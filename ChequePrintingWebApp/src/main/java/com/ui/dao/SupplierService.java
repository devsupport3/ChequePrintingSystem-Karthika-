package com.ui.dao;

import java.util.List;

import com.ui.model.Suppliers;

public interface SupplierService {
	  boolean addSupplier(Suppliers supplier);
	    List<Suppliers> getAllSuppliers();
	    boolean deactivateSupplier(int id);
	    boolean deleteSupplier(int id);
	    Suppliers getSupplierById(int id);
	    void updateSupplier(Suppliers supplier);
		List<Suppliers> getSuppliers() throws Exception;
}
