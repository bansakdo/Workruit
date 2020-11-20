package PProject;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;

import org.json.JSONObject;

import com.mashape.unirest.http.HttpResponse;
import com.mashape.unirest.http.JsonNode;
import com.mashape.unirest.http.Unirest;
import com.mashape.unirest.http.exceptions.UnirestException;

public class Ynh {
	String wurl = "https://www.googleapis.com/customsearch/v1";
	URL furl;
	String key = "AIzaSyBwP1K42FgN5rrgCEX553DtRoC6_-v-nFM";
	String cx = "015492573809795742946:2iyrlzlg1dl";
	String dateRestrict = "m1";
	String[] result;

	public String[] selectTopic(String[][] news) {
		try {
			int num = news.length;
//			String[][] news = customSearch(query, num);						// [index][title, context, url]
			String[][] topics = new String[num * 3][2];						// [index][label, probability]
			result = new String[num];
			int numOfResult = 0;
			int minus = 0;													//context가 null인 개수 
			
			for(int j = 0 ; j < num ; j++) {								//context가 null이면 순서 뒤로 미루
				if(news[j][1] == "" || news[j][1] == null) {
					if(j+minus < num - 1) {
					minus++;
					news[j][0] = news[j+minus][0];
					news[j][1] = news[j+minus][1];
					news[j+minus][0] = null;
					news[j+minus][1] = null;
					} else if(j + minus < num){								// 마지막 index에서 이거 안하면 오류남 
						news[j][0] = news[j+minus][0];
						news[j][1] = news[j+minus][1];
						minus++;
					}
					
				}
			}
			
			
			//-------- 인공지능 기사 분석 ----------

			
//			topics에 일단 값 다 넣음
			for(int i = 0 ; i < num ; i++) {
				String[][] labels = xdc(news[i][1]);
				
				for(int j = 0 ; j < 3 ; j++) {
					for(int k = 0 ; k < num * 3 ; k++) {
						if(topics[k][0] == null) {
							topics[k][0] = labels[j][0];
							topics[k][1] = labels[j][1];
							break;
						}
					}
				}
			}
			System.out.println("topics에 값이 다 들어감");
					
			
//			중복된 것들 점수 합치기 
			for(int i = 0 ; i < num * 3 ; i++) {
				for(int j = i+1 ; j < num * 3 ; j++) {
					if( topics[i][0] == null)
						break;
					if(topics[j][0] == null || topics[j][1] == null || i == j || topics[j][0].equals("") || topics[j][1].equals("")) {
						continue;
					}
					else if(topics[i][0].equals(topics[j][0])) {
						double prob = Double.parseDouble(topics[i][1]);
						prob += Double.parseDouble(topics[j][1]);
						topics[i][1] = String.valueOf(prob);
						topics[j][0] = null;	topics[j][1] = null;
					}
				}
			}
			System.out.println("중복 항목 점수 병합 완료 ");
			
			
			
			
//			확인
//			System.out.println("\n\n---------------------------\n");
//			for(int i = 0 ; i < num*3 ; i++) {
//				if(topics[i][0] == null || topics[i][0].equals("")) {
//					System.out.println("\ni : "+i);
//					break;
//				}else {
//					System.out.println(topics[i][0]+" : "+topics[i][1]);
//				}
//			}
			
			
//			------------ 점수가 내림차 정렬 ---------------
			for(int i = 0 ; i < num*3 ; i++) {
				if(topics[i][0] == null) {
					numOfResult = i;
					break;
				} else {
					for(int j = i+1 ; j <= num*3; j++) {
						if(topics[j][0] == null)	break;
						double num1 = Double.parseDouble(topics[i][1]);
						double num2 = Double.parseDouble(topics[j][1]);
						
						if(num1 < num2) {
							String str1 = topics[i][0];
							String str2 = topics[j][0];
							
							topics[i][0] = str2;
							topics[i][1] = String.valueOf(num2);
							topics[j][0] = str1;
							topics[j][1] = String.valueOf(num1);
							
						}
					}
				}
			}
			System.out.println("topics 내림차순 정렬 완료 ");
			
			
//			--------------- 모든 작업 완료 후 확인 작업 -------------
			result = new String[numOfResult];
			System.out.println("\n\n---------------------------\n");
			for(int i = 0 ; i < num*3 ; i++) {
				if(topics[i][0] == null)
					break;
				else {
					System.out.println(topics[i][0]+" : "+topics[i][1]);
					result[i] = topics[i][0];
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	
//	------------------------- 구글 Custom Search Engine 사용(연합뉴스) --------------------------	
	public String[][] customSearch(String query, int num) throws UnirestException, IOException {
		HttpResponse<JsonNode> jsonResponse = Unirest.get(wurl).header("accept", "application/json")
				.queryString("key", key).queryString("cx", cx).queryString("q", query)
				.queryString("dateRestrict", dateRestrict).asJson();

		String[][] datas = new String[num][3]; // [title, context, url]
		for (int i = 0; i < num; i++) {

//			System.out.println("\n");
			JSONObject data = jsonResponse.getBody().getObject().getJSONArray("items").getJSONObject(i);


			String newsUrl = data.getString("link");
			String title = getNewsTitle(newsUrl);
			String context = newsCrawling(newsUrl);

			datas[i][0] = title;
			datas[i][1] = context;
			datas[i][2] = newsUrl;

//			System.out.println(title);
//			System.out.println(newsUrl);
		}

		return datas;
	}

	
//	----------------------- 연합뉴스 기사 본문문 가져오기 -------------------------
	String newsCrawling(String newsUrl) {

		String context = "";
		try {
			URL url = new URL(newsUrl);
//			System.out.println(String.valueOf(url));
			URLConnection conn = url.openConnection();
			BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
			String line;
			int check_line = 0;

			while ((line = reader.readLine()) != null) {
				if (line.contains("class=\"article\"") && check_line == 0) {
					check_line = 1;
				}
				if (line.contains("저작권자(c)") && check_line == 1) {
					check_line = 0;
				}
				if (check_line == 1) {
//					System.out.println("3");
					if (line.contains("<p>")) {
						context = context.concat(line.split("<p>")[1].split("<")[0]); // p태그 안의 내용만 가져온다
						context = context.trim();
//						System.out.println(context);
					}
				}
			}
			context = context.replace("\"", "\\\"");
//			System.out.println(context);
			reader.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return context;
	}

	
//	-------------------------- 연합뉴스 기사 타이틀 가져오기 --------------------------
	public String getNewsTitle(String newsUrl) {
		String title = "";
		try {
			URL url = new URL(newsUrl);
			URLConnection conn = url.openConnection();
			BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream(),"utf-8"));
			String line;

			while ((line = reader.readLine()) != null) {
//				if (line.contains("class=\"tit-article\"")) {
				if (line.contains("<title>")) {
					title = line.split(">")[1].split("<")[0];
					break;
				}
			
			}
			if(title.contains("|")) {
				title = title.split("\\|")[0];
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return title;
	}

	
//	--------------------- MAUM AI 텍스트 분류 API --------------------------
	String[][] xdc(String context) throws UnirestException, IOException {

		String wurl = "https://api.maum.ai/api/bert.xdc";
		String apiId = "gachon.pproject.5a467605bcdcb";
		String apiKey = "25156799f7e447eaab8cb5731477c0a5";
		String[][] labels = new String[3][2];

		try {

			HttpResponse<JsonNode> response = Unirest.post(wurl).header("Content-Type", "application/json")
					.body("{\"apiId\" : \"" + apiId + "\", \"apiKey\" : \"" + apiKey + "\", \"context\" : \"" + context + "\"}")
					.asJson();

			if (response.getBody().getObject().getJSONObject("message").getString("message").equals("Success")) {
				for (int i = 0; i < 3; i++) {
					JSONObject data = response.getBody().getObject().getJSONArray("labels").getJSONObject(i);
					labels[i][0] = data.getString("label");
					labels[i][1] = String.valueOf(data.getDouble("probability"));
				}

//				System.out.println(data.getString("label"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return labels;
	}

//	public static void main(String[] args) {
//		Ynh app = new Ynh();
//		try {
//			app.selectTopic("삼성전자", 10);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	}
}
