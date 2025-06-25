package com.ui.dao.Impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Date;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.stereotype.Service;

import com.ui.dao.ChequeService;
import com.ui.model.Cheques;


@Service("ChequeService")
public class ChequeServiceImpl implements ChequeService{
	
	
	 private DataSource dataSource;
		
		
		public ChequeServiceImpl(){
			
		}
		 public void setDataSource(DataSource dataSource) {
		        this.dataSource = dataSource;
		    }

	@Override
	public void issueCheque(Cheques cheque) throws Exception {
		
		
		  String sql = "UPDATE cheques SET supplier_id=?, amount_numeric=?, amount_words=?, cheque_date=?, status='issued' " +
                  "WHERE cheque_book_id=? AND status='issued' LIMIT 1";

     try (Connection conn = dataSource.getConnection();
          PreparedStatement ps = conn.prepareStatement(sql)) {

         ps.setInt(1, cheque.getSupplierId());
         ps.setBigDecimal(2, cheque.getAmountNumeric());
         ps.setString(3, cheque.getAmountWords());
         ps.setDate(4, java.sql.Date.valueOf(cheque.getChequeDate()));
         ps.setInt(5, cheque.getChequeBookId());

         ps.executeUpdate();
     }
		
	}

	@Override
	public List<Cheques> getAllCheques() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Cheques getChequeById(int chequeId) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
