package com.SAS;

import java.io.InputStream;

public class Rescue {
	
	int rescueID;
	String rescueType = null;
	String rescueDescription = null;
	String rescueReporterContact = null;
	String username = null;
	String location = null;
	String photoPath = null;
	InputStream photoblob = null;
	
	
	public InputStream getPhotoblob() {
		return photoblob;
	}
	public void setPhotoblob(InputStream photoblob) {
		this.photoblob = photoblob;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getPhotoPath() {
		return photoPath;
	}
	public void setPhotoPath(String photoPath) {
		this.photoPath = photoPath;
	}
	public int getRescueID() {
		return rescueID;
	}
	public void setRescueID(int rescueID) {
		this.rescueID = rescueID;
	}
	public String getRescueType() {
		return rescueType;
	}
	public void setRescueType(String rescueType) {
		this.rescueType = rescueType;
	}
	public String getRescueDescription() {
		return rescueDescription;
	}
	public void setRescueDescription(String rescueDescription) {
		this.rescueDescription = rescueDescription;
	}
	public String getRescueReporterContact() {
		return rescueReporterContact;
	}
	public void setRescueReporterContact(String rescueReporterContact) {
		this.rescueReporterContact = rescueReporterContact;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	
}
