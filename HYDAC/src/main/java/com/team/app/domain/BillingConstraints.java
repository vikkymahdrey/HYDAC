package com.team.app.domain;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="billing_constraints")
public class BillingConstraints {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	
	private int orgId;
	
	private int appId;
	
	@OneToMany(mappedBy="billCons",cascade=CascadeType.REMOVE)
	private List<BillingSlabs> billingSlabs;
	
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="water_source_id")
	private WaterSources waterSourceId;
	
	@Column(name="effective_date")
	private Date effectiveDate;
	
	private int billingDay;
	
	private String Status;
	

	public List<BillingSlabs> getBillingSlabs() {
		return billingSlabs;
	}

	public void setBillingSlabs(List<BillingSlabs> billingSlabs) {
		this.billingSlabs = billingSlabs;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getOrgId() {
		return orgId;
	}

	public void setOrgId(int orgId) {
		this.orgId = orgId;
	}

	public int getAppId() {
		return appId;
	}

	public void setAppId(int appId) {
		this.appId = appId;
	}

	public WaterSources getWaterSourceId() {
		return waterSourceId;
	}

	public void setWaterSourceId(WaterSources waterSourceId) {
		this.waterSourceId = waterSourceId;
	}

	public Date getEffectiveDate() {
		return effectiveDate;
	}

	public void setEffectiveDate(Date effectiveDate) {
		this.effectiveDate = effectiveDate;
	}

	public int getBillingDay() {
		return billingDay;
	}

	public void setBillingDay(int billingDay) {
		this.billingDay = billingDay;
	}

	public String getStatus() {
		return Status;
	}

	public void setStatus(String status) {
		Status = status;
	}
	
	
}
