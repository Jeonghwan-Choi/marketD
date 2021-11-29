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
	
	//selectlocationlist
	private int loginmemberno;
	private String loginname;
	private String loginprofile;
	private int boardmemberno;
	private String boardmembername;
	private String boardmemberprofile;
	
	
	public int getLoginmemberno() {
		return loginmemberno;
	}


	public void setLoginmemberno(int loginmemberno) {
		this.loginmemberno = loginmemberno;
	}


	public String getLoginname() {
		return loginname;
	}


	public void setLoginname(String loginname) {
		this.loginname = loginname;
	}


	public String getLoginprofile() {
		return loginprofile;
	}


	public void setLoginprofile(String loginprofile) {
		this.loginprofile = loginprofile;
	}


	public int getBoardmemberno() {
		return boardmemberno;
	}


	public void setBoardmemberno(int boardmemberno) {
		this.boardmemberno = boardmemberno;
	}


	public String getBoardmembername() {
		return boardmembername;
	}


	public void setBoardmembername(String boardmembername) {
		this.boardmembername = boardmembername;
	}


	public String getBoardmemberprofile() {
		return boardmemberprofile;
	}


	public void setBoardmemberprofile(String boardmemberprofile) {
		this.boardmemberprofile = boardmemberprofile;
	}


	public String getLogin() {
		return login;
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
			String location, String locationdescription, int loginmemberno, String loginname, String loginprofile,
			int boardmemberno, String boardmembername, String boardmemberprofile) {
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
		this.loginmemberno = loginmemberno;
		this.loginname = loginname;
		this.loginprofile = loginprofile;
		this.boardmemberno = boardmemberno;
		this.boardmembername = boardmembername;
		this.boardmemberprofile = boardmemberprofile;
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