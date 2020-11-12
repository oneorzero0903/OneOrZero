package com.oneorzero.comment.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.oneorzero.bean.CommentBean;
import com.oneorzero.comment.service.ICommentService;

@Controller
public class CommentController {

	@Autowired
	ICommentService service;
	
	@PostMapping("/addComment.do")
	public @ResponseBody Map<String, String> addComment(@RequestBody String jsonStr) {
		JsonObject object = new Gson().fromJson(jsonStr, JsonObject.class);
		String comment = object.get("content").getAsString();
		Integer store_id = object.get("store_id").getAsInt();
		Integer member_id = object.get("member_id").getAsInt();
		service.newComment(comment, store_id, member_id);
		Map<String, String> map = new HashMap<String, String>();
		map.put("success", "success");
		return map;
	}
	
	@PostMapping("/getComment.do")
	public @ResponseBody List<CommentBean> getComment(@RequestBody String jsonStr) {
		JsonObject object = new Gson().fromJson(jsonStr, JsonObject.class);
		Integer store_id = object.get("store_id").getAsInt();
		return service.getComment(store_id);
	}
}
