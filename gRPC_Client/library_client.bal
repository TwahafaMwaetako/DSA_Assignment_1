import ballerina/io;

LibraryClient ep = check new ("http://localhost:9090");

public function main() returns error? {
    bookDetails add_bookRequest = {isbn: "165154157", title: "The Book Of Life", author: "Sam Kovavic Nujoma", isborrowed: "Yes"};
    response add_bookResponse = check ep->add_book(add_bookRequest);
    io:println(add_bookResponse);

    bookDetails update_bookRequest = {isbn : "321654987", title : "The Catcher in the Rye", author : "J.D. Salinger", isborrowed : "Yes" };
    response update_bookResponse = check ep->update_book(update_bookRequest);
    io:println(update_bookResponse);

    userDetails create_usersRequest = {userID: "165135135", firstName: "Twahafa", lastName: "Mwaetako", role: "Student"};
    response create_usersResponse = check ep->create_users(create_usersRequest);
    io:println(create_usersResponse);

    usrRequest remove_bookRequest = {isbn: "987654321"};
    response remove_bookResponse = check ep->remove_book(remove_bookRequest);
    io:println(remove_bookResponse);

    usrRequest locate_bookRequest = {isbn: "321654987"};
    response locate_bookResponse = check ep->locate_book(locate_bookRequest);
    io:println(locate_bookResponse);

    usrRequest borrow_bookRequest = {isbn: "123456789"};
    response borrow_bookResponse = check ep->borrow_book(borrow_bookRequest);
    io:println(borrow_bookResponse);

    clientRequest list_all_booksRequest = {clRequest: " "};
    stream<bookDetails, error?> list_all_booksResponse = check ep->list_all_books(list_all_booksRequest);
    check list_all_booksResponse.forEach(function(bookDetails value) {
        io:println(value);
    });

    clientRequest list_available_booksRequest = {clRequest: " "};
    stream<bookDetails, error?> list_available_booksResponse = check ep->list_available_books(list_available_booksRequest);
    check list_available_booksResponse.forEach(function(bookDetails value) {
        io:println(value);
    });
}

