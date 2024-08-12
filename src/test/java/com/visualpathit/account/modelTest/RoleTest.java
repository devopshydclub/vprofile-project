package com.visualpathit.account.modelTest;

import junit.framework.Assert;

import java.util.HashSet;
import java.util.Set;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import com.visualpathit.account.model.Role;
import com.visualpathit.account.model.User;

/** {@author imrant} !*/
public class RoleTest {

	public static final Long EXPECTED_ID = 1L;	
    public static final String EXPECTED_ROLENAME = "Admin";
    public static final int EXPECTED_SIZE = 1;
    private Role role;
    @Before
    public void setUp() throws Exception {
    	User user = new User();
        user.setId(1L);
        user.setUsername("Wahidkhan74");
        user.setPassword("Wahidkhan74");
        user.setUserEmail("XXXXX@gmail.com");
        
    	Set<User> users = new HashSet<User>();    	
    	users.add(user);    	
    	role = new Role();
    	role.setId(1L);
        role.setName("Admin");
        role.setUsers(users);
    }

    @After
    public void tearDown() throws Exception {
        System.out.println("Test Completed");

    }

    @Test
    public void testUserDetailsHappyFlow() throws Exception {
    	Assert.assertEquals(EXPECTED_ID, role.getId());
        Assert.assertEquals(EXPECTED_ROLENAME, role.getName());
        Assert.assertEquals(EXPECTED_SIZE,role.getUsers().size());

    }
}