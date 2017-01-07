package org.db.hibernate;

import org.db.dao.InterestsDAO;
import org.db.model.Interests;

import java.util.List;

/**
 * Created by mgunes on 07.01.2017.
 */
public class InterestsHibernateImpl extends AbstractDAO implements InterestsDAO {

    public List<Interests> getMyInterests(String username) {
        String query = "SELECT * FROM interests WHERE student = '" + username + "';";
        return getRowsBySQLQuery(Interests.class, query);
    }

    public List<Interests> getInterestsByQuery(String query) {
        return getRowsBySQLQuery(Interests.class, query);
    }

    public boolean saveInterests(Interests interests) {
        return save(interests);
    }

    public boolean deleteInterestsById(int id) {
        return deleteByQuery(Interests.class, "Interests", "id", id);
    }
}
