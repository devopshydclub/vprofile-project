package com.visualpathit.account.model;


import javax.persistence.*;

import java.io.Serializable;
import java.util.Set;
/**{@author imrant} !*/
@Entity
@Table(name = "user")
public class User implements Serializable {
	/** the id field !*/
    private Long id;
    /** the user name field !*/
    private String username;
    /** the password field !*/
    private String password;
    /** the userEmail field !*/
    private String userEmail;
    /** the passwordConfirm field !*/
    private String passwordConfirm;
    /** the profileImg field !*/
    private String profileImg;
    /** the profileImgPath field !*/
    private String profileImgPath;
    private String dateOfBirth;
    private String fatherName;
    private String motherName;
    private String gender;
    private String maritalStatus;
    private String permanentAddress;
    private String tempAddress;
    private String primaryOccupation;
    private String secondaryOccupation;
    private String skills;
    private String phoneNumber;
    private String secondaryPhoneNumber;
    private String nationality;
    private String language;
    private String workingExperience;
    
    
    /** the roles field !*/
    private Set<Role> roles;
    /** {@inheritDoc}} !*/
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    /** {@link User#id} */
    public Long getId() {
        return id;
    }
    /** {@inheritDoc}} !*/
    public  void setId(final Long id) {
        this.id = id;
    }
    /**{@inheritDoc}} !*/
    public String getUsername() {
        return username;
    }
    /** {@inheritDoc}} !*/
    public  void setUsername(final String username) {
        this.username = username;
    }
    /**
     * {@link User#password}
     * @return The {@link String} instance representing password
     !*/
    public String getPassword() {
        return password;
    }
    /**
     * {@inheritDoc}} 
     !*/
    public  void setPassword(final String password) {
        this.password = password;
    }
    /**
     * {@link User#userEmail}
     * @return The {@link String} instance representing userEmail.
     !*/
    public String getUserEmail() {
		return userEmail;
	}
    /** {@inheritDoc}} !*/
	public  void setUserEmail(final String userEmail) {
		this.userEmail = userEmail;
	}

	 /** {@inheritDoc}} !*/
	@Transient
	/**
     * {@link User#passwordConfirm}
     !*/
    public String getPasswordConfirm() {
        return passwordConfirm;
    }
	 /** {@inheritDoc}} !*/
    public  void setPasswordConfirm(final String passwordConfirm) {
        this.passwordConfirm = passwordConfirm;
    }
    /** {@inheritDoc}} !*/
    @ManyToMany
    @JoinTable(name = "user_role", joinColumns = @JoinColumn(name = "user_id"), inverseJoinColumns = @JoinColumn(name = "role_id"))
    public Set<Role> getRoles() {
        return roles;
    }
    /** {@inheritDoc}} !*/
    public void setRoles(final Set<Role> roles) {
        this.roles = roles;
    }
	public String getProfileImg() {
		return profileImg;
	}
	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}
	public String getProfileImgPath() {
		return profileImgPath;
	}
	public void setProfileImgPath(String profileImgPath) {
		this.profileImgPath = profileImgPath;
	}
	public String getDateOfBirth() {
		return dateOfBirth;
	}
	public void setDateOfBirth(String dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}
	public String getFatherName() {
		return fatherName;
	}
	public void setFatherName(String fatherName) {
		this.fatherName = fatherName;
	}
	public String getMotherName() {
		return motherName;
	}
	public void setMotherName(String motherName) {
		this.motherName = motherName;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getMaritalStatus() {
		return maritalStatus;
	}
	public void setMaritalStatus(String maritalStatus) {
		this.maritalStatus = maritalStatus;
	}
	public String getPermanentAddress() {
		return permanentAddress;
	}
	public void setPermanentAddress(String permanentAddress) {
		this.permanentAddress = permanentAddress;
	}
	public String getTempAddress() {
		return tempAddress;
	}
	public void setTempAddress(String tempAddress) {
		this.tempAddress = tempAddress;
	}
	public String getPrimaryOccupation() {
		return primaryOccupation;
	}
	public void setPrimaryOccupation(String primaryOccupation) {
		this.primaryOccupation = primaryOccupation;
	}
	public String getSecondaryOccupation() {
		return secondaryOccupation;
	}
	public void setSecondaryOccupation(String secondaryOccupation) {
		this.secondaryOccupation = secondaryOccupation;
	}
	public String getSkills() {
		return skills;
	}
	public void setSkills(String skills) {
		this.skills = skills;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getSecondaryPhoneNumber() {
		return secondaryPhoneNumber;
	}
	public void setSecondaryPhoneNumber(String secondaryPhoneNumber) {
		this.secondaryPhoneNumber = secondaryPhoneNumber;
	}
	public String getNationality() {
		return nationality;
	}
	public void setNationality(String nationality) {
		this.nationality = nationality;
	}
	public String getLanguage() {
		return language;
	}
	public void setLanguage(String language) {
		this.language = language;
	}
	public String getWorkingExperience() {
		return workingExperience;
	}
	public void setWorkingExperience(String workingExperience) {
		this.workingExperience = workingExperience;
	}
	
	
}
