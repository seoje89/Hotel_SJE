package human.com.hotel;

public class BookedRoom {
	private int bookcode;
	private String roomname;
	private int roomcode;
	private String roomtype;
	private String checkin;
	private String checkout;
	private int rperson;
	private int person;
	private String name;
	private String mobile;
	
	public BookedRoom() {
		
	}

	public BookedRoom(int bookcode, String roomname, int roomcode, String roomtype, String checkin, String checkout,
			int rperson, int person, String name, String mobile) {
		this.bookcode = bookcode;
		this.roomname = roomname;
		this.roomcode = roomcode;
		this.roomtype = roomtype;
		this.checkin = checkin;
		this.checkout = checkout;
		this.rperson = rperson;
		this.person = person;
		this.name = name;
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

	public int getRoomcode() {
		return roomcode;
	}

	public void setRoomcode(int roomcode) {
		this.roomcode = roomcode;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	
	
}
