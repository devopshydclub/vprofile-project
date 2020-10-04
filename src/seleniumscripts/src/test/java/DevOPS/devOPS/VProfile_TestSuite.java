package DevOPS.devOPS;

import java.io.IOException;

import org.openqa.selenium.WebDriver;
//import org.testng.annotations.AfterMethod;
import org.testng.annotations.AfterTest;
import org.testng.annotations.Test;



public class VProfile_TestSuite extends Variables {
	    
	@Test(priority=1)
	public void logintest() throws InterruptedException, IOException
	{
		
		WebDriver driver = baseDriver.Chromedriver();
		vprofileHomePagePO vpo = new vprofileHomePagePO(driver);
		vpo.loginPage(Variables.URL);		 
		vpo.loginAction(Variables.UserName, Variables.Password);
		driver.close();
	    
	}
	
	@Test(priority=2)
	public void Homepageverification() throws InterruptedException, IOException
	{
		
		WebDriver driver = baseDriver.Chromedriver();
		vprofileHomePagePO vpo = new vprofileHomePagePO(driver);
		vpo.loginPage(Variables.URL);
		//vpo.loginAction("admin_vp", "admin_vp");
		vpo.loginAction(Variables.UserName, Variables.Password);
		vprofileHomePageVerification vphome = new vprofileHomePageVerification(driver);
		vphome.HomePageCheck();
	    //vphome.HomePageCheck();
	    driver.close();
	}
	
	
	
	

}
