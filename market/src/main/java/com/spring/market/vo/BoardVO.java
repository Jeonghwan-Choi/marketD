package com.spring.market.vo;

public class BoardVO {
	private int boardno;
	private int memberno;
	private String title;
	private String category;
	private String datetime;
	private String content;
	private int price;
	private int cnt;
	private String imagename;
	private String address;
	private int wish;
	
	public BoardVO() {}

	public BoardVO(int boardno, int memberno, String title, String category, String datetime, String content, int price,
			int cnt, String imagename,String address,int wish) {
		super();
		this.boardno = boardno;
		this.memberno = memberno;
		this.title = title;
		this.category = category;
		this.datetime = datetime;
		this.content = content;
		this.price = price;
		this.cnt = cnt;
		this.imagename = imagename;
		this.address = address;
		this.wish = wish;
	}

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

	public String getDatetime() {
		return datetime;
	}

	public void setDatetime(String datetime) {
		this.datetime = datetime;
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

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public String getImagename() {
		return imagename;
	}

	public void setImagename(String imagename) {
		this.imagename = imagename;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	
	public int getWish() {
		return wish;
	}

	public void setWish(int wish) {
		this.wish = wish;
	}
	
	
	


}
