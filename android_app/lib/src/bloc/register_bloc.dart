import 'package:rxdart/rxdart.dart';
import 'register_validator.dart';

class RegisterBloc extends Object with RegisterValidator implements BaseBloc{

  //gets the value of email and password, it is a single subscription controller
  //Here, behaviour subject is used instead of stream controller as stream cannot be listened again and again
  final _fnameController = BehaviorSubject<String>();
  final _lnameController = BehaviorSubject<String>();
  final _emailController = BehaviorSubject<String>();
  final _roleController = BehaviorSubject<bool>();
  final _passwordController = BehaviorSubject<String>();
  final _confirmPasswordController = BehaviorSubject<String>();
  final _phoneNumberController = BehaviorSubject<String>();

  //gets the value from stream controller and transforms or checks the value
  Stream<String> get fnameStream => _fnameController.stream.transform(fnameValidator);
  Stream<String> get lnameStream => _lnameController.stream.transform(lnameValidator);
  Stream<String> get emailStream => _emailController.stream.transform(emailValidator);
  Stream<bool> get roleStream => _roleController.stream.transform(roleValidator);
  Stream<String> get passwordStream => _passwordController.stream.transform(passwordValidator);
  Stream<String> get confirmPasswordStream => _confirmPasswordController.stream.transform(confirmPasswordValidator);
  Stream<String> get phoneNumberStream => _phoneNumberController.stream.transform(phoneNumberValidator);


  //using rxdart comp to check data. rxdart's stream is called observable. observable is replaced by Rx
  Stream<bool> get registerCheck => Rx.combineLatest6(phoneNumberStream,fnameStream,lnameStream,emailStream,passwordStream,confirmPasswordStream,(ph,f,l,e,p,cp)=> true);

  Function(String) get fnameChanged => _fnameController.sink.add;
  Function(String) get lnameChanged => _lnameController.sink.add;
  Function(String) get emailChanged => _emailController.sink.add;
  Function(bool) get roleChanged => _roleController.sink.add;
  Function(String) get passwordChanged => _passwordController.sink.add;
  Function(String) get confirmPasswordChanged => _confirmPasswordController.sink.add;
  Function(String) get phoneNumberChanged => _phoneNumberController.sink.add;

  @override
  void dispose() {
    _fnameController.close();
    _lnameController.close();
    _emailController.close();
    _roleController.close(); 
    _passwordController.close();
    _confirmPasswordController.close();
    _phoneNumberController.close();
  }

}

//to close the stream and use this class everywhere
abstract class BaseBloc{
  void dispose();
}
