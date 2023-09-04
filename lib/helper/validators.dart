import 'dart:async';

import 'package:get/get.dart';

const mobileRegex = r"^([0-9][\s]*){10,16}$";

const codeRegex = r"^([0-9][\s]*){4,4}$";

final StreamTransformer<String, String> validateEmail = StreamTransformer<String, String>.fromHandlers(
  handleData: (email, sink) {
    GetUtils.isEmail(email);
    if (GetUtils.isEmail(email)) {
      sink.add(email);
    } else {
      sink.addError('Enter a valid email');
    }
  },
);

final StreamTransformer<String, String> mobileValidator = StreamTransformer<String, String>.fromHandlers(
  handleData: (phone, sink) {
    if (phone.isNotEmpty && RegExp(mobileRegex).hasMatch(phone)) {
      sink.add(phone);
    } else {
      sink.addError('Enter valid mobile number');
    }
  },
);

final StreamTransformer<String, String> passwordValidator = StreamTransformer<String, String>.fromHandlers(
  handleData: (password, sink) {
    if (password.isNotEmpty && password.length > 1) {
      sink.add(password);
    } else {
      sink.addError('Enter valid password');
    }
  },
);

final StreamTransformer<String, String> nameValidator = StreamTransformer<String, String>.fromHandlers(
  handleData: (password, sink) {
    if (password.isNotEmpty && password.length > 1) {
      sink.add(password);
    } else {
      sink.addError('Enter valid name');
    }
  },
);
