package com.qdu.service;

import com.qdu.pojo.Student;
import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Service;

@Service
public class StudentService {

    private static List<Student> studentList;

    static {

        studentList = new ArrayList();
        studentList.add(new Student("S001", "张三", "男"));
        studentList.add(new Student("S002", "李思", "女"));
        studentList.add(new Student("S003", "赵武", "男"));
        studentList.add(new Student("S004", "王燕", "女"));
    }

    public Student getStudentById(String stuId) {

        Student s = null;
        for (int i = 0; i < studentList.size(); i++) {
            if (studentList.get(i).getStuId().equals(stuId)) {
                s = studentList.get(i);
            }
        }
        return s;
    }

    public List getStudentList() {
        return studentList;
    }

    public boolean addStudent(Student newStudent) {
        if (newStudent.getStuId().length() != 4) {
            return false;
        } else {
            studentList.add(newStudent);
            return true;
        }
    }
    
    public void delele(String stuId){
        studentList.remove(getStudentById(stuId));
    }
}
