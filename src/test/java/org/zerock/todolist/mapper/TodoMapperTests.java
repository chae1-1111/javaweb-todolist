package org.zerock.todolist.mapper;

import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.zerock.todolist.domain.TodoVO;
import org.zerock.todolist.dto.PageRequestDTO;

import java.time.LocalDate;
import java.util.List;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/root-context.xml")
public class TodoMapperTests {

    @Autowired(required = false)
    private TodoMapper todoMapper;

    @Test
    public void testGetTime() {
        log.info(todoMapper.getTime());
    }

    @Test
    public void testInsert() {
        TodoVO todoVO = TodoVO.builder()
                .title("스프링 테스트")
                .dueDate(LocalDate.of(2023,1,12))
                .writer("user")
                .build();

        todoMapper.insert(todoVO);
    }

    @Test
    public void testSelectAll() {
        List<TodoVO> todoVOList = todoMapper.selectAll();

        todoVOList.forEach(todoVO -> log.info(todoVO));
    }

    @Test
    public void testSelectOne() {
        TodoVO todoVO = todoMapper.selectOne(1L);

        log.info(todoVO);
    }

    @Test
    public void testSelectSearch() {
        PageRequestDTO pageRequestDTO = PageRequestDTO.builder()
                .page(1)
                .size(10)
                .types(new String[]{"t","w"})
                .keyword("dummy")
                .from(LocalDate.of(2023,2,2))
                .to(LocalDate.of(2023,2,7))
                .build();

        log.info(pageRequestDTO);
//
//        List<TodoVO> voList = todoMapper.selectList(pageRequestDTO);
//
//        voList.forEach(vo -> log.info(vo));
//
//        log.info("count: " + todoMapper.getCount(pageRequestDTO));
    }
}
