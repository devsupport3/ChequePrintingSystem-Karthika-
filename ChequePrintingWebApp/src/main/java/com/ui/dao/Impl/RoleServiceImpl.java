package com.ui.dao.Impl;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.stereotype.Service;

import com.ui.dao.RoleService;
import com.ui.model.Role;

@Service("RoleService")
public class RoleServiceImpl implements RoleService {
	private DataSource dataSource;

	  public RoleServiceImpl() {
	        // Required for Spring bean instantiation
	    }
	  
	  public void setDataSource(DataSource dataSource) {
	        this.dataSource = dataSource;
	    }
	  
	 
	  public List<Role> getAllRoles() {
	      List<Role> roles = new ArrayList<>();
	      String sql = "SELECT * FROM roles";

	      try (Connection conn = dataSource.getConnection();
	           Statement stmt = conn.createStatement();
	           ResultSet rs = stmt.executeQuery(sql)) {

	          while (rs.next()) {
	              Role role = new Role(
	                  rs.getInt("role_id"),
	                  rs.getString("role_name")
	              );

	              roles.add(role);
	          }

	      } catch (Exception e) {
	          e.printStackTrace();
	      }

	      return roles;
	  }
}
