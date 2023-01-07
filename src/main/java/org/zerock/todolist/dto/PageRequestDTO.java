package org.zerock.todolist.dto;

import lombok.*;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.Positive;
import java.net.URLEncoder;
import java.time.LocalDate;
import java.util.Arrays;

@Builder
@Data
@AllArgsConstructor
@NoArgsConstructor
public class PageRequestDTO {

    @Builder.Default
    @Min(value=1)
    @Positive
    private int page = 1;

    @Builder.Default
    @Min(value=10)
    @Max(value=100)
    @Positive
    private int size = 10;

    private String link;

    private String[] types;
    private String keyword;

    private boolean finished;
    private LocalDate from;
    private LocalDate to;

    public int getSkip() {
        return (page-1) * size;
    }

    public String getLink() {
        if(link == null) {
            StringBuilder builder = new StringBuilder();
            builder.append("page="+this.page);
            builder.append(this.size == 10 ? "" : "&size="+this.size);

            if(this.finished) builder.append("&finished=on");

            if(this.types != null && types.length > 0) {
                for(int i=0; i<types.length; i++){
                    builder.append("&types="+types[i]);
                }
            }

            if(this.keyword != null) {
                try {
                    builder.append("&keyword=" + URLEncoder.encode(keyword, "UTF-8"));
                }catch (Exception e) {
                    e.printStackTrace();
                }
            }

            if(this.from != null) builder.append("&from=" + this.from.toString());
            if(this.to != null) builder.append("&to=" + this.to.toString());

            link = builder.toString();
        }
        return link;
    }

    public boolean checkType(String type) {
        if(types == null || this.types.length == 0) return false;

        return Arrays.stream(this.types).anyMatch(type::equals);
    }
}
