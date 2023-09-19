import ballerina/io;

type Book record {
    string title;
    string author;
    boolean available;
};

function main() {
    // Initialize the list of available books
    Book[] books = [
        {title: "Book 1", author: "Author 1", available: true},
        {title: "Book 2", author: "Author 2", available: true},
        {title: "Book 3", author: "Author 3", available: true}
    ];
    
    // Get a list of available books
    function getAvailableBooks() returns Book[] {
        return books;
    }
    
    // Borrow a book
    function borrowBook(string bookTitle) returns string {
        foreach var book in books {
            if (book.title == bookTitle && book.available) {
                book.available = false;
                return "Book borrowed successfully";
            }
        }
        return "Book not found or not available";
    }
    
    // Search for a book
    function searchBook(string keyword) returns Book[] {
        Book[] searchResults;
        foreach var book in books {
            if (book.title.containsIgnoreCase(keyword) || book.author.containsIgnoreCase(keyword)) {
                searchResults.push(book);
            }
        }
        return searchResults;
    }
    
    // Locate a book
    function locateBook(string bookTitle) returns string {
        foreach var book in books {
            if (book.title == bookTitle) {
                return "Book is available";
            }
        }
        return "Book not found";
    }
    
    // Return a book
    function returnBook(string bookTitle) returns string {
        foreach var book in books {
            if (book.title == bookTitle && !book.available) {
                book.available = true;
                return "Book returned successfully";
            }
        }
        return "Book not found or already returned";
    }
    
    // Sample usage
    io:println("List of available books: ", getAvailableBooks());
    io:println(borrowBook("Book 1"));
    io:println("List of available books after borrowing: ", getAvailableBooks());
    io:println("Search results: ", searchBook("Author 2"));
    io:println(locateBook("Book 3"));
    io:println(returnBook("Book 1"));
    io:println("List of available books after returning: ", getAvailableBooks());
}
