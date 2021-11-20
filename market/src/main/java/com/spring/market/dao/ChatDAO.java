package com.spring.market.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.market.vo.ChatVO;



@Repository
public class ChatDAO {
	@Inject
	SqlSession sqlSession;
	

}
