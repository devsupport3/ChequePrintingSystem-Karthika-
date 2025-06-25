package com.ui.dao;


import java.util.List;

import com.ui.model.BankAccounts;

public interface BankAccountService {
	   BankAccounts getBankAccount();
	    List<BankAccounts> getAllBankAccounts();
	    boolean insertBankAccount(BankAccounts account);
	    boolean updateBankAccount(BankAccounts account);
	    BankAccounts getBankAccountById(int id);
	    boolean deleteBankAccount(int id);
	    boolean deactivateBankAccount(int id);
		List<BankAccounts> getAccountsByBankId(int bankId);
}
