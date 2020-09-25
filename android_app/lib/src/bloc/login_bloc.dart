import 'package:rxdart/rxdart.dart';
import 'login_validator.dart';

class LoginBloc extends Object with LoginValidator implements BaseBloc{

  //gets the value of email and password, it is a single subscription controller
  //Here, behaviour subject is used instead of stream controller as stream cannot be listened again and again
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  //gets the value from stream controller and transforms or checks the value
  Stream<String> get emailStream => _emailController.stream.transform(emailValidator);
  Stream<String> get passwordStream => _passwordController.stream.transform(passwordValidator);

  //using rxdart comp to check data. rxdart's stream is called observable. observable is replace by Rx
  Stream<bool> get loginCheck => Rx.combineLatest2(emailStream,passwordStream,(e,p)=> true);

  Function(String) get emailChanged => _emailController.sink.add;
  Function(String) get passwordChanged => _passwordController.sink.add;

  @override
  void dispose() {
    _emailController.close(); 
    _passwordController.close();
  }

}

//to close the stream and use this class everywhere
abstract class BaseBloc{
  void dispose();
}