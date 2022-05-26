package member_board.controller;

import member_board.dto.mDto;
import member_board.service.mService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;

@Controller
@RequestMapping("member")
public class mController {
    @Autowired
    mService ms;

    @GetMapping("/save-form")
    String saveform(){
        return "member/save-form";
    }

    @GetMapping("/save")
    void save(@ModelAttribute mDto mem) throws IOException {
        System.out.println("mController.save");
        System.out.println(mem);
        if(ms.save(mem)>0){

        };
    }
    @GetMapping("findid")
    mDto findid(@RequestParam("mid")String mid){
        return ms.findid(mid);
    }

}
