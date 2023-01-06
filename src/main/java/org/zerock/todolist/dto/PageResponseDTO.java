package org.zerock.todolist.dto;

import lombok.Builder;
import lombok.Getter;
import lombok.ToString;

import java.util.List;

@Getter
@ToString
public class PageResponseDTO<E> {

    private int page;   // 현재 페이지
    private int size;   // 1페이지 당 개수
    private int total;  // 전체 개수

    private int start;  //시작 페이지 번호
    private int end;    //끝 페이지 번호

    private boolean prev;   // 이전 페이지 존재 여부
    private boolean next;   // 다음 페이지 존재 여부

    private List<E> dtoList;

    @Builder(builderMethodName = "withAll")
    public PageResponseDTO(PageRequestDTO pageRequestDTO, List<E> dtoList, int total) {

        this.page = pageRequestDTO.getPage();
        this.size = pageRequestDTO.getSize();

        this.total = total;
        this.dtoList = dtoList;

        int end = (int)(Math.ceil(this.page / 10.0)) * 10;
        this.start = end - 9;

        int last = (int)(Math.ceil(this.total / (double)this.size));

        this.end = end > last ? last : end;

        this.prev = this.page > 1;
        this.next = this.page < last;
    }
}
