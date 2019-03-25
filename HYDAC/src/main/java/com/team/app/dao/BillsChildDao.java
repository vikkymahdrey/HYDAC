package com.team.app.dao;

import java.io.Serializable;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.team.app.domain.Bills;
import com.team.app.domain.BillsChild;

public interface BillsChildDao extends JpaRepository<BillsChild, Serializable>{

	@Query("From BillsChild b where b.bills.id=:billId")
	List<BillsChild> getBillsById(@Param("billId") int billId);
	
}
