package com.visualpathit.account.service;

/** method for finding already added user !*/
public interface SecurityService {
	/** {@inheritDoc}} !*/
    String findLoggedInUsername();

    boolean autologin(String username, String password);
}
