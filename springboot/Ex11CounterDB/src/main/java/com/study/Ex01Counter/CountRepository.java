package com.study.Ex01Counter;

import org.springframework.data.jpa.repository.JpaRepository;

public interface CountRepository extends JpaRepository<CountEntity, Long> {
}
