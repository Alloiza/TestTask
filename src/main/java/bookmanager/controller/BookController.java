package bookmanager.controller;

import bookmanager.model.Book;
import bookmanager.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class BookController {

    private BookService bookService;
    private String sort = "books";

    @Autowired(required = true)
    @Qualifier(value = "bookService")
    public void setBookService(BookService bookService) {
        this.bookService = bookService;
    }

    @RequestMapping(value = "books", method = RequestMethod.GET)
    public String listBooks(@RequestParam(required = false) Integer page, Model model) {
        sort = "books";
        model.addAttribute("book", new Book());
        List<Book> books = this.bookService.listBooks();
        setPaging(page, model, books);

        return "books";
    }

    @RequestMapping(value = "/books/create", method = RequestMethod.POST)
    public String createBook(@ModelAttribute("book") Book book) {
        if (book.getId() == 0) {
            bookService.create(book);
        } else {
            bookService.update(book);
        }
        return "redirect:/books";
    }

    @RequestMapping("/delete/{id}")
    public String deleteBook(@PathVariable("id") int id) {
        bookService.delete(id);
        return "redirect:/books";
    }

    @RequestMapping("update/{id}")
    public String updateBook(@PathVariable("id") int id, Model model) {
        model.addAttribute("book", bookService.getBookById(id));
        return "update";
    }

    @RequestMapping("read/{id}")
    public String readBook(@PathVariable("id") int id, Model model) {
        model.addAttribute("book", bookService.getBookById(id));
        return "bookdata";
    }

    @RequestMapping("makeRead/{id}")
    public String makeRead(@PathVariable("id") int id){
        Book book = bookService.getBookById(id);
        bookService.makeRead(book);
        return "redirect:/books";
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String saveBook(@ModelAttribute("book") Book book){

        bookService.save(book);
        return "redirect:/books";
    }

    @RequestMapping(value = "/search")
    public String searchUser(@RequestParam("searchTitle") String searchTitle, Model model) {
        Book book = (Book) this.bookService.getBookByName(searchTitle);
        model.addAttribute("book", book);

        return "bookdata";
    }

    private void setPaging(Integer page, Model model, List<Book> books) {
        PagedListHolder<Book> pagedListHolder = new PagedListHolder<Book>(books);
        pagedListHolder.setPageSize(10);

        model.addAttribute("maxPages", pagedListHolder.getPageCount());

        model.addAttribute("currentsort", sort);

        if (page == null || page < 1 || page > pagedListHolder.getPageCount())
            page = 1;

        model.addAttribute("page", page);
        int currentPage = page;

        pagedListHolder.setPage(page - 1);
        model.addAttribute("listBooks", pagedListHolder.getPageList());
    }

}
