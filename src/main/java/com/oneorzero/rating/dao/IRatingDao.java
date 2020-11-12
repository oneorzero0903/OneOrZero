package com.oneorzero.rating.dao;

public interface IRatingDao {
	
	boolean newRating(Integer member_id, Integer store_id, Integer rating);
}
