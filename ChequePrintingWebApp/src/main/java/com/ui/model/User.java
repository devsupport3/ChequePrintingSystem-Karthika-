package com.ui.model;

import java.sql.Timestamp;

//Model: User
public class User {
	//Variables
		private int userId;
		private String username;
		private String password;
		private String role;
		private int roleId; 
		 private boolean active;
		 private boolean  deleteflag;
		  private Timestamp createdAt;

		 //Constructor
		public  User(){
			 }
		 
		 public User(int id,String username,String password,int roleid,String role, boolean active) {
			 this.userId=id;
			 this.username=username;
			 this.password=password;
			 this.roleId=roleid;
			 this.role=role;
			 this.active=active;
			 
			 //this.createdAt=createdAt;
		 }

		 
		 //Getters and Setters
		public int getUserId() {
			return userId;
		}

		public void setUserId(int userId) {
			this.userId = userId;
		}

		public String getUsername() {
			return username;
		}

		public void setUsername(String username) {
			this.username = username;
		}

		public String getPassword() {
			return password;
		}

		public void setPassword(String password) {
			this.password = password;
		}

		public String getRole() {
			return role;
		}

		public void setRole(String role) {
			this.role = role;
		}

		public boolean isActive() {
			return active;
		}

		public void setActive(boolean active) {
			this.active = active;
		}

	

		public Timestamp getCreatedAt() {
			return createdAt;
		}

		public void setCreatedAt(Timestamp createdAt) {
			this.createdAt = createdAt;
		}

		public boolean isDeleteflag() {
			return deleteflag;
		}

		public void setDeleteflag(boolean deleteflag) {
			this.deleteflag = deleteflag;
		}

		public int getRoleId() {
			return roleId;
		}

		public void setRoleId(int roleId) {
			this.roleId = roleId;
		}
		
}
