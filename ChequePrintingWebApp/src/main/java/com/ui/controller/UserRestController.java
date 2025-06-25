package com.ui.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.ui.dao.RoleService;
import com.ui.dao.UserService;
import com.ui.model.Role;
import com.ui.model.User;

@RestController
@RequestMapping("/api/users")
public class UserRestController {
	 @Autowired
	  private UserService userService;
	
	 @Autowired
	 private RoleService roleService;

		/*
		 * //Login Validation (POST)
		 * 
		 * @PostMapping("/login") public User login(@RequestBody User user) { return
		 * userService.validateUser(user.getUsername(), user.getPassword()); }
		 */

	 @GetMapping("/login")
	 public User login(@RequestParam String
			 username, @RequestParam String password) { return
			  userService.validateUser(username, password); 
			 }
	 
	 @PostMapping(value = "/login", consumes = "application/json")
	 public User login(@RequestBody User user) {
	     return userService.validateUser(user.getUsername(), user.getPassword());
	 }
	 
	 
		/*
		 * @GetMapping("/login") public User login(@RequestParam String
		 * username, @RequestParam String password) { return
		 * userService.validateUser(username, password); }
		 */
	 
	  @PostMapping("/login")
	    @ResponseBody
	    public User login(@RequestBody User loginUser, HttpServletRequest request) {
	        User user = userService.validateUser(loginUser.getUsername(), loginUser.getPassword());

	        if (user != null) {
	            request.getSession().setAttribute("loggedUser", user);
	            return user;
	        } else {
	            return null;  // Frontend handles it as invalid login
	        }
	    }

	    // ✅ 2. LOGOUT API (Session destroy)
	    @PostMapping("/logout")
	    @ResponseBody
	    public String logout(HttpServletRequest request) {
	        HttpSession session = request.getSession(false);
	        if (session != null) {
	            session.invalidate();
	        }
	        return "Logged out successfully";
	    }

	    // ✅ 3. PROFILE API (to test session)
	    @GetMapping("/profile")
	    @ResponseBody
	    public User getProfile(HttpServletRequest request) {
	        HttpSession session = request.getSession(false);
	        if (session != null) {
	            return (User) session.getAttribute("loggedUser");
	        }
	        return null;
	    }
	    
	    @GetMapping("/roles")
	    public List<Role> getAllRoles() {
	        return roleService.getAllRoles();
	    }
	 
	 
	    //Register User (POST)
	    @PostMapping("/register")
	    public String register(@RequestBody User user) {
	        boolean registered = userService.registerUser(user);
	        return registered ? "User registered successfully" : "Registration failed";
	    }

	    // Get All Active Users (GET)
	    @GetMapping
	    public List<User> getAllUsers() {
	        return userService.getAllUsers();
	    }


		/*
		 * // Get User by ID (GET)
		 * 
		 * @GetMapping("/{id}") public User getUserById(@PathVariable("id") int id) {
		 * return userService.getUserById(id); }
		 */

	    @GetMapping("/{id}")
	    public User getUserById(@PathVariable("id") int id) {
	        return userService.getUserById(id);
	    }
	    
	    // Update User (PUT)
	    @PutMapping("/update/{id}")
	    public String updateUser(@PathVariable("id") int id, @RequestBody User user) {
	        user.setUserId(id); // assuming User has setId()
	        boolean updated = userService.updateUser(user);
	        return updated ? "User updated successfully" : "Update failed";
	    }

	    // Delete User by deactivating Status
	   // @DeleteMapping("/{id}")
	    
	    @PutMapping("/update-active/{id}")
	    public String deactivateUser(@PathVariable("id") int id) {
	        boolean result = userService.deactivateUser(id);
	        return result ? "User deactivated" : "Deactivation failed";
	    }
	    
	    
	    @PutMapping("/update-delete/{id}")
	    public String deleteUser(@PathVariable("id") int id) {
	        boolean result = userService.deleteUser(id);
	        return result ? "User deleted" : "Deletion failed";
	    }
}
