package PProject;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

//			형식
//String sql = "";
//connect();
//try {
//	pstmt = conn.prepareStatement(sql);
//	
//	pstmt.executeUpdate();
//}catch(Exception e) {
//	e.printStackTrace();
//	return false;
//}finally {
//	disconnect();
//}
//return true;

//USER, percat, persche, recruit,				 bookmark, history



public class DatabaseConnect {

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
	}

	public void disconnect() {
		try {
			if (rs != null) {
				rs.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			if (pstmt != null) {
				pstmt.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			if (conn != null) {
				conn.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

//	--------------------------------------- USER ---------------------------------------
	public boolean addUser(User u) {
		String sql = "insert into user (u_id, u_passwd, u_name, u_tel, u_email, u_etc) values (?, ?, ?, ?, ?, ?)";
		
		connect();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, u.getU_id());
			pstmt.setString(2, u.getU_passwd());
			pstmt.setString(3, u.getU_name());
			pstmt.setString(4, u.getU_tel());
			pstmt.setString(5, u.getU_email());
			pstmt.setString(6, u.getU_etc());
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			disconnect();
		}
		return true;
	}
	
	public User getUser(String u_id) {
		User user = new User();
		String sql = "select * from user where u_id = ?";
		connect();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, u_id);
			rs = pstmt.executeQuery();
			rs.next();
			user.setU_id(rs.getString("u_id"));
			user.setU_passwd(rs.getString("u_passwd"));
			user.setU_name(rs.getString("u_name"));
			user.setU_email(rs.getString("u_email"));
			user.setU_tel(rs.getString("u_tel"));
			user.setU_etc(rs.getString("u_etc"));
			user.setU_level(rs.getString("u_level"));
			rs.close();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return user;
	}
	
	public boolean modUser(User u) {
		String sql = "UPDATE user SET u_passwd=?, u_name=?, u_email=?, u_tel=?, u_level=?, u_etc=? where u_id=?";
		connect();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, u.getU_passwd());
			pstmt.setString(2, u.getU_name());
			pstmt.setString(3, u.getU_email());
			pstmt.setString(4, u.getU_tel());
			pstmt.setString(5, u.getU_level());
			pstmt.setString(6, u.getU_etc());
			pstmt.setString(7, u.getU_id());
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
			return false;
		}finally {
			disconnect();
		}
		return true;
	}
	
	public boolean delUser(String u_id) {
		String sql = "DELETE FROM USER where u_id = ?";
		connect();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, u_id);
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return true;
	}
	
	public List<User> getAllUser() {
		List<User> datas = new ArrayList<>();
		String sql = "select * from user";
		connect();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				User user = new User();
				user.setU_id(rs.getString("u_id"));
				user.setU_passwd(rs.getString("u_passwd"));
				user.setU_name(rs.getString("u_name"));
				user.setU_email(rs.getString("u_email"));
				user.setU_tel(rs.getString("u_tel"));
				user.setU_etc(rs.getString("u_etc"));
				user.setU_level(rs.getString("u_level"));
				datas.add(user);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return datas;
	}
	
//	--------------------------------------- RECRUIT ---------------------------------------
	public boolean addRecruit(Recruit r) {
		String sql = "INSERT INTO RECRUIT (r_title, r_notice, r_com, r_start, r_end, r_Lcat, r_Mcat, r_Scat, r_loc, r_img, r_exp) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		connect();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, r.getR_title());
			pstmt.setString(2, r.getR_notice());
			pstmt.setString(3, r.getR_com());
			pstmt.setTimestamp(4, new Timestamp(r.getR_start().getTime()));
			pstmt.setTimestamp(5, new Timestamp(r.getR_end().getTime()));
			pstmt.setString(6, r.getR_Lcat());
			pstmt.setString(7, r.getR_Mcat());
			pstmt.setString(8, r.getR_Scat());
			pstmt.setString(9, r.getR_loc());
			pstmt.setString(10, r.getR_img());
			pstmt.setString(11, r.getR_exp());
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
			return false;
		}finally {
			disconnect();
		}
		return true;
	}
	
	public Recruit getRecruit(int r_id) {
		Recruit recruit = new Recruit();
		String sql = "SELECT * FROM RECRUIT WHERE r_id = ?";
		connect();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, r_id);
			rs = pstmt.executeQuery();
			rs.next();
			recruit.setR_id(rs.getInt("r_id"));
			recruit.setR_title(rs.getString("r_title"));
			recruit.setR_notice(rs.getString("r_notice"));
			recruit.setR_com(rs.getString("r_com"));
			recruit.setR_start(rs.getTimestamp("r_start"));
			recruit.setR_end(rs.getTimestamp("r_end"));
			recruit.setR_Lcat(rs.getString("r_Lcat"));
			recruit.setR_Mcat(rs.getString("r_Mcat"));
			recruit.setR_Scat(rs.getString("r_Scat"));
			recruit.setR_loc(rs.getString("r_loc"));
			recruit.setR_exp(rs.getString("r_exp"));
			recruit.setR_img(rs.getString("r_img"));
			rs.close();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			disconnect();
		}
		return recruit;
	}
	
	public boolean modRecruit(Recruit r) {
		String sql = "UPDATE RECRUIT SET r_title=?, r_notice=?, r_com=?, r_start=?, r_end=?, r_Lcat=?, r_Mcat=?, r_Scat=?, r_loc=?, r_exp=?, r_img=? WHERE r_id=?";
		connect();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, r.getR_title());
			pstmt.setString(2, r.getR_notice());
			pstmt.setString(3, r.getR_com());
			pstmt.setTimestamp(4, new Timestamp(r.getR_start().getTime()));
			pstmt.setTimestamp(5, new Timestamp(r.getR_end().getTime()));
			pstmt.setString(6, r.getR_Lcat());
			pstmt.setString(7, r.getR_Mcat());
			pstmt.setString(8, r.getR_Scat());
			pstmt.setString(9, r.getR_loc());
			pstmt.setString(10, r.getR_exp());
			pstmt.setString(11, r.getR_img());
			pstmt.setInt(12, r.getR_id());
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
			return false;
		}finally {
			disconnect();
		}
		return true;
	}
	
	public boolean delRecruit(int r_id) {
		String sql = "DELETE FROM RECRUIT WHERE r_id=?";
		connect();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, r_id);
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
			return false;
		}finally {
			disconnect();
		}
		return true;
	}
	
	public List<Recruit> getAllRecruit() {
		List<Recruit> datas = new ArrayList<>();
		String sql = "select * from recruit";
		connect();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Recruit recruit = new Recruit();
				recruit.setR_id(rs.getInt("r_id"));
				recruit.setR_title(rs.getString("r_title"));
				recruit.setR_notice(rs.getString("r_notice"));
				recruit.setR_com(rs.getString("r_com"));
				recruit.setR_start(rs.getTimestamp("r_start"));
				recruit.setR_end(rs.getTimestamp("r_end"));
				recruit.setR_Lcat(rs.getString("r_Lcat"));
				recruit.setR_Mcat(rs.getString("r_Mcat"));
				recruit.setR_Scat(rs.getString("r_Scat"));
				recruit.setR_loc(rs.getString("r_loc"));
				recruit.setR_exp(rs.getString("r_exp"));
				datas.add(recruit);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return datas;
	}
	
	
//	--------------------------------------- PERCAT ---------------------------------------
	public boolean addPerCat(PerCats p) {
		String sql = "INSERT INTO PERCAT (p_userId, p_Lcat, p_Mcat, p_Scat) VALUES (?, ?, ?, ?)";
		connect();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, p.getP_userId());
			pstmt.setString(2, p.getP_Lcat());
			pstmt.setString(3, p.getP_Mcat());
			pstmt.setString(4, p.getP_Scat());
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
			return false;
		}finally {
			disconnect();
		}
		return true;
	}
	
	public PerCats getPerCat(String u_id) {
		PerCats p = new PerCats();
		String sql = "SELECT * FROM PerCat WHERE p_userId=?";
		connect();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, u_id);
			rs = pstmt.executeQuery();
			rs.next();
			p.setP_id(rs.getInt("p_id"));
			p.setP_userId(rs.getString("p_userId"));
			p.setP_Lcat(rs.getString("p_Lcat"));
			p.setP_Mcat(rs.getString("p_Mcat"));
			p.setP_Scat(rs.getString("p_Scat"));
			rs.close();
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return p;
	}
	
	public boolean modPerCat(PerCats p) {
		String sql = "UPDATE PerCat SET p_userId=?, p_Lcat=?, p_Mcat=?, p_Scat=? WHERE p_id=?";
		connect();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, p.getP_userId());
			pstmt.setString(2, p.getP_Lcat());
			pstmt.setString(3, p.getP_Mcat());
			pstmt.setString(4, p.getP_Scat());
			pstmt.setInt(5, p.getP_id());
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
			return false;
		}finally {
			disconnect();
		}
		return true;
	}
	
	public boolean delPerCat(int r_id) {
		String sql = "DELETE FROM PerCat WHERE p_id=?";
		connect();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, r_id);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
			return false;
		}finally {
			disconnect();
		}
		return true;
	}
	
	public List<PerCats> getAllPerCat() {
		List<PerCats> datas = new ArrayList<>();
		String sql = "select * from PerCat";
		connect();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				PerCats p = new PerCats();
				p.setP_id(rs.getInt("p_id"));
				p.setP_userId(rs.getString("p_userId"));
				p.setP_Lcat(rs.getString("p_Lcat"));
				p.setP_Mcat(rs.getString("p_Mcat"));
				p.setP_Scat(rs.getString("p_Scat"));
				datas.add(p);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return datas;
	}
	

//	--------------------------------------- PERSCHE ---------------------------------------
	public boolean addPerSche(PerSche ps) {
		String sql = "INSERT INTO PERSCHE (ps_title, ps_content, ps_start, ps_end) VALUES (?, ?, ?, ?)";
		connect();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ps.getPs_title());
			pstmt.setString(2, ps.getPs_content());
			pstmt.setTimestamp(3, new Timestamp(ps.getPs_start().getTime()));
			pstmt.setTimestamp(4, new Timestamp(ps.getPs_end().getTime()));
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
			return false;
		}finally {
			disconnect();
		}
		return true;
	}
	
	public PerSche getPerSche(int ps_id) {
		PerSche ps = new PerSche();
		String sql = "SELECT * FROM PerSche WHERE ps_id=?";
		connect();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ps_id);
			rs = pstmt.executeQuery();
			rs.next();
			ps.setPs_id(rs.getInt("ps_id"));
			ps.setPs_title(rs.getString("ps_title"));
			ps.setPs_content(rs.getString("ps_content"));
			ps.setPs_start(rs.getTimestamp("ps_start"));
			ps.setPs_end(rs.getTimestamp("ps_end"));
			rs.close();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			disconnect();
		}
		return ps;
	}
	
	public boolean modPerSche(PerSche ps) {
		String sql = "UPDATE PerSche SET ps_title=?, ps_content=?, ps_start=?, ps_end=? WHERE p_id=?";
		connect();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ps.getPs_title());
			pstmt.setString(2, ps.getPs_content());
			pstmt.setTimestamp(3, new Timestamp(ps.getPs_start().getTime()));
			pstmt.setTimestamp(4, new Timestamp(ps.getPs_end().getTime()));
			pstmt.setInt(5, ps.getPs_id());
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
			return false;
		}finally {
			disconnect();
		}
		return true; 
	}
	
	public boolean delPerSche(int ps_id) {
		String sql = "DELETE FROM PerSche WHERE ps_id=?";
		connect();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ps_id);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
			return false;
		}finally {
			disconnect();
		}
		return true;
	}
	
	public List<PerSche> getAllPerSche() {
		List<PerSche> datas = new ArrayList<>();
		String sql = "select * from PerSche";
		connect();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				PerSche ps = new PerSche();
				ps.setPs_id(rs.getInt("ps_id"));
				ps.setPs_title(rs.getString("ps_title"));
				ps.setPs_content(rs.getString("ps_content"));
				ps.setPs_start(rs.getTimestamp("ps_start"));
				ps.setPs_end(rs.getTimestamp("ps_end"));
				datas.add(ps);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return datas;
	}
	
	

//	--------------------------------------- BOOKMARK ---------------------------------------
	public boolean addBookmark(int r_id) {
		String sql = "INSERT INTO BOOKMARK (b_userId, b_recruitId) VALUES(?, ?)";
		connect();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "hoho");
			pstmt.setInt(2, r_id);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
			return false;
		}finally {
			disconnect();
		}
		return true;
	}
	public boolean addBookmark(Bookmark b) {
		String sql = "INSERT INTO BOOKMARK (b_userId, b_recruitId) VALUES(?, ?)";
		connect();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, b.getB_userId());
			pstmt.setInt(2, b.getB_recruitId());
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
			return false;
		}finally {
			disconnect();
		}
		return true;
	}
	
	public Bookmark getBookmark(int b_id) {
		Bookmark b = new Bookmark();
		String sql = "SELECT * FROM BOOKMARK WHERE b_id=?";
		connect();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, b_id);
			rs = pstmt.executeQuery();
			rs.next();
			b.setB_id(rs.getInt("b_id"));
			b.setB_userId(rs.getString("b_userId"));
			b.setB_recruitId(rs.getInt("b_recruitId"));
			rs.close();
		} catch(Exception e) {
			e.printStackTrace();
		}finally {
			disconnect();
		}
		return b;
	}
	
	public boolean modBookmark(Bookmark b) {
		String sql = "UPDATE BOOKMARK SET b_userId=?, b_recruitId=? WHERE b_id=?";
		connect();
		try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, b.getB_userId());
		pstmt.setInt(2, b.getB_recruitId());
		pstmt.setInt(3, b.getB_id());
		pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
			return false;
		}finally {
			disconnect();
		}
		return true;
		
	}
	
	public boolean delBookmark(int b_id) {
		String sql = "DELETE FROM bookmark WHERE b_id=?";
		connect();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, b_id);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
			return false;
		}finally {
			disconnect();
		}
		return true;
	}
	
	public List<Bookmark> getAllBookmark() {
		List<Bookmark> datas = new ArrayList<>();
		String sql = "select * from Bookmark";
		connect();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Bookmark b = new Bookmark();
				b.setB_id(rs.getInt("b_id"));
				b.setB_userId(rs.getString("b_userId"));
				b.setB_recruitId(rs.getInt("b_recruitId"));
				datas.add(b);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return datas;
	}
	
	
	
//	--------------------------------------- HISTORY ---------------------------------------
	public boolean addHistory(History h) {
		String sql = "INSERT INTO HISTORY (h_userId, h_recruitId, h_time) VALUES (?, ?, ?)";
		connect();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, h.getH_userId());
			pstmt.setInt(2, h.getH_recruitId());
			pstmt.setTimestamp(3,new Timestamp(h.getH_time().getTime()));
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
			return false;
		}finally {
			disconnect();
		}
		return true;
	}
	
	public History getHistory(int h_id) {
		History h = new History();
		String sql = "SELECT * FROM history WHERE h_id=?";
		connect();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, h_id);
			rs = pstmt.executeQuery();
			rs.next();
			h.setH_id(rs.getInt("h_id"));
			h.setH_recruitId(rs.getInt("h_recruitId"));
			h.setH_userId(rs.getString("h_userId"));
			h.setH_time(rs.getTimestamp("h_time"));
			rs.close();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			disconnect();
		}
		return h;
	}
	
	public boolean delHistory(int h_id) {
		String sql = "DELETE FROM history WHERE h_id=?";
		connect();
		try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, h_id);
		pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
			return false;
		}finally {
			disconnect();
		}
		return true;
	}
	
	public List<History> getAllHistory() {
		List<History> datas = new ArrayList<>();
		String sql = "SELECT * FROM history";
		connect();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				History h = new History();
				h.setH_id(rs.getInt("h_id"));
				h.setH_recruitId(rs.getInt("h_recruitId"));
				h.setH_userId(rs.getString("h_userId"));
				h.setH_time(rs.getTimestamp("h_time"));
				datas.add(h);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return datas;
	}
	
	public boolean delAllHistory(String u_id) {
		String sql = "DELETE FROM history WHERE h_userId=?";
		connect();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, u_id);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
			return false;
		}finally {
			disconnect();
		}
		return true;
	}
	
	
	

//	--------------------------------------- CUSTOM ---------------------------------------
//	공고 목록 
	public List<Recruit> getBookmarkRecruit(String UserId) {
		List<Recruit> datas = new ArrayList<>();
		String sql = "select b_id, r_id, r_Mcat, r_title, r_com, r_end from recruit LEFT JOIN bookmark ON recruit.r_id = bookmark.b_recruitId where bookmark.b_userId=?";
		connect();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, UserId);
			rs = pstmt.executeQuery();
			while (rs.next()) {				
				Recruit recruit = new Recruit();
				recruit.setR_img(String.valueOf(rs.getInt("b_id")));
				recruit.setR_id(rs.getInt("r_id"));
				recruit.setR_Mcat(rs.getString("r_Mcat"));
				recruit.setR_title(rs.getString("r_title"));
				recruit.setR_com(rs.getString("r_com"));
				recruit.setR_end(rs.getTimestamp("r_end"));
				datas.add(recruit);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return datas;
	}
	
	public List<Recruit> getRecomRecr(String u_id) {
		String sql = "SELECT p_Lcat FROM perCat WHERE p_userId=?";
		String[] lCatArr = null;
		int lcatIdx1 = 0, lcatIdx2 = 0;
		connect();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, u_id);
			rs = pstmt.executeQuery();
			rs.last();
			int length = rs.getRow();
			lCatArr = new String[length];
//			System.out.println("Length : " + length);
			rs.beforeFirst();
			while(rs.next()) {
				lCatArr[rs.getRow()-1] = rs.getString("p_Lcat");
			}
			Random rand = new Random(System.currentTimeMillis());
			lcatIdx1 = rand.nextInt(length);
			rand = new Random(System.currentTimeMillis());
			lcatIdx2 = rand.nextInt(length);
//			System.out.println("idx1 : " + lcatIdx1 + ", " +lCatArr[lcatIdx1]);
//			System.out.println("idx2 : " + lcatIdx2 + ", " +lCatArr[lcatIdx2]);
			while(lcatIdx1 == lcatIdx2){
				rand = new Random(System.currentTimeMillis());
				lcatIdx2 = rand.nextInt(length);				
			}
//			System.out.println("idx11 : " + lcatIdx1 + ", " +lCatArr[lcatIdx1]);
//			System.out.println("idx22 : " + lcatIdx2 + ", " +lCatArr[lcatIdx2]);

		} catch(Exception e) {
			e.printStackTrace();
		}
		sql = "select * from recruit where r_Lcat=? OR r_Lcat=? ORDER BY r_end asc";
		List<Recruit> datas = new ArrayList<>();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, lCatArr[lcatIdx1]);
			pstmt.setString(2, lCatArr[lcatIdx2]);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Recruit r = new Recruit();
				r.setR_id(rs.getInt("r_id"));
				r.setR_title(rs.getString("r_title"));
				r.setR_com(rs.getString("r_com"));
				r.setR_Scat(rs.getString("r_Scat"));
				r.setR_exp(rs.getString("r_exp"));
				r.setR_end(rs.getTimestamp("r_end"));
				r.setR_img(rs.getString("r_img"));
				datas.add(r);
			}
			rs.close();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return datas;
	}
	
	public String[] getPerLcat(String u_id) {
		String[] str = null;
		int num = 0;
		String sql = "SELECT DISTINCT p_Lcat FROM perCat WHERE p_userId=?";
		connect();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, u_id);
			rs = pstmt.executeQuery();
			rs.last();
			num = rs.getRow();
			rs.beforeFirst();
			str = new String[num];
			for(int i = 0 ; rs.next() ; i++) {
				str[i] = rs.getString("p_Lcat");
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return str;
	}
	void getAllBookmarks(String UserId) {
		String sql = "select r_title, r_com, r_start, r_end, r_exp from recruit LEFT JOIN bookmark ON recruit.r_id = bookmark.b_recruitId where bookmark.b_userId=?;";
		
		connect();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, UserId);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
			}
			
			
			rs.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
	

	

}
