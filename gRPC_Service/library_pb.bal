import ballerina/grpc;
import ballerina/protobuf;

public const string LIBRARY_DESC = "0A0D6C6962726172792E70726F746F12076C696272617279221E0A08726573706F6E736512120A0472657370180120012809520472657370222D0A0D636C69656E7452657175657374121C0A09636C526571756573741801200128095209636C5265717565737422200A0A7573725265717565737412120A046973626E18012001280952046973626E226F0A0B626F6F6B44657461696C7312120A046973626E18012001280952046973626E12140A057469746C6518022001280952057469746C6512160A06617574686F721803200128095206617574686F72121E0A0A6973626F72726F776564180420012809520A6973626F72726F77656422730A0B7573657244657461696C7312160A067573657249441801200128095206757365724944121C0A0966697273744E616D65180220012809520966697273744E616D65121A0A086C6173744E616D6518032001280952086C6173744E616D6512120A04726F6C651804200128095204726F6C6532DE030A074C69627261727912330A086164645F626F6F6B12142E6C6962726172792E626F6F6B44657461696C731A112E6C6962726172792E726573706F6E736512360A0B7570646174655F626F6F6B12142E6C6962726172792E626F6F6B44657461696C731A112E6C6962726172792E726573706F6E736512370A0C6372656174655F757365727312142E6C6962726172792E7573657244657461696C731A112E6C6962726172792E726573706F6E736512350A0B72656D6F76655F626F6F6B12132E6C6962726172792E757372526571756573741A112E6C6962726172792E726573706F6E736512400A0E6C6973745F616C6C5F626F6F6B7312162E6C6962726172792E636C69656E74526571756573741A142E6C6962726172792E626F6F6B44657461696C73300112460A146C6973745F617661696C61626C655F626F6F6B7312162E6C6962726172792E636C69656E74526571756573741A142E6C6962726172792E626F6F6B44657461696C73300112350A0B6C6F636174655F626F6F6B12132E6C6962726172792E757372526571756573741A112E6C6962726172792E726573706F6E736512350A0B626F72726F775F626F6F6B12132E6C6962726172792E757372526571756573741A112E6C6962726172792E726573706F6E7365620670726F746F33";

public isolated client class LibraryClient {
    *grpc:AbstractClientEndpoint;

    private final grpc:Client grpcClient;

    public isolated function init(string url, *grpc:ClientConfiguration config) returns grpc:Error? {
        self.grpcClient = check new (url, config);
        check self.grpcClient.initStub(self, LIBRARY_DESC);
    }

    isolated remote function add_book(bookDetails|ContextBookDetails req) returns response|grpc:Error {
        map<string|string[]> headers = {};
        bookDetails message;
        if req is ContextBookDetails {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.Library/add_book", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <response>result;
    }

    isolated remote function add_bookContext(bookDetails|ContextBookDetails req) returns ContextResponse|grpc:Error {
        map<string|string[]> headers = {};
        bookDetails message;
        if req is ContextBookDetails {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.Library/add_book", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <response>result, headers: respHeaders};
    }

    isolated remote function update_book(bookDetails|ContextBookDetails req) returns response|grpc:Error {
        map<string|string[]> headers = {};
        bookDetails message;
        if req is ContextBookDetails {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.Library/update_book", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <response>result;
    }

    isolated remote function update_bookContext(bookDetails|ContextBookDetails req) returns ContextResponse|grpc:Error {
        map<string|string[]> headers = {};
        bookDetails message;
        if req is ContextBookDetails {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.Library/update_book", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <response>result, headers: respHeaders};
    }

    isolated remote function create_users(userDetails|ContextUserDetails req) returns response|grpc:Error {
        map<string|string[]> headers = {};
        userDetails message;
        if req is ContextUserDetails {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.Library/create_users", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <response>result;
    }

    isolated remote function create_usersContext(userDetails|ContextUserDetails req) returns ContextResponse|grpc:Error {
        map<string|string[]> headers = {};
        userDetails message;
        if req is ContextUserDetails {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.Library/create_users", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <response>result, headers: respHeaders};
    }

    isolated remote function remove_book(usrRequest|ContextUsrRequest req) returns response|grpc:Error {
        map<string|string[]> headers = {};
        usrRequest message;
        if req is ContextUsrRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.Library/remove_book", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <response>result;
    }

    isolated remote function remove_bookContext(usrRequest|ContextUsrRequest req) returns ContextResponse|grpc:Error {
        map<string|string[]> headers = {};
        usrRequest message;
        if req is ContextUsrRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.Library/remove_book", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <response>result, headers: respHeaders};
    }

    isolated remote function locate_book(usrRequest|ContextUsrRequest req) returns response|grpc:Error {
        map<string|string[]> headers = {};
        usrRequest message;
        if req is ContextUsrRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.Library/locate_book", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <response>result;
    }

    isolated remote function locate_bookContext(usrRequest|ContextUsrRequest req) returns ContextResponse|grpc:Error {
        map<string|string[]> headers = {};
        usrRequest message;
        if req is ContextUsrRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.Library/locate_book", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <response>result, headers: respHeaders};
    }

    isolated remote function borrow_book(usrRequest|ContextUsrRequest req) returns response|grpc:Error {
        map<string|string[]> headers = {};
        usrRequest message;
        if req is ContextUsrRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.Library/borrow_book", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <response>result;
    }

    isolated remote function borrow_bookContext(usrRequest|ContextUsrRequest req) returns ContextResponse|grpc:Error {
        map<string|string[]> headers = {};
        usrRequest message;
        if req is ContextUsrRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.Library/borrow_book", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <response>result, headers: respHeaders};
    }

    isolated remote function list_all_books(clientRequest|ContextClientRequest req) returns stream<bookDetails, grpc:Error?>|grpc:Error {
        map<string|string[]> headers = {};
        clientRequest message;
        if req is ContextClientRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeServerStreaming("library.Library/list_all_books", message, headers);
        [stream<anydata, grpc:Error?>, map<string|string[]>] [result, _] = payload;
        BookDetailsStream outputStream = new BookDetailsStream(result);
        return new stream<bookDetails, grpc:Error?>(outputStream);
    }

    isolated remote function list_all_booksContext(clientRequest|ContextClientRequest req) returns ContextBookDetailsStream|grpc:Error {
        map<string|string[]> headers = {};
        clientRequest message;
        if req is ContextClientRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeServerStreaming("library.Library/list_all_books", message, headers);
        [stream<anydata, grpc:Error?>, map<string|string[]>] [result, respHeaders] = payload;
        BookDetailsStream outputStream = new BookDetailsStream(result);
        return {content: new stream<bookDetails, grpc:Error?>(outputStream), headers: respHeaders};
    }

    isolated remote function list_available_books(clientRequest|ContextClientRequest req) returns stream<bookDetails, grpc:Error?>|grpc:Error {
        map<string|string[]> headers = {};
        clientRequest message;
        if req is ContextClientRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeServerStreaming("library.Library/list_available_books", message, headers);
        [stream<anydata, grpc:Error?>, map<string|string[]>] [result, _] = payload;
        BookDetailsStream outputStream = new BookDetailsStream(result);
        return new stream<bookDetails, grpc:Error?>(outputStream);
    }

    isolated remote function list_available_booksContext(clientRequest|ContextClientRequest req) returns ContextBookDetailsStream|grpc:Error {
        map<string|string[]> headers = {};
        clientRequest message;
        if req is ContextClientRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeServerStreaming("library.Library/list_available_books", message, headers);
        [stream<anydata, grpc:Error?>, map<string|string[]>] [result, respHeaders] = payload;
        BookDetailsStream outputStream = new BookDetailsStream(result);
        return {content: new stream<bookDetails, grpc:Error?>(outputStream), headers: respHeaders};
    }
}

public class BookDetailsStream {
    private stream<anydata, grpc:Error?> anydataStream;

    public isolated function init(stream<anydata, grpc:Error?> anydataStream) {
        self.anydataStream = anydataStream;
    }

    public isolated function next() returns record {|bookDetails value;|}|grpc:Error? {
        var streamValue = self.anydataStream.next();
        if (streamValue is ()) {
            return streamValue;
        } else if (streamValue is grpc:Error) {
            return streamValue;
        } else {
            record {|bookDetails value;|} nextRecord = {value: <bookDetails>streamValue.value};
            return nextRecord;
        }
    }

    public isolated function close() returns grpc:Error? {
        return self.anydataStream.close();
    }
}

public client class LibraryResponseCaller {
    private grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendResponse(response response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextResponse(ContextResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.caller->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.caller->complete();
    }

    public isolated function isCancelled() returns boolean {
        return self.caller.isCancelled();
    }
}

public client class LibraryBookDetailsCaller {
    private grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendBookDetails(bookDetails response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextBookDetails(ContextBookDetails response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.caller->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.caller->complete();
    }

    public isolated function isCancelled() returns boolean {
        return self.caller.isCancelled();
    }
}

public type ContextBookDetailsStream record {|
    stream<bookDetails, error?> content;
    map<string|string[]> headers;
|};

public type ContextBookDetails record {|
    bookDetails content;
    map<string|string[]> headers;
|};

public type ContextResponse record {|
    response content;
    map<string|string[]> headers;
|};

public type ContextUsrRequest record {|
    usrRequest content;
    map<string|string[]> headers;
|};

public type ContextUserDetails record {|
    userDetails content;
    map<string|string[]> headers;
|};

public type ContextClientRequest record {|
    clientRequest content;
    map<string|string[]> headers;
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type response record {|
    string resp = "";
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type bookDetails record {|
    string isbn = "";
    string title = "";
    string author = "";
    string isborrowed = "";
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type usrRequest record {|
    string isbn = "";
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type userDetails record {|
    string userID = "";
    string firstName = "";
    string lastName = "";
    string role = "";
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type clientRequest record {|
    string clRequest = "";
|};

