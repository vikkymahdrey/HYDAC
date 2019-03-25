package com.team.app.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fasterxml.jackson.annotation.JsonFormat;


/**
 * The persistent class for the tbl_device_feedback database table.
 * 
 */
@Entity
@Table(name="tbl_device_feedback")
@NamedQuery(name="TblDeviceFeedback.findAll", query="SELECT t FROM TblDeviceFeedback t")
public class TblDeviceFeedback implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private String id;
	
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="created_at")
	@JsonFormat(pattern="dd-MM-yyyy HH:mm")
	private Date createdAt;

	private String devEUI;
	
	@Column(name="ticketId")
	private String ticketId;

	public String getTicketId() {
		return ticketId;
	}

	public void setTicketId(String ticketId) {
		this.ticketId = ticketId;
	}

	private String nodeName;

	private String phoneDeviceVersion;

	private String phoneType;

	private String status;

	private String textarea;

	private String type;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="updated_at")
	@JsonFormat(pattern="dd-MM-yyyy HH:mm" , timezone="Asia/Kolkata")
	private Date updatedAt;

	//bi-directional many-to-one association to TblUserInfo
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="userId")
	private TblUserInfo tblUserInfo;
	
	//bi-directional many-to-one association to TblDeviceFeedbackStatus
	@OneToMany(mappedBy="tblDeviceFeedback")
	private List<TblDeviceFeedbackStatus> tblDeviceFeedbackStatuses;

	public TblDeviceFeedback() {
	}

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}
	@JsonFormat(pattern="dd-MM-yyyy HH:mm" , timezone="Asia/Kolkata")
	public Date getCreatedAt() {
		return this.createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public String getDevEUI() {
		return this.devEUI;
	}

	public void setDevEUI(String devEUI) {
		this.devEUI = devEUI;
	}

	public String getNodeName() {
		return this.nodeName;
	}

	public void setNodeName(String nodeName) {
		this.nodeName = nodeName;
	}

	public String getPhoneDeviceVersion() {
		return this.phoneDeviceVersion;
	}

	public void setPhoneDeviceVersion(String phoneDeviceVersion) {
		this.phoneDeviceVersion = phoneDeviceVersion;
	}

	public String getPhoneType() {
		return this.phoneType;
	}

	public void setPhoneType(String phoneType) {
		this.phoneType = phoneType;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getTextarea() {
		return this.textarea;
	}

	public void setTextarea(String textarea) {
		this.textarea = textarea;
	}

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Date getUpdatedAt() {
		return this.updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

	public TblUserInfo getTblUserInfo() {
		return this.tblUserInfo;
	}

	public void setTblUserInfo(TblUserInfo tblUserInfo) {
		this.tblUserInfo = tblUserInfo;
	}
	
	public List<TblDeviceFeedbackStatus> getTblDeviceFeedbackStatuses() {
		return this.tblDeviceFeedbackStatuses;
	}

	public void setTblDeviceFeedbackStatuses(List<TblDeviceFeedbackStatus> tblDeviceFeedbackStatuses) {
		this.tblDeviceFeedbackStatuses = tblDeviceFeedbackStatuses;
	}

	public TblDeviceFeedbackStatus addTblDeviceFeedbackStatus(TblDeviceFeedbackStatus tblDeviceFeedbackStatus) {
		getTblDeviceFeedbackStatuses().add(tblDeviceFeedbackStatus);
		tblDeviceFeedbackStatus.setTblDeviceFeedback(this);

		return tblDeviceFeedbackStatus;
	}

	public TblDeviceFeedbackStatus removeTblDeviceFeedbackStatus(TblDeviceFeedbackStatus tblDeviceFeedbackStatus) {
		getTblDeviceFeedbackStatuses().remove(tblDeviceFeedbackStatus);
		tblDeviceFeedbackStatus.setTblDeviceFeedback(null);

		return tblDeviceFeedbackStatus;
	}

}