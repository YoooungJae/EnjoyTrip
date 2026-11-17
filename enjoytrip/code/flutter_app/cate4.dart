// 출처: EnjoyTrip 최종보고서 부록 4(소스 코드)에서 옮긴 코드입니다. 원본 저장소는 남아 있지 않습니다.
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'AIScheduleScreen.dart';


void main() {
  runApp(Cate4Page(selectedOptions: []));
}

class Cate4Page extends StatelessWidget {
  final List<String> selectedOptions;

  Cate4Page({required this.selectedOptions});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MySelectionButtons(selectedOptions: selectedOptions),
    );
  }
}

class MySelectionButtons extends StatefulWidget {
  final List<String> selectedOptions;

  MySelectionButtons({required this.selectedOptions});

  @override
  _MySelectionButtonsState createState() => _MySelectionButtonsState(selectedOptions: selectedOptions);
}

class _MySelectionButtonsState extends State<MySelectionButtons> {
  late List<String> selectedOptions;

  _MySelectionButtonsState({required this.selectedOptions});

  void sendDataToServer(List<String> data) async {
    var url = Uri.parse('http://<SERVER_HOST>:8000'); // 서버의 경로에 맞게 수정
    var jsonData = jsonEncode({"selectedOptions": data});

    var response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonData,
    );

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              // Handle back button press
            },
          ),
          title: Text('여행조건설정'),
          actions: [
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {
                // Handle action button press
              },
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'lib/assets/images/bar_4.png', // Replace 'your_image.jpg' with the path to your image asset
                fit: BoxFit.cover, // Adjust the image fit as needed
              ),
            ),

            //================================================================================
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0.5, vertical: 0.5),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: '     당신의 취향에 맞게 당신의\n     모험을 선택해봐요.',
                      hintMaxLines: 2,
                      border: InputBorder.none,
                    ),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('      여행 선호도를 선택하여 여행 계획을 맞춤화하세요.',
                    style: TextStyle(
                      //fontStyle: FontStyle.italic, 글씨 기울기
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            //================================================================================

            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 3,
                padding: EdgeInsets.all(16),
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                children: [
                  buildSelectionButton('관광명소', '관광명소', EdgeInsets.symmetric(horizontal: 1, vertical: 1)),
                  buildSelectionButton('쇼핑', '쇼핑', EdgeInsets.symmetric(horizontal: 1, vertical: 1)),
                  buildSelectionButton('아트&디자인', '아트&디자인', EdgeInsets.symmetric(horizontal: 1, vertical: 1)),
                  buildSelectionButton('애니메이션&만화', '애니메이션&만화', EdgeInsets.symmetric(horizontal: 1, vertical: 1)),
                  buildSelectionButton('자연', '자연', EdgeInsets.symmetric(horizontal: 1, vertical: 1)),
                  buildSelectionButton('맛집', '맛집', EdgeInsets.symmetric(horizontal: 1, vertical: 1)),
                  buildSelectionButton('온천', '온천', EdgeInsets.symmetric(horizontal: 1, vertical: 1)),
                  buildSelectionButton('역사', '역사', EdgeInsets.symmetric(horizontal: 1, vertical: 1)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  sendDataToServer(selectedOptions); // 데이터를 서버로 전송
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AIScheduleScreen()),
                  );
                },
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all<Size>(Size(double.infinity, 50)), // Adjust width and height
                ),
                child: Text('NEXT'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Selected Options: ${selectedOptions.join(', ')}',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
            Container(
              color: Colors.grey[300],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.person), // My Information icon
                    onPressed: () {
                      // Action for My Information icon button
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.home), // Home icon
                    onPressed: () {
                      // Action for Home icon button
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.calendar_today), // Schedule icon
                    onPressed: () {
                      // Action for Schedule icon button
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSelectionButton(String title, String value, EdgeInsets padding) {
    bool isSelected = selectedOptions.contains(value);
    return ElevatedButton(
      onPressed: () {
        setState(() {
          if (isSelected) {
            selectedOptions.remove(value);
          } else {
            selectedOptions.add(value);
          }
        });
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          isSelected ? Colors.blue : Colors.grey,
        ),
        padding: MaterialStateProperty.all<EdgeInsets>(padding),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontSize: 16,
        ),
      ),
    );
  }
}
