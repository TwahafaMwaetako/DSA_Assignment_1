import ballerina/grpc;

listener grpc:Listener ep = new (9090);

@grpc:Descriptor {value: LIBRARY_DESC}
service "Library" on ep {

    // Define an array to hold the books
    bookDetails[] books = [{}];
    userDetails[] users = [{}];
    usrRequest[] requests = [{}];
    clientRequest[] clientRequests = [{}];

    remote function add_book(bookDetails value) returns response|error {
       bookDetails.push(value);
        return {status: "success", message: "operation was successful"};
    }

    remote function update_book(bookDetails value) returns response|error {

    }
    remote function create_users(userDetails value) returns response|error {
        userDetails.push(value);
        return {status: "success", message: "operation was successful"};
    }
    remote function remove_book(usrRequest value) returns response|error {
        usrRequest.push(value);
        return {status: "success", message: "operation was successful"};
    }
    
    remote function borrow_book(usrRequest value) returns response|error {
        usrRequest.push(value);
        return {status: "success", message: "operation was successful"};
    }
    remote function list_all_books(clientRequest value) returns stream<bookDetails, error?>|error {
        bookDetails[] allBooks = ...; // retrieve all books from the database or other source
        return allBooks.toStream();
    }
    remote function list_available_books(clientRequest value) returns stream<bookDetails, error?>|error {
        bookDetails[] availableBooks = ...; // retrieve all available books from the database or other source
        return availableBooks.toStream();
    }
}

