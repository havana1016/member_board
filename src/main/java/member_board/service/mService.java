package member_board.service;

import member_board.dto.mDto;
import member_board.repository.mRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class mService {
    @Autowired
    mRepository mr;


    public int save(mDto mem) {
        return mr.save(mem);
    }
}
