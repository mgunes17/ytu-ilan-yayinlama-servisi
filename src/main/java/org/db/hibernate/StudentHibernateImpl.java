package org.db.hibernate;

import org.db.dao.StudentDAO;
import org.db.model.Student;

public class StudentHibernateImpl extends AbstractDAO implements StudentDAO {

	public boolean saveStudent(Student student) {
		return save(student);
	}
}