package member_board.controller;

import member_board.dto.mDto;
import member_board.service.mService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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

    @PostMapping("/save")
    String save(@ModelAttribute mDto mem) throws IOException {
        System.out.println("mController.save");
        System.out.println(mem);
        if(ms.save(mem)>0){
            return "member/login";
        }return "index";
    }
    @GetMapping("/findid")
    @ResponseBody String findid(@RequestParam("mid")String mid){
        System.out.println("controller mid : "+mid);
        mDto mem=ms.findid(mid);
        System.out.println("cont mem : "+mem);
        if(mem==null){
            return "yes";
        }return "no";

        }
    @GetMapping("/login")
    String login(){
        return "member/login";
       }
       @PostMapping("/logc")
        @ResponseBody mDto logc(@RequestParam("mid")String mid,@RequestParam("mpw")String mpw, Model model){
           System.out.println("mController.logc");
           System.out.println("mid : "+mid);
           mDto result= ms.findid(mid);
           System.out.println("mController.logc");
           System.out.println("result : "+result);
           if(result.getMpw().equals(mpw)){
               return result;
           }
           return null;
           }

























}
