package com.bbs.service;

import java.util.List;

import com.bbs.dao.BbsDao;
import com.vo.BbsVo;

//자유게시판
public class BbsServiceImpl implements BbsService{

	private BbsDao bbsDao = new BbsDao();
	
	@Override
	public void bbsWriteAction(BbsVo bbsVo) {
		bbsDao.bbsWriteAction(bbsVo);
	}

	@Override
	public List<BbsVo> list() {
		List<BbsVo> list = bbsDao.bbsList();
		return list;
	}

	@Override
	public BbsVo bbsView(int sn) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void bbsUpdate(BbsVo bbsVo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void bbsDelete(int sn) {
		// TODO Auto-generated method stub
		
	}

	
	
}
