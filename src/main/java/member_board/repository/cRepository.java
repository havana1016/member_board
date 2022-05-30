package member_board.repository;

import member_board.dto.cDto;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class cRepository {
    @Autowired
    SqlSessionTemplate sql;
    public int save(cDto com) {
        return sql.insert("com.save",com);
    }

    public List<cDto> findall() {
        return sql.selectList("com.findall");
    }

    public int delc(cDto del) {

        System.out.println("cRepository.delc");
        System.out.println("del : "+del);
        int result= sql.delete("com.delc",del);
        System.out.println(result);
        return result;
    }

    public List<cDto> findid(cDto com) {
        return sql.selectList("com.findid",com);
    }
}
