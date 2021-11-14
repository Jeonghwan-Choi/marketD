package com.spring.market.vo;

public class BoardVO {
	private int boardno;
	private int memberno;
	private String title;
	private String category;
	private String dateTime;
	private String content;
	private int price;
	
	
	public BoardVO() {}
	


	public int getBoardno() {
		return boardno;
	}
	public void setBoardno(int boardno) {
		this.boardno = boardno;
	}
	public int getMemberno() {
		return memberno;
	}
	public void setMemberno(int memberno) {
		this.memberno = memberno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getDateTime() {
		return dateTime;
	}
	public void setDateTime(String dateTime) {
		this.dateTime = dateTime;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public BoardVO(int boardno, int memberno, String title, String category, String dateTime, String content,
			int price) {
		super();
		this.boardno = boardno;
		this.memberno = memberno;
		this.title = title;
		this.category = category;
		this.dateTime = dateTime;
		this.content = content;
		this.price = price;
	}
}
