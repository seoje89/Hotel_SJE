package human.com.hotel;

import java.util.ArrayList;

public interface iRoom {
	ArrayList<Roominfo> getRoomList();
	
	ArrayList<Roomtype> getRoomType();
	
	void doDeleteRoom(int roomcode);
	
	void doJoinRoom(String roomname, int roomtype, int howmany, int howmuch);

	void doUpdateRoom(int roomcode, String roomname, int roomtype, int howmany, int howmuch);
}
