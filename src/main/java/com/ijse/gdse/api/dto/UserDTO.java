package com.ijse.gdse.api.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class UserDTO {
    private int id;
    private String name;
    private String password;
    private String role;  // 🔄 Renamed from 'job'
    private String email;

    // Constructor without ID
    public UserDTO(String name, String password, String email, String role) {
        this.name = name;
        this.password = password;
        this.email = email;
        this.role = role;
    }

    // For login use-case
    public UserDTO(String name, String password) {
        this.name = name;
        this.password = password;
    }

    // If needed: constructor without role (not recommended if role is required)
    public UserDTO(String name, String password, String email) {
        this.name = name;
        this.password = password;
        this.email = email;
    }
}
