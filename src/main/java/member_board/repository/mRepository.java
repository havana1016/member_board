package member_board.repository;

import member_board.dto.mDto;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class mRepository {
    @Autowired
    SqlSessionTemplate sql;
    public int save(mDto mem) {
        System.out.println("repository"+mem);
        return sql.insert("data.save",mem);
    }

    public mDto findid(String mid) {
        return sql.selectOne("data.findid",mid);
    }

    public int update(mDto mem) {
        System.out.println("mRepository.update");
        System.out.println("mem : "+ mem);
        return sql.update("data.update",mem);
    }

    public int delete(String mid) {
        return sql.delete("data.delete",mid);
    }

    public List<mDto> member() {
        return sql.selectList("data.member");
    }
}
