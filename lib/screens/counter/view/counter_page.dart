import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloclearingapp/screens/counter/CounterBloc.dart';

import '../CounterEvents.dart';

class CounterPage extends StatelessWidget {
  CounterBloc _counterBloc = new CounterBloc(initialCount: 0);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(title: Text(" Counter Page "),),
        body: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text('You have pushed the button this many times:'),
              new StreamBuilder(
                  stream: _counterBloc.counterObservable,
                  builder: (context, AsyncSnapshot<int> snapshot) {
                    return new Text('${snapshot.data}',
                        style: Theme.of(context).textTheme.display1);
                  })
            ],
          ),
        ),
        floatingActionButton: new Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              new Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: new FloatingActionButton(
                    heroTag: "btn1",
                    onPressed: _counterBloc.increment,
                    tooltip: 'Increment',
                    child: new Icon(Icons.add),
                  )),
              new FloatingActionButton(
                heroTag: "btn2",
                onPressed: _counterBloc.decrement,
                tooltip: 'Decrement',
                child: new Icon(Icons.remove),
              ),
            ]));
  }
}
