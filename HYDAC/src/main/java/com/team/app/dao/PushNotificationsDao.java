package com.team.app.dao;


import java.io.Serializable;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.team.app.domain.TblPushNotifications;




public interface PushNotificationsDao extends JpaRepository<TblPushNotifications, Serializable> {

	@Query("Select n from TblPushNotifications n")
	List<TblPushNotifications> getusertokenid();
	
	@Query("Select n from TblPushNotifications n where n.appId=:appId group by appId")
	TblPushNotifications gettokenidsByAppId(@Param("appId") String appid);
	
	@Query("Select n from TblPushNotifications n where n.appId=:appId group by n.userId")
	List<TblPushNotifications> getUseridsByAppId(@Param("appId") String appid);
	
	@Query("Select n from TblPushNotifications n where n.appId=:appId group by appId")
	TblPushNotifications getnotificationKeyByAppId(@Param("appId") String appid);	

	@Query("Select n from TblPushNotifications n where n.userId=:userId")
	TblPushNotifications getNotificationInfoByUserId(@Param("userId") String userId);

	@Query("Select n from TblPushNotifications n where n.userId=:userId")
	TblPushNotifications getTokenByUserId(@Param("userId") String userId);

	
}




