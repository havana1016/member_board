package member_board.controller;

import member_board.dto.mDto;
import member_board.service.mService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class mController {
    @Autowired
    mService ms;

    @GetMapping("/save-form")
    String saveform(){
        return "member/save-form";
    }
    @PostMapping("/save")
    void save(@ModelAttribute mDto mem){
        if(ms.save(mem)>0){

        };
    }
}
