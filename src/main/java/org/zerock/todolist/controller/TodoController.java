package org.zerock.todolist.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.todolist.dto.PageRequestDTO;
import org.zerock.todolist.dto.PageResponseDTO;
import org.zerock.todolist.dto.TodoDTO;
import org.zerock.todolist.service.TodoService;

import javax.validation.Valid;

@Log4j2
@Controller
@RequestMapping("/todo")
@RequiredArgsConstructor
public class TodoController {

    private final TodoService todoService;

    @RequestMapping("/list")
    public void list(@Valid PageRequestDTO pageRequestDTO, BindingResult bindingResult, Model model) {
        log.info("/todo/list");
        log.info(pageRequestDTO);

        if(bindingResult.hasErrors()) {
            pageRequestDTO = PageRequestDTO.builder().build();
        }

        model.addAttribute("responseDTO", todoService.getList(pageRequestDTO));
    }

    @GetMapping("/register")
    public void registerGet() {
        log.info("GET /todo/register");
    }

    @PostMapping("/register")
    public String registerPost(@Valid TodoDTO todoDTO, BindingResult bindingResult, RedirectAttributes redirectAttributes) {
        log.info("POST /todo/register");

        if(bindingResult.hasErrors()){
            log.info("has errors");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            return "redirect:/todo/register";
        }

        log.info(todoDTO);

        todoService.register(todoDTO);

        return "redirect:/todo/list";
    }

    @GetMapping({"/read", "/modify"})
    public void readGet(Long tno, Model model) {
        log.info("GET /todo/read");

        TodoDTO todoDTO = todoService.getOne(tno);
        log.info(todoDTO);

        model.addAttribute("dto",todoDTO);
    }

    @PostMapping("/modify")
    public String modifyPost(@Valid TodoDTO todoDTO, BindingResult bindingResult, RedirectAttributes redirectAttributes) {
        log.info("POST /todo/modify");

        if(bindingResult.hasErrors()){
            log.info("has errors");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            return "redirect:/todo/modify?tno=" + todoDTO.getTno();
        }

        todoService.updateOne(todoDTO);

        return "redirect:/todo/read?tno=" + todoDTO.getTno();
    }

    @PostMapping("/remove")
    public String removePost(Long tno, Model model) {
        log.info("POST /todo/remove");

        todoService.deleteOne(tno);

        return "redirect:/todo/list";
    }

}
