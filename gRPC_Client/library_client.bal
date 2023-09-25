import ballerina/io;

LibraryClient ep = check new ("http://localhost:9090");

public function main() returns error? {
    bookDetails add_bookRequest = {isbn: "ballerina", title: "ballerina", author: "ballerina", isborrowed: "ballerina"};
    response add_bookResponse = check ep->add_book(add_bookRequest);
    io:println(add_bookResponse);

    bookDetails update_bookRequest = {isbn: "ballerina", title: "ballerina", author: "ballerina", isborrowed: "ballerina"};
    response update_bookResponse = check ep->update_book(update_bookRequest);
    io:println(update_bookResponse);

    userDetails create_usersRequest = {userID: "ballerina", firstName: "ballerina", lastName: "ballerina", role: "ballerina"};
    response create_usersResponse = check ep->create_users(create_usersRequest);
    io:println(create_usersResponse);

    usrRequest remove_bookRequest = {isbn: "ballerina"};
    response remove_bookResponse = check ep->remove_book(remove_bookRequest);
    io:println(remove_bookResponse);

    usrRequest locate_bookRequest = {isbn: "ballerina"};
    response locate_bookResponse = check ep->locate_book(locate_bookRequest);
    io:println(locate_bookResponse);

    usrRequest borrow_bookRequest = {isbn: "ballerina"};
    response borrow_bookResponse = check ep->borrow_book(borrow_bookRequest);
    io:println(borrow_bookResponse);

    clientRequest list_all_booksRequest = {clRequest: "ballerina"};
    stream<bookDetails, error?> list_all_booksResponse = check ep->list_all_books(list_all_booksRequest);
    check list_all_booksResponse.forEach(function(bookDetails value) {
        io:println(value);
    });

    clientRequest list_available_booksRequest = {clRequest: "ballerina"};
    stream<bookDetails, error?> list_available_booksResponse = check ep->list_available_books(list_available_booksRequest);
    check list_available_booksResponse.forEach(function(bookDetails value) {
        io:println(value);
    });
}

