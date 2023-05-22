package com.demo.servlet.mvc;

import java.util.ArrayList;
import java.util.List;

public class StudentDataUtil {

	public static List<Student> getStudents() {

		List<Student> students = new ArrayList<>();

		students.add(new Student("John", "Doe", "john@gmail.com"));
		students.add(new Student("Jack", "Wal", "jack@gmail.com"));
		students.add(new Student("Dorsey", "Wilmar", "dorsey@gmail.com"));

		return students;
	}
}
