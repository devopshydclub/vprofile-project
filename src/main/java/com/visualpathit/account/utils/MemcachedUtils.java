package com.visualpathit.account.utils;

import java.net.InetSocketAddress;
import java.net.SocketAddress;
import java.util.concurrent.Future;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.visualpathit.account.beans.Components;
import com.visualpathit.account.model.User;

import net.spy.memcached.MemcachedClient;
@Service
public class MemcachedUtils {
	
	private static Components object;
    @Autowired
    public void setComponents(Components object){
    	MemcachedUtils.object = object;
    }
    public static String memcachedSetData(User user,String key){    	
    	String Result = "";
    	int expireTime =  900;
    	try{
    			MemcachedClient mactiveClient = memcachedConnection();
    			System.out.println("--------------------------------------------");
    			System.out.println("Client is ::"+ mactiveClient.getStats());
    			System.out.println("--------------------------------------------");
	            Future future = mactiveClient.set(key,expireTime, user);	        	         
	     	    System.out.println("set status:" + future.get());
	     	    Result =" Data is From DB and Data Inserted In Cache !!";
	     	    mactiveClient.shutdown();             
	           
    		
    	} catch (Exception e) {    		
    		System.out.println( e.getMessage() );
		}
    	return Result;
    }
    public static User memcachedGetData(String key){
    	String Result = "";
    	User userData = null;
    	try{
    			MemcachedClient mclient = memcachedConnection();
    			System.out.println("--------------------------------------------");
    			System.out.println("Client Status :: "+mclient.getStats());
    			System.out.println("--------------------------------------------");
	            userData = (User) mclient.get(key);
	     	    System.out.println("user value in cache - " + mclient.get(key));
	     	    Result =" Data Retrieval From Cache !!";
	     	    System.out.println(Result);
	     	    mclient.shutdown();               
	           
    	} catch (Exception e) {    		
    		System.out.println( e.getMessage() );
		}
    	return userData;
    }
    public static MemcachedClient memcachedConnection(){ 
    	MemcachedClient mcconn = null;
    	boolean active = true;
    	String key="pid";
    	String port = "";
    	String activeHost =object.getActiveHost();
    	String activePort =object.getActivePort();    	
    	try{   		
    		if(!activeHost.isEmpty() && !activePort.isEmpty() && active){
	    		mcconn = new MemcachedClient(new InetSocketAddress(activeHost,Integer.parseInt(activePort)));
	    		for(SocketAddress innerKey:mcconn.getStats().keySet()){
	    			System.out.println("Connection  SocketAddress ::" + innerKey);
	    			//System.out.println("Connection port ::" + mcconn.getStats().get(innerKey).get(key));
	    			port = mcconn.getStats().get(innerKey).get(key);	    			
	    		} 
	    		if(port == null){
    				System.out.println("Port::"+ port);
    				mcconn.shutdown();
    				System.out.println("--------------------------------------------");
		       		System.out.println("Connection Failure By Active Host ::" + activeHost);
		       		System.out.println("--------------------------------------------");
		       		mcconn = null;
		       		active =false;
		       		return mcconn = standByMemcachedConn();
    			}
    			if(!port.isEmpty()){
	    			System.out.println("--------------------------------------------");
		    		System.out.println("Connection to server sucessfull for active Host ::"+activeHost);
		            System.out.println("--------------------------------------------");
		            active =true;
		            return mcconn;
	    		}
	    	}else if(!activeHost.isEmpty() && !activePort.isEmpty() && !active){
	    		return mcconn = standByMemcachedConn();
	    	}else {
	    		 System.out.println("--------------------------------------------");
	    		 System.out.println("Connection to Failure Due to Incorrect or Empty Host:: ");
	    		 System.out.println("--------------------------------------------");
	    	}
	    	}
    	catch (Exception e) {
    		System.out.println( e.getMessage() );
		}
    	return mcconn;
    }   
    public static MemcachedClient standByMemcachedConn(){
    	MemcachedClient mcconn = null;
    	String port = "";
    	String key="pid";
    	String standByHost = object.getStandByHost();
    	String standByPort = object.getStandByPort();
    	try{
    	if(!standByHost.isEmpty() && !standByPort.isEmpty() && mcconn == null && port.isEmpty()){
    		mcconn = new MemcachedClient(new InetSocketAddress(standByHost,Integer.parseInt(standByPort)));
    		for(SocketAddress innerKey:mcconn.getStats().keySet()){
    			port = mcconn.getStats().get(innerKey).get(key);    		
    		}
    		if(!port.isEmpty()){
	    		System.out.println("--------------------------------------------");
	    		System.out.println("Connection to server sucessful by StandBy Host::" + standByHost);
	            System.out.println("--------------------------------------------");
	            return mcconn;
    		}else {
	    		 mcconn.shutdown();
	       		 System.out.println("--------------------------------------------");
	       		 System.out.println("Connection Failure By StandBy Host ::" +standByHost);
	       		 System.out.println("--------------------------------------------");
    		}
    	}
    	}catch (Exception e) {
    		System.out.println( e.getMessage() );
		}
    	return mcconn;
    }    
}
