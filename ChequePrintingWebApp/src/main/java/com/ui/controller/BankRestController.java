package com.ui.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.ui.dao.BankService;
import com.ui.model.Bank;



@RestController
@RequestMapping("/api/banks")
public class BankRestController {
	  @Autowired
	    private BankService bankService;

	   
	    @PostMapping("/add")
	    public String addBank(@RequestBody Bank bank) {
	        bankService.addBank(bank);
	        return "Bank added successfully.";
	    }

	  
	    @GetMapping()
	    public List<Bank> getAllBanks() {
	        return bankService.getAllBanks();
	    }

	 
	    @GetMapping("{id}")
	    public Bank getBankById(@PathVariable int id) {
	        return bankService.getBankById(id);
	    }


	    @PutMapping("/update/{id}")
	    public String updateBank(@PathVariable("id") int id, @RequestBody Bank bank) {
	    	bank.setBankId(id);
	    	bankService.updateBank(bank);
	        return "Bank updated successfully.";
	    }

	    // ✅ Soft Delete Bank
		/*
		 * @DeleteMapping("/delete/{bankId}") public String deleteBank(@PathVariable int
		 * bankId) { bankService.deleteBank(bankId); return
		 * "Bank deleted successfully."; }
		 */
	    
	    
	    @PutMapping("/update-active/{id}")
	    public String deactivateBank(@PathVariable("id") int id) {
	        boolean result = bankService.deactivateBank(id);
	        return result ? "Bank deactivated" : "Deactivation failed";
	    }
	    
	    
	    @PutMapping("/update-delete/{id}")
	    public String deleteBank(@PathVariable("id") int id) {
	        boolean result = bankService.deleteBank(id);
	        return result ? "Bank deleted" : "Deletion failed";
	    }
	    
	    
	    
	    @GetMapping("/banksAll")
	    public List<Bank> getBanks() {
	        return bankService.getBanks();
	    }
}
