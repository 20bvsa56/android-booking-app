import 'dart:async';

class LoginValidator {

  //StreamTransformers checks the validity of data and add it to the sink
  var emailValidator =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (email.contains('@')) {
      sink.add(email);
    } else {
      sink.addError('Enter valid email address.');
    }
  });

   var passwordValidator =
      StreamTransformer<String, String>.fromHandlers(handleData: (password, sink) {
    if (password.length > 5) {
      sink.add(password);
    } else {
      sink.addError('Enter password with more then 5 characters.');
    }
  });
}