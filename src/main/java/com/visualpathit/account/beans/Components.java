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
	
	@Value("${rabbitmq.address}")
    private String rabbitMqHost;
	@Value("${rabbitmq.port}")
    private String rabbitMqPort;
	@Value("${rabbitmq.username}")
    private String rabbitMqUser;
	@Value("${rabbitmq.password}")
    private String rabbitMqPassword;
	
	
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
	public String getRabbitMqHost() {
		return rabbitMqHost;
	}
	public void setRabbitMqHost(String rabbitMqHost) {
		this.rabbitMqHost = rabbitMqHost;
	}
	public String getRabbitMqPort() {
		return rabbitMqPort;
	}
	public void setRabbitMqPort(String rabbitMqPort) {
		this.rabbitMqPort = rabbitMqPort;
	}
	public String getRabbitMqUser() {
		return rabbitMqUser;
	}
	public void setRabbitMqUser(String rabbitMqUser) {
		this.rabbitMqUser = rabbitMqUser;
	}
	public String getRabbitMqPassword() {
		return rabbitMqPassword;
	}
	public void setRabbitMqPassword(String rabbitMqPassword) {
		this.rabbitMqPassword = rabbitMqPassword;
	}	
}
