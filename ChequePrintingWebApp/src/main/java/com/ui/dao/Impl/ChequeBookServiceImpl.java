package com.ui.dao.Impl;


import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ui.dao.ChequeBookService;

import com.ui.model.ChequeBook;


@Service("ChequeBookService")
public class ChequeBookServiceImpl implements ChequeBookService {
	
	   
	   private DataSource dataSource;
	
	   
	   public ChequeBookServiceImpl() {
		   
	   }
	   
	
	   public void setDataSource(DataSource dataSource) {
	        this.dataSource = dataSource;
	    }
	
	
	@Override
	public int addChequeBook(ChequeBook book) {
		  int chequeBookId = 0;
		  String insertBookSql = "INSERT INTO cheque_book (bank_account_id, book_name, series_start, series_end, total_cheques, issue_date,status) VALUES (?, ?, ?, ?, ?, ?, ?)";
             
		  // Auto-generate cheques from series_start to series_end
          int start = Integer.parseInt(book.getSeriesStart());
          int end = Integer.parseInt(book.getSeriesEnd());
          int totalCheques = end - start + 1;
          
		  
			/*
			 * try (Connection conn = dataSource.getConnection(); PreparedStatement ps =
			 * conn.prepareStatement(insertBookSql, new String[] {"cheque_book_id"})) { //
			 * Insert into cheque_books table //PreparedStatement pstmt =
			 * connection.prepareStatement(insertBookSql, Statement.RETURN_GENERATED_KEYS);
			 * System.out.println(book.getBankAccountId()); ps.setInt(1,
			 * book.getBankAccountId()); ps.setString(2, book.getBookName());
			 * ps.setString(3, book.getSeriesStart()); ps.setString(4, book.getSeriesEnd());
			 * ps.setInt(5, totalCheques); ps.setDate(6, new
			 * java.sql.Date(book.getIssueDate().getTime()));
			 * ps.setString(7,book.getStatus()); ps.executeUpdate();
			 * 
			 * // Get generated cheque_book_id ResultSet rs = ps.getGeneratedKeys(); if
			 * (rs.next()) { chequeBookId = rs.getInt(1); }
			 * 
			 * 
			 * 
			 * String insertChequeSql =
			 * "INSERT INTO cheques (cheque_number, bank_account_id, cheque_book_id, cheque_date) VALUES (?, ?, ?, CURDATE())"
			 * ; PreparedStatement chequeStmt = conn.prepareStatement(insertChequeSql);
			 * 
			 * for (int i = start; i <= end; i++) { String chequeNumber =
			 * String.format("%06d", i);
			 * 
			 * chequeStmt.setString(1, chequeNumber); chequeStmt.setInt(2,
			 * book.getBankAccountId()); chequeStmt.setInt(3, chequeBookId);
			 * 
			 * chequeStmt.executeUpdate(); }
			 */
          try (Connection conn = dataSource.getConnection()) {
        	    conn.setAutoCommit(false);

        	    PreparedStatement ps = conn.prepareStatement(insertBookSql, new String[] {"cheque_book_id"});
        	    ps.setInt(1, book.getBankAccountId());
        	    ps.setString(2, book.getBookName());
        	    ps.setString(3, book.getSeriesStart());
        	    ps.setString(4, book.getSeriesEnd());
        	    ps.setInt(5, totalCheques);
        	    ps.setDate(6, new java.sql.Date(book.getIssueDate().getTime()));
        	    ps.setString(7, book.getStatus());
        	    ps.executeUpdate();

        	    ResultSet rs = ps.getGeneratedKeys();
        	    if (rs.next()) {
        	        chequeBookId = rs.getInt(1);
        	        System.out.println("Generated ChequeBookId: " + chequeBookId);
        	    } else {
        	        throw new SQLException("Failed to retrieve generated cheque_book_id.");
        	    }

        	    String insertChequeSql = "INSERT INTO cheques (cheque_number, bank_account_id, cheque_book_id) VALUES (?, ?, ?)";
        	    PreparedStatement chequeStmt = conn.prepareStatement(insertChequeSql);

        	    for (int i = start; i <= end; i++) {
        	        String chequeNumber = String.format("%06d", i);
        	        chequeStmt.setString(1, chequeNumber);
        	        chequeStmt.setInt(2, book.getBankAccountId());
        	        chequeStmt.setInt(3, chequeBookId);
        	        chequeStmt.executeUpdate();
        	        System.out.println("Inserted Cheque: " + chequeNumber);
        	    }

        	    conn.commit(); // Final commit
	        } catch (Exception e) {
	            e.printStackTrace();  // Log error
	        }

	        return chequeBookId;
	    }
	

	@Override
	public ChequeBook getChequeBookById(int chequeBookId) {
		   ChequeBook cb = null;

	        try (Connection conn = dataSource.getConnection()) {
	            String sql = "SELECT * FROM cheque_book WHERE cheque_book_id = ?";
	            PreparedStatement stmt = conn.prepareStatement(sql);
	            stmt.setInt(1, chequeBookId);
	            ResultSet rs = stmt.executeQuery();

	            if (rs.next()) {
	                cb = new ChequeBook();
	                cb.setChequeBookId(rs.getInt("cheque_book_id"));
	                cb.setBankAccountId(rs.getInt("bank_account_id"));
	                cb.setBookName(rs.getString("book_name"));
	                cb.setSeriesStart(rs.getString("series_start"));
	                cb.setSeriesEnd(rs.getString("series_end"));
	                cb.setTotalCheques(rs.getInt("total_cheques"));
	                cb.setIssueDate(rs.getDate("issue_date"));
	                cb.setStatus(rs.getString("status"));
	            }

	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        return cb;
	}

	@Override
	public boolean deleteChequeBook(int chequeBookId) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<ChequeBook> getAllChequeBooks() {
		 
		  List<ChequeBook> list = new ArrayList<>();

	        try (Connection conn = dataSource.getConnection()) {
	            String sql = "SELECT cheque_book_id, bank_account_id,book_name, series_start, series_end, issue_date, status,total_cheques FROM cheque_book";
	            PreparedStatement stmt = conn.prepareStatement(sql);
	            ResultSet rs = stmt.executeQuery();

	            while (rs.next()) {
	                ChequeBook cb = new ChequeBook();
	                cb.setChequeBookId(rs.getInt("cheque_book_id"));
	                cb.setBankAccountId(rs.getInt("bank_account_id"));
	                cb.setBookName(rs.getString("book_name"));
	                cb.setSeriesStart(rs.getString("series_start"));
	                cb.setSeriesEnd(rs.getString("series_end"));
	                cb.setTotalCheques(rs.getInt("total_cheques"));
	                cb.setIssueDate(rs.getDate("issue_date"));
	                cb.setStatus(rs.getString("status"));
	                list.add(cb);
	            }

	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        return list;
	}


	@Override
	public List<ChequeBook> getChequeBooksByBankId(int bankId) throws Exception {
		      List<ChequeBook> list = new ArrayList<>();
		        String sql = "SELECT cb.cheque_book_id, cb.book_name " +
		                     "FROM cheque_book cb " +
		                     "JOIN bank_account ba ON cb.bank_account_id = ba.account_id " +
		                     "WHERE ba.bank_id = ?";
		        Connection conn = dataSource.getConnection();
		        PreparedStatement ps = conn.prepareStatement(sql);
		        ps.setInt(1, bankId);
		        ResultSet rs = ps.executeQuery();
		        while (rs.next()) {
		            ChequeBook cb = new ChequeBook();
		            cb.setChequeBookId(rs.getInt("cheque_book_id"));
		            cb.setBookName(rs.getString("book_name"));
		            list.add(cb);
		        }
		        return list;
		    
	}
	
	
	
	
	
	
	
	

}
