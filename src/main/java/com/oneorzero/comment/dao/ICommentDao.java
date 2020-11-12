package com.oneorzero.comment.dao;

import java.util.List;

import com.oneorzero.bean.CommentBean;

public interface ICommentDao {
	void newComment(String comment, Integer store_id, Integer member_id);
	List<CommentBean> getComment(Integer store_id);
}
