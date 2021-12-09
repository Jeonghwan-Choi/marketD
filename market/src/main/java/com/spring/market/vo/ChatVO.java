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
	

	private String login;
	private String member;
	private int memberno;
	

	//chatmessage
	private int chatmessageno;
	private int seller;
	private String chatmessage;
	private int readst;
	
	//chatlocation
	private int locationno;
	private String locationtitle;
	private String locationdate;
	private String location;
	private String locationdescription;
	private String memberprofile;
	private int locactionjsp;
	
	//more chatlist
	 private int firstvalue;
	 private int lastvalue;
	   
	public int getFirstvalue() {
		return firstvalue;
	}


	public void setFirstvalue(int firstvalue) {
		this.firstvalue = firstvalue;
	}


	public int getLastvalue() {
		return lastvalue;
	}


	public void setLastvalue(int lastvalue) {
		this.lastvalue = lastvalue;
	}


	public int getLocactionjsp() {
		return locactionjsp;
	}


	public void setLocactionjsp(int locactionjsp) {
		this.locactionjsp = locactionjsp;
	}


	public String getLogin() {
		return login;
	}
	

	public String getMemberprofile() {
		return memberprofile;
	}


	public void setMemberprofile(String memberprofile) {
		this.memberprofile = memberprofile;
	}


	public int getMemberno() {
		return memberno;
	}

	public void setMemberno(int memberno) {
		this.memberno = memberno;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getMember() {
		return member;
	}

	public void setMember(String member) {
		this.member = member;
	}

	
	public int getLocationno() {
		return locationno;
	}

	public void setLocationno(int locationno) {
		this.locationno = locationno;
	}

	public String getLocationtitle() {
		return locationtitle;
	}

	public void setLocationtitle(String locationtitle) {
		this.locationtitle = locationtitle;
	}

	public String getLocationdate() {
		return locationdate;
	}

	public void setLocationdate(String locationdate) {
		this.locationdate = locationdate;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getLocationdescription() {
		return locationdescription;
	}

	public void setLocationdescription(String locationdescription) {
		this.locationdescription = locationdescription;
	}

	public ChatVO() {}

	

	

	


	

	
	public ChatVO(int chatroomno, int boardno, int buyerno, String datetime, int chatmember, int user1, int user2,
			String name, String address, String profile, String login, String member, int memberno, int chatmessageno,
			int seller, String chatmessage, int readst, int locationno, String locationtitle, String locationdate,
			String location, String locationdescription, String memberprofile, int locactionjsp, int firstvalue,
			int lastvalue) {
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
		this.login = login;
		this.member = member;
		this.memberno = memberno;
		this.chatmessageno = chatmessageno;
		this.seller = seller;
		this.chatmessage = chatmessage;
		this.readst = readst;
		this.locationno = locationno;
		this.locationtitle = locationtitle;
		this.locationdate = locationdate;
		this.location = location;
		this.locationdescription = locationdescription;
		this.memberprofile = memberprofile;
		this.locactionjsp = locactionjsp;
		this.firstvalue = firstvalue;
		this.lastvalue = lastvalue;
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