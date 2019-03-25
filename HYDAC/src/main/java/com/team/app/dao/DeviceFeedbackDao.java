package com.team.app.dao;

import java.io.Serializable;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.team.app.domain.TblDeviceFeedback;
import com.team.app.domain.TblDeviceFeedbackStatus;

public interface DeviceFeedbackDao extends JpaRepository<TblDeviceFeedback, Serializable> {
	@Query("From TblDeviceFeedback")
	List<TblDeviceFeedback> getDeviceFeedback();
	
	@Query("From TblDeviceFeedback where DevEUI=:DevEUI  ORDER  BY id")
	List<TblDeviceFeedback> getDeviceFeedback(@Param("DevEUI") String DevEUI);

	@Query("From TblDeviceFeedbackStatus where device_feedback_id=:id")
	List<TblDeviceFeedbackStatus> getDeviceFeedbackStatus(@Param("id") String id);
	@Query("From TblDeviceFeedback where id=:id")
	TblDeviceFeedback getDeviceFeedbackid(@Param("id") String id);
	
	@Query("From TblDeviceFeedback where ticketId=:ticket")
	TblDeviceFeedback getDeviceFeedbackissueid(@Param("ticket") String ticket);
	@Query("From TblDeviceFeedback where devEUI=:devEUI  ORDER  BY id")
	TblDeviceFeedback getDeviceFeedbackByDevEUI(@Param("devEUI") String devEUI);


}
