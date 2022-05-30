package member_board.service;

import member_board.dto.cDto;
import member_board.repository.cRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class cService {
    @Autowired
    cRepository cr;
    public int save(cDto com) {
        return cr.save(com);
    }
   public List<cDto> findall(){
        return cr.findall();
    }

    public int delc(cDto del) {
        return cr.delc(del);
    }
    public List<cDto> findid(cDto com){
        return cr.findid(com);
    }
}
