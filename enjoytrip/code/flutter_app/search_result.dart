// 출처: EnjoyTrip 최종보고서 부록 4(소스 코드)에서 옮긴 코드입니다. 원본 저장소는 남아 있지 않습니다.
import 'package:flutter/material.dart';
import '../../model/place.dart'; // 정확한 경로로 Place 클래스 임포트

class SearchResultScreen extends StatelessWidget {
  final String searchKeyword;
  final List<Place> searchResults;

  const SearchResultScreen(
      {Key? key, required this.searchKeyword, required this.searchResults})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String appBarTitle =
        searchKeyword.isNotEmpty ? '"$searchKeyword"로 검색한 결과' : '검색 결과';

    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
        backgroundColor: Colors.indigo[100], // AppBar의 배경색을 원하는 색상으로 변경
      ),
      body: ListView.builder(
        itemCount: searchResults.length,
        itemBuilder: (BuildContext context, int index) {
          final Place place = searchResults[index];
          return ListTile(
            title: Text(place.name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(place.location),
                Text(place.headline),
                Text(place.desc),
              ],
            ),
            leading: Image.asset(
              place.asset,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
            onTap: () {
              // 장소를 클릭했을 때 추가 작업을 할 수 있습니다.
            },
          );
        },
      ),
    );
  }
}
