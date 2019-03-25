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
@Table(name="bills")
public class Bills {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="userId")
	private TblUserInfo user;
	
	
	
//	@Cascade({CascadeType.REMOVE})
	@OneToMany(mappedBy="bills")
	private List<BillsChild> billsChild;
	
	
	private String orgid;
	
	private Date bill_from_time;
	
	private Date bill_to_time;
	
	private int bill_month;
	
	private float payable_amount;
	
	private String payment_status;
	
	private Date bill_payed_time;
	
	private String paymentsrc;
	
	private String adminid;
	
	private Date bill_generated_time;
	
	private String bill_generated_source;
	
	private int bill_generator_id;
	
	

	public String getAdminid() {
		return adminid;
	}

	public void setAdminid(String adminid) {
		this.adminid = adminid;
	}

	public String getPaymentsrc() {
		return paymentsrc;
	}

	public void setPaymentsrc(String paymentsrc) {
		this.paymentsrc = paymentsrc;
	}

	public String getOrgid() {
		return orgid;
	}

	public void setOrgid(String orgid) {
		this.orgid = orgid;
	}

	public Date getBill_from_time() {
		return bill_from_time;
	}

	public void setBill_from_time(Date bill_from_time) {
		this.bill_from_time = bill_from_time;
	}

	public Date getBill_to_time() {
		return bill_to_time;
	}

	public void setBill_to_time(Date bill_to_time) {
		this.bill_to_time = bill_to_time;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public TblUserInfo getUser() {
		return user;
	}

	public void setUser(TblUserInfo user) {
		this.user = user;
	}

	

	public int getBill_month() {
		return bill_month;
	}

	public void setBill_month(int bill_month) {
		this.bill_month = bill_month;
	}

	

	public float getPayable_amount() {
		return payable_amount;
	}

	public void setPayable_amount(float payable_amount) {
		this.payable_amount = payable_amount;
	}

	public String getPayment_status() {
		return payment_status;
	}

	public void setPayment_status(String payment_status) {
		this.payment_status = payment_status;
	}

	public Date getBill_payed_time() {
		return bill_payed_time;
	}

	public void setBill_payed_time(Date bill_payed_time) {
		this.bill_payed_time = bill_payed_time;
	}

	

	public Date getBill_generated_time() {
		return bill_generated_time;
	}

	public void setBill_generated_time(Date bill_generated_time) {
		this.bill_generated_time = bill_generated_time;
	}

	public String getBill_generated_source() {
		return bill_generated_source;
	}

	public void setBill_generated_source(String bill_generated_source) {
		this.bill_generated_source = bill_generated_source;
	}

	public int getBill_generator_id() {
		return bill_generator_id;
	}

	public void setBill_generator_id(int bill_generator_id) {
		this.bill_generator_id = bill_generator_id;
	}
	
	
	public List<BillsChild> getBillsChild() {
		return billsChild;
	}

	public void setBillsChild(List<BillsChild> billsChild) {
		this.billsChild = billsChild;
	}


	
	
	
}
