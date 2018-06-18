package bookmanager.service;

import bookmanager.model.Book;

import java.util.List;

public interface BookService {

    public void create(Book book);

    public void update(Book book);

    public void delete(int id);

    public void makeRead(Book book);

    public Book getBookById(int id);

    public List<Book> listBooks();

    Book save(Book book);

    Book getBookByName(String searchName);
}
