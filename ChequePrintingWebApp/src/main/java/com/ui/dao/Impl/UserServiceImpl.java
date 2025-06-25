package com.ui.dao.Impl;

import java.sql.*;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.stereotype.Service;

import com.ui.dao.UserService;
import com.ui.model.User;
@Service("UserService")
public class UserServiceImpl implements UserService {


	private DataSource dataSource;

	  public UserServiceImpl() {
	        // Required for Spring bean instantiation
	    }
	  
	  public void setDataSource(DataSource dataSource) {
	        this.dataSource = dataSource;
	    }
    // Constructor Injection of DataSource
	/*
	 * public UserServiceImpl(DataSource dataSource) { this.dataSource = dataSource;
	 * }
	 */
    @Override
    public User validateUser(String username, String password) {
        User user = null;
        String sql = "SELECT * FROM users WHERE username = ? AND password = ? AND is_active = true";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, username);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                user = new User();
                user.setUserId(rs.getInt("user_id"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setRoleId(rs.getInt("role_id"));
                user.setActive(rs.getBoolean("is_active"));

                
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

    @Override
    public List<User> getAllUsers() {
        List<User> users = new ArrayList<>();
        String sql = "SELECT u.user_id, u.username, u.password, u.is_active, " +
                "u.role_id, r.role_name " +
                "FROM users u " +
                "JOIN roles r ON u.role_id = r.role_id " +
                "WHERE u.is_active = true AND u.delete_flag = false";

        try (Connection conn = dataSource.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                User user = new User(
                        rs.getInt("user_id"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getInt("role_id"), 
                        rs.getString("role_name"),
                        rs.getBoolean("is_active"));
                       // rs.getObject("supplier_id") != null ? rs.getInt("supplier_id") : 0
               
                users.add(user);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return users;
    }

    @Override
    public boolean registerUser(User user) {
        String sql = "INSERT INTO users (username, password, role_id,is_active) VALUES (?, ?, ?, true)";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, user.getUsername());
            stmt.setString(2, user.getPassword());
            stmt.setInt(3, user.getRoleId());


            return stmt.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    
    @Override
    public boolean deactivateUser(int userId) {
        String sql = "UPDATE users SET is_active = false WHERE user_id = ?";
        try (Connection conn =dataSource.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, userId);
            return stmt.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    
    @Override
    public boolean deleteUser(int userId) {
        String sql = "Update users set delete_flag=true WHERE user_id = ? ";
        try (Connection conn =dataSource.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, userId);
          //  stmt.setBoolean(2, delflag);
            return stmt.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public User getUserById(int userId) {
        User user = null;
        String sql = "SELECT * FROM users WHERE user_id = ?";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                user = new User();
                user.setUserId(rs.getInt("user_id"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setRoleId(rs.getInt("role_id"));
                user.setActive(rs.getBoolean("is_active"));

             
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

    @Override
    public boolean updateUser(User user) {
        String sql = "UPDATE users SET username = ?, password = ?, role_id = ?, is_active = ? WHERE user_id = ?";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, user.getUsername());
            stmt.setString(2, user.getPassword());
            stmt.setInt(3, user.getRoleId());
            stmt.setBoolean(4, user.isActive());
            stmt.setInt(5, user.getUserId());

            return stmt.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
