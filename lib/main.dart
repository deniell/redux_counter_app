import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_counter_app/pages/counter_page.dart';
import 'package:redux_counter_app/core/stores.dart';

void main() {
  runApp(StoreProvider(
    store: store,
    child: const MaterialApp(
      title: 'Redux Counter App',
      home: CounterPage(),
      debugShowCheckedModeBanner: false,
    ),
  ));
}

