package com.ui.model;

import java.math.BigDecimal;
import java.sql.Date;
import java.sql.Timestamp;




//Model Cheques
public class Cheques {
	//Variables
	private int chequeId;
    private String chequeNumber;
    private int bankAccountId;
    private int chequeBookId;
    private int supplierId;
    private String BankName;
    private String supplierName;
    private BigDecimal amountNumeric;
    private String amountWords;
    private String chequeDate;
    private String status;
    private Timestamp printedAt;
    private boolean isActive;
   // private Timestamp createdAt;
    
    
    //Constructor
    public Cheques() {}


	public int getChequeId() {
		return chequeId;
	}


	public void setChequeId(int chequeId) {
		this.chequeId = chequeId;
	}


	public String getChequeNumber() {
		return chequeNumber;
	}


	public void setChequeNumber(String chequeNumber) {
		this.chequeNumber = chequeNumber;
	}


	public int getBankAccountId() {
		return bankAccountId;
	}


	public void setBankAccountId(int bankAccountId) {
		this.bankAccountId = bankAccountId;
	}


	public int getChequeBookId() {
		return chequeBookId;
	}


	public void setChequeBookId(int chequeBookId) {
		this.chequeBookId = chequeBookId;
	}


	public int getSupplierId() {
		return supplierId;
	}


	public void setSupplierId(int supplierId) {
		this.supplierId = supplierId;
	}


	public String getBankName() {
		return BankName;
	}


	public void setBankName(String bankName) {
		BankName = bankName;
	}


	public String getSupplierName() {
		return supplierName;
	}


	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}


	public BigDecimal getAmountNumeric() {
		return amountNumeric;
	}


	public void setAmountNumeric(BigDecimal amountNumeric) {
		this.amountNumeric = amountNumeric;
	}


	public String getAmountWords() {
		return amountWords;
	}


	public void setAmountWords(String amountWords) {
		this.amountWords = amountWords;
	}


	public String getChequeDate() {
		return chequeDate;
	}


	public void setChequeDate(String chequeDate) {
		this.chequeDate = chequeDate;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public Timestamp getPrintedAt() {
		return printedAt;
	}


	public void setPrintedAt(Timestamp printedAt) {
		this.printedAt = printedAt;
	}


	public boolean isActive() {
		return isActive;
	}


	public void setActive(boolean isActive) {
		this.isActive = isActive;
	}

   

    
    //Getters and Setters
	


}
