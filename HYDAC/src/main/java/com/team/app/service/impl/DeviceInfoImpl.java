package com.team.app.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.app.dao.DeviceFeedbackDao;
import com.team.app.dao.DeviceFeedbackTypeDao;
import com.team.app.domain.TblDeviceFeedback;
import com.team.app.domain.TblDeviceFeedbackStatus;
import com.team.app.domain.TblDeviceFeedbackType;
import com.team.app.exception.AtAppException;
import com.team.app.logger.AtLogger;
import com.team.app.service.DeviceInfo;

@Service
public class DeviceInfoImpl implements DeviceInfo {

	private static final AtLogger logger = AtLogger.getLogger(DeviceInfoImpl.class);

	@Autowired
	private DeviceFeedbackTypeDao deviceFeedbackTypeDao;

	@Autowired
	private DeviceFeedbackDao deviceFeedbackDao;
	

	public List<TblDeviceFeedbackType> getDeviceFeedbackType() throws AtAppException {
		return deviceFeedbackTypeDao.getDeviceFeedbackType();
	}

	public List<TblDeviceFeedback> getDeviceFeedback(String DevEUI) throws AtAppException {
		// TODO Auto-generated method stub
		return deviceFeedbackDao.getDeviceFeedback(DevEUI);
	}

	public TblDeviceFeedback setDeviceFeedback(TblDeviceFeedback f) throws AtAppException {
		return deviceFeedbackDao.save(f);
	}

	
	public TblDeviceFeedbackType getDeviceFeedbackCmplType(String typeId) throws AtAppException {
		// TODO Auto-generated method stub
		return deviceFeedbackTypeDao.getDeviceFeedbackCmplType(typeId);
	}

	public List<TblDeviceFeedbackStatus> getDeviceFeedbackStatus(String id) throws AtAppException {
		// TODO Auto-generated method stub
		return deviceFeedbackDao.getDeviceFeedbackStatus(id);
	}

	
	public TblDeviceFeedback getDeviceFeedbackid(String id) throws AtAppException {
		// TODO Auto-generated method stub
		return deviceFeedbackDao.getDeviceFeedbackid(id);
	}

	
	public TblDeviceFeedback getDeviceFeedbackissueid(String ticket) throws AtAppException{
		// TODO Auto-generated method stub
		return deviceFeedbackDao.getDeviceFeedbackissueid(ticket);
	}

	@Override
	public TblDeviceFeedback getDeviceFeedbackByDevEUI(String devEUI) throws AtAppException {
		// TODO Auto-generated method stub
		return deviceFeedbackDao.getDeviceFeedbackByDevEUI(devEUI);
	}


	public List<TblDeviceFeedback> getDeviceFeedback() throws AtAppException {
		// TODO Auto-generated method stub
		return deviceFeedbackDao.getDeviceFeedback();
	}


}
