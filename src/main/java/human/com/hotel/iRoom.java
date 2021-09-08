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

	void doReservationRoom(String rname, int rcode, String rtype, String date1, String date2, int reserhowmany, int rhowmany,
			String resername, String resermobile);

	void doDeleteBook(int bookcode);

	ArrayList<BookOk> doCheckDate(String checkin, String checkout);//이부분 아닌가욤? 이걸로 날짜를 받아서 리턴은 아래 배열로 했어요
	
	ArrayList<BookedRoom> BookedRoom(String checkin, String checkout);
}
