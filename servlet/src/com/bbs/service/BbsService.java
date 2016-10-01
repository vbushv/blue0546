package com.bbs.service;

import java.util.List;

import com.vo.BbsVo;

public interface BbsService {

	public void bbsWriteAction(BbsVo bbsVo);// 입력해줌
	
	public List<BbsVo> list(); //list 가져와줌
	
	public BbsVo bbsView(int sn); // 이건 뷰페이지 리스트에서 뭘 눌렀을때 1개만 보여주는거 제목,내용,아디 등등 보여주는거
	
	public void bbsUpdate(BbsVo bbsVo);
	
	public void bbsDelete(int sn);
	
}
