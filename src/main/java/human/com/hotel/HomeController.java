package human.com.hotel;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		
		return "home";
	}
	
	@RequestMapping(value="/selected")
	public String doJob(HttpServletRequest hsr, Model model) {
		String strPath=hsr.getParameter("path");
		if(strPath.equals("login")){
			return "login";
		} else if(strPath.equals("newbie")) {
			return "newbie";
		} else {
			return "home";
		}
	}
	
	@RequestMapping(value="/join")
	public String doJoin(HttpServletRequest hsr, Model model) {
		String uid=hsr.getParameter("userid");
		String upw=hsr.getParameter("userpw");
		model.addAttribute("loginid", uid);
		model.addAttribute("loginpw", upw);
		return "viewinfo";
	}
	
	@RequestMapping(value="/newbie")
	public String doNewbie(Model model, HttpServletRequest hsr) {
		String nname=hsr.getParameter("nbname");
		String nid=hsr.getParameter("nbid");
		String npw=hsr.getParameter("nbpw");
		String npwc=hsr.getParameter("nbpwcheck");
		String nmobile=hsr.getParameter("nbmobile");
		
		model.addAttribute("newbieid", nid);
		model.addAttribute("newbiepw", npw);
		model.addAttribute("newbiename", nname);
		model.addAttribute("newbiemobile", nmobile);
		
		return "newinfo";
	}
}
