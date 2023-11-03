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
public class Businfo  implements Serializable {
    private int id;
    private String name;
    private int price;
    private String phone;
    private int quantity;
    private String description;
    private String status;
    private Timestamp created_on;
    private int schedule_id;
    private String departure_location;
    private String arrival_location;
    private Timestamp take_time;
    private Timestamp pickup_time;
}
