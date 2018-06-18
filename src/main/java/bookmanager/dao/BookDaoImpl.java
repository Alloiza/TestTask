package bookmanager.dao;

import bookmanager.model.Book;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import java.util.List;

@Repository
public class BookDaoImpl implements BookDao {

    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public void create(Book book) {
        Session session = sessionFactory.getCurrentSession();
        session.persist(book);
    }

    public void update(Book book) {
        Session session = sessionFactory.getCurrentSession();
        session.update(book);
    }

    public void delete(int id) {
        Session session = sessionFactory.getCurrentSession();
        Book book = (Book) session.load(Book.class, new Integer(id));

        if (book != null) {
            session.delete(book);
        }
    }

    public Book getBookById(int id) {
        Session session = sessionFactory.getCurrentSession();
        Book book = (Book) session.get(Book.class, new Integer(id));
        return book;
    }

    @SuppressWarnings("unchecked")
    public List<Book> listBooks() {

        Session session = sessionFactory.getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Book> criteria = builder.createQuery(Book.class);
        Root<Book> root = criteria.from(Book.class);
        criteria.select(root);

        List<Book> bookList = session.createQuery(criteria).getResultList();
        return bookList;
    }


    public Book save(Book book) {
        Session session = sessionFactory.getCurrentSession();
        if (book.getId() == 0) {
            session.persist(book);
            return book;
        } else {
            return (Book) session.merge(book);
        }
    }

    @SuppressWarnings("unchecked")
    public Book getBookByName(String searchTitle) {
        Session session = this.sessionFactory.getCurrentSession();
        List<Book> bookList = session.createQuery("from Book where title =:title")
                .setParameter("title", searchTitle)
                .list();
        if (bookList.size() == 0) bookList.add(new Book());

        return bookList.get(0);
    }
}
