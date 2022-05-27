package member_board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("board")
public class bController {
    @GetMapping("/findall")
    String findall(){
        return "board/main";
    }


}
