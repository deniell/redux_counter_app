import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:redux_counter_app/core/actions.dart';
import 'package:redux_counter_app/core/app_state.dart';

void loaderMiddleware(
  Store<AppState> store,
  dynamic action,
  NextDispatcher nextDispatcher
) {
  if (action is GetImageAction) {
    const String url = "https://picsum.photos/500/400";
    _loadImage(url).then((image) => store.dispatch(LoadedImageAction(image: image)));
  }

  nextDispatcher(action);
}

Future<Widget> _loadImage(String url) async {
  await Future.delayed(const Duration(seconds: 2));
  return Image.network(url);
}