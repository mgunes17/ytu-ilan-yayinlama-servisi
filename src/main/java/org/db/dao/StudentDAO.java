package org.db.dao;

import org.db.model.Student;

public interface StudentDAO {
	Student getStudent(String username);
	boolean saveStudent(Student s);
}
