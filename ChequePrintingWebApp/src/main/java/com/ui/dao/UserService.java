package com.ui.dao;

import java.util.List;

import com.ui.model.User;

public interface UserService {
	 
    User validateUser(String username, String password);

    // Register new user
    boolean registerUser(User user);

    List<User> getAllUsers();

    // Deactivate (soft delete) a user
    boolean deactivateUser(int userId);
    boolean deleteUser(int userId);

    User getUserById(int userId);

    boolean updateUser(User user);
}
