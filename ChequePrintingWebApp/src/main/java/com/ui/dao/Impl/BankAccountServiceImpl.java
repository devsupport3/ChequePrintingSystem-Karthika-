package com.ui.dao.Impl;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ui.dao.BankAccountService;
import com.ui.model.BankAccounts;


@Service("BankAccountService")
public class BankAccountServiceImpl implements BankAccountService {

	
	 private DataSource dataSource;
	
	 public BankAccountServiceImpl() {
	        
	    }
	 
	 public void setDataSource(DataSource dataSource) {
	        this.dataSource = dataSource;
	    }
		/*
		 * public BankAccountServiceImpl(DataSource dataSource) { this.dataSource =
		 * dataSource; }
		 */
	
	@Override
	public BankAccounts getBankAccount() {
		 BankAccounts account = null;
	        String sql = "SELECT * FROM bank_account WHERE delete_flag = 0 LIMIT 1";

	        try (Connection conn = dataSource.getConnection();
	             PreparedStatement stmt = conn.prepareStatement(sql)) {

	            ResultSet rs = stmt.executeQuery();
	            if (rs.next()) {
	                account = new BankAccounts();
	                account.setBankaccountId(rs.getInt("account_id"));
	                account.setAccountNumber(rs.getString("account_number"));
	                account.setAccountHolderName(rs.getString("account_holder_name"));
	                account.setBankId(rs.getInt("bank_id"));
	                account.setBranchName(rs.getString("branch_name"));
	                account.setIfscCode(rs.getString("ifsc_code"));
	                account.setActive(rs.getBoolean("active"));
	       
	                //account.setCreatedAt(rs.getTimestamp("created_at"));
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }

	        return account;
	}

	@Override
	public List<BankAccounts> getAllBankAccounts() {
		  List<BankAccounts> list = new ArrayList<>();
	        //String sql = "SELECT * FROM bank_account WHERE active=true and delete_flag = 0";
	        String sql="SELECT ba.*, b.bank_name "
	        		+ "FROM bank_account ba "
	        		+ "JOIN bank b ON ba.bank_id = b.bank_id "
	        		+ "WHERE ba.delete_flag = false and ba.active=true ";
	        try (Connection conn = dataSource.getConnection();
	             PreparedStatement stmt = conn.prepareStatement(sql);
	             ResultSet rs = stmt.executeQuery()) {

	            while (rs.next()) {
	                BankAccounts account = new BankAccounts();
	                account.setBankaccountId(rs.getInt("account_id"));
	                account.setAccountNumber(rs.getString("account_number"));
	                account.setAccountHolderName(rs.getString("account_holder_name"));
	                account.setBankName(rs.getString("bank_name"));
	                account.setBranchName(rs.getString("branch_name"));
	                account.setIfscCode(rs.getString("ifsc_code"));
	                account.setActive(rs.getBoolean("active"));
	               //  account.setCreatedAt(rs.getTimestamp("created_at"));
	                list.add(account);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }

	        return list;
	}

	@Override
	public boolean insertBankAccount(BankAccounts account) {
	    String sql = "INSERT INTO bank_account (account_number, account_holder_name, bank_id, branch_name, ifsc_code, active, delete_flag) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?)";

   try (Connection conn = dataSource.getConnection();
        PreparedStatement stmt = conn.prepareStatement(sql)) {

       stmt.setString(1, account.getAccountNumber());
       stmt.setString(2, account.getAccountHolderName());
       stmt.setInt(3, account.getBankId());
       stmt.setString(4, account.getBranchName());
       stmt.setString(5, account.getIfscCode());
       stmt.setBoolean(6, account.isActive());
       stmt.setBoolean(7, false); // delete_flag = false
  

       return stmt.executeUpdate() > 0;

   } catch (SQLException e) {
       e.printStackTrace();
   }

        return false;
	}

	@Override
	public boolean updateBankAccount(BankAccounts account) {
		 String sql = "UPDATE bank_account SET account_number=?, account_holder_name=?, bank_id=?, branch_name=?, ifsc_code=?, active=? WHERE account_id=?";

	        try (Connection conn = dataSource.getConnection();
	             PreparedStatement stmt = conn.prepareStatement(sql)) {

	            stmt.setString(1, account.getAccountNumber());
	            stmt.setString(2, account.getAccountHolderName());
	            stmt.setInt(3, account.getBankId());
	            stmt.setString(4, account.getBranchName());
	            stmt.setString(5, account.getIfscCode());
	            stmt.setBoolean(6, account.isActive());
	         
	            stmt.setInt(7, account.getBankaccountId());

	            return stmt.executeUpdate() > 0;

	        } catch (SQLException e) {
	            e.printStackTrace();
	        }

	        return false;
	}

	@Override
	public BankAccounts getBankAccountById(int id) {
		 BankAccounts account = null;
	        String sql = "SELECT * FROM bank_account WHERE account_id=?";

	        try (Connection conn = dataSource.getConnection();
	             PreparedStatement stmt = conn.prepareStatement(sql)) {

	            stmt.setInt(1, id);
	            ResultSet rs = stmt.executeQuery();
	            if (rs.next()) {
	                account = new BankAccounts();
	                account.setBankaccountId(rs.getInt("account_id"));
	                account.setAccountNumber(rs.getString("account_number"));
	                account.setAccountHolderName(rs.getString("account_holder_name"));
	                account.setBankId(rs.getInt("bank_id"));
	                account.setBranchName(rs.getString("branch_name"));
	                account.setIfscCode(rs.getString("ifsc_code"));
	                account.setActive(rs.getBoolean("active"));
	               
	            }

	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return account;
	}

	@Override
	public boolean deleteBankAccount(int id)  {
		 String sql = "UPDATE bank_account SET delete_flag = true WHERE account_id=?";

	        try (Connection conn = dataSource.getConnection();
	             PreparedStatement stmt = conn.prepareStatement(sql)) {

	            stmt.setInt(1, id);
	            return stmt.executeUpdate() > 0;

	        } catch (Exception e) {
	            e.printStackTrace();
	            return false;
	        }
	}

	@Override
	public boolean deactivateBankAccount(int id) {
		 String sql = "UPDATE bank_account SET active = false WHERE account_id=?";

	        try (Connection conn = dataSource.getConnection();
	             PreparedStatement stmt = conn.prepareStatement(sql)) {

	            stmt.setInt(1, id);
	            return stmt.executeUpdate() > 0;

	        } catch (Exception e) {
	            e.printStackTrace();
	            return false;
	        }
	}

	@Override
	public List<BankAccounts> getAccountsByBankId(int bankId) {
	    List<BankAccounts> accounts = new ArrayList<>();

	    String sql = "SELECT account_id AS bankAccountId, account_number AS accountNumber,  bank_id AS bankId FROM bank_account WHERE bank_id = ?";
	    try (Connection conn = dataSource.getConnection();
	         PreparedStatement ps = conn.prepareStatement(sql)) {

	        ps.setInt(1, bankId);
	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {
	            BankAccounts acc = new BankAccounts();
	            acc.setBankaccountId(rs.getInt("bankAccountId"));
	            acc.setAccountNumber(rs.getString("accountNumber"));
	            acc.setBankId(rs.getInt("bankId"));
	            // add more fields if needed

	            accounts.add(acc);
	        }

	    } catch (Exception e) {
	        e.printStackTrace(); // log properly in real projects
	    }

	    return accounts;
	}

}
