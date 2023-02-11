package com.visualpathit.account.controllerTest;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.forwardedUrl;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;

import org.junit.Before;
import org.junit.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import com.visualpathit.account.controller.UserController;
import com.visualpathit.account.model.User;
import com.visualpathit.account.service.UserService;
import com.visualpathit.account.setup.StandaloneMvcTestViewResolver;


public class UserControllerTest {
	
	@Mock
	private UserService controllerSer;
	@InjectMocks
	private UserController controller;
	private MockMvc mockMvc;
	
	@Before
	public void setup(){
		MockitoAnnotations.initMocks(this);
		
		/*InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
        viewResolver.setPrefix("/WEB-INF/views/");
        viewResolver.setSuffix(".jsp");
		*/
		mockMvc = MockMvcBuilders.standaloneSetup(controller)
				  .setViewResolvers(new StandaloneMvcTestViewResolver()).build();
	}
	
	@Test
	public void registrationTestforHappyFlow() throws Exception{
		User user = new User();
		mockMvc.perform(get("/registration"))
        .andExpect(status().isOk())
        .andExpect(view().name("registration"))
        .andExpect(forwardedUrl("registration"));
		
	}
	@Test
	public void registrationTestforNullValueHappyFlow() throws Exception{
		mockMvc.perform(get("/registration"))
        .andExpect(status().isOk())
        .andExpect(view().name("registration"))
        .andExpect(forwardedUrl("registration"));
		
	}
	/*@Test
	public void registrationTestforPostValueHappyFlow() throws Exception{
		String description =new String("Error String");
		UserValidator userValidator;
		BindingResult bindingResult;
		when(userValidator.validate(new User(),bindingResult))
		.thenThrow(bindingResult.hasErrors());
		mockMvc.perform(post("/registration").contentType(MediaType.APPLICATION_FORM_URLENCODED)
                .param("userForm","userForm"))
		
        .andExpect(status().isOk());
        //.andExpect(view().name("redirect:/welcome"))
        //.andExpect(forwardedUrl("redirect:/welcome"));
		
	}*/
	@Test
	public void loginTestHappyFlow() throws Exception{
		String error = "Your username and password is invalid";
		mockMvc.perform(get("/login").param(error, error))
        .andExpect(status().isOk())
        .andExpect(view().name("login"))
        .andExpect(forwardedUrl("login"));
		
	}
	@Test
	public void welcomeTestHappyFlow() throws Exception{
		mockMvc.perform(get("/welcome"))
        .andExpect(status().isOk())
        .andExpect(view().name("welcome"))
        .andExpect(forwardedUrl("welcome"));
		
	}
	@Test
	public void welcomeAfterDirectLoginTestHappyFlow() throws Exception{
		mockMvc.perform(get("/"))
        .andExpect(status().isOk())
        .andExpect(view().name("welcome"))
        .andExpect(forwardedUrl("welcome"));
		
	}
	@Test
	public void indexTestHappyFlow() throws Exception{
		mockMvc.perform(get("/index"))
        .andExpect(status().isOk())
        .andExpect(view().name("index_home"))
        .andExpect(forwardedUrl("index_home"));
		
	}

}
