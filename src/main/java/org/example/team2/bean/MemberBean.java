package org.example.team2.bean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MemberBean {
    private String id;
    private String password;
    private String name;
    private char gender;
    private String email;
    private String birth;
    private String zipcode;
    private String address;
    private String hobby;
    private String job;
}
