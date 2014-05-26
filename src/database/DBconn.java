package database;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;

import bean.ClassInfo;
import bean.UserInfo;

public class DBconn {
	
	private Connection conn;// 数据库链接对象

	private PreparedStatement stmt;// 预编译对象
	
	private CallableStatement  sc;

	private ResultSet rs;// 结果集对象
	
	public DBconn()
	{
		try {
			Class.forName("org.gjt.mm.mysql.Driver");
			conn = DriverManager
					.getConnection("jdbc:mysql://localhost:3306/contacts?user=pm&password=pm&useUnicode=true&characterEncoding=gb2312");
			
		} catch (Exception e) {

		}
	}
	
	public List<ClassInfo> getClasses(){
		ArrayList<ClassInfo> list = new ArrayList<ClassInfo>();
		try {
			stmt = conn.prepareStatement("select * from classes");
			rs = stmt.executeQuery();
			while(rs.next()){
				ClassInfo info = new ClassInfo();
				info.setClass_id(rs.getInt("id"));
				info.setClass_name(rs.getString("name"));
				list.add(info);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	public List<UserInfo> getUser(int id){
		ArrayList<UserInfo> list = new ArrayList<UserInfo>();
		try {
			stmt = conn.prepareStatement("select u.*,c.name from users u,classes c where u.classes = ? and u.classes=c.id");
			stmt.setInt(1, id);
			rs = stmt.executeQuery();
			while(rs.next()){
				UserInfo info = new UserInfo();
				info.setId(rs.getInt(1));
				info.setName(rs.getString(2));
				info.setMobile(rs.getString(3));
				info.setClasses(rs.getInt(4));
				info.setEmail(rs.getString(5));
				info.setClass_name(rs.getString(6));
				list.add(info);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	public void add(UserInfo info){
		try {
			stmt = conn.prepareStatement("insert into users(name,mobile,classes,email) values(?,?,?,?) ");
			stmt.setString(1, info.getName());
			stmt.setString(2, info.getMobile());
			stmt.setInt(3, info.getClasses());
			stmt.setString(4, info.getEmail());
			stmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public UserInfo getUserById(int id){
		UserInfo info = new UserInfo();
		try {
			stmt = conn.prepareStatement("select * from users where id = ?");
			stmt.setInt(1, id);
			rs = stmt.executeQuery();
			if(rs.next()){
				info.setId(rs.getInt("id"));
				info.setName(rs.getString("name"));
				info.setMobile(rs.getString("mobile"));
				info.setClasses(rs.getInt("classes"));
				info.setEmail(rs.getString("email"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return info;
	}
	
	public void modify(UserInfo info){
		try {
			stmt = conn.prepareStatement("update users set name = ?,mobile=?,email=?,classes=? where id=?");
			stmt.setString(1, info.getName());
			stmt.setString(2, info.getMobile());
			stmt.setString(3, info.getEmail());
			stmt.setInt(4, info.getClasses());
			stmt.setInt(5, info.getId());
			stmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void delete(int id){
		try {
			stmt = conn.prepareStatement("delete from users where id=?");
			stmt.setInt(1, id);
			stmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
