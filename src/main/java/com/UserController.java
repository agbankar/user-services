package com;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class UserController {
    @GetMapping("/getuser")
    public String getUser(){
        for (int i = 0; i < 10; i++) {
            System.out.println("this is test log " + i);
        }
        return "welcome test user";
    }
}
