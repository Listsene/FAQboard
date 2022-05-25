package net.aird.FAQboard.dao;
 
import java.util.List;
 
/**
 * Defines basic DAO operations.
 *
 */
public interface IDao<T> {
    
    int LIST_MAX_RESULTS = 10;

	// updates object, creates if object doesn't already exist 
    public void update(T object);
     
    public void delete(int id);
     
    public List<T> list();
    
    public T get(int id);
    
}