package com.study.Ex13VMDB;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class HtmlController {
    private final ProductService productService;

    @GetMapping("/")
    public String indexShow(Model model){
        List<ProductEntity> list = productService.findAll();
        model.addAttribute("list",list);
        model.addAttribute("count",list.size());
        return "index";
    }

    @GetMapping("/addProduct")
    public String addProductShow(){
        return "addProduct";
    }

    @GetMapping("/editProduct/{id}")
    public String editProductShow(@PathVariable("id") Integer id, Model model){
        ProductEntity product = productService.findById(id);
        model.addAttribute("product", product);
        return "editProduct";
    }

    @PostMapping("/addProduct")
    public String addProduct(@ModelAttribute ProductEntity product){
        productService.insert(product);
        return "redirect:/";
    }

    @PostMapping("/editProduct")
    public String editProduct(@ModelAttribute ProductEntity product){
        productService.update(product);
        return "redirect:/";
    }
    @GetMapping("deleteProduct/{id}")
    public String deleteProduct(@PathVariable("id") Integer id){
        productService.delete(id);
        return "redirect:/";
    }





}
