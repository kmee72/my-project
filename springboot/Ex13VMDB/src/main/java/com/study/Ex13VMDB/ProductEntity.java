package com.study.Ex13VMDB;

import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDate;

@Entity
@Table(name = "product")
@Getter
@Setter
@NoArgsConstructor
@Builder
@AllArgsConstructor
public class ProductEntity {
    @Id
    @GeneratedValue (strategy = GenerationType.IDENTITY)
    @Column(name = "product_no")
    private Integer productNo;
    @Column(name = "product_name")
    private String productName;
    @Column(name = "product_price")
    private Integer productPrice;
    @Column(name = "product_limit_date")
    private LocalDate productLimitDate;
}
