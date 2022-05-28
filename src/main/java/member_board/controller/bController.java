package member_board.controller;

import member_board.dto.bDto;
import member_board.service.bService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("board")
public class bController {
    @Autowired
    bService bs;
    @GetMapping("/findall")
    String findall(){
        return "board/main";
    }
    @GetMapping("text-form")
    String textform(){
        return "board/text-form";
    }
    @GetMapping("/save")
    String save(@ModelAttribute bDto text){
        if(bs.save(text)>0){
          return "redirect:/board/main";
        }return "/board/text-form";
    }

}
