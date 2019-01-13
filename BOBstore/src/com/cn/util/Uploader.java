package com.cn.util;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;


public class Uploader {

	public String upload(@RequestParam("picture") MultipartFile picture, HttpServletRequest request) {
		 
        //��ȡ�ļ��ڷ������Ĵ���λ��
        String path = request.getSession().getServletContext().getRealPath("/upload");
        File filePath = new File(path);
        System.out.println("�ļ��ı���·����" + path);
        if (!filePath.exists() && !filePath.isDirectory()) {
            System.out.println("Ŀ¼�����ڣ�����Ŀ¼:" + filePath);
            filePath.mkdir();
        }
 
        //��ȡԭʼ�ļ�����(������ʽ)
        String originalFileName = picture.getOriginalFilename();
        System.out.println("ԭʼ�ļ����ƣ�" + originalFileName);
 
        //��ȡ�ļ����ͣ������һ��`.`Ϊ��ʶ
        String type = originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
        System.out.println("�ļ����ͣ�" + type);
        //��ȡ�ļ����ƣ���������ʽ��
        String name = originalFileName.substring(0, originalFileName.lastIndexOf("."));
 
        //�����ļ�������: ��ǰʱ��+�ļ����ƣ���������ʽ��
        Date d = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        String date = sdf.format(d);
        String fileName = date + name + "." + type;
        System.out.println("���ļ����ƣ�" + fileName);
 
        //��ָ��·���´���һ���ļ�
        File targetFile = new File(path, fileName);
 
        //���ļ����浽������ָ��λ��
        try {
            picture.transferTo(targetFile);
            System.out.println("�ϴ��ɹ�");
            //���ļ��ڷ������Ĵ洢·������
            return (path +"/"+ fileName);
        } catch (IOException e) {
            System.out.println("�ϴ�ʧ��");
            e.printStackTrace();
            return ("�ϴ�ʧ��");
        }
    }
	
}
