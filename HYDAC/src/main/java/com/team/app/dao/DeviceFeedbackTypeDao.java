package com.team.app.dao;

import java.io.Serializable;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import com.team.app.domain.TblDeviceFeedbackType;


public interface DeviceFeedbackTypeDao extends JpaRepository<TblDeviceFeedbackType, Serializable> {

	@Query("From TblDeviceFeedbackType")
	List<TblDeviceFeedbackType> getDeviceFeedbackType();
	@Query("From TblDeviceFeedbackType where id=:typeId")
	TblDeviceFeedbackType getDeviceFeedbackCmplType(@Param("typeId") String typeId);



}
