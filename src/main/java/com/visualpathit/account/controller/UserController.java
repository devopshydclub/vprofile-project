package com.visualpathit.account.controller;

import com.visualpathit.account.model.User;
import com.visualpathit.account.service.SecurityService;
import com.visualpathit.account.service.UserService;
import com.visualpathit.account.validator.UserValidator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
/**{@author waheedk}*/
@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @Autowired
    private SecurityService securityService;

    @Autowired
    private UserValidator userValidator;
    
    /** {@inheritDoc} */
    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public final String registration(final Model model) {
        model.addAttribute("userForm", new User());

        return "registration";
    }
    /** {@inheritDoc} */
    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public final String registration(final @ModelAttribute("userForm") User userForm, 
    	final BindingResult bindingResult, final Model model) {
    	
        userValidator.validate(userForm, bindingResult);
        if (bindingResult.hasErrors()) {
            return "registration";
        }
        System.out.println("User PWD:"+userForm.getPassword());
        userService.save(userForm);

        securityService.autologin(userForm.getUsername(), userForm.getPasswordConfirm());

        return "redirect:/welcome";
    }
    /** {@inheritDoc} */
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public final String login(final Model model, final String error, final String logout) {
        if (error != null){
            model.addAttribute("error", "Your username and password is invalid.");
        }
        if (logout != null){
            model.addAttribute("message", "You have been logged out successfully.");
        }
        return "login";
    }
    /** {@inheritDoc} */
    @RequestMapping(value = { "/", "/welcome"}, method = RequestMethod.GET)
    public final String welcome(final Model model) {
        return "welcome";
    }
    /** {@inheritDoc} */
    @RequestMapping(value = { "/index"} , method = RequestMethod.GET)
    public final String indexHome(final Model model) {
        return "index_home";
    }
}
