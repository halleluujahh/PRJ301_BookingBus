/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bookingbus.entity;

import java.io.Serializable;
import java.sql.Timestamp;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 *
 * @author LENOVO
 */
@Builder
@Data
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class Bookinginfo  implements Serializable {
    private int id;
    private int account_id;
    private int bus_id;
    private Timestamp created_on;
    private int quantity;
    private int total_price;
    private String status;
    private String username;
    private String email;
    private String phone;
    private String name;
    private int price;
    private String departure_location;
    private String arrival_location;
    private Timestamp take_time;
    private Timestamp pickup_time;
}
