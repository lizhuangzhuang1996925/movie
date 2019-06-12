package com.bw.mapper;

import java.util.List;
import java.util.Map;

public interface MovieMapper {

	List<Map> movielist(Map map);

	void sj(int mid);

	void xj(int mid);

	void del(String ids);

}
