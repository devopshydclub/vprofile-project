package com.visualpathit.account.utils;

import java.net.InetSocketAddress;
import java.util.concurrent.Future;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.visualpathit.account.beans.Components;
import com.visualpathit.account.model.User;

import net.spy.memcached.MemcachedClient;
import net.spy.memcached.MemcachedNode;
@Service
public class MemchachedUtils {
	
	private static Components object;
    @Autowired
    public void setComponents(Components object){
    	MemchachedUtils.object = object;
    }
    public static String memchachedSetData(User user,String key){    	
    	String Result = "";
    	int expireTime =  900;
    	try{
    			MemcachedClient mactiveClient = memchachedConnectionByActiveHost();
	                if (!mactiveClient.getStats().isEmpty()) {	                	
	                	Future future = mactiveClient.set(key,expireTime, user);	        	         
	     	            System.out.println("set status:" + future.get());
	     	            Result =" Data is From DB and Data Inserted In Chache !!";
	     	            mactiveClient.shutdown();
	                }else{
	                	MemcachedClient mstandByClient = memchachedConnectionByStandByHost();
	                	if (!mstandByClient.getStats().isEmpty()) {
			                	Future future = mstandByClient.set(key,expireTime, user);	        	         
			     	            System.out.println("set status:" + future.get());
			     	            Result =" Data is From DB and Data Inserted In StandBy Chache !!";
			     	            mstandByClient.shutdown();			                	
	    	            }else{
			                	Result =" Data Insertion Failure !! ";
	    	            }
	                }
	           
    		
    	} catch (Exception e) {    		
    		System.out.println( e.getMessage() );
		}
    	return Result;
    }
    public static User memchachedGetData(String key){
    	String Result = "";
    	User userData = null;
    	try{
    			MemcachedClient mclient = memchachedConnectionByActiveHost();
	                if (!mclient.getStats().isEmpty()) {	           
	                	userData = (User) mclient.get(key);
	     	            System.out.println("user value in cache - " + mclient.get(key));
	     	            Result =" Data Retrieval From Chache !!";
	     	            System.out.println(Result);
	     	            mclient.shutdown();
	                }
	                else{
	                		MemcachedClient mstandByClient = memchachedConnectionByStandByHost();	                	
	                		if (!mstandByClient.getStats().isEmpty()) {
	                			userData = (User) mstandByClient.get(key);
	    	     	            System.out.println("user value in cache - " + mstandByClient.get(key));
	    	     	            Result =" Data Retrieval From StandBy Chache !!";
	    	     	            System.out.println(Result);
	    	     	            mstandByClient.shutdown();
			                	
	                		}else{
			                	Result =" Data Retrieval Failure ::";
			                	mstandByClient.shutdown();
			                	mclient.shutdown();
	                		}
	                }
	           
    	} catch (Exception e) {    		
    		System.out.println( e.getMessage() );
		}
    	return userData;
    }
    public static MemcachedClient memchachedConnectionByActiveHost(){
    	MemcachedClient mcconn = null;
    	String activeHost =object.getActiveHost();
    	String activePort =object.getActivePort();
    	System.out.println("activeHost ::"+object.getActiveHost());
    	System.out.println("activePort ::"+object.getActivePort());
    	try{
    	if(!activeHost.isEmpty() && !activePort.isEmpty()){
    		mcconn = new MemcachedClient(new InetSocketAddress(activeHost,Integer.parseInt(activePort)));
	    		System.out.println("--------------------------------------------");
	    		System.out.println("Connection to server sucessful.");
	            System.out.println("Status Connection Node::"+mcconn.getNodeLocator().getAll().isEmpty());
	            System.out.println("--------------------------------------------");
    	}else {
    		 System.out.println("--------------------------------------------");
    		 System.out.println("Connection to Failure.");
    		 System.out.println("Connection Object is::"+ mcconn);
    		 System.out.println("--------------------------------------------");
    	}
    	}
    	catch (Exception e) {
    		System.out.println( e.getMessage() );
		}
    	return mcconn;
    }
    public static MemcachedClient memchachedConnectionByStandByHost(){
    	MemcachedClient mcconn = null;
    	String standByHost =object.getStandByHost();
    	String standByPort =object.getStandByPort();
    	System.out.println("activeHost ::"+object.getActiveHost());
    	System.out.println("activePort ::"+object.getActivePort());
    	try{
    	if(!standByHost.isEmpty() && !standByPort.isEmpty()){
    		mcconn = new MemcachedClient(new InetSocketAddress(standByHost,Integer.parseInt(standByPort)));
    		System.out.println("--------------------------------------------");
    		System.out.println("Connection to server sucessful by StandBy Host:" + standByHost);
            System.out.println("Status Connection Node::"+mcconn.getNodeLocator().getAll().isEmpty());
            System.out.println("--------------------------------------------");
    	}else {
    		 System.out.println("--------------------------------------------");
    		 System.out.println("Connection to Failure.");
    		 System.out.println("Connection Object is::"+ mcconn);
    		 System.out.println("--------------------------------------------");
    	}
    	}
    	catch (Exception e) {
    		System.out.println( e.getMessage() );
		}
    	return mcconn;
    }
}
