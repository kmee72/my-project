package com.study.Ex13VMDBB;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class HtmlController {

    private final ProductRepository productRepository;

    @GetMapping("/")
    public String index(Model model) {
        List<ProductEntity> list = productRepository.findAll();
        model.addAttribute("list", list);
        model.addAttribute("count", list.size());
        return "index";
    }

    @GetMapping("/addProduct")
    public String addProductForm() {
        return "addProduct";
    }

    @PostMapping("/addProduct")
    public String addProduct(@ModelAttribute ProductEntity product) {
        productRepository.save(product);
        return "redirect:/";
    }

    @GetMapping("/editProduct/{id}")
    public String editProductForm(@PathVariable Long id, Model model) {
        ProductEntity product = productRepository.findById(id).orElseThrow();
        model.addAttribute("product", product);
        return "editProduct";
    }

    @PostMapping("/editProduct")
    public String editProduct(@ModelAttribute ProductEntity product) {
        productRepository.save(product);
        return "redirect:/";
    }

    @GetMapping("/deleteProduct/{id}")
    public String deleteProduct(@PathVariable Long id) {
        productRepository.deleteById(id);
        return "redirect:/";
    }
}