package DevOPS.devOPS;

public class Variables {
	
	/*
	 * public static final String URL ="http://192.168.33.12:8080/login"; public
	 * static final String UserName ="admin_vp"; public static final String Password
	 * ="admin_vp"; public static final String ScreenShotPath
	 * ="D:\\work\\devOPS\\ScrnShts\\ScrnSht_";
	 */
	
	public static final String URL = System.getProperty("url");
	public static final String UserName =System.getProperty("usr");
	public static final String Password =System.getProperty("pass");
	public static final String ScreenShotPath =System.getProperty("sShotPath");

}
