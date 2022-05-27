package member_board.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

@AllArgsConstructor @NoArgsConstructor @Data
public class mDto {
    Long id;
    String mid;
    String mpw;
    String mname;
    String memail;
    String mphone;
    String mdate;
    MultipartFile mf;
    String mfname;
}
