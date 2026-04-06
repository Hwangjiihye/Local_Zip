package com.kedu.dto;

public class FeedBack_reactionDTO {
	
	private int suggestion_reaction_seq;
	private String mem_id;
	private int suggestion_seq;
	private String reaction_type;
	private String reaction_date;
	
	public FeedBack_reactionDTO() {}
	public FeedBack_reactionDTO(int suggestion_reaction_seq, String mem_id, int suggestion_seq, String reaction_type,
			String reaction_date) {
		super();
		this.suggestion_reaction_seq = suggestion_reaction_seq;
		this.mem_id = mem_id;
		this.suggestion_seq = suggestion_seq;
		this.reaction_type = reaction_type;
		this.reaction_date = reaction_date;
	}
	
	public int getSuggestion_reaction_seq() {
		return suggestion_reaction_seq;
	}
	public void setSuggestion_reaction_seq(int suggestion_reaction_seq) {
		this.suggestion_reaction_seq = suggestion_reaction_seq;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public int getSuggestion_seq() {
		return suggestion_seq;
	}
	public void setSuggestion_seq(int suggestion_seq) {
		this.suggestion_seq = suggestion_seq;
	}
	public String getReaction_type() {
		return reaction_type;
	}
	public void setReaction_type(String reaction_type) {
		this.reaction_type = reaction_type;
	}
	public String getReaction_date() {
		return reaction_date;
	}
	public void setReaction_date(String reaction_date) {
		this.reaction_date = reaction_date;
	}
}
