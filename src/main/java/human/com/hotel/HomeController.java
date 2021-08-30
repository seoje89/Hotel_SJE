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

@Controller
public class HomeController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		
		return "home";
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
		HttpSession session = hsr.getSession();
		session.setAttribute("loginid", uid);

		return "redirect:/booking"; //RequestMapping의 경로이름
	}
	
	@RequestMapping(value="/booking", method=RequestMethod.GET)
	public String gobooking(HttpServletRequest hsr) {
		HttpSession session=hsr.getSession();
		String loginid=(String)session.getAttribute("loginid");
		
		if(!loginid.equals("")) {
			return "booking"; // JSP파일이름
		} else {
			return "redirect:/";
		}
	}
	
	@RequestMapping(value="/newbie")
	public String doNewbie(Model model, HttpServletRequest hsr) {
//		String nname=hsr.getParameter("nbname");
//		String nid=hsr.getParameter("nbid");
//		String npw=hsr.getParameter("nbpw");
//		String npwc=hsr.getParameter("nbpwcheck");
//		String nmobile=hsr.getParameter("nbmobile");
//		
//		model.addAttribute("newbieid", nid);
//		model.addAttribute("newbiepw", npw);
//		model.addAttribute("newbiename", nname);
//		model.addAttribute("newbiemobile", nmobile);
		
		return "newbie";
	}
	@RequestMapping(value="/goNewbie", method=RequestMethod.POST)
	public String goNewbie(HttpServletRequest hsr, Model model) {
		String nname=hsr.getParameter("nbname");
		String nid=hsr.getParameter("nbid");
		String npw=hsr.getParameter("nbpw");
		String npwc=hsr.getParameter("nbpwcheck");
		String nmobile=hsr.getParameter("nbmobile");
		
		model.addAttribute("newbieid", nid);
		model.addAttribute("newbiepw", npw);
		model.addAttribute("newbiename", nname);
		model.addAttribute("newbiemobile", nmobile);
		
		return "home";
	}
	
	@RequestMapping(value="/room") 
	public String goRoom(HttpServletRequest hsr, Model model) {
		HttpSession session = hsr.getSession();
		if(session.getAttribute("loginid")==null) {
			return "redirect:/home";
		} else {
			//interface 호출하고 결과를 room.jsp에 전달
			iRoom room = sqlSession.getMapper(iRoom.class);
			ArrayList<Roominfo> roominfo=room.getRoomList();
			model.addAttribute("list", roominfo);
			return "room";
		}
	}
	@RequestMapping(value="/logout")
	public String logout(HttpServletRequest hsr) {
		HttpSession session = hsr.getSession();
		session.invalidate();
		return "redirect:/";
	}
	
	
}
