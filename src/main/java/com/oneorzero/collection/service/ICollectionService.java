package com.oneorzero.collection.service;

import java.util.List;

import com.oneorzero.bean.PaymentBean;
import com.oneorzero.collection.model.GetPaymentDtlResponse;
import com.oneorzero.collection.model.RemarkUpdateRequest;

public interface ICollectionService {
	List<GetPaymentDtlResponse> getPaymentDtl(String id);
	boolean calculation();
	boolean demo();
	List<GetPaymentDtlResponse> emailList();
	void sendMail(GetPaymentDtlResponse getPaymentDtlResponse);
	List<GetPaymentDtlResponse> autodilerList();
	boolean autodilerRemarkUpdate(RemarkUpdateRequest remarkUpdateRequest);
	List<GetPaymentDtlResponse> depositList();
	List<PaymentBean> functIsDisabled(Integer store_id);  //判斷店家是否已欠款超過35天
}
