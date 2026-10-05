package com.smartagrirent.cultivation;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;

@SpringBootApplication
@EnableFeignClients
public class CultivationServiceApplication {

    public static void main(String[] args) {
        SpringApplication.run(CultivationServiceApplication.class, args);
    }
}
