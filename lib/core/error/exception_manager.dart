import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tasks/core/error/handlers/auth_exception_handler.dart';
import 'package:tasks/core/error/handlers/firebase_exception_handler.dart';
import 'package:tasks/core/error/handlers/unexpected_exception_handler.dart';
import 'package:tasks/core/utils/color_manager.dart';

abstract class ExceptionHandler {
  String handle(Exception exception);
}

class ExceptionManager {
  static final Map<Type, ExceptionHandler> _handlers = <Type, ExceptionHandler>{
    FirebaseAuthException: FirebaseAuthExceptionHandler(),
    FirebaseException: FirebaseExceptionHandler(),
    UnexpectedExceptionHandler: UnexpectedExceptionHandler(),
  };

  static String getMessage(Exception exception) {
    debugPrint("***************************error*************************");
    debugPrint(exception.toString());
    debugPrint("***************************error*************************");
    return _handlers[exception.runtimeType]?.handle(exception) ??
        _handlers[UnexpectedExceptionHandler]!.handle(exception);
  }

  static void showMessage(Exception exception) {
    Fluttertoast.showToast(
      msg: getMessage(exception),
      backgroundColor: ColorManager.red,
    );
  }
}
