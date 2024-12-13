// Define the Book class
class Book {
  String title;
  String author;

  Book(this.title, this.author);

  @override
  String toString() => '“$title” by $author';
}

// Define the Member class
class Member {
  String name;
  String membershipNumber;
  List<Book> borrowedBooks = [];

  Member(this.name, this.membershipNumber);

  void borrowBook(Book book) {
    borrowedBooks.add(book);
    print('$name borrowed ${book.title}.');
  }

  void returnBook(Book book) {
    if (borrowedBooks.remove(book)) {
      print('$name returned ${book.title}.');
    } else {
      print('$name has not borrowed ${book.title}.');
    }
  }

  void printMemberInfo() {
    print('Member: $name (Membership Number: $membershipNumber)');
    if (borrowedBooks.isEmpty) {
      print('No books borrowed.');
    } else {
      print('Borrowed books:');
      borrowedBooks
          .forEach((book) => print('- ${book.title} by ${book.author}'));
    }
  }
}

void main() {
  // Create some Book objects
  Book book1 = Book('Dart Fundamental', 'hasnaa tarek');
  Book book2 = Book('Flutter basics', 'nada tarek');
  Book book3 = Book('oop', 'khaled');

  // Create Member objects
  Member alice = Member('Alice', 'M001');
  Member bob = Member('Bob', 'M002');

  // Members borrow books
  alice.borrowBook(book1);
  alice.borrowBook(book2);
  bob.borrowBook(book3);

  // Print members' information
  alice.printMemberInfo();
  bob.printMemberInfo();

  // Members return books
  alice.returnBook(book1);
  bob.returnBook(book2); // Attempt to return a book Bob hasn't borrowed

  // Print members' information after returning books
  alice.printMemberInfo();
  bob.printMemberInfo();
}
