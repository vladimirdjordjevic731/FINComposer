package com.fincomposer.catalog;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class PingController {

    record PingResponse(String service, String status, String version) {
    }

    @GetMapping("/api/ping")
    public PingResponse ping() {
        return new PingResponse("catalog-service", "UP", "0.0.1");

    }
}