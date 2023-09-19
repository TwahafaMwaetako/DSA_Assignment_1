import ballerina/io;

type Book record {
    string title;
    string author_1;
    string? author_2;
    string location;
    string isbn;
    boolean available;
};

type User record {
    string name;
    string profile;
};

// Initialize the list of available books
Book[] books = [];

// Initialize the list of users
User[] users = [];

// Add a book
function addBook(string title, string author_1, string? author_2, string location, string isbn, boolean available) returns string {
    Book book = {
        title: title,
        author_1: author_1,
        author_2: author_2,
        location: location,
        isbn: isbn,
        available: available
    };
    books.push(book);
    return isbn;
}

// Update a book
function updateBook(string isbn, string newLocation) returns string {
    foreach var book in books {
        if (book.isbn == isbn) {
            book.location = newLocation;
            return "Book updated successfully";
        }
    }
    return "Book not found";
}

// Remove a book
function removeBook(string isbn) returns string {
    foreach var book in books {
        if (book.isbn == isbn) {
            Book remove = books.remove(book);
            return "Book removed successfully";
        }
    }
    return "Book not found";
}

// List all borrowed books
function listBorrowedBooks() returns Book[] {
    Book[] borrowedBooks;
    foreach var book in books {
        if (!book.available) {
            borrowedBooks.push(book);
        }
    }
    return borrowedBooks;
}

// Create users
function createUsers(User[] newUsers) {
    users = newUsers;
}

// Sample usage

// Add a book
io:println("ISBN for the added book: ", addBook("Book 1", "Author 1", "Author 2", "Library A", "1234567890", true));

// Update a book
io:println(updateBook("1234567890", "Library B"));

// Remove a book
io:println(removeBook("1234567890"));

// List all borrowed books
io:println("List of borrowed books: ", listBorrowedBooks());

// Create users
createUsers([{name: "User 1", profile: "Profile 1"}, {name: "User 2", profile: "Profile 2"}]);