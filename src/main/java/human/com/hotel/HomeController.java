package human.com.hotel;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

@Controller
public class HomeController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		
		return "home";
	}	
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String login() {
		
		return "/";
	}
	
//	@RequestMapping(value="/selected")
//	public String doJob(HttpServletRequest hsr, Model model) {
//		String strPath=hsr.getParameter("path");
//		if(strPath.equals("login")){
//			return "login";
//		} else if(strPath.equals("newbie")) {
//			return "newbie";
//		} else {
//			return "home";
//		}
//	}
	
	@RequestMapping(value="/checkuser", method=RequestMethod.POST)
	public String checkuser(HttpServletRequest hsr, Model model) {
		String uid=hsr.getParameter("userid");
		String upw=hsr.getParameter("userpw");
		
		model.addAttribute("loginid", uid);
		model.addAttribute("loginpw", upw);
		
		//DB에서 유저확인 - 기존유저면 booking.jsp, 신규면 home으로
		iRoom member = sqlSession.getMapper(iRoom.class);
		int n = member.doCheckUser(uid, upw);
		if(n>0) {
			HttpSession session = hsr.getSession();
			session.setAttribute("loginid", uid);

			return "redirect:/booking"; //RequestMapping의 경로이름
		} else {
			return "home";
		}
		
	}
	
	@RequestMapping(value="/booking", method=RequestMethod.GET)
	public String gobooking(HttpServletRequest hsr, Model model) {
		HttpSession session=hsr.getSession();
		String loginid=(String)session.getAttribute("loginid");
		
		iRoom room = sqlSession.getMapper(iRoom.class);
		ArrayList<Roomtype> roomtype=room.getRoomType();
		model.addAttribute("rtype", roomtype);
		
		if(loginid==null) {
			return "redirect:/";
		} else {
			return "booking"; // JSP파일이름
		}
	}
	
	@RequestMapping(value="/newbie")
	public String doNewbie(Model model, HttpServletRequest hsr) {

		return "newbie";
	}
	
	@RequestMapping(value="/goNewbie",produces="application/text; charset=utf8", method=RequestMethod.POST)
	public String goNewbie(HttpServletRequest hsr, Model model) {
		String nname=hsr.getParameter("nbname");
		String nid=hsr.getParameter("nbid");
		String npw=hsr.getParameter("nbpw");
		//String npwc=hsr.getParameter("nbpwcheck");
		//String nmobile=hsr.getParameter("nbmobile");
		
//		model.addAttribute("newbieid", nid);
//		model.addAttribute("newbiepw", npw);
//		model.addAttribute("newbiename", nname);
		//model.addAttribute("newbiemobile", nmobile);
		
		iRoom room = sqlSession.getMapper(iRoom.class);
		room.goNewbie(nname, nid, npw);
		
		return "redirect:/";
	}
	
	@RequestMapping(value="/room") 
	public String goRoom(HttpServletRequest hsr, Model model) {
		HttpSession session = hsr.getSession();
		if(session.getAttribute("loginid")==null) {
			return "redirect:/home";
		} else {
			//interface 호출하고 결과를 room.jsp에 전달
			iRoom room = sqlSession.getMapper(iRoom.class);
			
			//ArrayList<Roominfo> roominfo=room.getRoomList();
			ArrayList<Roomtype> roomtype=room.getRoomType();
			
			//model.addAttribute("list", roominfo);
			model.addAttribute("rtype", roomtype);
			
			return "room";
		}
	}
	@RequestMapping(value="getRoomList", produces="application/text; charset=utf8", method=RequestMethod.POST)
	@ResponseBody //AJAX 호출에 반응하려면 붙여줘야하는 애노테이션
	public String getRoomList(HttpServletRequest hsr) {
		iRoom room=sqlSession.getMapper(iRoom.class);
		ArrayList<Roominfo> roominfo=room.getRoomList();
		// 찾아진 데이터로 JSONArray 만들기
		JSONArray ja = new JSONArray();
		for(int i=0;i<roominfo.size();i++) {
			JSONObject jo = new JSONObject();
			jo.put("roomcode", roominfo.get(i).getRoomcode());
			jo.put("roomname", roominfo.get(i).getRoomname());
			jo.put("typename", roominfo.get(i).getTypename());
			jo.put("howmany", roominfo.get(i).getHowmany());
			jo.put("howmuch", roominfo.get(i).getHowmuch());
			ja.add(jo);
		}
		return ja.toString();
	}
	
	@RequestMapping(value="deleteRoom", produces="application/text; charset=utf8", method=RequestMethod.POST)
	@ResponseBody //AJAX 호출에 반응하려면 붙여줘야하는 애노테이션
	public String deleteRoom(HttpServletRequest hsr) {
		int roomcode = Integer.parseInt(hsr.getParameter("roomcode"));
		iRoom room=sqlSession.getMapper(iRoom.class);
		room.doDeleteRoom(roomcode);
		
		return "ok";
	}
	
	@RequestMapping(value="joinRoom", produces="application/text; charset=utf8", method=RequestMethod.POST)
	@ResponseBody
	public String joinRoom(HttpServletRequest hsr) {
		String rname=hsr.getParameter("roomname");
		int rtype=Integer.parseInt(hsr.getParameter("roomtype"));
		int rhowmany=Integer.parseInt(hsr.getParameter("howmany"));
		int rhowmuch=Integer.parseInt(hsr.getParameter("howmuch"));
		
		iRoom room=sqlSession.getMapper(iRoom.class);
		room.doJoinRoom(rname, rtype, rhowmany, rhowmuch);
		
		return "ok";
	}

	@RequestMapping(value="updateRoom", produces="application/text; charset=utf8", method=RequestMethod.POST)
	@ResponseBody
	public String updateRoom(HttpServletRequest hsr) {
		int rcode=Integer.parseInt(hsr.getParameter("roomcode"));
		String rname=hsr.getParameter("roomname");
		int rtype=Integer.parseInt(hsr.getParameter("roomtype"));
		int rhowmany=Integer.parseInt(hsr.getParameter("howmany"));
		int rhowmuch=Integer.parseInt(hsr.getParameter("howmuch"));
		
		iRoom room=sqlSession.getMapper(iRoom.class);
		room.doUpdateRoom(rcode, rname, rtype, rhowmany, rhowmuch);
	
		return "ok";
	}
	
	@RequestMapping(value="/logout")
	public String logout(HttpServletRequest hsr) {
		HttpSession session = hsr.getSession();
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping(value="getBookedRoom", produces="application/text; charset=utf8", method=RequestMethod.POST)
	@ResponseBody
	public String getBookedRoom(HttpServletRequest hsr) {
		iRoom room = sqlSession.getMapper(iRoom.class);
	
		String checkin = hsr.getParameter("date1");
		String checkout = hsr.getParameter("date2");
		
		System.out.println(checkin);
		System.out.println(checkout);
		
		ArrayList<BookedRoom> bookedroom = room.BookedRoom(checkin, checkout);
		JSONArray ja2 = new JSONArray();
		for(int j=0;j<bookedroom.size();j++) {
			JSONObject jo2 = new JSONObject();
			jo2.put("bookcode", bookedroom.get(j).getBookcode());
			jo2.put("roomname", bookedroom.get(j).getRoomname());
			jo2.put("roomcode", bookedroom.get(j).getRoomcode());
			jo2.put("roomtype", bookedroom.get(j).getRoomtype());
			jo2.put("checkin", bookedroom.get(j).getCheckin());
			jo2.put("checkout", bookedroom.get(j).getCheckout());
			jo2.put("rperson", bookedroom.get(j).getRperson());
			jo2.put("person", bookedroom.get(j).getPerson());
			jo2.put("name", bookedroom.get(j).getName());
			jo2.put("mobile", bookedroom.get(j).getMobile());
			
			ja2.add(jo2);
		}
		System.out.println("예약된 객실 확인"+ ja2.toString());
		return ja2.toString();
	}
	@RequestMapping(value="getRoomSearch", produces="application/text; charset=utf8", method=RequestMethod.POST)
	@ResponseBody
	public String getRoomSearch(HttpServletRequest hsr) {
		iRoom room = sqlSession.getMapper(iRoom.class);
	
		String checkin = hsr.getParameter("date1");
		String checkout = hsr.getParameter("date2");
		
		System.out.println(checkin);
		System.out.println(checkout);
		
		//room.doCheckDate(checkin,checkout);
				// 리턴받는거를 인터페이스에서 따로 메서드 추가해주는게 아니에용! 감사합니다
		//ArrayList<BookOk> bookok=room.getBookOk();				
		ArrayList<BookOk> bookok=room.doCheckDate(checkin,checkout);
		// 찾아진 데이터로 JSONArray 만들기
		JSONArray ja = new JSONArray();
		for(int i=0;i<bookok.size();i++) {
			JSONObject jo = new JSONObject();
			jo.put("roomcode", bookok.get(i).getRoomcode());
			jo.put("roomname", bookok.get(i).getRoomname());
			jo.put("typename", bookok.get(i).getTypename());
			jo.put("howmany", bookok.get(i).getHowmany());
			jo.put("howmuch", bookok.get(i).getHowmuch());
			ja.add(jo);
		}
		
		System.out.println("예약가능 객실 확인" + ja.toString());		
		return ja.toString();
	}
	
	@RequestMapping(value="getBookedDetail", produces="application/text; charset=utf8", method=RequestMethod.POST)
	@ResponseBody
	public String getBookedDetail(HttpServletRequest hsr, Model model) {
		int bcode = Integer.parseInt(hsr.getParameter("bcode"));
		iRoom book=sqlSession.getMapper(iRoom.class);
		ArrayList<BookedDetail> bookDetail = book.doGetBookedDetail(bcode);
		
			JSONObject jo3 = new JSONObject();
			jo3.put("bookcode", bookDetail.get(0).getBookcode());
			jo3.put("roomname", bookDetail.get(0).getRoomname());
			jo3.put("roomtype", bookDetail.get(0).getRoomtype());
			jo3.put("checkin", bookDetail.get(0).getCheckin());
			jo3.put("checkout", bookDetail.get(0).getCheckout());
			jo3.put("rperson", bookDetail.get(0).getRperson());
			jo3.put("person", bookDetail.get(0).getPerson());
			jo3.put("howmuch", bookDetail.get(0).getHowmuch());
			jo3.put("rname", bookDetail.get(0).getRname());
			jo3.put("mobile", bookDetail.get(0).getMobile());
		
		return jo3.toString();
	}
	
	
	@RequestMapping(value="reservationRoom", produces="application/text; charset=utf8", method=RequestMethod.POST)
	@ResponseBody
	public String reservationRoom(HttpServletRequest hsr) {
		String rname=hsr.getParameter("roomname");
		int rcode=Integer.parseInt(hsr.getParameter("roomcode"));
		String rtype=hsr.getParameter("roomtype");		
		int rhowmany=Integer.parseInt(hsr.getParameter("howmany"));
		int rhowmuch=Integer.parseInt(hsr.getParameter("howmuch"));
		String date1=hsr.getParameter("date1");
		String date2=hsr.getParameter("date2");
		int reserhowmany = Integer.parseInt(hsr.getParameter("reserhowmany"));
		int allprice = Integer.parseInt(hsr.getParameter("allprice"));
		String resername = hsr.getParameter("resername");
		String resermobile= hsr.getParameter("resermobile");		
		
		iRoom room=sqlSession.getMapper(iRoom.class);
		room.doReservationRoom(rname, rcode, rtype, date1, date2, reserhowmany, rhowmany, resername, resermobile);
		
		return "ok";
	}
	
	@RequestMapping(value="updateReservationRoom", produces="application/text; charset=utf8", method=RequestMethod.POST)
	@ResponseBody
	public String updateReservationRoom(HttpServletRequest hsr) {
		int brcode = Integer.parseInt(hsr.getParameter("roomcode"));
//		String rname=hsr.getParameter("roomname");
//		String rtype=hsr.getParameter("roomtype");		
//		int rhowmany=Integer.parseInt(hsr.getParameter("howmany"));
//		int rhowmuch=Integer.parseInt(hsr.getParameter("howmuch"));
//		String date1=hsr.getParameter("date1");
//		String date2=hsr.getParameter("date2");
		int reserhowmany = Integer.parseInt(hsr.getParameter("reserhowmany"));
//		int allprice = Integer.parseInt(hsr.getParameter("allprice"));
		String resername = hsr.getParameter("resername");
		String resermobile= hsr.getParameter("resermobile");
		
		iRoom room=sqlSession.getMapper(iRoom.class);
		room.doUpdateReservationRoom(brcode, reserhowmany, resername, resermobile);
		
		return "ok";
	}
	
	
	@RequestMapping(value="deleteBook", produces="application/text; charset=utf8", method=RequestMethod.POST)
	@ResponseBody
	public String deleteBook(HttpServletRequest hsr) {
		int bookcode = Integer.parseInt(hsr.getParameter("bookcode"));
		iRoom book = sqlSession.getMapper(iRoom.class);
		
		book.doDeleteBook(bookcode);
		return "ok";
	}
}
