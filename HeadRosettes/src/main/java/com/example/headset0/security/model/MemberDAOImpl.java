package com.example.headset0.security.model;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	


	@Override
	public int insert(Map<String, Object> map) {
		return sqlSession.insert("member.insert",map);
	}

	@Override
	public Map<String, Object> detail(String m_id) {
		return sqlSession.selectOne("member.detail", m_id);
	}
	
	@Override
	public int idCheck(String m_id) { 
			return sqlSession.selectOne("member.idCheck", m_id); 
			}
	
	
     @Override	
     public void unregister(String m_id) {
    	 sqlSession.update("member.unregister", m_id);
     }
		
     @Override 
     public void update(Map<String, Object> map) {
	     sqlSession.update("member.info_update", map); }
		 
}
