package DevOPS.devOPS;

import org.openqa.selenium.WebDriver;
//import org.testng.annotations.AfterMethod;
import org.testng.annotations.AfterTest;
import org.testng.annotations.Test;



public class VProfile_TestSuite {
	
	
     
    
	@Test(priority=1)
	public void logintest() throws InterruptedException
	{
		
		WebDriver driver = baseDriver.Chromedriver();
		vprofileHomePagePO vpo = new vprofileHomePagePO(driver);
		vpo.loginPage("http://54.90.50.239:8080/vprofile/login");
		vpo.loginAction("admin_vp", "admin_vp");
		driver.close();
	    
	}
	
	@Test(priority=2)
	public void Homepageverification() throws InterruptedException
	{
		
		WebDriver driver = baseDriver.Chromedriver();
		vprofileHomePagePO vpo = new vprofileHomePagePO(driver);
		vpo.loginPage("http://54.212.140.230:8080/vprofile/login");
		vpo.loginAction("admin_vp", "admin_vp");
		vprofileHomePageVerification vphome = new vprofileHomePageVerification(driver);
		vphome.HomePageCheck();
	    //vphome.HomePageCheck();
	    driver.close();
	}
	
	
	
	

}
