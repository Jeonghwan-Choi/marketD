package com.spring.market.vo;

public class BoardVO {
   private int boardno;
   private int memberno;
   private String title;
   private String category;
   private String datetime;
   private String content;
   private int price;
   private String email;
   private String name;
   private String profile;
   private int cnt;
   private String imagename;
   private String address;
   private int wish;
   private int wishcount;
   private int chatcount;
   private int viewscount;
   private String searchdata;
   private int firstvalue;
   private int lastvalue;
   
   private int guestno;
   private int guestcountchk;
   
   
   public int getGuestcountchk() {
	return guestcountchk;
}

public void setGuestcountchk(int guestcountchk) {
	this.guestcountchk = guestcountchk;
}

public int getGuestno() {
	return guestno;
}

public void setGuestno(int guestno) {
	this.guestno = guestno;
}

private MemberVO member;

   
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

   public String getEmail() {
      return email;
   }

   public void setEmail(String email) {
      this.email = email;
   }

   public String getName() {
      return name;
   }

   public void setName(String name) {
      this.name = name;
   }

   public String getProfile() {
      return profile;
   }

   public void setProfile(String profile) {
      this.profile = profile;
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

   public int getWishcount() {
      return wishcount;
   }

   public void setWishcount(int wishcount) {
      this.wishcount = wishcount;
   }

   public int getChatcount() {
      return chatcount;
   }

   public void setChatcount(int chatcount) {
      this.chatcount = chatcount;
   }

   public int getViewscount() {
      return viewscount;
   }

   public void setViewscount(int viewscount) {
      this.viewscount = viewscount;
   }
   public String getSearchdata() {
	   return searchdata;
   }

   public void setSearchdata(String searchdata) {
	   this.searchdata = searchdata;
   }
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



public MemberVO getMember() {
      return member;
   }

   public void setMember(MemberVO member) {
      this.member = member;
   }

public BoardVO(int boardno, int memberno, String title, String category, String datetime, String content, int price,
		String email, String name, String profile, int cnt, String imagename, String address, int wish, int wishcount,
		int chatcount, int viewscount, String searchdata, int firstvalue, int lastvalue, int guestno, int guestcountchk,
		MemberVO member) {
	super();
	this.boardno = boardno;
	this.memberno = memberno;
	this.title = title;
	this.category = category;
	this.datetime = datetime;
	this.content = content;
	this.price = price;
	this.email = email;
	this.name = name;
	this.profile = profile;
	this.cnt = cnt;
	this.imagename = imagename;
	this.address = address;
	this.wish = wish;
	this.wishcount = wishcount;
	this.chatcount = chatcount;
	this.viewscount = viewscount;
	this.searchdata = searchdata;
	this.firstvalue = firstvalue;
	this.lastvalue = lastvalue;
	this.guestno = guestno;
	this.guestcountchk = guestcountchk;
	this.member = member;
}

   

   
   


}