package Practice;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;

public class WebCrwlingTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

//		crawling();
		crawling3("samsung");

	}

	static void crawling() {

		try {
			URL url = new URL("https://finance.naver.com/");
			BufferedReader reader = new BufferedReader(new InputStreamReader(url.openStream(), "euc-kr"));
			String line;
			int check_line = 0;

//			System.out.println("0");
			System.out.println(String.valueOf(reader.readLine()));
			while ((line = reader.readLine()) != null) {
				if (line.contains("<a href=\"/marketindex/worldExchangeDetail.nhn?marketindexCd")) {
					check_line = 1;
//					System.out.println("1");
				}
				if (line.contains("<a href=\"/marketindex/?tabSel=worldExchange#tab_section\"")) {
					check_line = 0;
//					System.out.println("2");
				}
				if (check_line == 1) {
//					System.out.println("3");
					if (line.contains("<a href=\"/marketindex/worldExchangeDetail.nhn?marketindexCd=")) {
						String temp = line.split(">")[1].split("<")[1];
						temp = temp.trim();
						System.out.println(temp);
					}
					if (line.contains("<td>") && !line.contains("em")) {
						String temp = line.split(">")[1].split("<")[0];
						System.out.println(temp);
					}
					if (line.contains("<td>") && line.contains("em")) {
						String temp = line.split(">")[3].split("<")[0];
						System.out.println(temp);
						String temp2 = line.split(">")[5].split("<")[0];
						System.out.println(temp2);
						System.out.println();
					}
				}
			}
//			System.out.println("-1");
			reader.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	static void crawling3(String search) {

		try {
			URL url = new URL("https://www.yna.co.kr/search/index?query=" + search);
			System.out.println(String.valueOf(url));
			URLConnection conn = url.openConnection();
			BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
			String line;
			int check_line = 0;

			System.out.println(String.valueOf(reader.readLine()));
			while ((line = reader.readLine()) != null) {
//				System.out.println("111");
				if (line.contains("class=\"cts_atclst\"")) {
					check_line = 1;
					System.out.println("1");
				}
				if (line.contains("</div>")) {
					check_line = 0;
//					System.out.println("2");
				}
				if (check_line == 1) {
					System.out.println("3");
					if (line.contains("<a href=\"")) {
						String temp = line.split("\"")[0].split("\"")[10];
						temp = temp.trim();
						System.out.println(temp);
					}
//					if (line.contains("<td>") && !line.contains("em")) {
//						String temp = line.split(">")[1].split("<")[0];
//						System.out.println(temp);
//					}
//					if (line.contains("<td>") && line.contains("em")) {
//						String temp = line.split(">")[3].split("<")[0];
//						System.out.println(temp);
//						String temp2 = line.split(">")[5].split("<")[0];
//						System.out.println(temp2);
//						System.out.println();
//					}
				}
			}
//			System.out.println("-1");
			reader.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	static void crawling2(String search) {

		try {
			URL url = new URL("https://www.yna.co.kr/search/index?sort=weight&query=" + search);
			URLConnection conn = url.openConnection();
			BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream(), "euc-kr"));
			String line;
			int check_line = 0;

			System.out.println(String.valueOf(reader.readLine()));
			while ((line = reader.readLine()) != null) {
				if (line.contains("class=\"cts_atclst\"")) {
					check_line = 1;
//					System.out.println("1");
				}
				if (line.contains("</div>")) {
					check_line = 0;
//					System.out.println("2");
				}
				if (check_line == 1) {
//					System.out.println("3");
					if (line.contains("<a href=\"")) {
						String temp = line.split("\"")[0].split("\"")[1];
						temp = temp.trim();
						System.out.println(temp);
					}
//					if (line.contains("<td>") && !line.contains("em")) {
//						String temp = line.split(">")[1].split("<")[0];
//						System.out.println(temp);
//					}
//					if (line.contains("<td>") && line.contains("em")) {
//						String temp = line.split(">")[3].split("<")[0];
//						System.out.println(temp);
//						String temp2 = line.split(">")[5].split("<")[0];
//						System.out.println(temp2);
//						System.out.println();
//					}
				}
			}
//			System.out.println("-1");
			reader.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
