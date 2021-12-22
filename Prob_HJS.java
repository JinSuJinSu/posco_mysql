package mysql.exam;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class Prob_HJS {

	public static void main(String[] args) {
		printEmp("A");
		printEmp("Q");
		printEmp("T");
	}
	public static void printEmp(String pn) {
		// 구현
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException cnfe) {
			System.out.println("해당 클래스를 찾을 수 없습니다." + cnfe.getMessage());
			return;
		} 
		String url = "jdbc:mysql://localhost:3306/sqldb?characterEncoding=UTF-8&serverTimezone=UTC";
		String user = "root";
		String passwd = "1234";
		try (Connection conn = DriverManager.getConnection(url, user, passwd);
			Statement stmt = conn.createStatement()){
			String sql = "";
			if(pn.equals("A")) {
				System.out.println("** 이름에 A 문자가 들어간 직원들의 리스트 **");
				sql = "select concat(emp.ename,'(',locations.city,')') "
						+ " as information from emp"
						+ "	join dept on emp.deptno = dept.deptno"
						+ "	join locations on dept.loc_code = locations.loc_code"
						+ "	where ename like '%A%'";
				
			}
			else if(pn.equals("T")) {
				System.out.println("** 이름에 T 문자가 들어간 직원들의 리스트 **");
				sql = "select concat(emp.ename,'(',locations.city,')') "
						+ " as information from emp"
						+ "	join dept on emp.deptno = dept.deptno"
						+ "	join locations on dept.loc_code = locations.loc_code"
						+ "	where ename like '%T%'";
			}
			else if(pn.equals("Q")) {
				System.out.println("~~ 이름에 Q 문자가 들어간 직원들은 없음 ~~");
				sql = "select concat(emp.ename,'(',locations.city,')') "
						+ " as information from emp"
						+ "	join dept on emp.deptno = dept.deptno"
						+ "	join locations on dept.loc_code = locations.loc_code"
						+ "	where ename like '%Q%'";
			}
		
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {
				System.out.println(rs.getString(1));
			}
			rs.close();
		} catch (SQLException se) {
			System.out.println("[오류발생] " + se.getMessage());
		}
	}
}


