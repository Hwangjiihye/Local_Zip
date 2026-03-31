package com.kedu.service;

import java.net.URI;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.kedu.dao.SafetyFacilityDAO;
import com.kedu.dto.SafetyFacilityDTO;

@Service
public class SafetyFacilityService {

	@Autowired
	private SafetyFacilityDAO dao;

	private final String SERVICE_KEY = "3f7cf2f9619b457587f2badf959dcf25ccb7f35296e133ec36cdd5df068a94c5";

	public int saveToiletData() {
		int count = 0;

		try {
			dao.deleteByType("공중화장실");

			int pageNo = 1;
			int numOfRows = 1000;
			int totalCount = 0;

			RestTemplate restTemplate = new RestTemplate();


			while(true) {
				String url = "https://apis.data.go.kr/1741000/public_restroom_info/info"
						+ "?serviceKey=" + SERVICE_KEY
						+ "&pageNo=" + pageNo
						+ "&numOfRows=" + numOfRows
						+ "&type=json";

				Map<String, Object> response = restTemplate.getForObject(url, Map.class);
				if (response == null) break;


				Map<String, Object> responseMap = (Map<String , Object>) response.get("response");
				if (responseMap == null) break;

				Map<String, Object> body = (Map<String, Object>) responseMap.get("body");
				if (body == null) break;

				Object totalCountObj = body.get("totalCount");
				if (totalCountObj != null) {
					totalCount = (int)Double.parseDouble(String.valueOf(totalCountObj));
				}

				Map<String, Object> items = (Map<String, Object>) body.get("items");
				if (items == null) break;

				List<Map<String, Object>> itemList = (List<Map<String, Object>>) items.get("item");
				if (itemList == null || itemList.isEmpty()) break;

				for (Map<String, Object> item : itemList) {
					String roadAddr = clean(item.get("LCTN_ROAD_NM_ADDR"));
					String numAddr = clean(item.get("LCTN_LOTNO_ADDR"));
					String facName = clean(item.get("RSTRM_NM"));
					String latStr = clean(item.get("WGS84_LAT"));
					String lngStr = clean(item.get("WGS84_LOT"));

					String addr = !roadAddr.isEmpty() ? roadAddr : numAddr;

					if (!addr.contains("서울")) continue;
					if (latStr.isEmpty() || lngStr.isEmpty()) continue;
					SafetyFacilityDTO dto = new SafetyFacilityDTO();
					dto.setFac_type("공중화장실");
					dto.setFac_name(facName);
					dto.setFac_address(roadAddr);
					dto.setFac_numaddress(numAddr);
					dto.setFac_gu(extractGu(addr));
					try {
						dto.setFac_lat(Double.parseDouble(latStr));
						dto.setFac_lng(Double.parseDouble(lngStr));
					}catch(Exception e) {
						continue;
					}
					dao.insert(dto);
					count++;
				}

				if (pageNo * numOfRows >= totalCount) {
					break;
				}

				pageNo++;
			}

		}catch(Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	
	public int savePoliceData() {
		int count = 0;

		try {
			dao.deleteByType("치안시설");

			int pageNo = 1;
			int numOfRows = 1000;
			int totalCount = 0;

			RestTemplate restTemplate = new RestTemplate();


			while (true) {
	            String url = "https://api.odcloud.kr/api/15076962/v1/uddi:8ba698ca-b192-4fb7-99f7-e60903af03d0"
	                    + "?serviceKey=" + SERVICE_KEY
	                    + "&page=" + pageNo
	                    + "&perPage=" + numOfRows;

	            Map<String, Object> response = restTemplate.getForObject(url, Map.class);
	            if (response == null) break;

	            Object totalCountObj = response.get("totalCount");
	            if (totalCountObj != null) {
	                totalCount = (int) Double.parseDouble(String.valueOf(totalCountObj));
	            }

	            List<Map<String, Object>> itemList = (List<Map<String, Object>>) response.get("data");
	            if (itemList == null || itemList.isEmpty()) break;

	            for (Map<String, Object> item : itemList) {
	                String facName = clean(item.get("치안센터명"));
	                String addr = clean(item.get("주소"));
	                String officeName = clean(item.get("관서명"));

	                if (!addr.contains("서울")) continue;

	                SafetyFacilityDTO dto = new SafetyFacilityDTO();
	                dto.setFac_type("치안시설");
	                dto.setFac_name(!facName.isEmpty() ? facName : officeName);
	                dto.setFac_address(addr);
	                dto.setFac_numaddress("");
	                dto.setFac_gu(extractGu(addr));
	                dto.setFac_lat(0);
	                dto.setFac_lng(0);

	                dao.insert(dto);
	                count++;
	            }

	            if (pageNo * numOfRows >= totalCount) {
	                break;
	            }

	            pageNo++;
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return count;
	}
	
	private final String KAKAO_REST_API_KEY = "9b13c2ea8c18a1379ea7c45013873362";

    public int updatePoliceLatLng() {
        int count = 0;

        try {
            List<SafetyFacilityDTO> list = dao.selectPoliceWithoutCoords();
            RestTemplate restTemplate = new RestTemplate();

            for (SafetyFacilityDTO dto : list) {
                String address = dto.getFac_address();

                if (address == null || address.isBlank()) {
                    continue;
                }

                String encodedAddress = URLEncoder.encode(address, StandardCharsets.UTF_8);
                String url = "https://dapi.kakao.com/v2/local/search/address.json?query=" + encodedAddress;

                HttpHeaders headers = new HttpHeaders();
                headers.set("Authorization", "KakaoAK " + KAKAO_REST_API_KEY);

                HttpEntity<String> entity = new HttpEntity<>(headers);

                ResponseEntity<Map> response = restTemplate.exchange(
                        URI.create(url),
                        HttpMethod.GET,
                        entity,
                        Map.class
                );

                Map<String, Object> body = response.getBody();
                if (body == null) {
                    continue;
                }

                List<Map<String, Object>> documents = (List<Map<String, Object>>) body.get("documents");
                if (documents == null || documents.isEmpty()) {
                    System.out.println("좌표 못 찾음: " + address);
                    continue;
                }

                Map<String, Object> first = documents.get(0);

                String x = String.valueOf(first.get("x")); // 경도
                String y = String.valueOf(first.get("y")); // 위도

                double lng = Double.parseDouble(x);
                double lat = Double.parseDouble(y);

                int result = dao.updateLatLngBySeq(lat, lng, dto.getFac_seq());
                if (result > 0) {
                    count++;
                    System.out.println("업데이트 성공: " + dto.getFac_name() + " / " + lat + ", " + lng);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return count;
    }

    private final String SERVICE_KEY_SHELTER = "515452634f776a643735444c725564";
	public int saveShelterData() {
		int count = 0;

		try {
			dao.deleteByType("대피소");

			int start = 1;
			int end = 1000;
			int totalCount = 0;

			RestTemplate restTemplate = new RestTemplate();


			while (true) {

	            String url = "http://openapi.seoul.go.kr:8088/"
	                    + SERVICE_KEY_SHELTER
	                    + "/json/TlEtqkP/"
	                    + start + "/" + end;

	            Map<String, Object> response = restTemplate.getForObject(url, Map.class);
	            if (response == null) break;

	            Map<String, Object> data = (Map<String, Object>) response.get("TlEtqkP");
	            if (data == null) break;

	            Object totalCountObj = data.get("list_total_count");
	            if (totalCountObj != null) {
	            	totalCount = (int) Double.parseDouble(String.valueOf(totalCountObj));
	            }

	            List<Map<String, Object>> itemList = (List<Map<String, Object>>) data.get("row");
	            if (itemList == null || itemList.isEmpty()) break;

	            for (Map<String, Object> item : itemList) {
	                String facName = clean(item.get("ACTC_FCLT_NM")); // 시설명
	                String addr = clean(item.get("DADDR"));           // 주소
	                String nm = clean(item.get("SGG_NM")); // 구
	                String latStr = clean(item.get("LAT"));           // 위도
	                String lngStr = clean(item.get("LOT"));           // 경도

	                if (!addr.contains("서울")) continue;
	                if (facName.isEmpty()) continue;
	                if (latStr.isEmpty() || lngStr.isEmpty()) continue;

	                SafetyFacilityDTO dto = new SafetyFacilityDTO();
	                dto.setFac_type("대피소");
	                dto.setFac_name(facName);
	                dto.setFac_address(addr);
	                dto.setFac_gu(nm);
	                dto.setFac_numaddress("");

	                try {
	                    dto.setFac_lat(Double.parseDouble(latStr));
	                    dto.setFac_lng(Double.parseDouble(lngStr));
	                } catch (Exception e) {
	                    continue;
	                }

	                dao.insert(dto);
	                count++;
	            }

	            if (end >= totalCount) break;

	            start += 1000;
	            end += 1000;
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return count;
	}
	
	public List<SafetyFacilityDTO> getAllFacilities(){
		return dao.selectAll();
	}

	private String clean(Object obj) {
		if (obj == null) return "";
		String str = String.valueOf(obj).trim();
		if ("null".equalsIgnoreCase(str)) return "";
		return str;
	}

	private String extractGu(String addr) {
		if (addr == null || addr.isBlank()) return "";
		String[] arr = addr.split(" ");
		if (arr.length >= 2) {
			return arr[1];
		}
		return "";
	}
}