package com.visualpathit.account.utils;

import java.io.IOException;
import java.net.InetSocketAddress;

import org.apache.http.HttpHost;
import org.elasticsearch.client.RequestOptions;
import org.elasticsearch.client.RestClient;
import org.elasticsearch.client.RestHighLevelClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.visualpathit.account.beans.Components;

@Service
public class ElasticsearchUtil {

    private static Components object;

    @Autowired
    public void setComponents(Components object) {
        ElasticsearchUtil.object = object;    	
    }

    public static RestHighLevelClient getRestHighLevelClient() {
        System.out.println("Creating Elasticsearch client...");
        String elasticsearchHost = object.getElasticsearchHost();
        String elasticsearchPort = object.getElasticsearchPort();
        
        System.out.println("Elasticsearch Host: " + elasticsearchHost);
        System.out.println("Elasticsearch Port: " + elasticsearchPort);

        RestHighLevelClient client = null;
        try {
            client = new RestHighLevelClient(
                RestClient.builder(
                    new HttpHost(elasticsearchHost, Integer.parseInt(elasticsearchPort), "http")
                )
            );
        } catch (Exception e) {
            e.printStackTrace();
        }
        return client;
    }
}
