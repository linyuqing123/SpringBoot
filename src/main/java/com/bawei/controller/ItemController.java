package com.bawei.controller;

import com.bawei.bean.Item;
import com.bawei.bean.Items;
import com.bawei.bean.User;
import com.bawei.service.ItemService;
import com.bawei.util.FileDownLoad;
import com.bawei.util.PageUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
public class ItemController {
    @Autowired
    private ItemService itemService;

    @RequestMapping("itemList")
    public String itemList(HttpServletRequest request, HttpServletResponse response,Integer cpage, String mohu){
        int count=itemService.findCount(mohu);
        PageUtils pageUtils = new PageUtils(cpage, count, mohu, "itemList.action");
       List<Items> list= itemService.findItemList(pageUtils);
       request.setAttribute("list",list);
       request.setAttribute("pageUtils",pageUtils);
        return "ItemList";
    }

    @RequestMapping("findItemById")
    public String findItemById(Items item, HttpServletResponse response, HttpServletRequest request){
       Items item1= itemService.findItemById(item);
       request.setAttribute("item",item1);
        System.out.println(item1);
       return "update";
    }

    @RequestMapping("itemUpdate")
    public String itemUpdate(Items items, MultipartFile file, HttpServletRequest request, Date createtime) throws IOException {
        if (file.getSize()!=0){
            String realPath = request.getSession().getServletContext().getRealPath("");
            String picName = UUID.randomUUID().toString();
            String originalFilename = file.getOriginalFilename();
            String extName = originalFilename.substring(originalFilename.lastIndexOf("."));
            file.transferTo(new File("D:/img/"+picName+extName));
            items.setPic(picName+extName);
        }
        itemService.itemUpdate(items);
        return "forward:/itemList.action";
    }

    @RequestMapping("down")
    public void down(Item item,HttpServletRequest request,HttpServletResponse response) throws Exception {
        FileDownLoad.download(item.getPic(),request,response);
    }

    @RequestMapping("saveItem")
    public String saveItem(Items items,MultipartFile file,HttpServletRequest request,HttpServletResponse response) throws IOException {
        UUID fileName = UUID.randomUUID();
        String originalFilename = file.getOriginalFilename();
        String extName = originalFilename.substring(originalFilename.lastIndexOf("."));
        String fileRealName=fileName+extName;
        file.transferTo(new File("D:/img",fileRealName));
        items.setPic(fileRealName);
        int i=itemService.saveItem(items);
        if (i>0){
            response.getWriter().println("<script>alert('添加用户成功；；；')</script>");
        }
        return "redirect:/itemList.action";
    }

    @RequestMapping("delBatch")
    @ResponseBody
    public int delBatch(String id){
       int i= itemService.delBatch(id);
        System.out.println(i);
       return  i;
    }

    /*@RequestMapping("login")
    @ResponseBody
    public int login(User user,HttpServletRequest request,HttpServletResponse response){
        int i=itemService.login(user);
        if (i==1){
            request.getSession().setAttribute("user",user);
        }
        return i;
    }*/







}
