package com.ui.dao.Impl;

import java.sql.*;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.stereotype.Service;

import com.ui.dao.SupplierService;
import com.ui.model.Suppliers;
@Service("SupplierService")
public class SupplierServiceImpl implements SupplierService{
	 private DataSource dataSource;

	 public SupplierServiceImpl() {
	        
	    }

	 
	 public void setDataSource(DataSource dataSource) {
	        this.dataSource = dataSource;
	    }
		/*
		 * public SupplierServiceImpl(DataSource dataSource) { this.dataSource =
		 * dataSource; }
		 */
	    
	@Override
	public boolean addSupplier(Suppliers supplier) {
		   String sql = "INSERT INTO suppliers( first_name, last_name, company_name, contact_person_name, email, mobile_no, address_line1, address_line2, address_line3, "
		   		+ "city, state, zip_code, country, is_active,delete_flag) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? ,?, ?,?)";
	        try (Connection conn = dataSource.getConnection();
	             PreparedStatement stmt = conn.prepareStatement(sql)) {
	            stmt.setString(1, supplier.getFirstName());
	            stmt.setString(2, supplier.getLastName());
	            stmt.setString(3, supplier.getCompanyName());
	            stmt.setString(4, supplier.getContactPersonName());
	            stmt.setString(5, supplier.getEmail());
	            stmt.setString(6, supplier.getMobile_no());
	            stmt.setString(7, supplier.getAddressLine1());
	            stmt.setString(8, supplier.getAddressLine2());
	            stmt.setString(9, supplier.getAddressLine3());
	            stmt.setString(10, supplier.getCity());
	            stmt.setString(11, supplier.getState());
	            stmt.setString(12, supplier.getZipCode());
	            stmt.setString(13, supplier.getCountry());
	            stmt.setBoolean(14, supplier.isActive());
	            stmt.setBoolean(15, false);
	            return stmt.executeUpdate() > 0;
	        } catch (SQLException e) {
	            e.printStackTrace();
	            return false;
	        }
	}

	@Override
	public List<Suppliers> getAllSuppliers() {
		  List<Suppliers> list = new ArrayList<>();
	        String sql = "SELECT * FROM suppliers WHERE is_active = true and  delete_flag=false";
	        try (Connection conn = dataSource.getConnection();
	             Statement stmt = conn.createStatement();
	             ResultSet rs = stmt.executeQuery(sql)) {

	            while (rs.next()) {
	                Suppliers s = new Suppliers();
	                s.setSupplierId(rs.getInt("supplier_id"));
	                s.setFirstName(rs.getString("first_name"));
	                s.setLastName(rs.getString("last_name"));
		            s.setCompanyName(rs.getString("company_name"));
		            s.setContactPersonName(rs.getString("contact_person_name"));
		            s.setEmail(rs.getString("email"));
		            s.setMobile_no(rs.getString("mobile_no"));
		            s.setAddressLine1(rs.getString("address_line1"));
		            s.setAddressLine2(rs.getString("address_line2"));
		            s.setAddressLine3(rs.getString("address_line3"));
		            s.setCity(rs.getString("city"));
		            s.setState(rs.getString("state"));
		            s.setZipCode(rs.getString("zip_code"));
		            s.setCountry(rs.getString("country"));
	                s.setActive(rs.getBoolean("is_active"));
	                list.add(s);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return list;
	}

	@Override
	public boolean deleteSupplier(int id) {
		 String sql = "UPDATE suppliers SET delete_flag = true WHERE supplier_id = ?";
	        try (Connection conn = dataSource.getConnection();
	             PreparedStatement stmt = conn.prepareStatement(sql)) {
	            stmt.setInt(1, id);
	           return stmt.executeUpdate() > 0;
	        } catch (SQLException e) {
	            e.printStackTrace();
	            return false;
	        }
	}

	@Override
	public Suppliers getSupplierById(int id) {
		String sql = "SELECT * FROM suppliers WHERE supplier_id = ?";
        Suppliers supp = null;
        try (Connection conn = dataSource.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    supp = new Suppliers();
                    supp.setSupplierId(rs.getInt("supplier_id"));
	                supp.setFirstName(rs.getString("first_name"));
	                supp.setLastName(rs.getString("last_name"));
		            supp.setCompanyName(rs.getString("company_name"));
		            supp.setContactPersonName(rs.getString("contact_person_name"));
		            supp.setEmail(rs.getString("email"));
		            supp.setMobile_no(rs.getString("mobile_no"));
		            supp.setAddressLine1(rs.getString("address_line1"));
		            supp.setAddressLine2(rs.getString("address_line2"));
		            supp.setAddressLine3(rs.getString("address_line3"));
		            supp.setCity(rs.getString("city"));
		            supp.setState(rs.getString("state"));
		            supp.setZipCode(rs.getString("zip_code"));
		            supp.setCountry(rs.getString("country"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return supp;
	}

	@Override
	public void updateSupplier(Suppliers supplier) {
		 String sql =  "UPDATE suppliers SET "
			        + "first_name = ?, last_name = ?, company_name = ?, contact_person_name = ?, "
			        + "email = ?, mobile_no = ?, address_line1 = ?, address_line2 = ?, address_line3 = ?, "
			        + "city = ?, state = ?, zip_code = ?, country = ?, is_active = ? "
			        + "WHERE supplier_id = ?";
	        try (Connection conn = dataSource.getConnection();
	             PreparedStatement stmt = conn.prepareStatement(sql)) {
	        	  stmt.setString(1, supplier.getFirstName());
		            stmt.setString(2, supplier.getLastName());
		            stmt.setString(3, supplier.getCompanyName());
		            stmt.setString(4, supplier.getContactPersonName());
		            stmt.setString(5, supplier.getEmail());
		            stmt.setString(6, supplier.getMobile_no());
		            stmt.setString(7, supplier.getAddressLine1());
		            stmt.setString(8, supplier.getAddressLine2());
		            stmt.setString(9, supplier.getAddressLine3());
		            stmt.setString(10, supplier.getCity());
		            stmt.setString(11, supplier.getState());
		            stmt.setString(12, supplier.getZipCode());
		            stmt.setString(13, supplier.getCountry());
		            stmt.setBoolean(14, supplier.isActive());
		            stmt.setInt(15, supplier.getSupplierId());
	            stmt.executeUpdate();
	            System.out.println("Updating Supplier ID: " + supplier.getSupplierId());
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	}


	@Override
	public boolean deactivateSupplier(int id) {
		 String sql = "UPDATE suppliers SET is_active=false WHERE supplier_id = ?";
	        try (Connection conn = dataSource.getConnection();
	             PreparedStatement stmt = conn.prepareStatement(sql)) {
	            stmt.setInt(1, id);
	           return  stmt.executeUpdate() > 0;
	        } catch (SQLException e) {
	            e.printStackTrace();
	            return false;
	        }
	}

	
	
	@Override
    public List<Suppliers> getSuppliers() throws Exception {
        List<Suppliers> list = new ArrayList<>();
        String sql = "SELECT * FROM suppliers";
        Connection conn = dataSource.getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            Suppliers s = new Suppliers();
            s.setSupplierId(rs.getInt("supplier_id"));
            s.setFirstName(rs.getString("supplier_name"));
            list.add(s);
        }
        return list;
    }
}
