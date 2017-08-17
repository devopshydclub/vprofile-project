package com.visualpathit.account.modelTest;

import junit.framework.Assert;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import com.visualpathit.account.model.User;

/** {@author waheedk} !*/
public class UserTest {
	
	public static final Long EXPECTED_ID = 1L;	
    public static final String EXPECTED_USERNAME = "Wahidkhan74";
    public static final String EXPECTED_PASSWD = "Wahidkhan74";
    public static final String EXPECTED_USEREMAIL = "XXXXX@gmail.com";
    private User user;
    @Before
    public void setUp() throws Exception {
        user = new User();
        user.setId(1L);
        user.setUsername("Wahidkhan74");
        user.setPassword("Wahidkhan74");
        user.setUserEmail("XXXXX@gmail.com");
    }

    @After
    public void tearDown() throws Exception {
        System.out.println("Test Completed");

    }

    @Test
    public void testUserDetailsHappyFlow() throws Exception {
    	Assert.assertEquals(EXPECTED_ID, user.getId());
        Assert.assertEquals(EXPECTED_USERNAME, user.getUsername());
        Assert.assertEquals(EXPECTED_PASSWD, user.getPassword());
        Assert.assertEquals(EXPECTED_USEREMAIL, user.getUserEmail());

    }
}