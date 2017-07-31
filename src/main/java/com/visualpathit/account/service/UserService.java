package com.visualpathit.account.service;

import com.visualpathit.account.model.User;

public interface UserService {
    void save(User user);

    User findByUsername(String username);
}
