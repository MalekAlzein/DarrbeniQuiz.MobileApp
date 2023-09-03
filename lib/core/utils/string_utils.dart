class StringUtil {
  static bool isEmail(String value) {
    RegExp regExp = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$");
    return regExp.hasMatch(value);
  }

  static bool isPassword(String value) {
    RegExp regExp =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    return regExp.hasMatch(value);
  }

  static bool isName(String value) {
    RegExp regExp =
        RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
    return regExp.hasMatch(value);
  }

  static bool isLastName(String value) {
    RegExp regExp = RegExp(r"^\s*([A-Za-z]{1,})*$");
    return regExp.hasMatch(value);
  }

  static bool isAddress(String value) {
    RegExp regExp = RegExp(r'^[0-9a-zA-Z\s,-/]+$');
    return regExp.hasMatch(value);
  }

  static bool isMobile(String value) {
    RegExp regExp = RegExp(r'^\+?00963[0-9]{9}$');
    return regExp.hasMatch(value);
  }

  //! This to validate syrian number phone And this better than before (isMobile)
  static bool isValidSyriaMobileNumber(String value) {
    RegExp regex = RegExp(r'^(!?(\+|00)?(963)|0)?9\d{8}$');
    return regex.hasMatch(value);
  }

  static bool isage18(String value) {
    RegExp regExp = RegExp(r'^(?:1[8-9]|[2-9][0-9])$');
    return regExp.hasMatch(value);
  }
}
