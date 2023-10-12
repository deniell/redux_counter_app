import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_counter_app/core/actions.dart';
import 'package:redux_counter_app/core/app_state.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Store<AppState> store = StoreProvider.of<AppState>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StoreConnector<AppState, AppState>(
              converter: (store) => store.state,
              builder: (context, state) => Text(
                state.counter.toString(),
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: FloatingActionButton(
              heroTag: "calc",
              onPressed: () => store.dispatch(calcCountThunkAction(store)),
              tooltip: 'Calculation',
              child: const Icon(Icons.calculate, size: 35),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                heroTag: "+",
                onPressed: () => store.dispatch(AddAction()),
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
              const SizedBox(width: 10),
              FloatingActionButton(
                heroTag: "-",
                onPressed: () => store.dispatch(RemoveAction()),
                tooltip: 'Decrement',
                backgroundColor: Colors.redAccent,
                child: const Icon(Icons.remove),
              ),
            ],
          ),
        ],
      ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
