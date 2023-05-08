package com.kbstar.dto;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Msg {
    private String sendid;
    private String receiveid;
    private String content1;
}
