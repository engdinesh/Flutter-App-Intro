import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_app/common/Utils/Validator.dart';
import 'package:flutter_app/feature/login/login_presenter.dart';
import 'package:fluttertoast/fluttertoast.dart';

/*Created by Dinesh 26 Aug 2019 */

class LoginPageViewModel{

  bool login(String strEmail,String strPassword)
  {

    if(strEmail.trim().toString().isEmpty)
      {
        showMessage("Enter email");
        return false;
      }
    else if(!Validator.isEmailValid(strEmail))
      {
        showMessage("Enter valid email");
        return false;
      }
    else if(strPassword.trim().toString().isEmpty)
    {
      showMessage("Enter password");
      return false;
    }
    else if(!Validator.isPasswordValid(strPassword))
    {
      showMessage("Enter valid password");
      return false;
    }
    else
      {
        return true;
      }
  }


  /* Display Message to user */
  void showMessage(String message) {
      Fluttertoast.showToast(
        msg: "${message}",
        textColor: Colors.black,
        toastLength: Toast.LENGTH_LONG,
        timeInSecForIos: 1,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.white.withOpacity(0.5),
      );
  }

}
