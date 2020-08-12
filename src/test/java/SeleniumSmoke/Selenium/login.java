
package SeleniumSmoke.Selenium;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.testng.annotations.Test;

public class login {
	
	
	/*
	 * WebDriver driver = new ChromeDriver();
	 * 
	 * 
	 * 
	 * WebElement signin_link = driver.findElement(By.linkText("Sign in"));
	 * WebElement userName = driver.findElement(By.id("email")); WebElement password
	 * =driver.findElement(By.id("passwd")); WebElement signin
	 * =driver.findElement(By.id("SubmitLogin"));
	 */
		
	 
	@Test
	public void login_funcationality() throws InterruptedException {
		
		System.setProperty("webdriver.chrome.driver", System.getProperty("user.dir")
				  + "\\ChromeDriver\\chromedriver.exe");
		WebDriver driver = new ChromeDriver();
		
		
		
		  driver.get("http://automationpractice.com/index.php");
		Thread.sleep(5000);
		  WebElement signin_link = driver.findElement(By.xpath("//*[@id=\"header\"]/div[2]/div/div/nav/div[1]/a"));
			Thread.sleep(5000);
		  signin_link.click();
		
		  Thread.sleep(10000);
		  System.out.println("Sign in clicked");
		  WebElement userName = driver.findElement(By.id("email")); 
		  WebElement password
		  =driver.findElement(By.id("passwd")); 
		  WebElement signin
		  =driver.findElement(By.id("SubmitLogin"));
		
		
		userName.sendKeys("vagdhan@gmail.com");
		password.sendKeys("Secrete@8881");
		signin.click();
		
		
	
	}
}
