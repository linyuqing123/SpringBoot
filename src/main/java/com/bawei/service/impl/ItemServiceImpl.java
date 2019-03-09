package com.bawei.service.impl;

import com.bawei.bean.Item;
import com.bawei.bean.Items;
import com.bawei.mapper.ItemMapper;
import com.bawei.service.ItemService;
import com.bawei.util.PageUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ItemServiceImpl implements ItemService {
    @Autowired
    private ItemMapper itemMapper;
    @Override
    public int findCount(String mohu) {
        int i=itemMapper.findCount(mohu);
        return i;
    }

    @Override
    public List<Items> findItemList(PageUtils pageUtils) {
       List<Items> list= itemMapper.findItemList(pageUtils);
        return list;
    }

    @Override
    public Items findItemById(Items item) {
      Items item1=  itemMapper.findItemById(item);
        return item1;
    }

    @Override
    public void itemUpdate(Items items) {
        itemMapper.itemUpdate(items);
    }

    @Override
    public int saveItem(Items items) {
        int i=itemMapper.saveItem(items);
        return i;
    }

    @Override
    public int delBatch(String id) {
       int i= itemMapper.delBatch(id);
        return i;
    }
}
