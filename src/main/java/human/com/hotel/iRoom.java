package human.com.hotel;

import java.util.ArrayList;

public interface iRoom {
	ArrayList<Roominfo> getRoomList();
	
	ArrayList<Roomtype> getRoomType();
	
	void doDeleteRoom(int roomcode);
	
	void doJoinRoom(String roomname, int roomtype, int howmany, int howmuch);

	void doUpdateRoom(int roomcode, String roomname, int roomtype, int howmany, int howmuch);
	
	void goNewbie(String name, String loginid, String passcode);
	
	int doCheckUser(String userid, String passcode);

	void doReservationRoom(String rname, String rtype, String date1, String date2, int reserhowmany, int rhowmany,
			int rhowmuch, int allprice, String resername, String resermobile);
}
