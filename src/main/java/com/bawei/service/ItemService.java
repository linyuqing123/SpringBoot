package com.bawei.service;

import com.bawei.bean.Item;
import com.bawei.bean.Items;
import com.bawei.bean.User;
import com.bawei.util.PageUtils;

import java.util.List;

public interface ItemService {

    int findCount(String mohu);

    List<Items> findItemList(PageUtils pageUtils);

    Items findItemById(Items item);

    void itemUpdate(Items items);

    int saveItem(Items items);

    int delBatch(String id);

/*
    int login(User user);
*/
}
