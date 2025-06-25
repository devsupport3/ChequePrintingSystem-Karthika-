package com.ui.model;

import java.sql.Timestamp;


//Model : BankAccount
public class BankAccounts {

	//Variables
	 private int bankaccountId;
	    private String accountNumber;
	    private String accountHolderName;
	    private int bankId;
	    private String bankName;
	    
	    private String branchName;
	    private String ifscCode;
	    private boolean active;
	    private boolean deleteFlag;
	    //private Timestamp createdAt;
	    
	    public BankAccounts() {
	    	
	    }
	    
	    
	    public BankAccounts(int accountId, String accountNumber, String accountHolderName, int bankId,
                String branchName, String ifscCode, boolean active, boolean deleteFlag, Timestamp createdAt) {
this.bankaccountId = accountId;
this.accountNumber = accountNumber;
this.accountHolderName = accountHolderName;
this.bankId = bankId;
this.branchName = branchName;
this.ifscCode = ifscCode;
this.active = active;
this.deleteFlag = deleteFlag;
//this.createdAt = createdAt;
}


		public int getBankaccountId() {
			return bankaccountId;
		}

		public void setBankaccountId(int bankaccountId) {
			this.bankaccountId = bankaccountId;
		}

		public String getAccountNumber() {
			return accountNumber;
		}

		public void setAccountNumber(String accountNumber) {
			this.accountNumber = accountNumber;
		}

		public String getAccountHolderName() {
			return accountHolderName;
		}

		public void setAccountHolderName(String accountHolderName) {
			this.accountHolderName = accountHolderName;
		}

		public int getBankId() {
			return bankId;
		}

		public void setBankId(int bankId) {
			this.bankId = bankId;
		}

		public String getBranchName() {
			return branchName;
		}

		public void setBranchName(String branchName) {
			this.branchName = branchName;
		}

		public String getIfscCode() {
			return ifscCode;
		}

		public void setIfscCode(String ifscCode) {
			this.ifscCode = ifscCode;
		}

		public boolean isActive() {
			return active;
		}

		public void setActive(boolean active) {
			this.active = active;
		}

		public boolean isDeleteFlag() {
			return deleteFlag;
		}

		public void setDeleteFlag(boolean deleteFlag) {
			this.deleteFlag = deleteFlag;
		}

		public String getBankName() {
			return bankName;
		}

		public void setBankName(String bankName) {
			this.bankName = bankName;
		}
	    
	

	

		
	
}
