package com.spring.market.vo;

public class ChatVO {
	//chatromm
	private int chatroomno;
	private int boardno;
	private int buyerno;
	private String datetime;
	
	//chatmember
	private int chatmember;
	private int user1;
	private int user2;
	private String name;
	private String address;
	private String profile;
	
	//chatmessage
	private int chatmessageno;
	private int seller;
	private String chatmessage;
	private int readst;
	
	public ChatVO() {}

	public ChatVO(int chatroomno, int boardno, int buyerno, String datetime, int chatmember, int user1, int user2,
			String name, String address, String profile, int chatmessageno, int seller, String chatmessage,
			int readst) {
		super();
		this.chatroomno = chatroomno;
		this.boardno = boardno;
		this.buyerno = buyerno;
		this.datetime = datetime;
		this.chatmember = chatmember;
		this.user1 = user1;
		this.user2 = user2;
		this.name = name;
		this.address = address;
		this.profile = profile;
		this.chatmessageno = chatmessageno;
		this.seller = seller;
		this.chatmessage = chatmessage;
		this.readst = readst;
	}

	public int getChatroomno() {
		return chatroomno;
	}

	public void setChatroomno(int chatroomno) {
		this.chatroomno = chatroomno;
	}

	public int getBoardno() {
		return boardno;
	}

	public void setBoardno(int boardno) {
		this.boardno = boardno;
	}

	public int getBuyerno() {
		return buyerno;
	}

	public void setBuyerno(int buyerno) {
		this.buyerno = buyerno;
	}

	public String getDatetime() {
		return datetime;
	}

	public void setDatetime(String datetime) {
		this.datetime = datetime;
	}

	public int getChatmember() {
		return chatmember;
	}

	public void setChatmember(int chatmember) {
		this.chatmember = chatmember;
	}

	public int getUser1() {
		return user1;
	}

	public void setUser1(int user1) {
		this.user1 = user1;
	}

	public int getUser2() {
		return user2;
	}

	public void setUser2(int user2) {
		this.user2 = user2;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public int getChatmessageno() {
		return chatmessageno;
	}

	public void setChatmessageno(int chatmessageno) {
		this.chatmessageno = chatmessageno;
	}

	public int getSeller() {
		return seller;
	}

	public void setSeller(int seller) {
		this.seller = seller;
	}

	public String getChatmessage() {
		return chatmessage;
	}

	public void setChatmessage(String chatmessage) {
		this.chatmessage = chatmessage;
	}

	public int getReadst() {
		return readst;
	}

	public void setReadst(int readst) {
		this.readst = readst;
	}

	
		
	



	

}
