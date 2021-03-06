package member_board.repository;

import member_board.dto.bDto;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class bRepository {
    @Autowired
    SqlSessionTemplate sql;
    public int save(bDto text) {
        return sql.insert("board.save",text);
    }

    public List<bDto> findall() {
        return sql.selectList("board.findall");
    }

    public int boardCount() {
        return sql.selectOne("board.count");
    }

    public List<bDto> pagingList(Map<String, Integer> pagingParam) {
//        return sql.selectList("board.pagingList", pagingParam);
        List<bDto> re=sql.selectList("board.pagingList", pagingParam);
        System.out.println("bRepository.pagingList");
        System.out.println("re: "+re);
        return re;
    }

    public bDto findid(bDto mem) {
        return sql.selectOne("board.findid",mem);
    }


    public void hit(bDto mem) {
        sql.update("board.hit",mem);
    }

    public List<bDto> search(Map<String, String> slist) {
//        return sql.selectList("board.search",slist);
        List<bDto> list= sql.selectList("board.search",slist);
        System.out.println("bRepository.search");
        System.out.println(list);
        return list;
    }

    public int update(bDto up) {
        return sql.update("board.update",up);
    }

    public int delete(bDto del) {
        return sql.delete("board.delete",del);
    }
}
