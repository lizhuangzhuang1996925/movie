package com.bw.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bw.mapper.MovieMapper;

@Service
public class ImpService implements MyService{
	@Autowired
	private MovieMapper mm;

	public List<Map> list(Map map) {
		// TODO Auto-generated method stub
		return mm.movielist(map);
	}

	public void sj(int mid) {
		mm.sj(mid);
		
	}

	public void xj(int mid) {
		// TODO Auto-generated method stub
		mm.xj(mid);
	}

	public void del(String ids) {
		// TODO Auto-generated method stub
		mm.del(ids);
	}
}
