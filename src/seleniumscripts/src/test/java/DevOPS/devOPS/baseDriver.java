package DevOPS.devOPS;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.testng.annotations.AfterTest;

public class baseDriver {
	
	public baseDriver()
	{
		Chromedriver();
	}
	
	
	public static WebDriver Chromedriver() {
		System.setProperty("webdriver.chrome.driver", System.getProperty("user.dir")
				  + "\\ChromeDriver\\chromedriver.exe");
		WebDriver driver = new ChromeDriver();
		return driver;

	}
	
	
	

	
}
