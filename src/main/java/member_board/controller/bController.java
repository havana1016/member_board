package member_board.controller;

import member_board.dto.bDto;
import member_board.dto.pDto;
import member_board.service.bService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("board")
public class bController {
    @Autowired
    bService bs;
    @GetMapping("/findall")
    String findall(@RequestParam(value="page", required=false, defaultValue="1") int page, Model model){

        List<bDto> boardList = bs.pagingList(page);
        pDto paging = bs.paging(page);
        model.addAttribute("boardList", boardList);
        model.addAttribute("paging", paging);
        return "board/main";
    }
    @GetMapping("text-form")
    String textform(){
        return "board/text-form";
    }
    @PostMapping("/save")
    String save(@ModelAttribute bDto text) throws IOException {
        if(bs.save(text)>0){
          return "redirect:findall";
        }return "/board/text-form";
    }
    @GetMapping ("detail")
    String detail(@ModelAttribute bDto mem,Model model){
        bs.hit(mem);
        model.addAttribute("mem",bs.findid(mem));
        return "board/detail";
    }

}
