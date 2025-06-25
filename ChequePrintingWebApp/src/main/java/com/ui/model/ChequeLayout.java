package com.ui.model;

public class ChequeLayout {
	 private int layoutId;
	    private String layoutName;
	    private String bankName;
	    private int bankId;
	    private int accountId;
	    private String layoutJson;
	    private String imageBase64;
	    private String createdBy;
	  //  private Timestamp createdAt;
	    
	    
	    public int getLayoutId() { return layoutId; }
	    public void setLayoutId(int layoutId) { this.layoutId = layoutId; }

	    public String getLayoutName() { return layoutName; }
	    public void setLayoutName(String layoutName) { this.layoutName = layoutName; }

	    public String getBankName() { return bankName; }
	    public void setBankName(String bankName) { this.bankName = bankName; }

	    public int getAccountId() { return accountId; }
	    public void setAccountId(int accountId) { this.accountId = accountId; }

	    public String getLayoutJson() { return layoutJson; }
	    public void setLayoutJson(String layoutJson) { this.layoutJson = layoutJson; }

	    public String getImageBase64() { return imageBase64; }
	    public void setImageBase64(String imageBase64) { this.imageBase64 = imageBase64; }

	    public String getCreatedBy() { return createdBy; }
	    public void setCreatedBy(String createdBy) { this.createdBy = createdBy; }
	    
		   public int getBankId() { return bankId; }
	    public void setBankId(int bankId) { this.bankId = bankId; }

	   
}
