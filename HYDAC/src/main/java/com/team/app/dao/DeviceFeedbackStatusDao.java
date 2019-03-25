package com.team.app.dao;

import java.io.Serializable;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.team.app.domain.TblDeviceFeedback;
import com.team.app.domain.TblDeviceFeedbackStatus;

public interface DeviceFeedbackStatusDao extends JpaRepository<TblDeviceFeedbackStatus, Serializable> {


}
