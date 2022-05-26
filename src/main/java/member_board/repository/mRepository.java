package member_board.repository;

import member_board.dto.mDto;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class mRepository {
    @Autowired
    SqlSessionTemplate sql;
    public int save(mDto mem) {
        return sql.insert("data.save",mem);
    }
}
