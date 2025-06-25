package com.ui.dao;

import java.util.List;

import com.ui.model.BankAccounts;
import com.ui.model.ChequeBook;

public interface ChequeBookService {
	 int addChequeBook(ChequeBook book);
	    ChequeBook getChequeBookById(int chequeBookId);
	    boolean deleteChequeBook(int chequeBookId);
	    List<ChequeBook> getAllChequeBooks();
	    
	    List<ChequeBook> getChequeBooksByBankId(int bankId) throws Exception;
		//List<BankAccounts> getAccountsByBankId(int bankId);
}
