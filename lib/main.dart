import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_counter_app/core/stores.dart';
import 'package:redux_counter_app/pages/home_page.dart';

void main() {
  runApp(StoreProvider(
    store: store,
    child: MaterialApp(
      title: 'Redux Counter App',
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
    ),
  ));
}

