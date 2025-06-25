package com.ui.dao.Impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.stereotype.Service;

import com.ui.dao.LayoutService;
import com.ui.model.ChequeLayout;

@Service("LayoutService")
public class LayoutServiceImpl implements LayoutService {
	
	 private DataSource dataSource;
		
		
		public LayoutServiceImpl(){
			
		}
		 public void setDataSource(DataSource dataSource) {
		        this.dataSource = dataSource;
		    }
		
	
	@Override
    public void saveLayout(ChequeLayout layout) {
        String sql = "INSERT INTO cheque_layout (layout_name, bank_id,  layout_json, created_by) " +
                     "VALUES (?, ?, ?, ?)";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, layout.getLayoutName());
            ps.setInt(2, layout.getBankId());
          //  ps.setInt(3, layout.getAccountId());
            ps.setString(3, layout.getLayoutJson());
           // ps.setString(5, layout.getImageBase64());
            ps.setString(4, layout.getCreatedBy());

            ps.executeUpdate();
            System.out.println("Cheque Layout inserted successfully.");
        } catch (Exception e) {
            e.printStackTrace();
            //throw new Exception("Error inserting cheque layout: " + e.getMessage());
        }
        
        
        
        
	}
	
	
	  @Override
	    public List<ChequeLayout> getAllLayouts() {
	        List<ChequeLayout> layouts = new ArrayList<>();
	        String sql = "SELECT * FROM cheque_layout";

	        try (Connection conn = dataSource.getConnection();
	             PreparedStatement ps = conn.prepareStatement(sql);
	             ResultSet rs = ps.executeQuery()) {

	            while (rs.next()) {
	                ChequeLayout layout = new ChequeLayout();
	                layout.setLayoutId(rs.getInt("layout_id"));
	                layout.setLayoutName(rs.getString("layout_name"));
	                layout.setBankId(rs.getInt("bank_id"));
	               // layout.setAccountId(rs.getInt("account_id"));
	                layout.setLayoutJson(rs.getString("layout_json"));
	                layout.setCreatedBy(rs.getString("created_by"));
	               // layout.setCreatedAt(rs.getTimestamp("created_at"));
	                // Skip image_base64 if not needed
	                layouts.add(layout);
	            }

	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        return layouts;
	    }
	  
	  
	  @Override
	public ChequeLayout getLayoutById(int layoutId) {
		ChequeLayout layout = null;

	    try (Connection conn = dataSource.getConnection();
	         PreparedStatement ps = conn.prepareStatement("SELECT * FROM cheque_layout WHERE layout_id = ?")) {

	        ps.setInt(1, layoutId);
	        ResultSet rs = ps.executeQuery();

	        if (rs.next()) {
	            layout = new ChequeLayout();
	            layout.setLayoutId(rs.getInt("layout_id"));
	            layout.setLayoutName(rs.getString("layout_name"));
	            layout.setBankId(rs.getInt("bank_id"));
	            layout.setAccountId(rs.getInt("account_id"));
	            layout.setLayoutJson(rs.getString("layout_json"));
	            layout.setCreatedBy(rs.getString("created_by"));
	           // layout.setCreatedAt(rs.getTimestamp("created_at"));
	            // Optional: layout.setImageBase64(rs.getString("image_base64"));
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return layout;
	}

}
