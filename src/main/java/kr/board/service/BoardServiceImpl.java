package kr.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.board.entity.Board;
import kr.board.entity.TblBoard;
import kr.board.mapper.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	BoardMapper boardMapper;

	@Override
	public List<TblBoard> getList(TblBoard vo) {
		List<TblBoard> list=boardMapper.getList(vo);
		return list;
	}

	@Override
	public void register(TblBoard vo) {
		boardMapper.insertSelectKey(vo);
		
	}

	@Override
	public TblBoard get(Integer idx) {
		TblBoard vo = boardMapper.read(idx);
		return vo;
	}

	@Override
	public Integer count(Integer idx) {
		Integer count = boardMapper.count(idx);
		return count;
	}

	@Override
	public void modify(TblBoard vo) {
		boardMapper.update(vo);
	}

	@Override
	public void remove(int idx) {
		boardMapper.delete(idx);
	}
	

}
