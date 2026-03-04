package com.study.Ex01Counter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Optional;

@Controller
public class HtmlController {

    @Autowired
    private Counter counter;

    @Autowired
    CountRepository countRepository;

    @GetMapping("/")
    public String index(Model model){

        List<CountEntity> list = countRepository.findAll();
        CountEntity countEntity = list.get(0);
        System.out.println(countEntity.getCount());
        model.addAttribute("count",countEntity.getCount());

        return  "index"; //index.html 파일로 응답함.
    }

    @GetMapping("/plus")
    public String plus(Model model){
        //counter.setCount(counter.getCount()+1);
        //model.addAttribute("count",counter.getCount());
        Optional<CountEntity> optional = countRepository.findById(1L);
        optional.ifPresent(countEntity -> {
            Long count = countEntity.getCount();
            System.out.println("count = " + count);

            countEntity.updateCount(count + 1);
            countRepository.save(countEntity);
        });
        return "redirect:/";
    }

    @GetMapping("/minus")
    public String minus(Model model){
        //counter.setCount(counter.getCount()-1);;
        //model.addAttribute("count", counter.getCount());
        Optional<CountEntity> optional = countRepository.findById(1L);
        optional.ifPresent(countEntity -> {
            Long count = countEntity.getCount();
            System.out.println("count = " + count);

            countEntity.updateCount(count -1);
            countRepository.save(countEntity);
        });
        return "redirect:/";
    }

    @GetMapping("/api/plus")
    @ResponseBody
    public String api_plus(){
        //counter.setCount( counter.getCount() + 1);
        //return String.valueOf(counter.getCount());
        Long result = 0L;
        CountEntity countEntity = countRepository.findById( 1L ).get();

        Long count = countEntity.getCount();
        System.out.println("count: "+count);

        countEntity.updateCount( count + 1L );
        countRepository.save( countEntity );

        return String.valueOf( count + 1L ); //"1"형식의 문자열로 응답함.
    }


    @GetMapping("/api/minus")
    @ResponseBody
    public String api_minus(){
        //counter.setCount( counter.getCount() - 1);
        //return String.valueOf(counter.getCount());
        Long result = 0L;
        CountEntity countEntity = countRepository.findById( 1L ).get();

        Long count = countEntity.getCount();
        System.out.println("count: "+count);

        countEntity.updateCount( count - 1L );
        countRepository.save( countEntity );

        return String.valueOf( count - 1L ); //"1"형식의 문자열로 응답함.

    }
}
