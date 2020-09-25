import 'dart:async';

class RegisterValidator {
  //StreamTransformers checks the validity of data and add it to the sink
  var fnameValidator =
      StreamTransformer<String, String>.fromHandlers(handleData: (fname, sink) {
    if (fname.contains(new RegExp(r'[a-zA-Z]'))) {
      sink.add(fname);
    } else {
      sink.addError('Enter correct first name.');
    }
  });

  var lnameValidator =
      StreamTransformer<String, String>.fromHandlers(handleData: (lname, sink) {
    if (lname.contains(new RegExp(r'[a-zA-Z]'))) {
      sink.add(lname);
    } else {
      sink.addError('Enter correct last name.');
    }
  });

  var emailValidator =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (email.contains('@')) {
      sink.add(email);
    } else {
      sink.addError('Enter valid email address.');
    }
  });

  var roleValidator =
      StreamTransformer<bool, bool>.fromHandlers(handleData: (role, sink) {
    if (role == true) {
      sink.add(role);
    } else {
      sink.addError('Select a role.');
    }
  });

  var passwordValidator = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length > 5) {
      sink.add(password);
    } else {
      sink.addError('Enter password with more then 5 characters.');
    }
  });

  var confirmPasswordValidator = StreamTransformer<String, String>.fromHandlers(
      handleData: (confirmPassword, sink) {
    if (confirmPassword.length > 5) {
      sink.add(confirmPassword);
    } else {
      sink.addError('Enter same password as above to confirm.');
    }
  });

  var phoneNumberValidator =
      StreamTransformer<String, String>.fromHandlers(handleData: (phoneNumber, sink) {
    if ( phoneNumber.length == 10) {
      sink.add(phoneNumber);
    } else {
      sink.addError('Enter correct phone number.');
    }
  });
}
