package com.ui.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
@Controller
public class LoginController {
	@GetMapping("/login")
    public String showLoginPage() {
        return "admin/login";  // loads /WEB-INF/views/admin/login.jsp
    }
	
	
	  @GetMapping("/adminDashboard")
	    public String showDashboard() {
	        return "admin/adminDashboard"; // loads /WEB-INF/views/admin/adminDashboard.jsp
	    }
}
