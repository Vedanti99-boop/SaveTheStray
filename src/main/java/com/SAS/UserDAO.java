package com.SAS;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class UserDAO {
	
	public int register(User user) throws SQLException {
		String INSERT_USERS_SQL = "INSERT INTO register VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);";
		int result = 0;
		Connection connection = DatabaseConnection.getConnection();
		PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL);
				preparedStatement.setString(1, user.getName());
				preparedStatement.setString(2, user.getEmail());
				preparedStatement.setString(3, user.getUsername());
				preparedStatement.setString(4, user.getPassword());
				preparedStatement.setString(5, user.getUsertype());
				preparedStatement.setString(6, user.getState());
				preparedStatement.setString(7, user.getCity());
				preparedStatement.setInt(8, user.getZipcode());
				preparedStatement.setString(9, user.getPhone());


				
				System.out.println(preparedStatement);
				result = preparedStatement.executeUpdate();
				
				return result;
	}
	
	public ResultSet verifyLogin(User user) throws SQLException {
	    String VERIFY_USERS_SQL = "SELECT password FROM register WHERE username = ?";
	    
		Connection connection = DatabaseConnection.getConnection();
		PreparedStatement preparedStatement = connection.prepareStatement(VERIFY_USERS_SQL);
		preparedStatement.setString(1, user.getUsername());
		System.out.println(preparedStatement);
		ResultSet rs = preparedStatement.executeQuery();
		
		return rs;
	}
	
	public int donate(Donation donate) throws SQLException {
		
		String DONATE_SQL = "INSERT INTO donation (donation_ID , donated_by , donated_to , amount , message , username)" + 
		" VALUES ( ?, ?, ?, ?, ?, ?)";
		int result = 0;
		Connection connection = DatabaseConnection.getConnection();
		PreparedStatement preparedStatement = connection.prepareStatement(DONATE_SQL);
		preparedStatement.setInt(1, donate.getDonationID());
		preparedStatement.setString(2, donate.getDonatedBy());
		preparedStatement.setString(3, donate.getDonatedTo());
		preparedStatement.setInt(4, donate.getAmount());
		preparedStatement.setString(5, donate.getMessage());
		preparedStatement.setString(6, donate.getUsername());
		
		System.out.println(preparedStatement);
		result = preparedStatement.executeUpdate();
		
		return result;
	}
	
	public ResultSet getName(String username) throws SQLException {
		
		String GET_NAME_SQL = "SELECT name FROM register WHERE username = ?";
	    
		Connection connection = DatabaseConnection.getConnection();
		PreparedStatement preparedStatement = connection.prepareStatement(GET_NAME_SQL);
		preparedStatement.setString(1, username);
		System.out.println(preparedStatement);
		ResultSet rs = preparedStatement.executeQuery();
		
		return rs;
		
	}

	public ResultSet getOrganization() throws SQLException {
		
		String GET_USER_TYPE_SQL = "SELECT name FROM register WHERE user_type = 'Organization' ";
	    
		Connection connection = DatabaseConnection.getConnection();
		Statement statement = connection.createStatement();
		ResultSet rs = statement.executeQuery(GET_USER_TYPE_SQL);
				
		return rs;
		
	}
	
	public ResultSet getRescues() throws SQLException {
		
		String GET_RESCUES = "SELECT * FROM `rescue` ORDER BY `rescue`.`reported_time` DESC";
		Connection connection = DatabaseConnection.getConnection();
		Statement statement = connection.createStatement();
		ResultSet rs = statement.executeQuery(GET_RESCUES);

		
		return rs;
	}
	
	public ResultSet getRescueStatus(Rescue rescue) throws SQLException {
		
		String GET_RESCUE_STATUS = "SELECT * FROM rescue_status where username = ? ";
		Connection connection = DatabaseConnection.getConnection();
		PreparedStatement preparedStatement = connection.prepareStatement(GET_RESCUE_STATUS);
		preparedStatement.setInt(1, rescue.getRescueID());
		ResultSet rs = preparedStatement.executeQuery();

		
		return rs;
	}
	
	public ResultSet getPhoto(Rescue rescue) throws SQLException {
		
		String GET_PHOTO_SQL = "SELECT rescue_photo FROM rescue where rescue_ID = ? ";
		Connection connection = DatabaseConnection.getConnection();
		PreparedStatement preparedStatement = connection.prepareStatement(GET_PHOTO_SQL);
		
		preparedStatement.setInt(1, rescue.getRescueID());
		
		ResultSet rs = preparedStatement.executeQuery();

		return rs;
		
	}
	
	public int take_action(Rescue rescue) throws SQLException {
		
		String TAKE_ACTION = "INSERT INTO `take_action`(`rescue_ID`, `action_taker`) VALUES (? , ?)";
		int result = 0;
		Connection connection = DatabaseConnection.getConnection();
		PreparedStatement preparedStatement = connection.prepareStatement(TAKE_ACTION);
		preparedStatement.setInt(1, rescue.getRescueID());
		preparedStatement.setString(2, rescue.getUsername());

		System.out.println(preparedStatement);
		result = preparedStatement.executeUpdate();
		
		return result;
	}
	
public ResultSet getActionTaker(Rescue rescue) throws SQLException {
		
		String GET_RESCUE_STATUS = "SELECT * FROM `take_action` WHERE `action_taker` = ? ";
		Connection connection = DatabaseConnection.getConnection();
		PreparedStatement preparedStatement = connection.prepareStatement(GET_RESCUE_STATUS);
		preparedStatement.setString(1, rescue.getUsername());
		ResultSet rs = preparedStatement.executeQuery();
		
		return rs;
	}

public ResultSet getRescueSt(Rescue rescue) throws SQLException {
	
	String GET_RESCUE_STATUS = "SELECT * FROM `take_action` WHERE `action_taker` = ? ";
	Connection connection = DatabaseConnection.getConnection();
	PreparedStatement preparedStatement = connection.prepareStatement(GET_RESCUE_STATUS);
	preparedStatement.setString(1, rescue.getUsername());
	ResultSet rs = preparedStatement.executeQuery();
	
	return rs;
}
}
