package com.qdu.controller;

import com.qdu.pojo.Student;
import com.qdu.service.StudentService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/testAjax")
public class TestController {
    
    @Autowired
    private StudentService studentService;
    
    @RequestMapping(value="/testString",
            method = RequestMethod.POST,
            produces = "text/html;charset=utf-8") //MIME类型
    //produces属性指定方法生成的数据的类型和字符集
    @ResponseBody
    public String testString(String name){
        String msg="你好，"+name;
        return msg;  //这里的返回值表示返回给页面的一个字符串
        //但是正常情况下，springmvc会将该字符串理解为要跳转的页面的名称
        //所以在方法前面添加@ResponseBody注解，说明返回值作为响应正文内容返回
    }
    
    @RequestMapping(value="/testObject",method = RequestMethod.POST)
    @ResponseBody //返回的数据作为响应正文内容返回
    public Student testObject(String stuId){
        return studentService.getStudentById(stuId);
    }
    
    @RequestMapping(value="/testList")
    @ResponseBody //返回的数据作为响应正文内容返回
    public List testList(){
        return studentService.getStudentList();
    }
    
    @RequestMapping(value="/testDelete",method = RequestMethod.POST)
    @ResponseBody //保留该注解，否则spring mvc会跳转到testAjax文件夹下的testDelete.jsp
    public void testDelete(String stuId){
        studentService.delele(stuId);
    }
    
    @RequestMapping(value="/testForm",
            method = RequestMethod.POST,
            produces = "text/html;charset=utf-8")
    @ResponseBody //保留该注解，否则spring mvc会跳转到testAjax文件夹下的testDelete.jsp
    public String testForm(Student s){
        boolean flag=studentService.addStudent(s);
        if(flag)
            return "注册成功!谢谢注册!";
        else
            return "注册失败!学号必须是4位有效字符!";
    }
}
