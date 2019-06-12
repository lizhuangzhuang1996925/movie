package com.bw.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bw.service.MyService;
import com.bw.utils.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

/** 
 * @ClassName: MyController 
 * @Description: TODO
 * @author: lenovo
 * @date: 2019年6月11日 上午9:02:22  
 */
@Controller
public class MyController {
	@Autowired
	private MyService ms;
	/** 
	 * @Title: list 
	 * @Description: TODO
	 * @param tpx
	 * @param m
	 * @param nname
	 * @param mname
	 * @param pageNum
	 * @param mautor
	 * @param mindate
	 * @param maxdate
	 * @param mintime
	 * @param maxtime
	 * @param minprice
	 * @param maxprice
	 * @return
	 * @return: String
	 */
	@RequestMapping("list")
	public String list(@RequestParam(defaultValue="0")String tpx,Model m,@RequestParam(defaultValue="")String nname,@RequestParam(defaultValue="")String mname,@RequestParam(defaultValue="1")int pageNum,@RequestParam(defaultValue="")String mautor,@RequestParam(defaultValue="")String mindate,@RequestParam(defaultValue="")String maxdate,@RequestParam(defaultValue="")String mintime,@RequestParam(defaultValue="")String maxtime,@RequestParam(defaultValue="")String minprice,@RequestParam(defaultValue="")String maxprice) {
		Map map=new HashMap();
		System.out.println(mindate+"000000000000000000000000000000000000000000");
		map.put("maxprice", maxprice);
		map.put("tpx", tpx);
		map.put("mname", mname);
		map.put("mautor", mautor);
		map.put("minprice", minprice);
		map.put("mindate", mindate);
		map.put("maxdate", maxdate);
		map.put("nname", nname);
		map.put("mintime", mintime);
		map.put("maxtime",maxtime);
		PageHelper.startPage(pageNum, 4);
		List<Map> list=ms.list(map);
		PageInfo pg=new PageInfo(list);
		Page.fenye(m, pg, "");
		m.addAttribute("map", map);
		m.addAttribute("list", list);
		return "list";
	}
	@RequestMapping("sj")
	@ResponseBody
	public Object sj(int mid) {
		ms.sj(mid);
		return true;
	}
	@RequestMapping("xj")
	@ResponseBody
	public Object xj(int mid) {
		ms.xj(mid);
		return true;
	}
	@RequestMapping("del")
	@ResponseBody
	public Object del(String ids) {
		ms.del(ids);
		return true;
		
	}
}
