package com.visualpathit.account.beans;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class Components {
	
	@Value("${memcached.active.host}")
    private String activeHost;
	@Value("${memcached.active.port}")
    private String activePort;
	@Value("${memcached.standBy.host}")
    private String standByHost;
	@Value("${memcached.standBy.port}")
    private String standByPort;
	
	public String getActiveHost() {
		return activeHost;
	}
	public String getActivePort() {
		return activePort;
	}
	public String getStandByHost() {
		return standByHost;
	}
	public String getStandByPort() {
		return standByPort;
	}
	public void setActiveHost(String activeHost) {
		this.activeHost = activeHost;
	}
	public void setActivePort(String activePort) {
		this.activePort = activePort;
	}
	public void setStandByHost(String standByHost) {
		this.standByHost = standByHost;
	}
	public void setStandByPort(String standByPort) {
		this.standByPort = standByPort;
	}
	

	
}
