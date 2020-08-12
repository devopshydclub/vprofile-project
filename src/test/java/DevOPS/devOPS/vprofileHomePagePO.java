package DevOPS.devOPS;

import java.util.concurrent.TimeUnit;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.WebDriverWait;

public class vprofileHomePagePO {

	//Acquiring Web Driver From the test suite and creating a local instance
	
		protected static WebDriver driver;
		
		public vprofileHomePagePO(WebDriver driver) {
			// TODO Auto-generated constructor stub
			this.driver = driver;
		}
		// Explicit wait implementation variables
		
		//WebDriverWait wait=new WebDriverWait(driver, 20);
		
		String eHeadding ="LOGIN";
		
		// Defining Local variables for the page elements 
		
		public WebElement signin_link,userName,password,signin;
		
		/*
		 * Method for defining Elements on the Login Page Any future modifications in
		 * the login page code effecting the Login page UI has to be dealt in this
		 * method
		 */
		
		public void loginPage(String url) {
			
			driver.manage().timeouts().implicitlyWait(10,TimeUnit.SECONDS) ;
			driver.get(url);
			String aHeadding =driver.getTitle();
			//driver.manage().timeouts().implicitlyWait(10,TimeUnit.SECONDS) ;
			if (eHeadding.equals(aHeadding)) {
				
				    userName= driver.findElement(By.name("username"));
				    password=driver.findElement(By.name("password"));
				    signin=driver.findElement(By.xpath("/html/body/div[2]/form/div/button"));
				
			}
		   
		}
		
		//Method for invoking login Activity

	/*	public void loginAction(String UserName, String Password) throws InterruptedException {		 
					
			userName.sendKeys(UserName);
			password.sendKeys(Password);
			Thread.sleep(5000);
			signin.click();
		}*/
		
		public vprofileHomePageVerification loginAction(String UserName, String Password) throws InterruptedException {		 
			
			userName.sendKeys(UserName);
			password.sendKeys(Password);
			Thread.sleep(5000);
			signin.click();
			
			return new vprofileHomePageVerification(driver);
		}
}

