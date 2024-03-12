package com.ssm.maven.core.entity;

import lombok.Data;

/**
 * @Author cccc
 * @Date 2024/02/27 15:35
 **/
@Data
public class Product {
   private String pid;
   private String pname;
   private String marketPrice;
   private String shopPrice;
   private String pimage;
   private String pdate;
   private String isHot;
   private String pdesc;
   private String pflag;
   private String cid;
   private String store;
}
