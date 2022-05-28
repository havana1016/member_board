package member_board.service;

import member_board.dto.bDto;
import member_board.repository.bRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class bService {
    @Autowired
    bRepository br;
    public int save(bDto text) {
        return br.save(text);
    }
}
