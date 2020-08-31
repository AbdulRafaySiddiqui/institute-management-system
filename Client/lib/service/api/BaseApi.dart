import 'dart:io';

class BaseApi {
  String baseUrl = 'https://localhost:5001/api';
  String defaultErrorMessage = 'Something went wrong..!';
  Map<String, String> header = {
    HttpHeaders.authorizationHeader:
        "Bearer eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFkbWluQHRlc3QuY29tIiwibmJmIjoxNTk4OTA3MzI4LCJleHAiOjE1OTk1MTIxMjgsImlhdCI6MTU5ODkwNzMyOH0.YBcAKLMPRw8FTK1htZfRPFpGTnxMXqIGF9WSFRqx8051Uq3JTwG1u_bwA8BKIOW08YrmKL3FGldAnHbFfXiiqw",
    HttpHeaders.contentTypeHeader: "application/json"
  };
}
