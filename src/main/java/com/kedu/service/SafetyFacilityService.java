package com.kedu.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
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
	
//	public int saveShelterData() {
//		
//	}

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
