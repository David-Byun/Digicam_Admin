package com.kbstar.mapper;

import com.kbstar.dto.Cart;
import com.kbstar.frame.KBMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface CartMapper extends KBMapper<String, Cart> {
    Cart getMyCart(String id) throws Exception;
}
