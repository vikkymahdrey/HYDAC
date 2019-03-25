package com.team.app.dao;

import java.io.Serializable;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.team.app.domain.TblHydacInfo;

public interface HydacDao extends JpaRepository<TblHydacInfo, Serializable> {

	@Query("Select f from TblHydacInfo f")
	List<TblHydacInfo> getHydacDevices();

	@Query(value="Select f.* from tbl_hydac_info f order by f.id desc limit 10",nativeQuery=true)
	List<TblHydacInfo> getHydacInfo();

	@Query(value="Select f.* from tbl_hydac_info f order by f.id desc",nativeQuery=true)
	List<TblHydacInfo> getHydacInfos();

}
