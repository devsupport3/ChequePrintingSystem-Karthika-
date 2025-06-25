package com.ui.model;



public class Bank {

	  private int bankId;
	    private String bankName;
	    private String shortForm;
	    private boolean active;
	    private boolean deleteFlag;
	//    private Timestamp createdAt;
	    
	    
	    
		public int getBankId() {
			return bankId;
		}
		public void setBankId(int bankId) {
			this.bankId = bankId;
		}
		public String getBankName() {
			return bankName;
		}
		public void setBankName(String bankName) {
			this.bankName = bankName;
		}
		public String getShortForm() {
			return shortForm;
		}
		public void setShortForm(String shortForm) {
			this.shortForm = shortForm;
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
}
