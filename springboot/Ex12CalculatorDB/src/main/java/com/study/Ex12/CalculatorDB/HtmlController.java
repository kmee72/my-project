package com.study.Ex12.CalculatorDB;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequiredArgsConstructor
public class HtmlController {
    @Autowired
    private final HistoryRepository historyRepository;
    @GetMapping("/")
    public String index(){
        return "index";
    }
    @GetMapping("/calc-submit")
    public String calcSubmit(@RequestParam Integer num1,
                             @RequestParam Integer num2,
                             @RequestParam String calType,
                             Model model){

        int result = 0;
        if (calType.equals("add")) {
            result = num1 + num2;
        } else if (calType.equals("sub")) {
            result = num1 - num2;
        } else if (calType.equals("mul")) {
            result = num1 * num2;
        } else if (calType.equals("div")) {
            result = (num2 != 0) ? num1 / num2 : 0;
        }

        System.out.println("num1 = " + num1 + ", num2 = " + num2 + ", calType = " + calType);

        model.addAttribute("num1",num1 );
        model.addAttribute("num2",num2 );
        model.addAttribute("result",result );

        HistoryEntity historyEntity = HistoryEntity.builder()
                .input1(num1)
                .input2(num2)
                .result(result)
                .op(calType)
                .build();
        historyRepository.save(historyEntity);
        return "index";
    };
}
