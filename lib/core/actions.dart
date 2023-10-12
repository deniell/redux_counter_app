import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

class AddAction {}

class RemoveAction {}

class CalculateAction {
  final int count;
  CalculateAction(this.count);
}

class SetTextAction {
  final String text;

  SetTextAction({required this.text});
}

class ResetTextAction {}

class GetImageAction {}

class LoadedImageAction {
  final Widget image;

  const LoadedImageAction({
    required this.image,
  });
}

ThunkAction loadImageThunkAction = (Store store) async {
  store.dispatch(GetImageAction());
  const String url = "https://picsum.photos/500/400";
  _loadImage(url).then((image) => store.dispatch(LoadedImageAction(image: image)));
};

Future<Widget> _loadImage(String url) async {
  await Future.delayed(const Duration(seconds: 2));
  return Image.network(url);
}

ThunkAction calcCountThunkAction = (Store store) async {
  compute(calc, 5000000000).then((value) =>
      store.dispatch(CalculateAction(value)));
};

Future<int> calc(int count) async {
  int result = 0;
  for (var i = 0; i < count; ++i) {
    result++;
  }
  return result;
}