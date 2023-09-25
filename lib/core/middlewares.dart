import 'package:redux/redux.dart';
import 'package:redux_counter_app/core/actions.dart';
import 'package:redux_counter_app/core/app_state.dart';

void loaderMiddleware(
  Store<AppState> store,
  dynamic action,
  NextDispatcher nextDispatcher
) {
  if (action is GetImageAction) {

  }

  nextDispatcher(action);
}