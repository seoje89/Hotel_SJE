package human.com.hotel;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
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
	public String gobooking(HttpServletRequest hsr) {
		HttpSession session=hsr.getSession();
		String loginid=(String)session.getAttribute("loginid");
		
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
	
	
}
