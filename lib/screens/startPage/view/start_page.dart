import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloclearingapp/screens/counter/CounterBloc.dart';
import 'package:flutterbloclearingapp/screens/counter/view/counter_page.dart';
import 'package:flutterbloclearingapp/screens/login/login_page.dart';
import 'package:flutterbloclearingapp/screens/timer/Ticker.dart';
import 'package:flutterbloclearingapp/screens/timer/TimerBloc.dart';
import 'package:flutterbloclearingapp/screens/timer/view/timer.dart';

class StartPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Tutorial App'),
        ),

        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ButtonBar(
              alignment: MainAxisAlignment.center,
              buttonPadding: EdgeInsets.fromLTRB(14, 0, 14, 0),
              children: <Widget>[
                RaisedButton(
                  child: Text("Counter Page"),
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => CounterPage()));
                  },
                ),
              ],
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              buttonPadding: EdgeInsets.fromLTRB(22, 0, 22, 0),
              children: <Widget>[
                RaisedButton(
                  child: Text("Timer Page"),
                  onPressed: () {
                    BlocProvider(
                      create: (context) => TimerBloc(ticker: Ticker()),
                      child: Timer(),
                    );
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
                          return Timer();
                        }));
                  },
                ),
              ],
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              buttonPadding: EdgeInsets.fromLTRB(22, 0, 22, 0),
              children: <Widget>[
                RaisedButton(
                  child: Text("Login Page"),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
                          return LoginPage();
                        }));
                  },
                ),
              ],
            ),
          ],
        ));
  }
}
