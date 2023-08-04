package kr.co.jboard1.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import kr.co.jboard1.db.DBHelper;
import kr.co.jboard1.db.SQL;
import kr.co.jboard1.vo.UserVO;

public class UserDAO extends DBHelper{
	private static UserDAO instance = new UserDAO();
	public static UserDAO getInstance() {
		return instance;
	}
	public UserDAO() {}
	
	
	
	
	public void insertUser(UserVO vo) {
		
		try{
			//JNDI 서비스 객체 생성
			Context initCtx = new InitialContext();
			Context ctx = (Context) initCtx.lookup("java:comp/env");
			
			//커넥션 풀에서 커넥션 가져오기
			
			DataSource ds = (DataSource) ctx.lookup("jdbc/Jboard");
			Connection conn = ds.getConnection();
			PreparedStatement psmt = conn.prepareStatement(SQL.INSERT_USER);

			psmt.setString(1, vo.getUid());
			psmt.setString(2, vo.getPass());
			psmt.setString(3, vo.getName());
			psmt.setString(4, vo.getNick());
			psmt.setString(5, vo.getEmail());
			psmt.setString(6, vo.getHp());
			psmt.setString(7, vo.getZip());
			psmt.setString(8, vo.getAddr1());
			psmt.setString(9, vo.getAddr2());
			psmt.setString(10, vo.getRegip());
		
			psmt.executeUpdate();

			psmt.close();
			conn.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	public UserVO selectUser(String uid, String pass) {
		
		UserVO user = null;
		
		try{

			conn = getConnection();
			psmt = conn.prepareStatement(SQL.SELECT_USER);
			psmt.setString(1, uid);
			psmt.setString(2, pass);
			rs = psmt.executeQuery();
			
			
			if(rs.next()){
				user = new UserVO();
				
				user.setUid(rs.getString(1));
				user.setPass(rs.getString(2));
				user.setName(rs.getString(3));
				user.setNick(rs.getString(4));
				user.setEmail(rs.getString(5));
				user.setHp(rs.getString(6));
				user.setRole(rs.getString(7));
				user.setZip(rs.getString(8));
				user.setAddr1(rs.getString(9));
				user.setAddr2(rs.getString(10));
				user.setRegip(rs.getString(11));
				user.setRegDate(rs.getString(12));
				user.setLeaveDate(rs.getString(13));
			}
			
			close();
		
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return user;
	}
	
	public int selectCountUid(String uid) {
		int result = 0;
		try{
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.SELECT_COUNT_UID );
			psmt.setString(1, uid);
			
			rs = psmt.executeQuery();
			if(rs.next()){
				result = rs.getInt(1);
			}
			
			close();
		
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return 0;
	}
	
	public int selectCountNick(String nick) {
		
		
		try{

			conn = getConnection();
			psmt = conn.prepareStatement(SQL.SELECT_COUNT_NICK);
			psmt.setString(1, nick); //setString으로 12번 라인의 nick을 22번 라인의 쿼리문 nick과 바인딩 
			
			rs = psmt.executeQuery();
			if(rs.next()){
				rs.getInt(1);
			}
			
			rs.close();
			psmt.close();
			conn.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return 0;
	}
	
	public int selectCountHp(String hp) {
		
		try{

			conn = getConnection();
			psmt = conn.prepareStatement(SQL.SELECT_COUNT_HP);
			psmt.setString(1, hp); //setString으로 12번 라인의 nick을 22번 라인의 쿼리문 nick과 바인딩 
			
			ResultSet rs = psmt.executeQuery();
			if(rs.next()){
				rs.getInt(1);
			}
			
			close();
		
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return 0;
	}
	
	public int selectCountEmail(String email) {
		
		try{
			
			conn = getConnection();
			PreparedStatement psmt = conn.prepareStatement(SQL.SELECT_COUNT_EMAIL);
			psmt.setString(1, email); //setString으로 12번 라인의 nick을 22번 라인의 쿼리문 nick과 바인딩 
			
			ResultSet rs = psmt.executeQuery();
			if(rs.next()){
				rs.getInt(1);
			}
			
			rs.close();
			psmt.close();
			conn.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return 0;
	}
	
	public void selectTerms() {
		
	}
	
	public void selectUsers() {
		
	}
	
	public void updateUser() {
		
	}
	public void deleteUser() {
		
	}
	
	
}
