import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:redux_counter_app/core/actions.dart';
import 'package:redux_counter_app/core/app_state.dart';

// implementation of reducer with use of combinedReducers
AppState betterReducer(AppState state, dynamic action) => AppState(
    counter: _betterCounterReducer(state.counter, action),
    text: _betterTextReducer(state.text, action),
    widget: _imageReducer(state.widget, action),
);

int _addCounterReducer(int count, AddAction action) => count + 1;
int _removeCounterReducer(int count, RemoveAction action) => count - 1;

Reducer<int> _betterCounterReducer = combineReducers([
  TypedReducer<int, AddAction>(_addCounterReducer),
  TypedReducer<int, RemoveAction>(_removeCounterReducer),
]);

String _setTextReducer(String text, SetTextAction action) => action.text;
String _resetTextReducer(String text, ResetTextAction action) => "";

Reducer<String> _betterTextReducer = combineReducers([
  TypedReducer<String, SetTextAction>(_setTextReducer),
  TypedReducer<String, ResetTextAction>(_resetTextReducer),
]);

Reducer<Widget> _imageReducer = combineReducers([
  TypedReducer<Widget, GetImageAction>(_getImageReducer),
  TypedReducer<Widget, LoadedImageAction>(_loadedImageReducer),
]);

Widget _getImageReducer(Widget widget, GetImageAction action) =>
    const Center(child: CircularProgressIndicator());
Widget _loadedImageReducer(Widget widget, LoadedImageAction action) =>
    action.image;

// simple reducer implementation
// AppState reducer(AppState state, dynamic action) => AppState(
//     counter: _counterReducer(state, action), text: _textReducer(state, action));

int _counterReducer(AppState state, dynamic action) {
  if (action is AddAction) {
    return state.counter + 1;
  } else if (action is RemoveAction) {
    return state.counter - 1;
  } else {
    return state.counter;
  }
}

String _textReducer(AppState state, dynamic action) {
  if (action is SetTextAction) {
    return action.text;
  } else if (action is ResetTextAction) {
    return "";
  } else {
    return state.text;
  }
}
