package DevOPS.devOPS;

import java.io.IOException;
import java.util.Properties;

import org.testng.annotations.Test;

public class mavenarg {
	@Test
	public void args() throws IOException {
		
		String test = System.getProperty("propertyName");
		System.out.println("value is" + test);
		
		/*
		 * String appPort, ipaddress, username, password;
		 * 
		 * java.io.InputStream inputStream =
		 * Thread.currentThread().getContextClassLoader().getResourceAsStream(
		 * "my.properties"); java.util.Properties properties = new Properties();
		 * properties.load(inputStream); appPort = properties.getProperty("app.port");
		 * ipaddress = properties.getProperty("app.ipaddress"); username =
		 * properties.getProperty("app.username"); password =
		 * properties.getProperty("app.password");
		 */
	}

}
