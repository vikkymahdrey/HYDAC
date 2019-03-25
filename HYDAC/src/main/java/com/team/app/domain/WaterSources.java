package com.team.app.domain;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="water_sources")
public class WaterSources {

	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	
	private int orgid;
	
	private int appId;

	@Column(name="water_source")
	private String waterSouce;
	
	@OneToMany(mappedBy="waterSourceId")
	private List<BillingConstraints> billingConstraint;
	
	@OneToMany(mappedBy="waterSourceId")
	private List<UserDeviceMapping> userDeices;
	
	

	public List<UserDeviceMapping> getUserDeices() {
		return userDeices;
	}

	public void setUserDeices(List<UserDeviceMapping> userDeices) {
		this.userDeices = userDeices;
	}

	public List<BillingConstraints> getBillingConstraint() {
		return billingConstraint;
	}

	public void setBillingConstraint(List<BillingConstraints> billingConstraint) {
		this.billingConstraint = billingConstraint;
	}

	public String getWaterSouce() {
		return waterSouce;
	}

	public void setWaterSouce(String waterSouce) {
		this.waterSouce = waterSouce;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getOrgid() {
		return orgid;
	}

	public void setOrgid(int orgid) {
		this.orgid = orgid;
	}

	public int getAppId() {
		return appId;
	}

	public void setAppId(int appId) {
		this.appId = appId;
	}
	
	
	
}
