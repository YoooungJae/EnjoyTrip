// 출처: EnjoyTrip 최종보고서 부록 4(소스 코드)에서 옮긴 코드입니다. 원본 저장소는 남아 있지 않습니다.
import 'package:flutter/material.dart';
import 'cate2.dart'; // Import the next page

void main() {
  runApp(Cate1Page());
}

class Cate1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MySelectionButtons(),
    );
  }
}

class MySelectionButtons extends StatefulWidget {
  @override
  _MySelectionButtonsState createState() => _MySelectionButtonsState();
}

class _MySelectionButtonsState extends State<MySelectionButtons> {
  List<String> selectedOptions = [];

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
          title: Center(
            child: Text('여행조건설정'),
          ),
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
                'lib/assets/images/bar_1.png', // Replace with the path to your image asset
                fit: BoxFit.cover, // Adjust the image fit as needed
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0.5, vertical: 0.5),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: '     나이를 선택해 주세요.',
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
                    '      나이를 선택하는 것으로 시작하겠습니다.',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 3,
                padding: EdgeInsets.all(16),
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                children: [
                  buildSelectionButton('10~20대', 'age_1020', EdgeInsets.symmetric(horizontal: 1, vertical: 1)),
                  buildSelectionButton('30~40대', 'age_3040', EdgeInsets.symmetric(horizontal: 1, vertical: 1)),
                  buildSelectionButton('50대 이후', 'age_50', EdgeInsets.symmetric(horizontal: 1, vertical: 1)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  // NEXT 버튼을 누르면 cate2 페이지로 선택된 옵션을 전달하며 이동
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Cate2Page(selectedOptions: selectedOptions),
                    ),
                  );
                },
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all<Size>(Size(double.infinity, 80)), // Adjust width and height
                ),
                child: Text('NEXT'),
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
