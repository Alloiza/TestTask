
Use test;

DROP TABLE IF EXISTS book;

CREATE TABLE book (
  id INT(11) NOT NULL AUTO_INCREMENT,
  title VARCHAR(100) NOT NULL,
  description VARCHAR(255) NULL DEFAULT NULL,
  author VARCHAR(100) NOT NULL,
  isbn VARCHAR(20) NOT NULL,
  printYear INT(11) NOT NULL,
  readAlready BIT(1) NOT NULL DEFAULT 0,

  PRIMARY KEY (id))
  ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8;

INSERT INTO book (title, description, author, isbn, printYear)
VALUES ('Ten Little Niggers', '', 'Agatha Christie', '978-0006117278', 1980),
  ('And Then There Were None', '', 'Agatha Christie', '978-0062073488', 2011),
  ('Dead Wrong', '', 'Leighann Dobbs', 'B00CMHMB6A', 2013),
  ('Murder on the Orient Express: A Hercule Poirot Mystery', '', 'Agatha Christie', '978-0062693662', 2017),
  ('Say You\'re Sorry', '', 'Melinda Leigh', '1503948706', 2017),
  ('Bones Don\'t Lie', '', 'Melinda Leigh', '1542049865', 2018),
  ('Harry Potter and the Sorcerer\'s Stone', '', 'J.K. Rowling', '978-0439708180', 1999),
  ('Harry Potter and the Chamber of Secrets', '', 'J.K. Rowling', '978-0545791328', 2016),
  ('Harry Potter and the Prisoner of Azkaban', '', 'J.K. Rowling', '978-0545791342', 2017),
  ('Harry Potter And The Goblet Of Fire', '', 'J.K. Rowling', '978-0439139601', 2002),
  ('Harry Potter And The Order Of The Phoenix', '', 'J.K. Rowling', '978-0439358071', 2004),
  ('Harry Potter and the Half-Blood Prince', '', 'J.K. Rowling', '978-0439785969', 2006),
  ('Harry Potter and the Deathly Hallows', '', 'J.K. Rowling', '978-0545139700', 2009),
  ('Pride and Prejudice', '', 'Jane Austen', '978-0141439518', 2002),
  ('Emma', '', 'Jane Austen', '978-0141439587', 2003),
  ('The Hobbit and the Lord of the Rings', '', 'J.R.R. Tolkien', '978-0345538376', 2012),
  ('The Hobbit', '', 'Jane Austen', '978-0547928227', 2012),
  ('1984', '', 'George Orwell', '978-0451524935', 1961),
  ('Animal Farm', '', 'George Orwell', '978-8187138754', 2004),
  ('The Abbot', '', 'Walter Scott', '978-1-5960-5428-8', 2005),
  ('Ivanhoe', '', 'Walter Scott', '978-5-521-06015-3', 2018),
  ('Count Robert of Paris', '', 'Walter Scott', '978-5-521-05546-3', 2017),
  ('Rob Roy', '', 'Walter Scott', '978-0-00-744986-6', 2012),
  ('Our Mutual Friend I & II', '', 'Charles Dickens', '978-5-521-06845-6', 2018),
  ('The Life and Adventures of Nicholas Nickleby II', '', 'Charles Dickens', '978-5-521-06869-2', 2018),
  ('Dombey and Son I', '', 'Charles Dickens', '978-5-521-06878-4', 2018),
  ('The Mystery of Edwin Drood', '', 'Charles Dickens', '978-5-521-06848-7', 2018),
  ('Our Mutual Friend III', '', 'Charles Dickens', '978-5-521-06846-3', 2018),
  ('Our Mutual Friend IV', '', 'Charles Dickens', '978-5-521-06847-0', 2018),
  ('Three Ghost Stories', '', 'Charles Dickens', '978-5-521-06872-2', 2018);

