package com.code;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.code.session.UserSingleton;
import com.module.system.model.User;

public class SecurityInterceptor implements HandlerInterceptor {

	@Override
	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
		
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object arg2) throws Exception {
		User user = UserSingleton.getInstance().getUser();
        if(user != null) {    
            return true;
        } else {  
            PrintWriter out = response.getWriter();
            out.println("<html>");  
            out.println("<script>");  
            String path = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
            out.println("top.location.href = " + "'" + path + "/frame/loginForm'");
            out.println("</script>");  
            out.println("</html>"); 
            out.flush();
            out.close();
//        	response.sendRedirect("/frame/loginForm"); 
        }  
		return false;
	}

}