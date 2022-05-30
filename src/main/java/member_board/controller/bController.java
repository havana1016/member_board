package member_board.controller;

import member_board.dto.bDto;
import member_board.dto.cDto;
import member_board.dto.pDto;
import member_board.service.bService;
import member_board.service.cService;
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
    @Autowired
    cService cs;
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
        cDto cd=new cDto();
        cd.setBid(mem.getBid());
        model.addAttribute("clist",cs.findid(cd));
        return "board/detail";
    }
    @GetMapping ("/search")
     String search(@RequestParam("search")String search,@RequestParam("type")String type,Model model){
        List<bDto> result=bs.search(search,type);
        model.addAttribute("blist",result);
        System.out.println("bController.search");
        System.out.println(result);
        return("board/resultlist");
    }
    @GetMapping("update")
    String update(@ModelAttribute bDto mem,Model model){
        model.addAttribute("mem",bs.findid(mem));
        return "board/update";

    }
    @PostMapping("update")
    String update1(@ModelAttribute bDto up,Model model){
        if(bs.update(up)>0){
            bDto result=bs.findid(up);
            model.addAttribute("mem",result);
            cDto cd=new cDto();
            cd.setBid(result.getBid());
            model.addAttribute("clist",cs.findid(cd));
            return "/board/detail";
        } return  "/index";
    }
    @GetMapping("delete")
    String del(@ModelAttribute bDto del,Model model){
        if(bs.delete(del)>0){

            return "redirect:/board/findall";
        }return "/index";
    }

}
