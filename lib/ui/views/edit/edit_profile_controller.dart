import 'package:flutter/cupertino.dart';
import 'package:new_quiz/core/services/base_controller.dart';

class editProfileController extends BaseController{
  TextEditingController userNameController= TextEditingController();
  TextEditingController phoneController= TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  editProfileController(String userName,int phone) {
    userNameController.text = userName;
    phoneController.text=phone.toString();
  }

  void editProfileInfo()
  {

  }
}