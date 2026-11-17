// 출처: EnjoyTrip 최종보고서 부록 4(소스 코드)에서 옮긴 코드입니다. 원본 저장소는 남아 있지 않습니다.
import 'package:flutter/material.dart';
import 'recom2.dart';

class Recom1 extends StatelessWidget {
  final List<String> schedule;

  Recom1({required this.schedule});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter ListView Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(schedule: schedule),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final List<String> schedule;

  MyHomePage({required this.schedule});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('하루 일정 추천')),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '리스트 목록',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: widget.schedule.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Item ${index + 1}'),
                    subtitle: Text(widget.schedule[index]),
                  );
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: () {
                  // 전달할 데이터
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Recom2(items: widget.schedule),
                    ),
                  );
                },
                child: Text('일정 불러오기'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: Size(150, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 32),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 32),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today, size: 32),
            label: '',
          ),
        ],
        selectedItemColor: Colors.blue,
      ),
    );
  }
}
