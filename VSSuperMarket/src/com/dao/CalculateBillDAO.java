package com.dao;

import com.model.CustomerVO;

public class CalculateBillDAO {

	public int calculateBill(CustomerVO lCustomerVO) {
		// TODO Auto-generated method stub
		
		int total=0;
		total= lCustomerVO.getItem1()*10+lCustomerVO.getItem2()*20+lCustomerVO.getItem3()*40+lCustomerVO.getItem4()*50;
		return total;
	}

}
