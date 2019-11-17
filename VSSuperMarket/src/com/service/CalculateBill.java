package com.service;

import com.dao.CalculateBillDAO;
import com.model.CustomerVO;

public class CalculateBill 
{

	public int calculateBill(CustomerVO lCustomerVO) {
		// TODO Auto-generated method stub
		CalculateBillDAO lCalculateBillDAO= new CalculateBillDAO();
		int total=lCalculateBillDAO.calculateBill(lCustomerVO);
		return total;
	}
	
	

}
