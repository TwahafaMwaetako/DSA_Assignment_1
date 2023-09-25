import ballerina/grpc;
import ballerina/http;
import ballerina/io;
import ballerina/log;

listener grpc:Listener ep = new (9090);

@grpc:Descriptor {value: LIBRARY_DESC}
service "Library" on ep {


    remote function add_book(bookDetails value) returns response|error {
        //get the book details from the request
    }
    remote function update_book(bookDetails value) returns response|error {
    }
    remote function create_users(userDetails value) returns response|error {
    }
    remote function remove_book(usrRequest value) returns response|error {
    }
    
    remote function borrow_book(usrRequest value) returns response|error {
    }
    remote function list_all_books(clientRequest value) returns stream<bookDetails, error?>|error {
    }
    remote function list_available_books(clientRequest value) returns stream<bookDetails, error?>|error {
    }
}

