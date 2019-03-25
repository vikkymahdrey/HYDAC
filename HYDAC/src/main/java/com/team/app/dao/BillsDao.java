package com.team.app.dao;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.team.app.domain.Bills;


public interface BillsDao extends JpaRepository<Bills, Serializable> {

	@Query("From Bills b where b.user.id=:userId order by b.id desc")
	List<Bills> getBillsForUser(@Param("userId") String userId);
	
	@Query("From Bills b where b.bill_from_time=:billfromtime and b.bill_to_time=:billtotime and b.orgid=:orgid ")
	List<Bills> getBillsForrange(@Param("billfromtime") Date billfromtime,@Param("billtotime") Date billtotime,@Param("orgid") String orgid);
	
	
	
	@Query("From Bills b where b.id=:billId")
	Bills getBillsById(@Param("billId") int billId);

	
	@Query("select b From Bills b where b.orgid=:orgid group by b.bill_from_time,b.bill_to_time")
	List<Bills> getgeneratedbillsDate(@Param("orgid") String orgid);

	
	@Query("From Bills b where b.orgid=:orgid order by b.id desc")
	List<Bills> getmaxBills(@Param("orgid") String orgid);


	@Modifying
	@Query(value="delete from BillsChild where bills_parent_id in(select id from bills where bill_from_time=?1 and bill_to_time=?2 and payment_status=?3)",nativeQuery = true)
	@Transactional
	void deleteBillschildPending(@Param("fromDate") Date fromDate, @Param("toDate") Date toDate,@Param("paymentstatus") String paymentstatus);
	
	
	@Modifying
	@Query(value="delete from bills where bill_from_time=?1 and bill_to_time=?2 and payment_status=?3",nativeQuery = true)
	@Transactional
	void deleteBillsPending(@Param("fromDate") Date fromDate, @Param("toDate") Date toDate,@Param("paymentstatus") String paymentstatus);
	
}
