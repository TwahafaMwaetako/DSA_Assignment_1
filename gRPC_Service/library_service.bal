import ballerina/grpc;

listener grpc:Listener ep = new (9090);
userDetails[] allUsers = [{}];
bookDetails[] books = [{}];

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

