package com.SAS;

public class Donation {

	String donatedTo = null;
	int amount;
	int donationID;
	String donatedBy = null;
	String message = null;
	String username = null;
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getDonatedTo() {
		return donatedTo;
	}
	public void setDonatedTo(String donatedTo) {
		this.donatedTo = donatedTo;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getDonationID() {
		return donationID;
	}
	public void setDonationID(int donationID) {
		this.donationID = donationID;
	}
	public String getDonatedBy() {
		return donatedBy;
	}
	public void setDonatedBy(String donatedBy) {
		this.donatedBy = donatedBy;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
	
}
