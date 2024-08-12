package com.visualpathit.account.service;

import java.util.List;

import com.visualpathit.account.model.User;

/** {@author imrant}!*/
public interface UserService {
	/** {@inheritDoc}} !*/
    void save(User user);
    /** {@inheritDoc}} !*/
    User findByUsername(String username);
    User findById(long id);
    /*public void updateUser(User user);*/
    public List <User> getList();
}
