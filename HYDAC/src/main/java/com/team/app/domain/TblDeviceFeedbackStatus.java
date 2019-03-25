package com.team.app.domain;

import java.io.Serializable;
import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;


/**
 * The persistent class for the tbl_device_feedback_status database table.
 * 
 */
@Entity
@Table(name="tbl_device_feedback_status")
@NamedQuery(name="TblDeviceFeedbackStatus.findAll", query="SELECT t FROM TblDeviceFeedbackStatus t")
public class TblDeviceFeedbackStatus implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private String id;

	private String comment;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="created_at")
	private Date createdAt;

	private String status;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="updated_at")
	private Date updatedAt;

	//bi-directional many-to-one association to TblDeviceFeedback
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="device_feedback_id")
	private TblDeviceFeedback tblDeviceFeedback;

	//bi-directional many-to-one association to TblUserInfo
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="assign_id")
	private TblUserInfo tblUserInfo;

	public TblDeviceFeedbackStatus() {
	}

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getComment() {
		return this.comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}
	@JsonFormat(pattern="dd-MM-yyyy HH:mm" , timezone="Asia/Kolkata")
	public Date getCreatedAt() {
		return this.createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	@JsonFormat(pattern="dd-MM-yyyy HH:mm" , timezone="Asia/Kolkata")
	public Date getUpdatedAt() {
		return this.updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

	public TblDeviceFeedback getTblDeviceFeedback() {
		return this.tblDeviceFeedback;
	}

	public void setTblDeviceFeedback(TblDeviceFeedback tblDeviceFeedback) {
		this.tblDeviceFeedback = tblDeviceFeedback;
	}

	public TblUserInfo getTblUserInfo() {
		return this.tblUserInfo;
	}

	public void setTblUserInfo(TblUserInfo tblUserInfo) {
		this.tblUserInfo = tblUserInfo;
	}

}