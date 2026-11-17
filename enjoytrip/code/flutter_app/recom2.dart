// 출처: EnjoyTrip 최종보고서 부록 4(소스 코드)에서 옮긴 코드입니다. 원본 저장소는 남아 있지 않습니다.
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Recom2 extends StatelessWidget {
  final List<String> items;

  Recom2({required this.items});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Schedule Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Recom2ScheduleScreen(items: items),
    );
  }
}

class Recom2ScheduleScreen extends StatefulWidget {
  final List<String> items;

  Recom2ScheduleScreen({required this.items});

  @override
  _Recom2ScheduleScreenState createState() => _Recom2ScheduleScreenState();
}

class _Recom2ScheduleScreenState extends State<Recom2ScheduleScreen> {
  List<String> _items = [];
  List<TextEditingController> _controllers = [];

  @override
  void initState() {
    super.initState();
    _items = List.from(widget.items);
    _controllers =
        _items.map((item) => TextEditingController(text: item)).toList();
  }

  void _addItem() {
    setState(() {
      _items.add("새 일정 ${_items.length + 1}");
      _controllers.add(TextEditingController(text: "새 일정 ${_items.length}"));
    });
  }

  void _updateItem(int index, String newValue) {
    setState(() {
      _items[index] = newValue;
    });
  }

  @override
  void dispose() {
    _controllers.forEach((controller) => controller.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('나의 일정'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "첫째날",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Slidable(
                      key: ValueKey(index),
                      endActionPane: ActionPane(
                        motion: DrawerMotion(),
                        extentRatio: 0.25,
                        children: [
                          SlidableAction(
                            onPressed: (context) {
                              setState(() {
                                _items.removeAt(index);
                                _controllers.removeAt(index);
                              });
                            },
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                            label: '삭제',
                          ),
                        ],
                      ),
                      child: Container(
                        padding: EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 4.0,
                              spreadRadius: 2.0,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Icon(Icons.location_pin,
                                      size: 28, color: Colors.grey),
                                  SizedBox(width: 8),
                                  Expanded(
                                    child: TextField(
                                      controller: _controllers[index],
                                      onSubmitted: (newValue) {
                                        _updateItem(index, newValue);
                                      },
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                      ),
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.map, size: 28, color: Colors.blue),
                              onPressed: () {
                                // 지도 아이콘 누르면 동작할 코드
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addItem,
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 6.0,
        child: Container(
          height: 60,
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  // 여행자에게 일정 공유하기 버튼 누르면 동작할 코드
                },
                child: Text(
                  "여행자에게 일정 공유하기",
                  style: TextStyle(fontSize: 16, color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
