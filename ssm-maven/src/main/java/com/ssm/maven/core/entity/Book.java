package com.ssm.maven.core.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.List;
@Data
public class Book implements Serializable {
    private String id;
    private String isbn;
    private String path;
    private String title;
    private String subtitle;
    private String originalTitle;
    private String marketPrice;
    private String intro;
    private String binding;
    private String pages;
    private String author;
    private String publisher;
    private String catalog;
    private int supply;
    private String status;
    private int hot;

}
