import 'package:flutter/widgets.dart';
import 'package:flutterbloclearingapp/repos/API.dart';
import 'package:flutterbloclearingapp/screens/homepage/homeBloc.dart';

class HomeProvider extends InheritedWidget {
  final HomeBloc homeBloc;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static HomeBloc of(BuildContext context) =>
      (context.dependOnInheritedWidgetOfExactType() as HomeProvider).homeBloc;

  HomeProvider({Key key, HomeBloc homeBloc, Widget child})
      : this.homeBloc = homeBloc ?? HomeBloc(API()),
        super(child: child, key: key);

}