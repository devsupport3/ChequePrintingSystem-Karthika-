package com.ui.controller;

import java.math.BigDecimal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.RestController;

import com.ui.dao.ChequeService;
import com.ui.model.Cheques;

@RestController
@RequestMapping("/api/cheques")
public class ChequeRestController {

	 @Autowired
	    private ChequeService chequeService;

	    @PostMapping("/issue")
	    public ResponseEntity<String> issueCheque(@RequestBody Cheques cheque) {
	        try {
	            chequeService.issueCheque(cheque);
	            return ResponseEntity.ok("Cheque issued successfully.");
	        } catch (Exception e) {
	            e.printStackTrace();
	            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
	                                 .body("Error issuing cheque.");
	        }
	    }
	    
	   
}
