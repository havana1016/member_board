package member_board.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import org.springframework.web.multipart.MultipartFile;
@Data @AllArgsConstructor @NoArgsConstructor
public class bDto {
    Long bid;
    String btitle;
    String mid;
    String btext;
    int bhit;
    String bdate;
    MultipartFile bf;
    String bfname;
}
