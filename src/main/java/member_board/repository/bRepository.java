package member_board.repository;

import member_board.dto.bDto;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class bRepository {
    @Autowired
    SqlSessionTemplate sql;
    public int save(bDto text) {
        return sql.insert("board.save",text);
    }
}
