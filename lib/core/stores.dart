import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:redux_counter_app/core/app_state.dart';
import 'package:redux_counter_app/core/reducers.dart';

final Store<AppState> store = Store(
  betterReducer,
  initialState: const AppState(
    counter: 0,
    text: "Your text will be set here",
    widget: Icon(
      Icons.image,
      size: 150,
    ),
  ),
);