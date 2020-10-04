package DevOPS.devOPS;

import static org.testng.Assert.assertEquals;

import java.util.concurrent.TimeUnit;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

public class vprofileHomePageVerification {

	private WebDriver driver;

	public vprofileHomePageVerification(WebDriver driver) {
		// TODO Auto-generated constructor stub
		this.driver = driver;
	}
	
   //public WebElement welcometitle;
    
	public void HomePageCheck() throws InterruptedException
	{
		System.out.println("Entred into homepage check");
		Thread.sleep(10000);
		//driver.manage().timeouts().implicitlyWait(10, TimeUnit.SECONDS);
	    WebElement welcometitle = driver.findElement(By.className("user-name"));
	    //driver.findElement(By.xpath("/html/body/div[1]/div/div[4]/div[1]/div/span[1]/h1/small"));	
	    
	    System.out.println("Entered into Homepage   "+welcometitle.getText());
	    
	    assertEquals(welcometitle.getText(), "admin_vp");
	  	  
	  
	}
	
	
	

}
