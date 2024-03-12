package com.ssm.maven.core.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

/**
 * @Author cccc
 * @Date 2024/03/10 15:32
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Order {
    private int orderId;
    private int uid;
    private int pid;
    private int count;
    private double totlePrice;
}
