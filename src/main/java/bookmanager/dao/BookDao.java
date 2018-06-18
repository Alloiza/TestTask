package bookmanager.dao;

import bookmanager.model.Book;

import java.util.List;

public interface BookDao {

    void create(Book book);

    void update(Book book);

    void delete(int id);

    Book getBookById(int id);

    List<Book> listBooks();

    Book save(Book book);

    Book getBookByName(String searchName);
}
