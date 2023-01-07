package org.zerock.todolist.mapper;

import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.zerock.todolist.domain.TodoVO;
import org.zerock.todolist.dto.PageRequestDTO;
import org.zerock.todolist.dto.TodoDTO;
import org.zerock.todolist.service.TodoService;

import java.time.LocalDate;
import java.util.List;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/root-context.xml")
public class TodoServiceTests {

    @Autowired
    private TodoService todoService;

    @Test
    public void testRegister() {
        TodoDTO todoDTO = TodoDTO.builder()
                .title("TodoService test....")
                .dueDate(LocalDate.now())
                .writer("chae1-1111")
                .build();

        todoService.register(todoDTO);
    }

    @Test
    public void testSelectAll() {
    }


}
