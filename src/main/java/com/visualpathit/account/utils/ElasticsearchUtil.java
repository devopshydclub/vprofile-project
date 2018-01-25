package com.visualpathit.account.utils;

import java.net.InetSocketAddress;

import org.elasticsearch.client.transport.TransportClient;
import org.elasticsearch.common.settings.Settings;
import org.elasticsearch.common.transport.InetSocketTransportAddress;
import org.elasticsearch.transport.client.PreBuiltTransportClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.visualpathit.account.beans.Components;
@Service
public class ElasticsearchUtil {
	
	private static Components object;
    @Autowired
    public void setComponents(Components object){
    	ElasticsearchUtil.object = object;    	
    	
    }
    public static TransportClient trannsportClient() {
    	System.out.println(" elasticsearch client");
    	String elasticsearchHost =object.getElasticsearchHost();
    	String elasticsearchPort =object.getElasticsearchPort(); 
    	String elasticsearchCluster =object.getElasticsearchCluster();
    	String elasticsearchNode =object.getElasticsearchNode();
    	System.out.println(" elasticsearchHost ........"+ elasticsearchHost);
    	System.out.println(" elasticsearchHost ........"+ elasticsearchPort);
    	TransportClient client = null;
    	try {    	
    	Settings settings = Settings.builder()    			
    			.put("cluster.name",elasticsearchCluster)
    			.put("node.name",elasticsearchNode)
    			.build();
    	client = new PreBuiltTransportClient(settings)
                .addTransportAddress(
                new InetSocketTransportAddress(
                		new InetSocketAddress(elasticsearchHost, Integer.parseInt(elasticsearchPort))));

        
    	}
    	catch (Exception e) {
			e.printStackTrace();
		}
    	return client;
      }
}
