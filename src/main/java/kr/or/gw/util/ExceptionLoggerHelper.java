package kr.or.gw.util;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import kr.or.gw.dto.OrgnztEmpMngtVO;

public class ExceptionLoggerHelper {
		
	public static void write(HttpServletRequest request, Exception e, Object res) {
		
		String savePath = GetUploadPath.getUploadPath("error.log").replace("/", File.separator);
		String logFilePath = savePath+File.separator+"system_exception_log.csv";
		
		String url = request.getRequestURI().replace(request.getContextPath(), "");
		String date = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date());
		String loginUserName = ((OrgnztEmpMngtVO)request.getSession().getAttribute("loginUser")).getNm();
		String exceptionType = e.getClass().getName();
		String happenObject = res.getClass().getName();
		
		String log = "[Error : " + exceptionType + "]" + url + "," + date + "," + loginUserName +  ","
					+ happenObject + "\n" + e.getMessage();
		
		//로그 파일 생성.
		File file = new File(savePath);
		file.mkdirs();
		
		try {
			BufferedWriter out = new BufferedWriter(new FileWriter(logFilePath, true));
			
			//로그를 기록
			out.write(log);
			out.newLine();

			out.close();
		} catch (IOException exception) {
			exception.printStackTrace();
		}
					
	}
}
