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
    // setState: State 클래스에서 데이터가 변경되었다고 알리는 함수
    // 이 함수 없으면 build 메서드 다시 실행 X -> 상태 변화 생겨도 ui 변경 X
    setState(() {
      counter = counter + 1;
    });
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
