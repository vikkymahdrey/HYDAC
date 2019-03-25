package com.team.app.service;

import java.util.List;

import com.team.app.domain.TblDeviceFeedback;
import com.team.app.domain.TblDeviceFeedbackType;
import com.team.app.domain.TblDeviceFeedbackStatus;
import com.team.app.exception.AtAppException;

public interface DeviceInfo {

	List<TblDeviceFeedbackType> getDeviceFeedbackType() throws AtAppException;
	List<TblDeviceFeedback> getDeviceFeedback(String DevEUI) throws AtAppException;
	List<TblDeviceFeedback> getDeviceFeedback() throws AtAppException;
	List<TblDeviceFeedbackStatus> getDeviceFeedbackStatus(String id) throws AtAppException;
	TblDeviceFeedback setDeviceFeedback(TblDeviceFeedback f)throws AtAppException;
	TblDeviceFeedback getDeviceFeedbackid(String id)throws AtAppException;
	TblDeviceFeedbackType getDeviceFeedbackCmplType(String typeId)throws AtAppException;
	TblDeviceFeedback getDeviceFeedbackissueid(String ticket) throws AtAppException;
	TblDeviceFeedback getDeviceFeedbackByDevEUI(String devEUI)throws AtAppException;
	

}
