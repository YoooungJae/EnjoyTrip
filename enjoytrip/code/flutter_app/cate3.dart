// 출처: EnjoyTrip 최종보고서 부록 4(소스 코드)에서 옮긴 코드입니다. 원본 저장소는 남아 있지 않습니다.
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'cate4.dart';

void main() {
  runApp(Cate3Page(selectedOptions: [],));
}

class Cate3Page extends StatelessWidget {
  final List<String> selectedOptions;

  Cate3Page({required this.selectedOptions});

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

  @override
  void initState() {
    super.initState();
    selectedOptions = List.from(widget.selectedOptions); // Copying the list from widget to avoid direct modification
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
                'lib/assets/images/bar_2.png',
                fit: BoxFit.cover,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 0.5, vertical: 0.5),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: '      어느 지역으로 가시나요?',
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
                  child: Text(
                    '      지역별 여행 계획을 맞춤화하세요.',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                    child: buildSelectionButton(
                        '신주쿠구',
                        '신주쿠구',
                        EdgeInsets.symmetric(horizontal: 16, vertical: 30)
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                    child: buildSelectionButton(
                        '시부야',
                        '시부야',
                        EdgeInsets.symmetric(horizontal: 16, vertical: 30)
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                    child: buildSelectionButton(
                        '미나토구',
                        '미나토구',
                        EdgeInsets.symmetric(horizontal: 16, vertical: 30)
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                    child: buildSelectionButton(
                        '코토구',
                        '코토구',
                        EdgeInsets.symmetric(horizontal: 16, vertical: 30)
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  // Action for the long button
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Cate4Page(selectedOptions: selectedOptions)),
                  );
                },
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all<Size>(
                      Size(double.infinity, 50)), // Adjust width and height
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
          Colors.white,
        ),
        padding: MaterialStateProperty.all<EdgeInsets>(padding),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            side: BorderSide(
              color: isSelected ? Colors.black : Colors.transparent,
            ),
          ),
        ),
        overlayColor: MaterialStateProperty.all<Color>(
          Colors.black.withOpacity(0.1),
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
      ),
    );
  }
}
