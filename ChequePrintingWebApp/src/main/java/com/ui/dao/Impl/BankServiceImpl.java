package com.ui.dao.Impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ui.dao.BankService;
import com.ui.model.Bank;

@Service("BankService")
public class BankServiceImpl implements BankService {

	
    private DataSource dataSource;
	
	
	public BankServiceImpl(){
		
	}
	 public void setDataSource(DataSource dataSource) {
	        this.dataSource = dataSource;
	    }
	
	
	@Override
	public void addBank(Bank bank) {
		
		String sql = "INSERT INTO bank (bank_name, short_form, active, delete_flag, created_at) VALUES (?, ?, ?, ?, NOW())";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, bank.getBankName());
            ps.setString(2, bank.getShortForm());
            ps.setBoolean(3, bank.isActive());
            ps.setBoolean(4, false);

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
	}

	@Override
	public List<Bank> getAllBanks() {
		  List<Bank> banks = new ArrayList<>();
	        String sql = "SELECT * FROM bank WHERE active=true and  delete_flag = false";

	        try (Connection conn = dataSource.getConnection();
	             PreparedStatement ps = conn.prepareStatement(sql);
	             ResultSet rs = ps.executeQuery()) {

	            while (rs.next()) {
	                Bank bank = new Bank();
	                bank.setBankId(rs.getInt("bank_id"));
	                bank.setBankName(rs.getString("bank_name"));
	                bank.setShortForm(rs.getString("short_form"));
	                bank.setActive(rs.getBoolean("active"));
	                bank.setDeleteFlag(rs.getBoolean("delete_flag"));
	                banks.add(bank);
	            }

	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        return banks;
	}

	@Override
	public Bank getBankById(int bankId) {
		   Bank bank = null;
	        String sql = "SELECT * FROM bank WHERE bank_id = ?";

	        try (Connection conn = dataSource.getConnection();
	             PreparedStatement ps = conn.prepareStatement(sql)) {

	            ps.setInt(1, bankId);
	            try (ResultSet rs = ps.executeQuery()) {
	                if (rs.next()) {
	                    bank = new Bank();
	                    bank.setBankId(rs.getInt("bank_id"));
	                    bank.setBankName(rs.getString("bank_name"));
	                    bank.setShortForm(rs.getString("short_form"));
	                    bank.setActive(rs.getBoolean("active"));
	                    bank.setDeleteFlag(rs.getBoolean("delete_flag"));
	                   // bank.setCreatedAt(rs.getTimestamp("created_at"));
	                }
	            }

	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        return bank;
	}

	@Override
	public void updateBank(Bank bank) {
		String sql = "UPDATE bank SET bank_name=?, short_form=?, active=? WHERE bank_id=?";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, bank.getBankName());
            ps.setString(2, bank.getShortForm());
            ps.setBoolean(3, bank.isActive());
            ps.setInt(4, bank.getBankId());

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
		
	}

	@Override
	public boolean deleteBank(int bankId) {
		String sql = "UPDATE bank SET delete_flag = true WHERE bank_id = ?";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, bankId);
           return  ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
	}

	@Override
	public boolean deactivateBank(int bankId) {
		String sql = "UPDATE bank SET active = false WHERE bank_id = ?";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, bankId);
           return  ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
	}
	@Override
	public List<Bank> getBanks() {
		 List<Bank> list = new ArrayList<>();
		    String sql = "SELECT bank_id, short_form FROM bank WHERE active=true and   delete_flag = false";

		    try (Connection conn = dataSource.getConnection();
		         PreparedStatement stmt = conn.prepareStatement(sql);
		         ResultSet rs = stmt.executeQuery()) {

		        while (rs.next()) {
		            Bank bank = new Bank();
		            bank.setBankId(rs.getInt("bank_id"));
		            bank.setBankName(rs.getString("short_form"));
		            list.add(bank);
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		    }
		    return list;
	}

}
