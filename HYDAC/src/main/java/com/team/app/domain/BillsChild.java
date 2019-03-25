package com.team.app.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity
@Table(name="BillsChild")
public class BillsChild {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="bills_parent_id")
	private Bills bills;
	
	@Column(name="device_id")
	private String deviceId;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="slab_id")
	private BillingSlabs billingSlab;
	
	
	
	
	@Column(name="water_consumption_from")
	private Date waterConsumtionFrom;
	@Column(name="water_consumption_to")
	private Date waterConsumtionTo;
	
	@Column(name="payable_per_consumption_per_slab_per_device")
	private float payable_per_consumption_per_slab_per_device;

	@Column(name="consumption_per_slab")
	private int consumptionperslab;
	
	@Column(name="price_applied_per_ltr")
	private float priceappliedperltr;
	
	@Column(name="ws_name")
	private String wsName;
	
	public String getWsName() {
		return wsName;
	}

	public void setWsName(String wsName) {
		this.wsName = wsName;
	}

	public float getPriceappliedperltr() {
		return priceappliedperltr;
	}

	public void setPriceappliedperltr(float priceappliedperltr) {
		this.priceappliedperltr = priceappliedperltr;
	}

	public int getConsumptionperslab() {
		return consumptionperslab;
	}

	public void setConsumptionperslab(int consumptionperslab) {
		this.consumptionperslab = consumptionperslab;
	}

	

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Bills getBills() {
		return bills;
	}

	public void setBills(Bills bills) {
		this.bills = bills;
	}

	public String getDeviceId() {
		return deviceId;
	}

	public void setDeviceId(String deviceId) {
		this.deviceId = deviceId;
	}

	public BillingSlabs getBillingSlab() {
		return billingSlab;
	}

	public void setBillingSlab(BillingSlabs billingSlab) {
		this.billingSlab = billingSlab;
	}


	public Date getWaterConsumtionFrom() {
		return waterConsumtionFrom;
	}

	public void setWaterConsumtionFrom(Date waterConsumtionFrom) {
		this.waterConsumtionFrom = waterConsumtionFrom;
	}

	public Date getWaterConsumtionTo() {
		return waterConsumtionTo;
	}

	public void setWaterConsumtionTo(Date waterConsumtionTo) {
		this.waterConsumtionTo = waterConsumtionTo;
	}

	public float getPayable_per_consumption_per_slab_per_device() {
		return payable_per_consumption_per_slab_per_device;
	}

	public void setPayable_per_consumption_per_slab_per_device(float payable_per_consumption_per_slab_per_device) {
		this.payable_per_consumption_per_slab_per_device = payable_per_consumption_per_slab_per_device;
	}
	
}
