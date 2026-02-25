package com.study.Ex04Autowired;

import org.springframework.stereotype.Component;

@Component("samsungCard") //빈의 이름을 직접 지정
public class SamsungCard implements ICard{
    @Override
    public void buy(String itemName) {
        System.out.println("SamsungCard.buy");
        System.out.println("itemName = " + itemName);
    }
}
