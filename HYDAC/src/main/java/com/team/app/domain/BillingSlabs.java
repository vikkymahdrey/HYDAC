package com.team.app.domain;



import java.util.List;

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
@Table(name="BillingSlabs")
public class BillingSlabs {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	@Column(name="units_from")
	private int unitsFrom;
	@Column(name="units_to")
	private int unitsTo;
	
	@Column(name="price_per_unit")
	private float pricePerUnit;

	@Column(name="slab_no")
	private int slabno;
	
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="billing_constraints_id")
	private BillingConstraints billCons;

	
	@OneToMany(mappedBy="billingSlab")
	private List<BillsChild> billsChild;


	public List<BillsChild> getBillsChild() {
		return billsChild;
	}


	public void setBillsChild(List<BillsChild> billsChild) {
		this.billsChild = billsChild;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public int getUnitsFrom() {
		return unitsFrom;
	}


	public void setUnitsFrom(int unitsFrom) {
		this.unitsFrom = unitsFrom;
	}


	public int getUnitsTo() {
		return unitsTo;
	}


	public void setUnitsTo(int unitsTo) {
		this.unitsTo = unitsTo;
	}


	

	public float getPricePerUnit() {
		return pricePerUnit;
	}


	public void setPricePerUnit(float pricePerUnit) {
		this.pricePerUnit = pricePerUnit;
	}


	public int getSlabno() {
		return slabno;
	}


	public void setSlabno(int slabno) {
		this.slabno = slabno;
	}


	public BillingConstraints getBillCons() {
		return billCons;
	}


	public void setBillCons(BillingConstraints billCons) {
		this.billCons = billCons;
	}
	
	

	
}
