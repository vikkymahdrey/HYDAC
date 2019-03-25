package com.team.app.dao;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.team.app.domain.BillingConstraints;

public interface BillingConstraintsDao extends JpaRepository<BillingConstraints, Serializable> {

	@Query("Select bc from BillingConstraints bc where bc.effectiveDate >=:effectiveDate and bc.waterSourceId.id=:wsid")
	List<BillingConstraints> getBillingConsForDateAndAbove(@Param("effectiveDate") Date effectiveDate,@Param("wsid") int wsid);
	
	@Query("Select bc from BillingConstraints bc where bc.effectiveDate =:effectiveDate and bc.waterSourceId.id=:wsid")
	List<BillingConstraints> getBillingIdForWaterSourceAndEffective(@Param("effectiveDate") Date effectiveDate,@Param("wsid") int wsid);

	
	
	
}
