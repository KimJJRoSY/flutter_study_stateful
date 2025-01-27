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
  bool showTitle = true;

  void toggleTitle() {
    setState(() {
      showTitle = !showTitle;
    });
  }

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
                // showTitle이 false일 때, nothing을 보여줌
                showTitle ? MyLargeTitle() : const Text('nothing'),
                IconButton(
                    onPressed: toggleTitle, icon: Icon(Icons.remove_red_eye))
              ],
            ),
          ),
        ));
  }
}

class MyLargeTitle extends StatefulWidget {
  const MyLargeTitle({
    super.key,
  });

  @override
  State<MyLargeTitle> createState() => _MyLargeTitleState();
}

class _MyLargeTitleState extends State<MyLargeTitle> {
  // 상태 초기화를 위한 메서드
  // 항상 build 메서드보다 먼저 호출되어야 함 + 한 번만 호출됨
  @override
  void initState() {
    super.initState();
    print('initState');
  }

  @override
  // dispose는 위젯이 스크린에서 제거될 때 호출되는 메서드
  void dispose() {
    super.dispose();
    print('dispose');
  }

  @override
  // contect는 Text 이전에 있는 모든 상위 요소들에 대한 정보 => 부모 요소 정보
  Widget build(BuildContext context) {
    // build 메서드는 위젯에서 ui를 만듦
    print('build');
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
