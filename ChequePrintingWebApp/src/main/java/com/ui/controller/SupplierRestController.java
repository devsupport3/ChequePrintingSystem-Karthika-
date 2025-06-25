package com.ui.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ui.dao.SupplierService;
import com.ui.model.Suppliers;

@RestController
@RequestMapping("/api/suppliers")
public class SupplierRestController {

    @Autowired
    private SupplierService supplierService;

    // GET all active suppliers
    @GetMapping
    public List<Suppliers> getAllSuppliers() {
        return supplierService.getAllSuppliers();
    }

    // GET supplier by ID
    @GetMapping("/{id}")
    public Suppliers getSupplierById(@PathVariable("id") int id) {
    	System.out.println("Fetching supplier with ID: " + id);
    	  
        return supplierService.getSupplierById(id);
    }

    // POST add new supplier
    @PostMapping("/add")
    public String addSupplier(@RequestBody Suppliers supplier) {
        boolean success = supplierService.addSupplier(supplier);
        return success ? "Supplier added successfully." : "Failed to add supplier.";
    }

    // PUT update supplier
    @PutMapping("/update/{id}")
    public String updateSupplier(@PathVariable("id") int id, @RequestBody Suppliers supplier) {
        supplier.setSupplierId(id);
        supplierService.updateSupplier(supplier);
        return "Supplier updated successfully.";
    }

    // DELETE (Soft delete) supplier
	/*
	 * @DeleteMapping("/{id}") public String deleteSupplier(@PathVariable("id") int
	 * id) { supplierService.deleteSupplier(id); return
	 * "Supplier deactivated successfully."; }
	 */
    
    @PutMapping("/update-active/{id}")
    public String deactivateSupplier(@PathVariable("id") int id) {
        boolean result = supplierService.deactivateSupplier(id);
        return result ? "Supplier deactivated" : "Deactivation failed";
    }
    
    
    @PutMapping("/update-delete/{id}")
    public String deleteSupplier(@PathVariable("id") int id) {
        boolean result = supplierService.deleteSupplier(id);
        return result ? "Supplier deleted" : "Deletion failed";
    }
    
    
    @GetMapping("/suppliersAll")
    public List<Suppliers> getSuppliers() throws Exception {
        return supplierService.getSuppliers();
    }
}