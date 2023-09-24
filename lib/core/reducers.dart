import 'package:redux_counter_app/core/actions.dart';
import 'package:redux_counter_app/core/app_state.dart';

AppState reducer(AppState state, dynamic action) {
  if (action is AddAction) {
    return AppState(counter: state.counter + 1, text: state.text);
  } else if (action is SetTextAction) {
    return AppState(counter: state.counter, text: action.text);
  } else {
    return state;
  }
}