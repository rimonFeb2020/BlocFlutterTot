import 'dart:async';
import 'package:flutterbloclearingapp/screens/login/validators.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with Validators implements LoginBaseBloc{
  final _emailController = StreamController<String>.broadcast();
  final _passwordController = StreamController<String>.broadcast();

  // values that got in onchange listener on both email and password
  Function(String) get emailChanged => _emailController.sink.add;
  Function(String) get passwordChanged => _passwordController.sink.add;

  // values that we have got form the input is validated using this
  Stream<String> get email => _emailController.stream.transform(emailValidator);
  Stream<String> get password => _passwordController.stream.transform(passwordValidator);

  // check if both email, password is validated using this rx then button click is enabled
  Stream<bool> get submitCheck => Rx.combineLatest2(email,password,(e,p) => true);

  submit(){
  //print("${_emailController.}")
    print("Submit Click submitCheck : ${submitCheck}");
  }

  @override
  void dispose() {
    _emailController?.close();
    _passwordController?.close();
  }
}


abstract class LoginBaseBloc{
  void dispose();
}