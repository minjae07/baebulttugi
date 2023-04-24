package kr.board.service;

import java.util.List;

import kr.board.entity.TblBoard;

public interface BoardService {
	public List<TblBoard> getList(TblBoard vo);
	public void register(TblBoard vo);
	public TblBoard get(Integer idx);
	public Integer count(Integer idx);
	public void modify(TblBoard vo);
	public void remove(int idx);
}
