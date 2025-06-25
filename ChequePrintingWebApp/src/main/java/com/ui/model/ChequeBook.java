package com.ui.model;

import java.sql.Date;

public class ChequeBook {
	private int chequeBookId;
    private int bankAccountId;
    private String seriesStart;
    private String seriesEnd;
    private Date issueDate;
    private String status;
    private boolean isActive;
    private String BookName;
    private int totalCheques;
    
    
    
    //private Timestamp createdAt;
	public int getChequeBookId() {
		return chequeBookId;
	}
	public void setChequeBookId(int chequeBookId) {
		this.chequeBookId = chequeBookId;
	}
	public int getBankAccountId() {
		return bankAccountId;
	}
	public void setBankAccountId(int bankAccountId) {
		this.bankAccountId = bankAccountId;
	}
	public String getSeriesStart() {
		return seriesStart;
	}
	public void setSeriesStart(String seriesStart) {
		this.seriesStart = seriesStart;
	}
	public String getSeriesEnd() {
		return seriesEnd;
	}
	public void setSeriesEnd(String seriesEnd) {
		this.seriesEnd = seriesEnd;
	}
	public Date getIssueDate() {
		return issueDate;
	}
	public void setIssueDate(Date issueDate) {
		this.issueDate = issueDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public boolean isActive() {
		return isActive;
	}
	public void setActive(boolean isActive) {
		this.isActive = isActive;
	}
	public String getBookName() {
		return BookName;
	}
	public void setBookName(String bookName) {
		BookName = bookName;
	}
	public int getTotalCheques() {
		return totalCheques;
	}
	public void setTotalCheques(int totalCheques) {
		this.totalCheques = totalCheques;
	}
}
