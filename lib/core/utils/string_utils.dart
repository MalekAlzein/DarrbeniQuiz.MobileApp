class StringUtil {
  bool isEmail(String value) {
    RegExp regExp = new RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    return regExp.hasMatch(value);
  }

  bool isPassword(String value) {
    RegExp regExp = new RegExp(r'^(?=.*?[A-Z])(?=.*?[!@#\$&*~]).{8,}$');
    return regExp.hasMatch(value);
  }

  bool isName(String value) {
    RegExp regExp = new RegExp(r'^[a-zA-Z]+(([,. -][a-zA-Z ])?[a-zA-Z]*)*$');

    return regExp.hasMatch(value);
  }

  bool isMobileNo(String value) {
    RegExp regExp = new RegExp(r'^[+]?[0-9]{10,13}$');

    return regExp.hasMatch(value);
  }

  bool isAddress(String value) {
    RegExp regExp = new RegExp(r'^[a-zA-Z0-9\s,\-]*$');
    return regExp.hasMatch(value);
  }
}
