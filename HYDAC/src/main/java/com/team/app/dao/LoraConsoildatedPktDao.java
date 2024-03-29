package com.team.app.dao;

import java.io.Serializable;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.team.app.domain.TblLoraConsoildatedPkt;

public interface LoraConsoildatedPktDao extends JpaRepository<TblLoraConsoildatedPkt, Serializable> {

	@Query(value="SELECT * FROM tbl_lora_consoildated_pkt f where f.applicationId=?1 and f.devEUI=?2 and f.status='D' order by f.id desc limit 1",nativeQuery=true)
	TblLoraConsoildatedPkt getLastClosedConsoildatedPkt(@Param("appId") String appId,@Param("devEUI") String devEUI);

	@Query("Select f from TblLoraConsoildatedPkt f order by id desc")
	List<TblLoraConsoildatedPkt> getConsoildatedFrames();
	
	@Query("Select f from TblLoraConsoildatedPkt f where f.applicationId=:appId and f.devEUI=:devEUI and f.devMapId=:devMapId and f.status='A'")
	TblLoraConsoildatedPkt validateLoraConsoildatedPkt(@Param("appId") String appId,@Param("devEUI") String devEUI,@Param("devMapId") String devMapId);

	@Query("Select f from TblLoraConsoildatedPkt f where f.applicationId=:appId group by f.devEUI")
	List<TblLoraConsoildatedPkt> getConsoildatedDevInfoByAppId( @Param("appId") String appId);

	@Modifying
	@Query(value="delete from tbl_lora_consoildated_pkt where applicationId=?1 and devEUI=?2",nativeQuery = true)
	@Transactional
	void deleteConsoildatedInfo(@Param("appId") String appId, @Param("devEUI") String devEUI);

}
