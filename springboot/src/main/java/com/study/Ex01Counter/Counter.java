package com.study.Ex01Counter;

import lombok.Data;
import org.springframework.stereotype.Component;

@Data
@Component
public class Counter {
    private int count;
}
