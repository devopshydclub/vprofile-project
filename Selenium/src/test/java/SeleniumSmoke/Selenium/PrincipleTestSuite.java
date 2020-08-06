
package SeleniumSmoke.Selenium;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.testng.annotations.Test;
import SeleniumSmoke.Selenium.baseDriver;
import SeleniumSmoke.Selenium.pageObjects;

public class PrincipleTestSuite  {
		
	@Test
	public void logintest() throws InterruptedException
	{
		WebDriver driver = baseDriver.Chromedriver();		
		pageObjects page = new pageObjects(driver);
		page.loginElements("http://automationpractice.com/index.php");
		page.loginAction("vagdhan@gmail.com", "Secrete@8881");
	 	    
	}
	
	
}
