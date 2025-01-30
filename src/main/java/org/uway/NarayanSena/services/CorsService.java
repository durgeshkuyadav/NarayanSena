package org.uway.NarayanSena.services;

import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class CorsService {
    public List<String> getAllowedOrigins() {
        // Fetch from a database or environment variable
        return List.of(
                "http://localhost:8090",
                "http://172.16.2.81:8000",
                "http://localhost:63342"
        );
    }
}
