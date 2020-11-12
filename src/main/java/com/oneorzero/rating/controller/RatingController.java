package com.oneorzero.rating.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.oneorzero.rating.service.IRatingService;

@Controller
public class RatingController {
	
	@Autowired
	IRatingService service;
	
	@PostMapping("/addRating.do")
	public @ResponseBody Map<String, String> newRating(@RequestBody String jsonStr) {
		Map<String, String> map = new HashMap<String, String>();
		JsonObject object = new Gson().fromJson(jsonStr, JsonObject.class);
		Integer store_id = object.get("store_id").getAsInt();
		Integer member_id = object.get("member_id").getAsInt();
		Integer rating = object.get("rating").getAsInt();
		if (service.newRating(member_id, store_id, rating)) {
			map.put("isOk", "ok");
		} else {
			map.put("isOk", "fail");
		}
		return map;
	}
}
