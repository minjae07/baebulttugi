package kr.co.baebulttugi.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.baebulttugi.board.entity.board;

@Mapper
public interface BoardMapper {
	public List<board> getLists();
	
}
