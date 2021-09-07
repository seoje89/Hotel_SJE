package human.com.hotel;

public class BookOk {
	private int roomcode;
	private String roomname;
	private String typename;
	private int howmany;
	private int howmuch;
//	private String checkin;
//	private String checkout;
	
	
	public BookOk(int roomcode, String roomname, String typename, int howmany, int howmuch
			) {

		this.roomcode = roomcode;
		this.roomname = roomname;
		this.typename = typename;
		this.howmany = howmany;
		this.howmuch = howmuch;
		
	}


	public BookOk() {
		
	}



	public int getRoomcode() {
		return roomcode;
	}


	public void setRoomcode(int roomcode) {
		this.roomcode = roomcode;
	}


	public String getRoomname() {
		return roomname;
	}


	public void setRoomname(String roomname) {
		this.roomname = roomname;
	}


	public String getTypename() {
		return typename;
	}


	public void setTypename(String typename) {
		this.typename = typename;
	}


	public int getHowmany() {
		return howmany;
	}


	public void setHowmany(int howmany) {
		this.howmany = howmany;
	}


	public int getHowmuch() {
		return howmuch;
	}


	public void setHowmuch(int howmuch) {
		this.howmuch = howmuch;
	}
	
	
}
