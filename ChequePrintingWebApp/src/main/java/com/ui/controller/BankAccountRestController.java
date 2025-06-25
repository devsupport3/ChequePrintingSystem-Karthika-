package com.ui.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;


import com.ui.dao.BankAccountService;
import com.ui.dao.BankService;
import com.ui.dao.Impl.BankServiceImpl;
import com.ui.model.Bank;
import com.ui.model.BankAccounts;

@RestController
@RequestMapping("/api/bankAccounts")
public class BankAccountRestController {

	@Autowired
	private BankService bankService;
	 @Autowired
	    private BankAccountService bankAccountService;
	 
	   @GetMapping("/banksAll")
	    public List<Bank> getBanks() {
	        return bankService.getBanks();
	    }

	    // Get any one bank account (first one in DB)
	    @GetMapping("/one")
	    public BankAccounts getAnyBankAccount() {
	        return bankAccountService.getBankAccount();
	    }

	    // Get all active bank accounts
	    @GetMapping
	    public List<BankAccounts> getAllBankAccounts() {
	        return bankAccountService.getAllBankAccounts();
	    }

	    // Get bank account by ID
	    @GetMapping("/{id}")
	    public BankAccounts getBankAccountById(@PathVariable int id) {
	        return bankAccountService.getBankAccountById(id);
	    }

	    // Insert a new bank account
	    @PostMapping("/add")
	    public String addBankAccount(@RequestBody BankAccounts account) {
	        boolean success = bankAccountService.insertBankAccount(account);
	        return success ? "Bank account added successfully." : "Failed to add bank account.";
	    }

	    // Update existing bank account
	    @PutMapping("/update/{id}")
	    public String updateBankAccount(@RequestBody BankAccounts account) {
	        boolean success = bankAccountService.updateBankAccount(account);
	        return success ? "Bank account updated successfully." : "Failed to update bank account.";
	    }

	    // Soft delete (deactivate) bank account
		/*
		 * @DeleteMapping("/{id}") public String deleteBankAccount(@PathVariable int id)
		 * { try { bankAccountService.deleteBankAccount(id); return
		 * "Bank account deactivated successfully."; } catch (Exception e) {
		 * e.printStackTrace(); return
		 * "Error occurred while deactivating bank account."; } }
		 */
	    
		/*
		 * @PutMapping("/update-active/{id}") public String
		 * deactivateBankAccount(@PathVariable("id") int id) { boolean result =
		 * bankAccountService.deactivateBankAccount(id); return result ?
		 * "Bank Account deactivated" : "Deactivation failed"; }
		 * 
		 * 
		 * @PutMapping("/update-delete/{id}") public String
		 * deleteBankAccount(@PathVariable("id") int id) { boolean result =
		 * bankAccountService.deleteBankAccount(id); return result ?
		 * "Bank Account deleted" : "Deletion failed"; }
		 */
	    
	    
	    
	    @PutMapping("/update-active/{id}")
	    public ResponseEntity<Map<String, String>> deactivateBankAccount(@PathVariable("id") int id) {
	        boolean result = bankAccountService.deactivateBankAccount(id);
	        Map<String, String> response = new HashMap<>();
	        response.put("message", result ? "Bank Account deactivated" : "Deactivation failed");
	        return ResponseEntity.ok(response);
	    }

	    @PutMapping("/update-delete/{id}")
	    public ResponseEntity<Map<String, String>> deleteBankAccount(@PathVariable("id") int id) {
	        boolean result = bankAccountService.deleteBankAccount(id);
	        Map<String, String> response = new HashMap<>();
	        response.put("message", result ? "Bank Account deleted" : "Deletion failed");
	        return ResponseEntity.ok(response);
	    }
	    
	    
	    
	   
	    @GetMapping("/bank/{bankId}")
	    public List<BankAccounts> getAccountsByBank(@PathVariable int bankId) {
	    	 System.out.println("Fetching accounts for bankId = " + bankId);
	        return bankAccountService.getAccountsByBankId(bankId);
	    }
	 
}
