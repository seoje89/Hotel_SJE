package human.com.hotel;

public class BookedDetail {
	
	private int bookcode;
	private String roomname;
	private String roomtype;
	private String checkin;
	private String checkout;
	private int rperson;
	private int person;
	private int howmuch;
	private String rname;
	private String mobile;
	
	public BookedDetail() {
	}

	public BookedDetail(int bookcode, String roomname, String roomtype, String checkin, String checkout, int rperson,
			int person, int howmuch, String rname, String mobile) {
		
		this.bookcode = bookcode;
		this.roomname = roomname;
		this.roomtype = roomtype;
		this.checkin = checkin;
		this.checkout = checkout;
		this.rperson = rperson;
		this.person = person;
		this.howmuch = howmuch;
		this.rname = rname;
		this.mobile = mobile;
	}

	public int getBookcode() {
		return bookcode;
	}

	public void setBookcode(int bookcode) {
		this.bookcode = bookcode;
	}

	public String getRoomname() {
		return roomname;
	}

	public void setRoomname(String roomname) {
		this.roomname = roomname;
	}

	public String getRoomtype() {
		return roomtype;
	}

	public void setRoomtype(String roomtype) {
		this.roomtype = roomtype;
	}

	public String getCheckin() {
		return checkin;
	}

	public void setCheckin(String checkin) {
		this.checkin = checkin;
	}

	public String getCheckout() {
		return checkout;
	}

	public void setCheckout(String checkout) {
		this.checkout = checkout;
	}

	public int getRperson() {
		return rperson;
	}

	public void setRperson(int rperson) {
		this.rperson = rperson;
	}

	public int getPerson() {
		return person;
	}

	public void setPerson(int person) {
		this.person = person;
	}

	public int getHowmuch() {
		return howmuch;
	}

	public void setHowmuch(int howmuch) {
		this.howmuch = howmuch;
	}

	public String getRname() {
		return rname;
	}

	public void setRname(String rname) {
		this.rname = rname;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	
	
}
