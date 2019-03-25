package com.team.app.dao;

import java.io.Serializable;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.team.app.domain.TblConsumptionsConfig;


public interface ConsumptionsLtrDao extends JpaRepository<TblConsumptionsConfig, Serializable> {

	@Query("Select c from TblConsumptionsConfig c where c.devEUI=:devEUI")
	TblConsumptionsConfig getConsumptionsConfigByDevId(@Param("devEUI")  String devEUI);
	
	@Query("Select c from TblConsumptionsConfig c where c.devEUI=:devEUI")
	TblConsumptionsConfig getdevidByDevId(@Param("devEUI")  String devEUI);

	
	@Modifying
	@Query(value="UPDATE tbl_consumptions_config c SET c.consumptionLtr=?1 WHERE c.devEUI=?2", nativeQuery = true)
	@Transactional
	void setUpdateppltr(@Param("consumptionLtr") String consumptionLtr, @Param("devEUI") String devEUI);
}
