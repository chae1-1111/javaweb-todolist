package org.zerock.todolist.mapper;

import org.zerock.todolist.domain.TodoVO;
import org.zerock.todolist.dto.PageRequestDTO;

import java.util.List;

public interface TodoMapper {

    // for Test
    String getTime();

    void insert(TodoVO todoVO);

    List<TodoVO> selectAll();

    List<TodoVO> selectList(PageRequestDTO pageRequestDTO);

    int getCount();

    TodoVO selectOne(Long tno);

    void updateOne(TodoVO todoVO);

    void deleteOne(Long tno);
}
