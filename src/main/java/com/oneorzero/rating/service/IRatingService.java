package com.oneorzero.rating.service;

public interface IRatingService {
	boolean newRating(Integer member_id, Integer store_id, Integer rating);
}
