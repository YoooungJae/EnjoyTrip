// 출처: EnjoyTrip 최종보고서 부록 4(소스 코드)에서 옮긴 코드입니다. 원본 저장소는 남아 있지 않습니다.
import 'package:flutter/material.dart';
import 'dart:convert'; // jsonDecode를 위한 import
import 'package:http/http.dart' as http; // http 패키지를 import
import 'recom1.dart';

void main() => runApp(AIScheduleScreen());

class AIScheduleScreen extends StatelessWidget {
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
  String selectedRecommendation = '';
  Map<String, List<String>> selectedSchedules = {};
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    fetchSchedules();
  }

  Future<void> fetchSchedules() async {
    setState(() {
      _loading = true;
    });

    final url = Uri.parse('http://<SERVER_HOST>:8000'); // 서버의 IP로 대체
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'selectedOptions': ['코토구', '맛집'] // 예시 선택 옵션
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body); // JSON 디코딩
      final List<List<String>> schedules = List<List<String>>.from(
        data['schedules'].map((schedule) => List<String>.from(schedule)),
      );

      setState(() {
        for (int i = 0; i < schedules.length; i++) {
          selectedSchedules['${i + 1}번째 추천'] = schedules[i];
        }
        _loading = false;
      });
    } else {
      setState(() {
        _loading = false;
      });
      throw Exception('일정 불러오기 실패');
    }
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
          title: Text(
            'AI 추천 일정',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {
                // Handle action button press
              },
            ),
          ],
        ),
        body: _loading
            ? Center(child: CircularProgressIndicator())
            : Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Text(
                '하루 일정 List',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Divider(
                color: Color(0xFFA1A1A1),
                thickness: 1,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  buildListItem(
                    '1번째 추천',
                    'lib/assets/images/shinjuku.png',
                    '신주쿠의 다채로운 여행',
                    '신주쿠는 화려한 스카이라인, 트렌디한 레스토랑, 그리고 평화로운 공원이 있는 도쿄의 대표적인 상업지역이에요.',
                    selectedSchedules['1번째 추천'],
                  ),
                  buildListItem(
                    '2번째 추천',
                    'lib/assets/images/shibuya(1).png',
                    '시부야의 도시적 매력',
                    '도쿄의 트렌디한 문화와 화려한 라이프스타일을 경험할 수 있는 상징적인 지역으로, 번화가와 고급 쇼핑, 유명한 거리 예술가의 작품까지 다양한 즐길 거리가 기다리고 있어요.',
                    selectedSchedules['2번째 추천'],
                  ),
                  buildListItem(
                    '3번째 추천',
                    'lib/assets/images/minato.png',
                    '미나토의 자연 여행',
                    '푸른 바다와 자연 경관, 전통과 현대의 조화로운 미나토는 역사적인 유적지부터 현대 아트 갤러리까지 다채로운 매력이 가득해요.',
                    selectedSchedules['3번째 추천'],
                  ),
                  buildListItem(
                    '4번째 추천',
                    'lib/assets/images/koto.png',
                    '주오의 다양한 여행',
                    '일본 주오구는 전통적인 신사와 신전, 현대적인 쇼핑몰, 그리고 풍부한 음식 문화로 다양한 관광 명소가 있어요.',
                    selectedSchedules['4번째 추천'],
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Find selected recommendation's schedule
                List<String>? selectedSchedule =
                selectedSchedules[selectedRecommendation];

                // Print selected schedule for verification
                if (selectedSchedule != null) {
                  print('Success: Selected Schedule: $selectedSchedule');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          Recom1(schedule: selectedSchedule),
                    ),
                  );
                } else {
                  print('Failed: No schedule selected');
                }
              },
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all<Size>(
                  Size(double.infinity, 50),
                ),
              ),
              child: Text('NEXT'),
            ),
            Container(
              color: Colors.grey[300],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.person),
                    onPressed: () {
                      // Action for My Information icon button
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.home),
                    onPressed: () {
                      // Action for Home icon button
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.calendar_today),
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

  Widget buildListItem(String recommendation, String imagePath, String title,
      String content, List<String>? schedule) {
    bool isSelected = selectedRecommendation == recommendation;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedRecommendation = recommendation;
        });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: isSelected ? Border.all(color: Colors.black, width: 2) : null,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      recommendation,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.chevron_right),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(imagePath),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            content,
                            style: TextStyle(
                              fontSize: 10,
                              color: Color(0xFF3A3C6A),
                            ),
                          ),
                          SizedBox(height: 10),
                          if (isSelected && schedule != null)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Selected Schedule:',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 5),
                                ...schedule.map((item) => Text(item)).toList(),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
