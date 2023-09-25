import ballerina/grpc;

listener grpc:Listener ep = new (9090);
userDetails[] allUsers = [{userID: "20232200", firstName: "Gerson", lastName: "Eichab", role:"student"},
                            {userID: "20232202", firstName: "John", lastName: "Doe", role: "student"},
                            {userID: "20232203", firstName: "Sarah", lastName: "Johnson", role: "student"},
                            {userID: "20232201", firstName: "Emma", lastName: "Smith", role: "student"

}];
                            
bookDetails[] books = [{isbn : "123456789", title : "The Great Gatsby", author : "F. Scott Fitzgerald", isborrowed : "No" },
                            { isbn : "987654321", title : "To Kill a Mockingbird", author : "Harper Lee", isborrowed : "Yes" },
                             { isbn : "456789123", title : "Pride and Prejudice", author : "Jane Austen", isborrowed : "No" },
                              { isbn : "789123456", title : "1984", author : "George Orwell", isborrowed : "Yes" },
                            { isbn : "321654987", title : "The Catcher in the Rye", author : "J.D. Salinger", isborrowed : "No" }];

@grpc:Descriptor {value: LIBRARY_DESC}

    service "Library" on ep {
    remote function add_book(bookDetails value) returns response|error {
       response bookAdded = { resp: "Book added successfully" };
        return bookAdded;
    }

    remote function update_book(bookDetails value) returns response|error {
        response bookUpdated = { resp: "Book updated successfully" };
        return bookUpdated;

    }
    remote function create_users(userDetails value) returns response|error {
        response userCreated = { resp: "User created successfully" };
        return userCreated;
    }
    remote function remove_book(usrRequest value) returns response|error {
        response bookRemoved = { resp: "book removed successfully" };
            return bookRemoved;

    }
    
    remote function borrow_book(usrRequest value) returns response|error {
        response bookBorrowed = { resp: "book borrowed successfully" };
        return bookBorrowed;
    }
   remote function locate_book(usrRequest value) returns bookDetails|error {
        int x = 0;
        int y = books.length();
            while(x < y) {
                    if (books[x].isbn == value.isbn){
                return books[x];
                    } else {
            x = x + 1;
            
        }
    } return books[x];
}


    remote function list_all_books(clientRequest value) returns stream<bookDetails, error?>|error {
         return books.toStream();
    }
    remote function list_available_books(clientRequest value) returns stream<bookDetails, error?>|error {
        return books.toStream();
    }
}

