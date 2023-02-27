package com.example.headset0.security.model;

import java.util.Map;

public interface MemberDAO {
	int insert(Map<String,Object> map);
	Map<String, Object>detail(String m_id);
	int idCheck(String m_id);
	void unregister(String m_id);
	void update(Map<String, Object> map);

}
