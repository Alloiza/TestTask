package bookmanager.service;


import bookmanager.dao.BookDao;
import bookmanager.model.Book;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
public class BookServiceImpl implements BookService {

    private BookDao bookDao;

    public void setBookDao(BookDao bookDao) {
        this.bookDao = bookDao;
    }

    @Transactional
    public void create(Book book) {
        bookDao.create(book);
    }

    @Transactional
    public void update(Book book) {
        bookDao.update(book);
    }

    @Transactional
    public void delete(int id) {
        bookDao.delete(id);
    }

    @Transactional
    public Book getBookById(int id) {
        return bookDao.getBookById(id);
    }

    @Transactional
    public List<Book> listBooks() {
        return bookDao.listBooks();
    }

    @Transactional
    public void makeRead(Book book) {
        book.setReadAlready(true);
        bookDao.update(book);
    }

    @Transactional
    public Book save(Book book) {
        book.setReadAlready(false);
        return bookDao.save(book);
    }

    @Transactional
    public Book getBookByName(String searchName) {
        return this.bookDao.getBookByName(searchName);
    }
}
