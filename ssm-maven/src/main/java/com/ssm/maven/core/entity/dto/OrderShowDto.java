package com.ssm.maven.core.entity.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

/**
 * @Author cccc
 * @Date 2024/03/11 10:53
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class OrderShowDto {
   private int orderId;
   private String pimage;
   private String pname;
   private String shopPrice;
   private int count;
   private double totlePrice;

}
