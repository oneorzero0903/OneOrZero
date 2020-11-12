package com.oneorzero.comment.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oneorzero.bean.CommentBean;
import com.oneorzero.comment.dao.ICommentDao;
import com.oneorzero.comment.service.ICommentService;
@Service
@Transactional
public class CommentService implements ICommentService {
	
	@Autowired
	ICommentDao dao;

	@Override
	public void newComment(String comment, Integer store_id, Integer member_id) {
		dao.newComment(comment, store_id, member_id);
	}

	@Override
	public List<CommentBean> getComment(Integer store_id) {
		return dao.getComment(store_id);
	}

}
