
package com.qdu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
    
    @RequestMapping({"/index","/"})
    public String index(){
        return "index";
    }
    
    @RequestMapping("/redirect/{pageName}")
    public String toTest(@PathVariable String pageName){
        return pageName;
    }
}
