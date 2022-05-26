package member_board.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

@Data @AllArgsConstructor @NoArgsConstructor
public class mDto {
    Long id;
    String mid;
    String mpw;
    String mname;
    String memail;
    String mphone;
    String mdate;
    MultipartFile bf;
    String fname;
}
