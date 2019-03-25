package com.team.app.dao;

import java.io.Serializable;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.team.app.domain.TblUserInfo;
import com.team.app.domain.WaterSources;
import com.team.app.domain.BillingConstraints;

public interface WaterSourceDao extends JpaRepository<WaterSources, Serializable> {

	@Query("Select ws From WaterSources ws where ws.orgid=:orgid")
	List<WaterSources> getwaterSourceForappAndOrg(@Param("orgid") int orgid);
	

	@Query("Select distinct ws From WaterSources ws, BillingConstraints bc where ws.orgid=:orgid and bc.waterSourceId=ws.id ")
	List<WaterSources> getwaterSourceForappandOrg(@Param("orgid") int orgid);
	
	@Query("Select ws From WaterSources ws where ws.id=:id")
	WaterSources getwaterSourceForId(@Param("id") int id);
	
	@Query("Select ws From WaterSources ws where ws.waterSouce=:waterSouce")
	WaterSources getwsnameByWSname(@Param("waterSouce")  String watersource);

		
	@Modifying
	@Query(value="UPDATE water_sources ws SET ws.water_source=?1 WHERE ws.id=?2", nativeQuery = true)
	@Transactional
	void UpdateWaterSources( @Param("water_source") String watersource, @Param("id") int id);
}
