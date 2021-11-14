package com.spring.market.vo;

public class ImageVO {
	private int imageno;
	private int imageindex;
	private int memberno;
	private int boardno;
	private String imagename;
	public ImageVO() {}
	public ImageVO(int imageno, int imageindex, int memberno, int boardno, String imagename) {
		super();
		this.imageno = imageno;
		this.imageindex = imageindex;
		this.memberno = memberno;
		this.boardno = boardno;
		this.imagename = imagename;
	}
	public int getImageno() {
		return imageno;
	}
	public void setImageno(int imageno) {
		this.imageno = imageno;
	}
	public int getImageindex() {
		return imageindex;
	}
	public void setImageindex(int imageindex) {
		this.imageindex = imageindex;
	}
	public int getMemberno() {
		return memberno;
	}
	public void setMemberno(int memberno) {
		this.memberno = memberno;
	}
	public int getBoardno() {
		return boardno;
	}
	public void setBoardno(int boardno) {
		this.boardno = boardno;
	}
	public String getImagename() {
		return imagename;
	}
	public void setImagename(String imagename) {
		this.imagename = imagename;
	}
}
