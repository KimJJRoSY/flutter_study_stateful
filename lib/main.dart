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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // 스타일링 전역 관리
        theme: ThemeData(
          textTheme: TextTheme(
            titleLarge: TextStyle(
              color: Colors.red,
            ),
          ),
        ),
        home: Scaffold(
          backgroundColor: Color(0xFFF4EDDB),
          body: Center(
            child: Column(
              //
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 위젯화
                MyLargeTitle(),
              ],
            ),
          ),
        ));
  }
}

class MyLargeTitle extends StatelessWidget {
  const MyLargeTitle({
    super.key,
  });

  @override
  // contect는 Text 이전에 있는 모든 상위 요소들에 대한 정보 => 부모 요소 정보
  Widget build(BuildContext context) {
    return Text(
      'My Large Title',
      style: TextStyle(
        fontSize: 30,
        //여기에서 theme까지 context로 거슬러 올라가기 가능
        color: Theme.of(context).textTheme.titleLarge?.color, //? <- null 방지
      ),
    );
  }
}
