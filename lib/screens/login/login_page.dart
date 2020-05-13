import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutterbloclearingapp/screens/homepage/home_page.dart';
import 'package:flutterbloclearingapp/screens/login/loginBloc.dart';
import 'package:flutterbloclearingapp/screens/timer/view/timer.dart';

class LoginPage extends StatelessWidget {
  changeThePage(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => HomePage()));
  }
  @override
  Widget build(BuildContext context) {
    final loginBloc = LoginBloc();
    


    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              StreamBuilder<String>(
                stream: loginBloc.email,
                builder: (context, snapshot) => TextField(
                  onChanged: loginBloc.emailChanged,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter email",
                      labelText: "Email",
                      errorText: snapshot.error),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              StreamBuilder<String>(
                stream: loginBloc.password,
                builder: (context, snapshot) => TextField(
                  onChanged: loginBloc.passwordChanged,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter password",
                      labelText: "Password",
                      errorText: snapshot.error),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              StreamBuilder<bool>(
                stream: loginBloc.submitCheck,
                builder: (context, snapshot) => RaisedButton(
                  color: Colors.tealAccent,
                  onPressed:
                  snapshot.hasData ? () => changeThePage(context) : null,
                  child: Text("Submit"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
