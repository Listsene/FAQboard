package net.aird.FAQboard.dao;
 
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
 
import javax.sql.DataSource;
 
import net.aird.FAQboard.model.Type;

import org.springframework.stereotype.Component;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
 
@Component("typeDao")
public class TypeDao implements IDao<Type> {
 
    private JdbcTemplate jdbcTemplate;
 
    public TypeDao(DataSource dataSource) {
        jdbcTemplate = new JdbcTemplate(dataSource);
    }
 
    @Override
    public void update(Type type) {
        if (type.getId() > 0) {
	        // update
	        String sql = "UPDATE type SET name=?";
	        jdbcTemplate.update(sql, type.getName());
	    } else {
	        // insert
	        String sql = "INSERT INTO type (name)"
	                    + " VALUES (?)";
	        jdbcTemplate.update(sql, type.getName());
	    }
    }
 
    @Override
    public void delete(int id) {
        String sql = "DELETE FROM type WHERE type_id=?";
    	jdbcTemplate.update(sql, id);
    }
 
    @Override
    public List<Type> list() {
        String sql = "SELECT * FROM type";
	    List<Type> listType = jdbcTemplate.query(sql, new RowMapper<Type>() {
	        @Override
	        public Type mapRow(ResultSet rs, int rowNum) throws SQLException {
	            Type aType = new Type();
	 
	            aType.setId(rs.getInt("type_id"));
	            aType.setName(rs.getString("name"));
	 
	            return aType;
	        }
	 
	    });
	 
	    return listType;
    }
    
    @Override
    public Type get(int typeId) {
        String sql = "SELECT * FROM type WHERE type_id=" + typeId;
        return jdbcTemplate.query(sql, new ResultSetExtractor<Type>() {
     
            @Override
            public Type extractData(ResultSet rs) throws SQLException,
                    DataAccessException {
                if (rs.next()) {
                    Type type = new Type();
                    type.setId(rs.getInt("type_id"));
                    type.setName(rs.getString("name"));
                    return type;
                }
     
                return null;
            }
     
        });
    }
 
}