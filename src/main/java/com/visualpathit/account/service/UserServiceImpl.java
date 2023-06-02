package com.visualpathit.account.service;

import com.visualpathit.account.model.User;
import com.visualpathit.account.repository.RoleRepository;
import com.visualpathit.account.repository.UserRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.List;

/** {@author waheedk}!*/
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    /** userRepository !*/
    private UserRepository userRepository;
    @Autowired
    /** roleRepository !*/
    private RoleRepository roleRepository;
    @Autowired
    /** bCryptPasswordEncoder !*/
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Override
    public void save(final User user) {
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        user.setRoles(new HashSet<>(roleRepository.findAll()));
        userRepository.save(user);
    }

    @Override
    public User findByUsername(final String username) {
        return userRepository.findByUsername(username);
    }
    
    @Override
    public List<User> getList() {
    	return userRepository.findAll();
    }
    @Override
	public User findById(long id){
    	return userRepository.findOne(id);
    }
}
