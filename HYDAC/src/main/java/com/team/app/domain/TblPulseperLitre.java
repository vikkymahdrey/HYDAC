package com.team.app.domain;
import java.io.Serializable;
import javax.persistence.*;



/**
 * The persistent class for the tbl_pulse_per_litre database table.
 * 
 */
@Entity
@Table(name="tbl_pulse_per_litre")
@NamedQuery(name="TblPulseperLitre.findAll", query="SELECT p FROM TblPulseperLitre p")	
public class TblPulseperLitre implements Serializable{

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private String id;
	
	@Column(name="pulse_per_ltr")
	private String pulsePerLtr;
	
	@Column(name="devEUI")
	private String devid;
	
	public String getDevid() {
		return devid;
	}

	public void setDevid(String devid) {
		this.devid = devid;
	}

	public TblPulseperLitre(){
		
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPulsePerLtr() {
		return pulsePerLtr;
	}

	public void setPulsePerLtr(String pulsePerLtr) {
		this.pulsePerLtr = pulsePerLtr;
	}

	
	
}
