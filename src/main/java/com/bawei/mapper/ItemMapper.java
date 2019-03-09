package com.bawei.mapper;

import com.bawei.bean.Item;
import com.bawei.bean.Items;
import com.bawei.util.PageUtils;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ItemMapper {
    int findCount(@Param("mohu") String mohu);

    List<Items> findItemList(PageUtils pageUtils);

    Items findItemById(Items item);

    void itemUpdate(Items items);

    int saveItem(Items items);

    int delBatch(@Param("id") String id);
}
