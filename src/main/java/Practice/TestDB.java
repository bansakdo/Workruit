package Practice;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class TestDB {
	private static Connection conn;
	private static PreparedStatement pstmt;
	ResultSet rs;
	String url = "jdbc:mysql://localhost:3306/pproj?characterEncoding=UTF-8&serverTimezone=UTC";

	public void connect() {

		try {
			String dbID = "root";
			String dbPasswd = "gachon654321";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, dbID, dbPasswd);
			System.out.println("Database Connected!!");
		} catch (Exception e) {
			e.printStackTrace();
		}

//		Connection con = null;
//		String url = "jdbc:mysql://localhost:3306/pproj?characterEncoding=UTF-8&serverTimezone=UTC";
//		try {
//			Class.forName("com.mysql.jdbc.Driver");
//			System.out.println("after forName");
//			con = DriverManager.getConnection(url, "root", "gachon654321");
//			System.out.println("DBms connection success");
//			System.out.println("DB load success");
//		} catch (Exception e) {
//			System.out.println("DB load fail " + e.toString());
//		}

	}

//	public static void main(String[] args) {

//		DatabaseConnect dbc

//		Connection con = null;
//		String url = "jdbc:mysql://localhost:3306/pproj?characterEncoding=UTF-8&serverTimezone=UTC";
//		try {
//			Class.forName("com.mysql.jdbc.Driver");
//			System.out.println("after forName");
//			con = DriverManager.getConnection(url, "root", "gachon654321");
//			System.out.println("DBms connection success");
//			System.out.println("DB load success");
//		} catch (Exception e) {
//			System.out.println("DB load fail " + e.toString());
//		}

//		try {
//			conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/pproject", "root", "111111");
//			pstmt = conn.prepareStatement("insert into user (u_id, u_passwd, u_name) values(?,?,?)");
//			pstmt.setString(1, "길똥이");
//			pstmt.setString(2, "1234!");
//			pstmt.setString(3, "abcd@gmail.com");
//			pstmt.executeUpdate();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//	}

}
