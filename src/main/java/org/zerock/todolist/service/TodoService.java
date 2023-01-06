package org.zerock.todolist.service;

import org.zerock.todolist.dto.PageRequestDTO;
import org.zerock.todolist.dto.PageResponseDTO;
import org.zerock.todolist.dto.TodoDTO;

import java.util.List;

public interface TodoService {

    void register(TodoDTO todoDTO);

//    List<TodoDTO> getAll();

    PageResponseDTO<TodoDTO> getList(PageRequestDTO pageRequestDTO);

    int getCount();

    TodoDTO getOne(Long tno);

    void updateOne(TodoDTO todoDTO);

    void deleteOne(Long tno);
}
