package member_board.service;

import member_board.dto.bDto;
import member_board.dto.pDto;
import member_board.repository.bRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class bService {
    @Autowired
    bRepository br;
    public int save(bDto text) throws IOException {
        System.out.println("bService.save");

        String bfname=text.getBf().getOriginalFilename();
        bfname =System.currentTimeMillis()+"-"+bfname;//2.1
        text.setBfname(bfname);//3
        String savePath ="c:\\spring_img\\"+bfname;//4
        System.out.println("bService.save");
        System.out.println(text);
        if(!text.getBf().isEmpty()){
            text.getBf().transferTo(new File(savePath));
            //파일이 비어있지 않다면 그 파일을 세이브 패스 경로에 옮겨라(저장해라)
            //나를 호출한 대로 이 익셉션을 던지겠다(예외처리)
        }//5
        return br.save(text);
    }

    public List<bDto> findall() {
        return br.findall();
    }

    private static final int PAGE_LIMIT = 3;
    //한 페이지에 보여줄 글 갯수
    private static final int BLOCK_LIMIT = 3;
    //페이지 번호를 몇개씩 보여줄거냐

    /**
     *요청하는 페이지에 해당하는 글 목록을 DB에서 가져오는 역할
     */
    public List<bDto> pagingList(int page) {
        //1페이지 요청=>
        int pagingStart = (page-1) * PAGE_LIMIT;
        System.out.println("bService.pagingList");
        System.out.println("pagingStart: "+pagingStart);
        Map<String, Integer> pagingParam = new HashMap<>();
        pagingParam.put("start", pagingStart);
        pagingParam.put("limit", PAGE_LIMIT);
        System.out.println("bService.pagingList");
        System.out.println("pagingParam : "+pagingParam);
        List<bDto> pagingList = br.pagingList(pagingParam);
        return pagingList;
    }

    public pDto paging(int page) {
        int boardCount = br.boardCount();//글 갯수 조회
        System.out.println("bService.paging");
        System.out.println(boardCount);
        //필요한 전체 페이지 갯수
        //10, 3 10/3=3.333 =>4
        int maxPage = (int)(Math.ceil((double)boardCount / PAGE_LIMIT));
        //시작페이지를 정하는 역할
        //1,4,7,10
        int startPage = (((int)(Math.ceil((double)page / BLOCK_LIMIT))) - 1) * BLOCK_LIMIT + 1;
        //끌페이지 값 3.6.9.12
        int endPage = startPage + BLOCK_LIMIT - 1;
        if(endPage > maxPage)
            endPage = maxPage;
        pDto paging = new pDto();
        paging.setPage(page);
        paging.setStartPage(startPage);
        paging.setEndPage(endPage);
        paging.setMaxPage(maxPage);
        System.out.println("bService.paging");
        System.out.println("paging : "+paging);
        return paging;
    }


    public bDto findid(bDto mem) {
        return br.findid(mem);
    }

    public void hit(bDto mem) {
        br.hit(mem);
    }
}
