package Practice;

import java.io.IOException;
import java.net.URL;

import org.json.JSONObject;

import com.mashape.unirest.http.HttpResponse;
import com.mashape.unirest.http.JsonNode;
import com.mashape.unirest.http.Unirest;
import com.mashape.unirest.http.exceptions.UnirestException;

public class RestClient {
	String wurl = "https://api.openweathermap.org/data/2.5/find";
	URL furl;
	
	public void loadWeather() throws UnirestException, IOException {
		HttpResponse<JsonNode> jsonResponse = Unirest.get(wurl)
				.header("accept","application/json")
				.queryString("appid","7d96bc5108f52b80e2d9075a369b9f35")
				.queryString("q", "Seoul")
				.queryString("units", "metric")
				.asJson();
		
		JSONObject data = jsonResponse.getBody().getObject().getJSONArray("list").getJSONObject(0);
		JSONObject current = data.getJSONObject("main");
		JSONObject weather = data.getJSONArray("weather").getJSONObject(0);  
		
		System.out.println("== 현재 날씨 ==");
		System.out.println("날씨: "+weather.getString("main"));
		System.out.println("상태: "+weather.getString("description"));
		System.out.println("기온: "+current.getInt("temp"));
		
		System.out.println("도시: "+data.getString("name"));
	}
	
	public static void main(String[] args) {
		RestClient app = new RestClient();
		try {
			app.loadWeather();
		} catch (UnirestException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
