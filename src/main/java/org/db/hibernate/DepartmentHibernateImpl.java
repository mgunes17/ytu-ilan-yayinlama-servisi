package org.db.hibernate;

import java.util.List;

import org.db.dao.DepartmentDAO;
import org.db.model.Department;

public class DepartmentHibernateImpl extends AbstractDAO implements DepartmentDAO {

	public List<Department> getAllDepartments() {
		List<Department> departments = getAllRows(Department.class);
		return departments;
	}

}
