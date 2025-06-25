package com.ui.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.ui.dao.BankAccountService;
import com.ui.dao.BankService;
import com.ui.dao.ChequeBookService;
import com.ui.model.Bank;
import com.ui.model.BankAccounts;
import com.ui.model.ChequeBook;


@RestController
@RequestMapping("/api/chequeBooks")
public class ChequeBookRestController {
	  @Autowired
	    private ChequeBookService chequeBookService;
	  
	    @GetMapping
	    public List<ChequeBook> getAllChequeBooks() {
	        return chequeBookService.getAllChequeBooks();
	    }

		/*
		 * @PostMapping("/add") public int addChequeBook(@RequestBody ChequeBook book) {
		 * return chequeBookService.addChequeBook(book); }
		 */
	    
	    
	    
	    @PostMapping("/add")
	    public ResponseEntity<String> addChequeBook(@RequestBody ChequeBook book) {
	        int id = chequeBookService.addChequeBook(book);
	        return ResponseEntity.ok("Inserted with ID: " + id);
	    }
	    
	    
	    @GetMapping("/{id}")
	    public ChequeBook getChequeBookById(@PathVariable int id) {
	        return chequeBookService.getChequeBookById(id);
	    }
	    
	    @GetMapping("/bybank/{id}")
	    public List<ChequeBook>  getChequeBooksByBankId(@PathVariable int id) throws Exception {
	        return chequeBookService.getChequeBooksByBankId(id);
	    }
	    
	 
	    
	    
		/*
		 * @GetMapping("/accounts") public List<BankAccounts> getAllBankAccounts() {
		 * return bankAccountService.getAllBankAccounts(); }
		 * 
		 * @GetMapping("/accountsbybank/{bankId}") public List<BankAccounts>
		 * getAccountsByBank(@PathVariable int bankId) { return
		 * chequeBookService.getAccountsByBankId(bankId); }
		 */
	    
	    
}


