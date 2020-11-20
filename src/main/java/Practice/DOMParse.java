package Practice;
import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpressionException;
import javax.xml.xpath.XPathFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.xml.sax.SAXException;
public class DOMParse {
	public static void main(String[] args) throws ParserConfigurationException, SAXException, IOException{
	
		URL obj = new URL("https://www.yna.co.kr/view/MYH20191126011300038"); 
		HttpURLConnection con = (HttpURLConnection)obj.openConnection();

		con.setDoOutput(true);
		con.setRequestMethod("GET");

		BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
		String line;
		String resultLine = "";
		while((line = in.readLine()) != null)
		{
		resultLine += line; 
		}

		in.close();
		            
		Document xml = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(new ByteArrayInputStream(resultLine.getBytes()));
		xml.getDocumentElement().normalize();
		            
		XPath xpath = XPathFactory.newInstance().newXPath();
		Node userName = null;
		try {
			userName = (Node) xpath.evaluate("tit", xml, XPathConstants.NODE);
		} catch (XPathExpressionException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
//		Node userAge= (Node) xpath.evaluate("//user/age", xml, XPathConstants.NODE);

		System.out.println("유저이름 : " + userName.getTextContent());
	}
}

