import 'package:redux/redux.dart';

final Store<int> store = Store(reducer, initialState: 0);

int reducer(int state, dynamic action) {
  if(action is AddAction) {
    return state+1;
  } else {
    return state;
  }
}

class AddAction {}