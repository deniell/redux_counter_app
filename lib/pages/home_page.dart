import 'package:flutter/material.dart';
import 'package:redux_counter_app/pages/counter_page.dart';
import 'package:redux_counter_app/pages/set_text_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.all(20),
              ),
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: ((context) => const CounterPage()))
              ),
              child: const Text(
                "Counter page",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.all(20),
              ),
              onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: ((context) => const SetTextPage()))
              ),
              child: const Text(
                "Set Text page",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
