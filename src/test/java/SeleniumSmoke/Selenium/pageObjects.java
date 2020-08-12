package SeleniumSmoke.Selenium;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

public class pageObjects {	
	
	protected static WebDriver driver;
	
	public pageObjects(WebDriver driver) {
		// TODO Auto-generated constructor stub
		this.driver = driver;
	}
	
	public WebElement signin_link,userName,password,signin;
	
	
	public void loginElements(String url) throws InterruptedException {
		driver.get(url);
		Thread.sleep(5000);
		signin_link = driver.findElement(By.xpath("//*[@id=\"header\"]/div[2]/div/div/nav/div[1]/a"));
		signin_link.click();
		Thread.sleep(10000);
		userName = driver.findElement(By.id("email")); 
		password =driver.findElement(By.id("passwd")); 
		signin  =driver.findElement(By.id("SubmitLogin"));
		
	}	
	
	  


	public void loginAction(String UserName, String Password) {		 
				
		userName.sendKeys(UserName);
		password.sendKeys(Password);
		signin.click();
		 	  
  }

	
	
}
