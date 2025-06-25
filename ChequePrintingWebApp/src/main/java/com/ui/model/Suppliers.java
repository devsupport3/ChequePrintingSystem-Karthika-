package com.ui.model;



//Model: Suppliers
public class Suppliers {
	//Variables
	 private int  supplierId;
	  private String firstName;
	    private String lastName;
	    private String companyName;
	    private String contactPersonName;
	    private String email;
	   
	    private String mobile_no;
	    private String addressLine1;
	    private String addressLine2;
	    private String addressLine3;
	    private String city;
	    private String state;
	    private String zipCode;
	    private String country;
	    private boolean active;
	    private boolean isdeleted;
	    //private LocalDateTime createdAt;

	  

	
	    
	    //Constructor
	    public Suppliers(){
	    	
	    }
	     public Suppliers(  int  supplierId,String firstName, String lastName,String companyName,
		     String contactPersonName,String email,String mobile_no,String addressLine1,String addressLine2,
String addressLine3,String city,String state,String zipCode,String country,boolean active) {
	    	 this.supplierId=supplierId;
	    	 this.firstName=firstName;
	    	 this.lastName=lastName;
	    	 this.companyName=companyName;
	    	 this.contactPersonName=contactPersonName;
	    	 this.email=email;
	    	 this.mobile_no=mobile_no;
	    	 this.addressLine1=addressLine1;
	    	 this.addressLine2=addressLine2;
	    	 this.addressLine3=addressLine3;
	    	 this.city=city;
	    	 this.state=state;
	    	 this.zipCode=zipCode;
	    	 this.country=country;
	    	 this.active=active;
	    	 this.active=active;
	    	 
	     }
	

	     //Getters and Setters
		public int  getSupplierId() {
			return supplierId;
		}

		public void setSupplierId(int  supplierId) {
			this.supplierId = supplierId;
		}

		

		public boolean isActive() {
			return active;
		}

		public void setActive(boolean active) {
			this.active = active;
		}

		
		
		public String getMobile_no() {
			return mobile_no;
		}
		public void setMobile_no(String mobile_no) {
			this.mobile_no = mobile_no;
		}
		public String getFirstName() {
			return firstName;
		}
		public void setFirstName(String firstName) {
			this.firstName = firstName;
		}
		public String getLastName() {
			return lastName;
		}
		public void setLastName(String lastName) {
			this.lastName = lastName;
		}
		public String getCompanyName() {
			return companyName;
		}
		public void setCompanyName(String companyName) {
			this.companyName = companyName;
		}
		public String getContactPersonName() {
			return contactPersonName;
		}
		public void setContactPersonName(String contactPersonName) {
			this.contactPersonName = contactPersonName;
		}
		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
		public String getAddressLine1() {
			return addressLine1;
		}
		public void setAddressLine1(String addressLine1) {
			this.addressLine1 = addressLine1;
		}
		public String getAddressLine2() {
			return addressLine2;
		}
		public void setAddressLine2(String addressLine2) {
			this.addressLine2 = addressLine2;
		}
		public String getAddressLine3() {
			return addressLine3;
		}
		public void setAddressLine3(String addressLine3) {
			this.addressLine3 = addressLine3;
		}
		public String getCity() {
			return city;
		}
		public void setCity(String city) {
			this.city = city;
		}
		public String getState() {
			return state;
		}
		public void setState(String state) {
			this.state = state;
		}
		public String getZipCode() {
			return zipCode;
		}
		public void setZipCode(String zipCode) {
			this.zipCode = zipCode;
		}
		public String getCountry() {
			return country;
		}
		public void setCountry(String country) {
			this.country = country;
		}
		public boolean isIsdelete() {
			return isdeleted;
		}
		public void setIsdelete(boolean isdelete) {
			this.isdeleted = isdelete;
		}
}
