class EndPoint {
  static String baseUrl = "https://student.valuxapps.com/api/";
  static String signIn = "login";
  static String signUp = "register";
  static String getUserDataEndPoint(id) {
    return "user/get-user/$id";
  }
}

class ApiKey {
  static String status = "status";
  static String errorMessage = "ErrorMessage";
  static String message = "message";
  static String token = "token";
  static String email = "email";
  static String id = "id";
  static String name = "name";
  static String phone = "phone";
  static String password = "password";
  static String confirmPassword = "confirmPassword";
}
