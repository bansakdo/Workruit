package Practice;

import java.io.IOException;
import java.net.URL;

import org.json.JSONObject;

import com.mashape.unirest.http.HttpResponse;
import com.mashape.unirest.http.JsonNode;
import com.mashape.unirest.http.Unirest;
import com.mashape.unirest.http.exceptions.UnirestException;

public class AddrRestClient {

	String wurl = "http://192.9.83.201:5000/gjavaweb/api/addrbook/list";
	URL furl;
	
	public void loadAddr() throws UnirestException, IOException {
		HttpResponse<JsonNode> jsonResponse = Unirest.get(wurl)
				.header("accept", "application/json")
				.asJson();
		
		JSONObject data = jsonResponse.getBody().getObject().getJSONArray("list").getJSONObject(0);
		JSONObject ab_name = data.getJSONObject("data");
	}
	

	
	
	
}
