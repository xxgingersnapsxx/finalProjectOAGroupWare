package kr.or.gw.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import kr.or.gw.dto.DclzMngtVO;
import kr.or.gw.dto.OrgnztEmpMngtVO;
import kr.or.gw.service.DclzService;
import kr.or.gw.service.MypageService;

@Controller
@RequestMapping("/attendance")
public class attendanceController {

	@Autowired
	private DclzService dclzService;

	@Autowired
	private MypageService mypageService;

   @RequestMapping("/individual/commute")
   public ModelAndView asdf(ModelAndView mnv) throws SQLException {
      String url = "attendance/individual/view";
      
      HttpServletRequest request = ((ServletRequestAttributes)       
      RequestContextHolder.currentRequestAttributes()).getRequest();
      HttpSession session = request.getSession();
      
      OrgnztEmpMngtVO   emp = (OrgnztEmpMngtVO) session.getAttribute("loginUser");
      List<DclzMngtVO> dclzList = dclzService.getDclzList(emp.getEmpno());
      List<DclzMngtVO> dclzCount = dclzService.getDclzCount(emp.getEmpno());
      List<DclzMngtVO> dclzdaycount = dclzService.getDclzDayCount(emp.getEmpno());
      List<DclzMngtVO> dclztotalcount = dclzService.getDclzTotalTime(emp.getEmpno());
      List<DclzMngtVO> dclzchart = dclzService.getDclzChart(emp.getEmpno());
      List<DclzMngtVO> dclzbackfront = dclzService.getDclzFrontBack(emp.getEmpno());

		String workingHrsStr = mypageService.selectDclzMngtWorkingHrs(emp.getEmpno()); // ?????? ??? ?????? ??????
		System.out.println(workingHrsStr);
		
		
		if (workingHrsStr != null) {
			int workedMin = Integer.parseInt(workingHrsStr.substring(workingHrsStr.length() - 2, workingHrsStr.length())); // ?????? ?????? ???
			int workedHrs = Integer.parseInt(workingHrsStr.substring(0, workingHrsStr.length() - 2));// ??? ??? ?????? ?????? ???

			int workingDay = mypageService.selectWorkingDayCnt(); // ???????????? ???????????? ????????? ?????? ?????? ???

			int avgWokringMinTot = (workedHrs * 60 + workedMin) / workingDay;// ?????? ??? ?????? ?????? ?????? (???)
			int avgWorkedHrs = avgWokringMinTot / 60; // ????????? ?????? ?????? ??????
			int avgWorkedMin = avgWokringMinTot % 60; // ????????? ?????? ?????? ???
			 mnv.addObject("avgWorkedHrs", avgWorkedHrs); // ?????? ?????? ??????
			 mnv.addObject("avgWorkedMin", avgWorkedMin); // ?????? ?????? ???
		} else {
			int zero = 0;
			 mnv.addObject("avgWorkedHrs", zero); // ?????? ?????? ??????
			 mnv.addObject("avgWorkedMin", zero); // ?????? ?????? ???
		}
      
      
      mnv.addObject("dclzList",dclzList);
      mnv.addObject("dclzCount",dclzCount);
      mnv.addObject("dclzdaycount",dclzdaycount);
      mnv.addObject("dclztotalcount",dclztotalcount);
      mnv.addObject("dclzchart",dclzchart);
      mnv.addObject("dclzbackfront",dclzbackfront);
      
      mnv.setViewName(url);
      
      return mnv;
   }
   
   @RequestMapping(value="/individual/list",method = RequestMethod.GET)
   @ResponseBody
   public ModelAndView list(ModelAndView mnv, String startDate, String endDate, Model model) throws SQLException {
	   asdf(mnv);
      String url = "attendance/individual/view";
      
      HttpServletRequest request = ((ServletRequestAttributes)       
      RequestContextHolder.currentRequestAttributes()).getRequest();
      HttpSession session = request.getSession();
      OrgnztEmpMngtVO   emp = (OrgnztEmpMngtVO) session.getAttribute("loginUser");
       
       if(startDate == null || startDate.equals("")||endDate == null || endDate.equals("")) {
          startDate= "sysdate";
          endDate= "sysdate";
       } 
       Map<String, String> paramMap = new HashMap<String, String>();
       paramMap.put("startDate", startDate);
       paramMap.put("endDate", endDate);
       paramMap.put("empno", String.valueOf(emp.getEmpno()));
       Map<String,Object> dataMap = dclzService.DclzLists(paramMap);
       
      mnv.addObject("dataMap",dataMap);
      
      List<OrgnztEmpMngtVO> dclzLists = (List<OrgnztEmpMngtVO>)dataMap.get("dclzLists");
      
      System.out.println(dclzLists.size()+"sava");
      
      mnv.setViewName(url);
      
      return mnv;
   }
   
   
  /* @RequestMapping("/individual/commute")
   	  public ModelAndView asdf(ModelAndView mnv,String startDate, String endDate) throws SQLException {
      String url = "attendance/individual/view";
      
      HttpServletRequest request = ((ServletRequestAttributes)       
      RequestContextHolder.currentRequestAttributes()).getRequest();
      HttpSession session = request.getSession();
      
      OrgnztEmpMngtVO   emp = (OrgnztEmpMngtVO) session.getAttribute("loginUser");
      List<DclzMngtVO> dclzList = dclzService.getDclzList(emp.getEmpno());
      List<DclzMngtVO> dclzCount = dclzService.getDclzCount(emp.getEmpno());
      List<DclzMngtVO> dclzdaycount = dclzService.getDclzDayCount(emp.getEmpno());
      List<DclzMngtVO> dclztotalcount = dclzService.getDclzTotalTime(emp.getEmpno());
      List<DclzMngtVO> dclzchart = dclzService.getDclzChart(emp.getEmpno());
      List<DclzMngtVO> dclzbackfront = dclzService.getDclzFrontBack(emp.getEmpno());
      
      mnv.addObject("dclzList",dclzList);
      mnv.addObject("dclzCount",dclzCount);
      mnv.addObject("dclzdaycount",dclzdaycount);
      mnv.addObject("dclztotalcount",dclztotalcount);
      mnv.addObject("dclzchart",dclzchart);
      mnv.addObject("dclzbackfront",dclzbackfront);
      
      if(startDate == null || startDate.equals("")||endDate == null || endDate.equals("")) {
          startDate= "sysdate";
          endDate= "sysdate";
       } 
       Map<String, String> paramMap = new HashMap<String, String>();
       paramMap.put("startDate", startDate);
       paramMap.put("endDate", endDate);
       paramMap.put("empno", String.valueOf(emp.getEmpno()));
       Map<String,Object> dataMap = dclzService.DclzLists(paramMap);
       
       mnv.addObject("dataMap",dataMap);
       
       List<OrgnztEmpMngtVO> dclzLists = (List<OrgnztEmpMngtVO>)dataMap.get("dclzLists");
      
      
      mnv.setViewName(url);
      
      return mnv;
   }*/
   
}