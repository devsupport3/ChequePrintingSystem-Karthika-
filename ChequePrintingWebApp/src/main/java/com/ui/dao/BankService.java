package com.ui.dao;

import java.util.List;

import com.ui.model.Bank;

public interface BankService {
	  void addBank(Bank bank);
	    List<Bank> getAllBanks();
	    Bank getBankById(int bankId);
	    void updateBank(Bank bank);
	    boolean deleteBank(int bankId);
	    boolean deactivateBank(int bankId);
	    
	    List<Bank>getBanks();
	    
}
