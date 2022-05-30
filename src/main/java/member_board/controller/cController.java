package member_board.controller;

import member_board.dto.bDto;
import member_board.dto.cDto;
import member_board.service.bService;
import member_board.service.cService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("comment")
public class cController {
@Autowired
cService cs;
@Autowired
bService bs;
    @GetMapping("save")
    String save(@ModelAttribute cDto com, @RequestParam("bid")Long bid, Model model){

        if(0<cs.save(com)){
            bDto mem =new bDto();
            mem.setBid(bid);
            model.addAttribute("mem",bs.findid(mem));
            model.addAttribute("clist",cs.findid(com));
          return "/board/detail";
        }return ("index");
        };
    @GetMapping ("delc")
    @ResponseBody String delc(@ModelAttribute cDto del){
        System.out.println("cController.delc");
        System.out.println("del : "+del);
        if(0<cs.delc(del)){
            return "sfd";
        };return null;
    }





}
