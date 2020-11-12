package com.oneorzero.comment.service;

import java.util.List;

import com.oneorzero.bean.CommentBean;

public interface ICommentService {
	void newComment(String comment, Integer store_id, Integer member_id);
	List<CommentBean> getComment(Integer store_id);
}
