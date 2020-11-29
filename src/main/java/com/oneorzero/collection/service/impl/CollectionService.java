package com.oneorzero.collection.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oneorzero.bean.PaymentBean;
import com.oneorzero.collection.dao.ICollectionDao;
import com.oneorzero.collection.model.GetPaymentDtlResponse;
import com.oneorzero.collection.model.RemarkUpdateRequest;
import com.oneorzero.collection.service.ICollectionService;

@Service
@Transactional
public class CollectionService implements ICollectionService{
	@Autowired
	ICollectionDao dao;
	
	@Override
	public List<GetPaymentDtlResponse> getPaymentDtl(String id) {
		return dao.getPaymentDtl(id);
	}

	@Override
	public boolean calculation() {
		return dao.calculation();
	}

	@Override
	public boolean demo() {
		return dao.demo();
	}

	@Override
	public List<GetPaymentDtlResponse> emailList() {
		return dao.emailList();
	}

	@Override
	public void sendMail(GetPaymentDtlResponse sendMail) {
		dao.sendMail(sendMail);
	}

	@Override
	public List<GetPaymentDtlResponse> autodilerList() {
		return dao.autodilerList();
	}

	@Override
	public boolean autodilerRemarkUpdate(RemarkUpdateRequest remarkUpdateRequest) {
		return dao.autodilerRemarkUpdate(remarkUpdateRequest);
	}

	@Override
	public List<GetPaymentDtlResponse> depositList() {
		return dao.depositList();
	}

	@Override
	public List<PaymentBean> functIsDisabled(Integer store_id) {
		return dao.functIsDisabled(store_id);
	}
}
