import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutterbloclearingapp/screens/timer/Ticker.dart';
import 'package:flutterbloclearingapp/screens/timer/TimerEvent.dart';
import 'package:flutterbloclearingapp/screens/timer/TimerState.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  final Ticker _ticker;
  final int _duration = 60;


  StreamSubscription<int> _tickerSubscription;

  TimerBloc({@required Ticker ticker})
      : assert(ticker != null),
        _ticker = ticker;

  @override
  TimerState get initialState => Ready(_duration);

  @override
  Stream<TimerState> mapEventToState(TimerEvent event,) async* {
    // TODO: implement mapEventToState
  }
}