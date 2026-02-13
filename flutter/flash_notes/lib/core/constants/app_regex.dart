class AppRegex {
  static final RegExp email =
      RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  static final RegExp password =
      RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');

  static final RegExp name =
      RegExp(r'^[a-zA-Z\u0600-\u06FF ]{2,}$');
}
