package com.board.FO4Board.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.board.FO4Board.vo.PageVO;

public interface BoardMapper {
	public List<Map<String, Object>> selectBoardList(PageVO pageVO);
	
	
	public int insertBoard(@Param("member_idx") int member_idx, @Param("title") String title, @Param("content") String content);
	public Map selectBoardDetail(int board_idx);
	public int deleteBoard(int board_idx);
	public int updateBoard(@Param("title") String title,@Param("content") String content,@Param("board_idx") int board_idx);
	public int updateViewcnt(int board_idx);
	public List<Map> selectBoardList_ten();
	public Map selectHeart(@Param("board_idx") int board_idx,@Param("member_idx") int member_idx);
	public int insertHeart(@Param("board_idx") int board_idx,@Param("member_idx") int member_idx);
	public int cancelHeart(@Param("board_idx") int board_idx,@Param("member_idx") int member_idx);
	public int boardAddHeart(int board_idx);
	public int boardCancelHeart(int board_idx);
	public List<Map> selectPopular();
	public Integer countBoardList();
}
