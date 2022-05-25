package net.aird.FAQboard.dao;
 
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;
 
import net.aird.FAQboard.model.*;
 
import org.springframework.stereotype.Component; 
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;

@Component("questionDao")
public class QuestionDao implements IDao<Question> {
 
    private JdbcTemplate jdbcTemplate;
 
    public QuestionDao(DataSource dataSource) {
        jdbcTemplate = new JdbcTemplate(dataSource);
    }
 
    @Override
    public void update(Question question) {
        if (question.getId() > 0) {
	        // update
	        String sql = "UPDATE question SET type_id=?, title=?, content=?, author=?, "
	                    + "date=?, count=? WHERE question_id=?";
	        jdbcTemplate.update(sql, question.getType().getId(), question.getTitle(), question.getContent(),
	                question.getAuthor(), question.getDate(), question.getCount(), question.getId());
	    } else {
	        // insert
	        String sql = "INSERT INTO question (type_id, title, content, author, date, count)"
	                    + " VALUES (?, ?, ?, ?, ?, ?)";
	        jdbcTemplate.update(sql, question.getType().getId(), question.getTitle(), question.getContent(),
	                question.getAuthor(), question.getDate(), question.getCount());
	    }
    }
 
    @Override
    public void delete(int id) {
        String sql = "DELETE FROM question WHERE question_id=?";
    	jdbcTemplate.update(sql, id);
    }
 
    @Override
    public List<Question> list() {
        //String sql = "SELECT * FROM question order by question_id desc";
        String sql = "SELECT question_id, name, question.type_id, title, content, author, date, count from question "
        	+ "inner join type on question.type_id = type.type_id order by question_id desc";
	    List<Question> listQuestion = jdbcTemplate.query(sql, new RowMapper<Question>() {
	 
	        @Override
	        public Question mapRow(ResultSet rs, int rowNum) throws SQLException {
	            Question aQuestion = new Question();
	 
	            aQuestion.setId(rs.getInt("question_id"));
	            Type type = new Type();
	            type.setName(rs.getString("name"));
	            type.setId(rs.getInt("type_id"));
	            aQuestion.setType(type);
	            aQuestion.setTitle(rs.getString("title"));
	            
	            aQuestion.setContent(rs.getString("content"));
	            aQuestion.setAuthor(rs.getString("author"));
	            aQuestion.setDate(rs.getTimestamp("date"));
	            aQuestion.setCount(rs.getInt("count"));
	 
	            return aQuestion;
	        }
	 
	    });
	 
	    return listQuestion;
    }
    
    @Override
    public Question get(int questionId) {
        String sql = "SELECT question_id, name, question.type_id, title, content, author, date, count from question "
        	+ "inner join type on question.type_id = type.type_id WHERE question_id=" + questionId;
        return jdbcTemplate.query(sql, new ResultSetExtractor<Question>() {
     
            @Override
            public Question extractData(ResultSet rs) throws SQLException,
                    DataAccessException {
                if (rs.next()) {
                    Question question = new Question();
                    question.setId(rs.getInt("question_id"));
	            	Type type = new Type();
	            	type.setName(rs.getString("name"));
	            	type.setId(rs.getInt("type_id"));
	            	question.setType(type);
	            	question.setTitle(rs.getString("title"));
	            
	            	question.setContent(rs.getString("content"));
	            	question.setAuthor(rs.getString("author"));
	            	question.setDate(rs.getDate("date"));
	            	question.setCount(rs.getInt("count"));
                }
     
                return null;
            }
     
        });
    }
    
    public List<Question> search(String searchStr, int typeId, int listPage) {
    	listPage = listPage - 1;
    	long max = IDao.LIST_MAX_RESULTS;
    	long first = listPage * max;
    	String sql;
        if( typeId == 0 ) {
            sql = "SELECT question_id, name, question.type_id, title, content, author, date, count FROM question "
        	+ "INNER JOIN type ON question.type_id = type.type_id "
        	+ "WHERE title LIKE '%"+searchStr+"%' OR author LIKE '%"+searchStr+"%' "
        	+ "ORDER BY question_id DESC LIMIT " + first + ", " + max;
        } else {
            sql = "SELECT question_id, name, question.type_id, title, content, author, date, count FROM question "
        	+ "INNER JOIN type ON question.type_id = type.type_id "
        	+ "WHERE question.type_id = " + typeId + " AND "
        	+ "(title LIKE '%"+searchStr+"%' OR author LIKE '%"+searchStr+"%') "
        	+ "ORDER BY question_id DESC LIMIT " + first + ", " + max;
        }
        
        List<Question> listQuestion = jdbcTemplate.query(sql, new RowMapper<Question>() {
	 
	        @Override
	        public Question mapRow(ResultSet rs, int rowNum) throws SQLException {
	            Question aQuestion = new Question();
	 
	            aQuestion.setId(rs.getInt("question_id"));
	            Type type = new Type();
	            type.setName(rs.getString("name"));
	            type.setId(rs.getInt("type_id"));
	            aQuestion.setType(type);
	            aQuestion.setTitle(rs.getString("title"));
	            
	            aQuestion.setContent(rs.getString("content"));
	            aQuestion.setAuthor(rs.getString("author"));
	            aQuestion.setDate(rs.getTimestamp("date"));
	            aQuestion.setCount(rs.getInt("count"));
	 
	            return aQuestion;
	        }
	 
	    });
	 	
	 	
	    return listQuestion;
        
    }
    
    public Integer count(String searchStr, int typeId) {
    	String sql;
        if( typeId == 0 ) {
            sql = "SELECT COUNT(*) FROM question WHERE "
                    + "title LIKE '%"+searchStr+"%' "
                    + "OR author LIKE '%"+searchStr+"%'";
        } else {
            sql = "SELECT COUNT(*) FROM question WHERE "
            		+ "type_id = " + typeId + " AND "
                    + "title LIKE '%"+searchStr+"%' "
                    + "OR author LIKE '%"+searchStr+"%'";
        }
        return jdbcTemplate.queryForObject(sql, Integer.class); 
    }
 
}