package com.oneorzero.rating.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oneorzero.rating.dao.IRatingDao;
import com.oneorzero.rating.service.IRatingService;

@Service
@Transactional
public class RatingService implements IRatingService {

	@Autowired
	IRatingDao dao;
	
	@Override
	public boolean newRating(Integer member_id, Integer store_id, Integer rating) {
		return dao.newRating(member_id, store_id, rating);
	}

}
