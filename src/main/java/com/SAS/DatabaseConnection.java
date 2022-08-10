package com.SAS;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
	public static Connection getConnection() throws SQLException
	{
		String url = "jdbc:mysql://localhost:3306/savethestray";
		String username = "root";
		String password = "";
		
	//	Class.forName("com.mysql.cj.jdbc.Driver");
		
		Connection conn = DriverManager.getConnection(url,username,password);
		
		return conn;
		}

	public static void printSQLException(SQLException e) {
		// TODO Auto-generated method stub
		
	}

}
