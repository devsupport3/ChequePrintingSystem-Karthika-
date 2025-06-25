package com.ui.model;

import java.sql.Timestamp;

public class ChequeSignatory {
	 private int chequeId;
	    private int signatoryId;
	    private boolean isActive;
	    private Timestamp createdAt;

	    public ChequeSignatory() {}

	    public ChequeSignatory(int chequeId, int signatoryId, boolean isActive, Timestamp createdAt) {
	        this.setChequeId(chequeId);
	        this.setSignatoryId(signatoryId);
	        this.setActive(isActive);
	        this.setCreatedAt(createdAt);
	    }

		public int getChequeId() {
			return chequeId;
		}

		public void setChequeId(int chequeId) {
			this.chequeId = chequeId;
		}

		public int getSignatoryId() {
			return signatoryId;
		}

		public void setSignatoryId(int signatoryId) {
			this.signatoryId = signatoryId;
		}

		public boolean isActive() {
			return isActive;
		}

		public void setActive(boolean isActive) {
			this.isActive = isActive;
		}

		public Timestamp getCreatedAt() {
			return createdAt;
		}

		public void setCreatedAt(Timestamp createdAt) {
			this.createdAt = createdAt;
		}

}
