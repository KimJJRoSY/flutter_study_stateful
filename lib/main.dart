import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  // 상태 없는 위젯
  @override
  State<App> createState() => _AppState();
}

// 상태 있는 위젯
class _AppState extends State<App> {
  int counter = 0;

  void onClicked() {
    counter = counter + 1;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Color(0xFFF4EDDB),
      body: Center(
        child: Column(
          //
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Click Count',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            Text(
              '$counter',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            // flutter에서 제공하는 버튼
            IconButton(
              iconSize: 40,
              onPressed: onClicked,
              icon: Icon(Icons.add_box_rounded),
            )
          ],
        ),
      ),
    ));
  }
}
