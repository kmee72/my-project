package com.study.Ex13VMDB;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
@RequiredArgsConstructor
public class ProductService {
    private final ProductRepository productRepository;
    public List<ProductEntity> findAll(){
        return productRepository.findAll();
    }
    public  ProductEntity findById(Integer id){
        return productRepository.findById(id).orElse(null);
    }
    public void insert(ProductEntity productEntity){
        productRepository.save(productEntity);
    }
    public void update(ProductEntity product){
        productRepository.save(product);
    }
    public void delete(Integer id){
        productRepository.deleteById(id);
    }
    }



