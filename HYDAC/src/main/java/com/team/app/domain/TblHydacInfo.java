package com.team.app.domain;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the tbl_hydac_info database table.
 * 
 */
@Entity
@Table(name="tbl_hydac_info")
@NamedQuery(name="TblHydacInfo.findAll", query="SELECT t FROM TblHydacInfo t")
public class TblHydacInfo implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private String id;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="created_dt")
	private Date createdDt;

	private String CSName;

	private String date;

	private float drive;

	private float iso14;

	private float iso4;

	private float iso6;

	private float max;

	@Column(name="NAS15_25")
	private float nas1525;

	@Column(name="NAS2_5")
	private float nas2_5;
	
	@Column(name="NAS25")
	private float nas25;

	@Column(name="NAS5_15")
	private float nas515;

	private float sat;

	private String serialNumber;

	private float temp;

	private String time;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="updated_dt")
	private Date updatedDt;

	private String version;

	public TblHydacInfo() {
	}

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Date getCreatedDt() {
		return this.createdDt;
	}

	public void setCreatedDt(Date createdDt) {
		this.createdDt = createdDt;
	}

	public String getCSName() {
		return this.CSName;
	}

	public void setCSName(String CSName) {
		this.CSName = CSName;
	}

	public String getDate() {
		return this.date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public float getDrive() {
		return this.drive;
	}

	public void setDrive(float drive) {
		this.drive = drive;
	}

	public float getIso14() {
		return this.iso14;
	}

	public void setIso14(float iso14) {
		this.iso14 = iso14;
	}

	public float getIso4() {
		return this.iso4;
	}

	public void setIso4(float iso4) {
		this.iso4 = iso4;
	}

	public float getIso6() {
		return this.iso6;
	}

	public void setIso6(float iso6) {
		this.iso6 = iso6;
	}

	public float getMax() {
		return this.max;
	}

	public void setMax(float max) {
		this.max = max;
	}

	public float getNas1525() {
		return this.nas1525;
	}

	public void setNas1525(float nas1525) {
		this.nas1525 = nas1525;
	}

	

	public float getNas2_5() {
		return nas2_5;
	}

	public void setNas2_5(float nas2_5) {
		this.nas2_5 = nas2_5;
	}

	public float getNas25() {
		return nas25;
	}

	public void setNas25(float nas25) {
		this.nas25 = nas25;
	}

	public float getNas515() {
		return this.nas515;
	}

	public void setNas515(float nas515) {
		this.nas515 = nas515;
	}

	public float getSat() {
		return this.sat;
	}

	public void setSat(float sat) {
		this.sat = sat;
	}

	public String getSerialNumber() {
		return this.serialNumber;
	}

	public void setSerialNumber(String serialNumber) {
		this.serialNumber = serialNumber;
	}

	public float getTemp() {
		return this.temp;
	}

	public void setTemp(float temp) {
		this.temp = temp;
	}

	public String getTime() {
		return this.time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public Date getUpdatedDt() {
		return this.updatedDt;
	}

	public void setUpdatedDt(Date updatedDt) {
		this.updatedDt = updatedDt;
	}

	public String getVersion() {
		return this.version;
	}

	public void setVersion(String version) {
		this.version = version;
	}

}