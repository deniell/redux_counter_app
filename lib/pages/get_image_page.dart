import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_counter_app/core/actions.dart';
import 'package:redux_counter_app/core/app_state.dart';
import 'package:redux_counter_app/core/stores.dart';

class GetImagePage extends StatelessWidget {
  const GetImagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Get Image"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 300,
              width: 300,
              margin: const EdgeInsets.all(16),
              child: StoreConnector<AppState, AppState> (
                converter: (store) => store.state,
                builder: (context, vm) => vm.widget,
              )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.all(15),
                  ),
                  onPressed: () => store.dispatch(GetImageAction()),
                  child: const Text(
                    "Get Image 1",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 30),
                ElevatedButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.all(15),
                  ),
                  onPressed: () => store.dispatch(loadImageThunkAction(store)),
                  child: const Text(
                    "Get Image 2",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
