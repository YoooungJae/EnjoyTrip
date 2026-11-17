// 출처: EnjoyTrip 최종보고서 부록 4(소스 코드)에서 옮긴 코드입니다. 원본 저장소는 남아 있지 않습니다.
import 'package:flutter/material.dart';
import 'package:enjoy_ui1/feature/enjoytrip_main/model/place.dart';
import 'search_result_screen.dart'; // 검색 결과를 표시할 새로운 화면

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Place> destinations = [
    Place(
      name: "디즈니 랜드",
      asset: "assets/Disney.png",
      location: "1-1 Maihama, Urayasu, Chiba 279-0031 일본",
      rating: 5.0,
      price: 0,
      headline:
          "도쿄 디즈니랜드는 일본 도쿄 근교의 지바현 우라야스시에 위치한 46만 5천 제곱미터 규모의 테마 파크이다. 미국 이외의 지역에서 건설된 첫 디즈니랜드로, 1983년 4월 15일 개장하였다.",
      desc: "",
      testimonials: [
        "assets/profile_1.jpeg",
        "assets/profile_2.jpeg",
        "assets/profile_3.jpeg",
        "assets/profile_4.jpeg",
      ],
    ),
    Place(
      name: "시부야 거리",
      asset: "assets/Shibuya.png",
      location: "일본 〒150-0042 도쿄도 시부야구 우다가와초",
      rating: 4.5,
      price: 0,
      headline:
          "시부야 센터 거리는 일본 도쿄도 시부야에 있는 거리로, 분카무라와 이노카시라도리 사이에 있는 길거리로 시부야역 앞 교차로에서 도큐 백화점 본점까지 약 350m 길이의 거리이다.",
      desc: "",
      testimonials: [
        "assets/profile_1.jpeg",
        "assets/profile_2.jpeg",
        "assets/profile_3.jpeg",
        "assets/profile_4.jpeg",
      ],
    ),
    Place(
      name: "아키하바라",
      asset: "assets/ak.jpeg",
      location: "Tokyo",
      rating: 4.7,
      price: 0,
      headline:
          "아키하바라는 활기 넘치는 쇼핑의 중심지로 작은 가판대부터 요도바시 멀티미디어 아키바 같은 대형 백화점까지 다양한 전자 제품 소매업으로 유명합니다. ",
      desc: "",
      testimonials: [
        "assets/profile_1.jpeg",
        "assets/profile_2.jpeg",
        "assets/profile_3.jpeg",
        "assets/profile_4.jpeg",
      ],
    ),
    Place(
      name: "나카미 세도리",
      asset: "assets/naka.jpg",
      location: "1 Chome-36-3 Asakusa, Taito City, Tokyo 111-0032 일본",
      rating: 5.7,
      price: 0,
      headline: "센소지의 정문과 본당을 연결하는 번화한 쇼핑가입니다.",
      desc: "",
      testimonials: [
        "assets/profile_1.jpeg",
        "assets/profile_2.jpeg",
        "assets/profile_3.jpeg",
        "assets/profile_4.jpeg",
      ],
    ),
    Place(
      name: "도쿄역 캐릭터 스트리트",
      asset: "assets/str.jpg",
      location:
          "일본 〒100-0005 Tokyo, Chiyoda City, Marunouchi, 1 Chome−9−1 東京駅一番街 B1",
      rating: 6.0,
      price: 0,
      headline: "애니메이션 및 만화 캐릭터 상품을 판매하는 매장이 있는 도쿄역 내부 중앙의 상가입니다.",
      desc: "",
      testimonials: [
        "assets/profile_1.jpeg",
        "assets/profile_2.jpeg",
        "assets/profile_3.jpeg",
        "assets/profile_4.jpeg",
      ],
    ),
    Place(
      name: "츠키지 시장 시겐, 야마초",
      asset: "assets/sijang.jpg",
      location: "4 Chome-14 Tsukiji, Chuo City, Tokyo 104-0045 일본",
      rating: 4.3,
      price: 0,
      headline: "쓰키치 장외시장",
      desc: "",
      testimonials: [
        "assets/profile_1.jpeg",
        "assets/profile_2.jpeg",
        "assets/profile_3.jpeg",
        "assets/profile_4.jpeg",
      ],
    ),
    Place(
      name: "긴자식스",
      asset: "assets/gim.jpg",
      location: "6 Chome-10-1 Ginza, Chuo City, Tokyo 104-0061 일본",
      rating: 7.0,
      price: 0,
      headline: "여러 명품 브랜드를 포함한 수백 개의 매장이 다목적 건물 내에서 영업 중이며 루프톱 정원도 있습니다.",
      desc: "",
      testimonials: [
        "assets/profile_1.jpeg",
        "assets/profile_2.jpeg",
        "assets/profile_3.jpeg",
        "assets/profile_4.jpeg",
      ],
    ),
    Place(
      name: "도버 스트리트 마켓 GU",
      asset: "assets/dover.jpg",
      location: "6 Chome-9-5 Ginza, Chuo City, Tokyo 104-0061 일본",
      rating: 7.7,
      price: 0,
      headline: "파리에서 시작된 고급 디자이너 브랜드 매장으로, 남성 및 여성 의류, 액세서리 등을 판매합니다.",
      desc: "",
      testimonials: [
        "assets/profile_1.jpeg",
        "assets/profile_2.jpeg",
        "assets/profile_3.jpeg",
        "assets/profile_4.jpeg",
      ],
    ),
    Place(
      name: "미츠코시 백화점",
      asset: "assets/mi.jpg",
      location: "4 Chome-6-16 Ginza, Chuo City, Tokyo 104-8212 일본",
      rating: 6.4,
      price: 0,
      headline: "디자이너 의류, 가정용품, 화장품 매장과 푸드홀, 레스토랑이 있는 백화점입니다.",
      desc: "",
      testimonials: [
        "assets/profile_1.jpeg",
        "assets/profile_2.jpeg",
        "assets/profile_3.jpeg",
        "assets/profile_4.jpeg",
      ],
    ),
    Place(
      name: "긴자 로프트",
      asset: "assets/loft.jpg",
      location: "일본 〒104-0061 Tokyo, Chuo City, Ginza, 2 Chome−4−6 ベルビア館 1階～5階",
      rating: 3.3,
      price: 0,
      headline: "매장 내 식사 및 배달 서비스 불가",
      desc: "",
      testimonials: [
        "assets/profile_1.jpeg",
        "assets/profile_2.jpeg",
        "assets/profile_3.jpeg",
        "assets/profile_4.jpeg",
      ],
    ),
    Place(
      name: "오모테산도",
      asset: "assets/omo.jpg",
      location: "4 Chome-12-10 Jingumae, Shibuya City, Tokyo 150-0001 일본",
      rating: 7.9,
      price: 0,
      headline: "독특한 삼각형 구조의 실내 쇼핑몰로 여러 층에 고급 상점이 들어서 있습니다.",
      desc: "",
      testimonials: [
        "assets/profile_1.jpeg",
        "assets/profile_2.jpeg",
        "assets/profile_3.jpeg",
        "assets/profile_4.jpeg",
      ],
    ),
    Place(
      name: "키디랜드",
      asset: "assets/kidi.jpg",
      location:
          "일본 〒150-0001 Tokyo, Shibuya City, Jingumae, 6 Chome−1−9 キデイランド原宿店",
      rating: 8.5,
      price: 0,
      headline: "4층 규모의 활기 넘치는 소매점으로 다양한 미국 및 일본 장난감을 판매합니다.",
      desc: "",
      testimonials: [
        "assets/profile_1.jpeg",
        "assets/profile_2.jpeg",
        "assets/profile_3.jpeg",
        "assets/profile_4.jpeg",
      ],
    ),
    Place(
      name: "시부야 스크램블 교차로",
      asset: "assets/scramble.jpg",
      location: "2 Chome-24-12 Shibuya, Shibuya City, Tokyo 150-0002 일본",
      rating: 9.3,
      price: 0,
      headline: "일본 전통 수공예품과 음식, 프랑스식 페이스트리, 230m 높이의 전망대가 있는 세련된 쇼핑몰입니다.",
      desc: "",
      testimonials: [
        "assets/profile_1.jpeg",
        "assets/profile_2.jpeg",
        "assets/profile_3.jpeg",
        "assets/profile_4.jpeg",
      ],
    ),
    Place(
      name: "아사쿠사",
      asset: "assets/asa.jpg",
      location: "〒111-0032 도쿄도 다이토구",
      rating: 4.5,
      price: 999,
      headline:
          "아사쿠사는 옛 도쿄의 분위기를 간직하고 있는 지역으로 유서 깊은 센소지 인근의 나카미세 거리에는 전통적인 공예품점과 길거리 음식 노점이 있습니다. "
          "",
      desc: "",
      testimonials: [
        "assets/profile_1.jpeg",
        "assets/profile_2.jpeg",
        "assets/profile_3.jpeg",
        "assets/profile_4.jpeg",
      ],
    ),
    Place(
      name: "스미다강변 도쿄크루즈",
      asset: "assets/smida.jpg",
      location: "〒131-0031 도쿄도 스미다구",
      rating: 4.5,
      price: 999,
      headline: "강변에 위치한 스미다 지역은 후지산 전망의 전망대가 있는 날렵한 전파탑 도쿄 스카이트리로 유명합니다. ",
      desc: "",
      testimonials: [
        "assets/profile_1.jpeg",
        "assets/profile_2.jpeg",
        "assets/profile_3.jpeg",
        "assets/profile_4.jpeg",
      ],
    ),
    Place(
      name: "오다이바 공원",
      asset: "assets/odai.jpg",
      location: "1 Chome-4 Daiba, Minato City, Tokyo 135-0091 일본",
      rating: 4.5,
      price: 999,
      headline: "레인보우 브리지와 시내 경관이 보이며 산책로와 작은 자유의 여신상이 있는 해안가의 녹지입니다.",
      desc: "",
      testimonials: [
        "assets/profile_1.jpeg",
        "assets/profile_2.jpeg",
        "assets/profile_3.jpeg",
        "assets/profile_4.jpeg",
      ],
    ),
    Place(
      name: "산리오 월드 도쿄 플라자",
      asset: "assets/sanrio.jpg",
      location: "일본 〒104-0061 Tokyo, Chuo City, Ginza, 4 Chome−1−先 西銀座 2F",
      rating: 4.5,
      price: 999,
      headline: "헬로 키티와 다른 만화 캐릭터가 그려진 선물, 의류, 액세서리를 판매하는 체인점입니다.",
      desc: "",
      testimonials: [
        "assets/profile_1.jpeg",
        "assets/profile_2.jpeg",
        "assets/profile_3.jpeg",
        "assets/profile_4.jpeg",
      ],
    ),
    Place(
      name: "세리아 긴자점",
      asset: "assets/seria.jpg",
      location:
          "일본 〒104-0061 Tokyo, Chuo City, Ginza, 5 Chome−7−10 イグジットメルサ 5階",
      rating: 4.5,
      price: 999,
      headline: "",
      desc: "",
      testimonials: [
        "assets/profile_1.jpeg",
        "assets/profile_2.jpeg",
        "assets/profile_3.jpeg",
        "assets/profile_4.jpeg",
      ],
    ),
    Place(
      name: "스카이 트리",
      asset: "assets/sky.jpg",
      location: "1 Chome-1-2 Oshiage, Sumida City, Tokyo 131-0045 일본",
      rating: 4.5,
      price: 999,
      headline: "360도 전망을 자랑하는 전망대가 있는 세계에서 가장 높은 독립형 전파탑입니다.",
      desc: "",
      testimonials: [
        "assets/profile_1.jpeg",
        "assets/profile_2.jpeg",
        "assets/profile_3.jpeg",
        "assets/profile_4.jpeg",
      ],
    ),
    Place(
      name: "도쿄 소라마치",
      asset: "assets/sora.jpg",
      location: "1 Chome-1-2 Oshiage, Sumida City, Tokyo 131-0045 일본",
      rating: 4.5,
      price: 999,
      headline: "도쿄 스카이트리 타워에 위치한 다층 소매 단지로 300여 개 매장과 레스토랑이 있습니다.",
      desc: "",
      testimonials: [
        "assets/profile_1.jpeg",
        "assets/profile_2.jpeg",
        "assets/profile_3.jpeg",
        "assets/profile_4.jpeg",
      ],
    ),
    Place(
      name: "아사히 맥주 빌딩",
      asset: "assets/asai.jpg",
      location: "1 Chome-23-1 Azumabashi, Sumida City, Tokyo 130-0001 일본",
      rating: 4.5,
      price: 999,
      headline: "아사히 본사가 있는 호박색의 유리 건물로 유명한 황금 불꽃 조형물과 바가 있습니다.",
      desc: "",
      testimonials: [
        "assets/profile_1.jpeg",
        "assets/profile_2.jpeg",
        "assets/profile_3.jpeg",
        "assets/profile_4.jpeg",
      ],
    ),
    Place(
      name: "아키하바라 애니메이트 아키바점",
      asset: "assets/aki.jpg",
      location: "4 Chome-3-1 Sotokanda, Chiyoda City, Tokyo 101-0021 일본",
      rating: 4.5,
      price: 999,
      headline: "매장 수령 가능",
      desc: "",
      testimonials: [
        "assets/profile_1.jpeg",
        "assets/profile_2.jpeg",
        "assets/profile_3.jpeg",
        "assets/profile_4.jpeg",
      ],
    ),
    Place(
      name: "가마쿠라코코마에",
      asset: "assets/kamakura.jpg",
      location: "1-chōme-1 Koshigoe, Kamakura, Kanagawa 248-0033 일본",
      rating: 4.5,
      price: 999,
      headline: "인근에 바다가 있는 지역",
      desc: "",
      testimonials: [
        "assets/profile_1.jpeg",
        "assets/profile_2.jpeg",
        "assets/profile_3.jpeg",
        "assets/profile_4.jpeg",
      ],
    ),
    Place(
      name: "스미다 수족관",
      asset: "assets/smida.jpg",
      location:
          "일본 〒131-0045 Tokyo, Sumida City, Oshiage, 1 Chome−1−2 東京スカイツリータウン・ソラマチ ５階～６階",
      rating: 4.5,
      price: 999,
      headline: "다양한 물고기와 펭귄 무리가 살고 있으며 카페도 갖추고 있는 세련되고 현대적인 수족관입니다.",
      desc: "",
      testimonials: [
        "assets/profile_1.jpeg",
        "assets/profile_2.jpeg",
        "assets/profile_3.jpeg",
        "assets/profile_4.jpeg",
      ],
    ),
    Place(
      name: "세이코 하우스",
      asset: "assets/seiko.jpg",
      location: "4 Chome-5-11 Ginza, Chuo City, Tokyo 104-0061 일본",
      rating: 4.5,
      price: 999,
      headline: "긴자에 위치한 최대 규모의 쇼핑몰",
      desc: "",
      testimonials: [
        "assets/profile_1.jpeg",
        "assets/profile_2.jpeg",
        "assets/profile_3.jpeg",
        "assets/profile_4.jpeg",
      ],
    ),
    Place(
      name: "미야시티파크",
      asset: "assets/miya.jpg",
      location: "6 Chome-20-10 Jingumae, Shibuya City, Tokyo 150-0001 일본",
      rating: 4.5,
      price: 999,
      headline: "식당, 고급 쇼핑몰, 비치 발리볼 코트, 루프톱 정원이 있는 쇼핑몰입니다.",
      desc: "",
      testimonials: [
        "assets/profile_1.jpeg",
        "assets/profile_2.jpeg",
        "assets/profile_3.jpeg",
        "assets/profile_4.jpeg",
      ],
    ),
    Place(
      name: "요요기 공원",
      asset: "assets/yoyo.jpg",
      location: "2-1 Yoyogikamizonocho, Shibuya City, Tokyo 151-0052 일본",
      rating: 4.5,
      price: 999,
      headline: "호수, 분수, 성목으로 가득한 숲이 있는 대형 공원입니다.",
      desc: "",
      testimonials: [
        "assets/profile_1.jpeg",
        "assets/profile_2.jpeg",
        "assets/profile_3.jpeg",
        "assets/profile_4.jpeg",
      ],
    ),
    Place(
      name: "메이지 신궁",
      asset: "assets/maygi.jpg",
      location: "1-1 Yoyogikamizonocho, Shibuya City, Tokyo 151-8557 일본",
      rating: 4.5,
      price: 999,
      headline: "숲으로 둘러싸여 있는 이 신사에는 계절마다 변화하는 붓꽃 정원이 있습니다.",
      desc: "",
      testimonials: [
        "assets/profile_1.jpeg",
        "assets/profile_2.jpeg",
        "assets/profile_3.jpeg",
        "assets/profile_4.jpeg",
      ],
    ),
    Place(
      name: "유니클로 긴자점",
      asset: "assets/uni.jpg",
      location:
          "일본 〒104-0061 Tokyo, Chuo City, Ginza, 6 Chome−9−5 ギンザコマツ東館 1－12F",
      rating: 4.5,
      price: 999,
      headline: "매장 내 쇼핑 가능하며 매장 수령 가능",
      desc: "",
      testimonials: [
        "assets/profile_1.jpeg",
        "assets/profile_2.jpeg",
        "assets/profile_3.jpeg",
        "assets/profile_4.jpeg",
      ],
    ),
    Place(
      name: "센소지",
      asset: "assets/sen.jpg",
      location: "2 Chome-3-1 Asakusa, Taito City, Tokyo 111-0032 일본",
      rating: 4.5,
      price: 999,
      headline: "도쿄에서 가장 오래되었으며 645년에 완공된 이 사원은 자비의 여신인 관음을 기리기 위해 세워졌습니다.",
      desc: "",
      testimonials: [
        "assets/profile_1.jpeg",
        "assets/profile_2.jpeg",
        "assets/profile_3.jpeg",
        "assets/profile_4.jpeg",
      ],
    ),
    Place(
      name: "벳푸 효탄온천",
      asset: "assets/hyotan.jpg",
      location: "159-2 Kannawa, Beppu, Oita 874-0042 일본",
      rating: 4.5,
      price: 999,
      headline: "노천탕과 실내 탕을 갖춘 조용한 분위기의 온천으로 개인 옵션과 일식도 제공합니다.",
      desc: "",
      testimonials: [
        "assets/profile_1.jpeg",
        "assets/profile_2.jpeg",
        "assets/profile_3.jpeg",
        "assets/profile_4.jpeg",
      ],
    ),
    Place(
      name: "평화공원",
      asset: "assets/pyeong.jpg",
      location: "9 Matsuyamamachi, Nagasaki, 852-8118 일본",
      rating: 4.5,
      price: 999,
      headline:
          "1955년에 건설된 장엄하고 평화로운 공원으로 원자 폭탄으로 사망한 사람들을 기리고 평화를 기원하기 위한 곳입니다.",
      desc: "",
      testimonials: [
        "assets/profile_1.jpeg",
        "assets/profile_2.jpeg",
        "assets/profile_3.jpeg",
        "assets/profile_4.jpeg",
      ],
    ),
    Place(
      name: "포켓몬센터",
      asset: "assets/poket.jpg",
      location:
          "일본 〒170-6002 Tokyo, Toshima City, Higashiikebukuro, 3 Chome−1−2 サンシャインシティ 専門店街アルパ 2F",
      rating: 4.5,
      price: 999,
      headline: "컴퓨터 게임의 선풍을 일으킨 포켓몬 캐릭터가 총집합된 초대형 상점입니다.",
      desc: "",
      testimonials: [
        "assets/profile_1.jpeg",
        "assets/profile_2.jpeg",
        "assets/profile_3.jpeg",
        "assets/profile_4.jpeg",
      ],
    ),
    Place(
      name: "캔들타워",
      asset: "assets/candle.jpg",
      location: "4 Chome-2-8 Shibakoen, Minato City, Tokyo 105-0011 일본",
      rating: 4.5,
      price: 999,
      headline: "",
      desc: "",
      testimonials: [
        "assets/profile_1.jpeg",
        "assets/profile_2.jpeg",
        "assets/profile_3.jpeg",
        "assets/profile_4.jpeg",
      ],
    ),
    Place(
      name: "네즈신사",
      asset: "assets/nez.jpg",
      location: "1 Chome-28-9 Nezu, Bunkyo City, Tokyo 113-0031 일본",
      rating: 4.5,
      price: 999,
      headline: "터널처럼 줄지어 선 도리이 문과 봄철 진달래로 유명한 한적한 신사입니다.",
      desc: "",
      testimonials: [
        "assets/profile_1.jpeg",
        "assets/profile_2.jpeg",
        "assets/profile_3.jpeg",
        "assets/profile_4.jpeg",
      ],
    ),
    Place(
      name: "화폐박물관",
      asset: "assets/hwa.jpg",
      location:
          "일본 〒103-0021 Tokyo, Chuo City, Nihonbashihongokucho, 1 Chome−3−1 日本銀行分館内",
      rating: 4.5,
      price: 999,
      headline: "무료 관람이 가능하며 일본 화폐에 대한 정보가 전시되어 있다.",
      desc: "",
      testimonials: [
        "assets/profile_1.jpeg",
        "assets/profile_2.jpeg",
        "assets/profile_3.jpeg",
        "assets/profile_4.jpeg",
      ],
    ),
    Place(
      name: "에노시마 신사",
      asset: "assets/sima.jpg",
      location: "2 Chome-3-8 Enoshima, Fujisawa, Kanagawa 251-0036 일본",
      rating: 4.5,
      price: 999,
      headline: "3개의 고대 신사, 아름다운 경내, 탁 트인 풍경을 선사하는 산 정상의 신사 단지입니다.",
      desc: "",
      testimonials: [
        "assets/profile_1.jpeg",
        "assets/profile_2.jpeg",
        "assets/profile_3.jpeg",
        "assets/profile_4.jpeg",
      ],
    ),
    Place(
      name: "롯폰기",
      asset: "assets/rot.jpeg",
      location: "〒106-0032 도쿄도 미나토구",
      rating: 4.5,
      price: 999,
      headline:
          "롯폰기는 활기 넘치는 엔터테인먼트 지구로 현지인과 관광객들이 함께 모여 인기 바와 클럽에서 밤늦게까지 춤을 춥니다. ",
      desc: "",
      testimonials: [
        "assets/profile_1.jpeg",
        "assets/profile_2.jpeg",
        "assets/profile_3.jpeg",
        "assets/profile_4.jpeg",
      ],
    ),
    Place(
      name: "우에노 동물원",
      asset: "assets/ueno.jpg",
      location: "9-83 Uenokoen, Taito City, Tokyo 110-8711 일본",
      rating: 4.5,
      price: 999,
      headline: "판다를 포함한 400여 종의 동물이 사는 19세기 동물원에 동물 체험장과 5층 탑이 있습니다.",
      desc: "",
      testimonials: [
        "assets/profile_1.jpeg",
        "assets/profile_2.jpeg",
        "assets/profile_3.jpeg",
        "assets/profile_4.jpeg",
      ],
    ),
    Place(
      name: "지브리 미술관",
      asset: "assets/zebri.jpg",
      location: "1 Chome-1-83 Shimorenjaku, Mitaka, Tokyo 181-0013 일본",
      rating: 4.5,
      price: 999,
      headline:
          "유명 애니메이션 스튜디오에 들어서 있는 독특한 박물관으로 내부에 놀이 공간, 극장, 루프톱 정원이 마련되어 있습니다.",
      desc: "",
      testimonials: [
        "assets/profile_1.jpeg",
        "assets/profile_2.jpeg",
        "assets/profile_3.jpeg",
        "assets/profile_4.jpeg",
      ],
    ),
    Place(
      name: "긴자 미츠코시 백화점",
      asset: "assets/miz.jpg",
      location: "4 Chome-6-16 Ginza, Chuo City, Tokyo 104-8212 일본",
      rating: 4.5,
      price: 999,
      headline: "디자이너 의류, 가정용품, 화장품 매장과 푸드홀, 레스토랑이 있는 백화점입니다.",
      desc: "",
      testimonials: [
        "assets/profile_1.jpeg",
        "assets/profile_2.jpeg",
        "assets/profile_3.jpeg",
        "assets/profile_4.jpeg",
      ],
    ),
    Place(
      name: "베네치안 곤돌라",
      asset: "assets/bene.jpg",
      location: "일본 〒279-0031 Chiba, Urayasu, Maihama, 1−1, ディズニー シー",
      rating: 4.5,
      price: 999,
      headline: "디즈니씨의 베니스를 본뜬 지역에 있는 어트랙션으로 아름다운 야경이 유명하다.",
      desc: "",
      testimonials: [
        "assets/profile_1.jpeg",
        "assets/profile_2.jpeg",
        "assets/profile_3.jpeg",
        "assets/profile_4.jpeg",
      ],
    ),
    Place(
      name: "모토하코네 항구",
      asset: "assets/moto.jpg",
      location:
          "164 Motohakone, Hakone, Ashigarashimo District, Kanagawa 250-0522 일본",
      rating: 4.5,
      price: 999,
      headline: "이국적인 풍경을 뽐내는 호수가 있으며 넓은 자연경관에서 편안함을 느낄 수 있는 장소이다.",
      desc: "",
      testimonials: [
        "assets/profile_1.jpeg",
        "assets/profile_2.jpeg",
        "assets/profile_3.jpeg",
        "assets/profile_4.jpeg",
      ],
    ),
    Place(
      name: "오와쿠다니",
      asset: "assets/owa.jpg",
      location:
          "1251 Sengokuhara, Hakone, Ashigarashimo District, Kanagawa 250-0631 일본",
      rating: 4.5,
      price: 999,
      headline: "방문객들은 후지산을 즐기며 지열 지대 온천수로 삶은 까만 달걀을 맛볼 수 있습니다.",
      desc: "",
      testimonials: [
        "assets/profile_1.jpeg",
        "assets/profile_2.jpeg",
        "assets/profile_3.jpeg",
        "assets/profile_4.jpeg",
      ],
    ),
    Place(
      name: "신궁외원 은행나무거리",
      asset: "assets/sin.jpg",
      location: "2 Chome-付近 Kita-Aoyama, Minato City, Tokyo 107-0061 일본",
      rating: 4.5,
      price: 999,
      headline: "선명한 가을 단풍과 소프트볼 경기장, 테니스 코트 등 다양한 스포츠 시설로 유명한 도심 공원입니다.",
      desc: "",
      testimonials: [
        "assets/profile_1.jpeg",
        "assets/profile_2.jpeg",
        "assets/profile_3.jpeg",
        "assets/profile_4.jpeg",
      ],
    ),
    Place(
      name: "도쿄 국립 박물관",
      asset: "assets/museum.jpg",
      location: "13-9 Uenokoen, Taito City, Tokyo 110-8712 일본",
      rating: 4.5,
      price: 999,
      headline: "일본과 다른 아시아 국가의 예술 작품과 유물을 주로 선보이는 웅장한 박물관 단지입니다.",
      desc: "",
      testimonials: [
        "assets/profile_1.jpeg",
        "assets/profile_2.jpeg",
        "assets/profile_3.jpeg",
        "assets/profile_4.jpeg",
      ],
    ),
    Place(
      name: "야메요코 시장",
      asset: "assets/yoko.jpg",
      location: "6 Chome-10 Ueno, Taito City, Tokyo 110-0005 일본",
      rating: 4.5,
      price: 999,
      headline: "우에노 근처에 위치한 상점가",
      desc: "",
      testimonials: [
        "assets/profile_1.jpeg",
        "assets/profile_2.jpeg",
        "assets/profile_3.jpeg",
        "assets/profile_4.jpeg",
      ],
    ),
    Place(
      name: "다이버 시티",
      asset: "assets/diver.jpg",
      location: "1 Chome-1-10 Aomi, Koto City, Tokyo 135-0064 일본",
      rating: 4.5,
      price: 999,
      headline: "8층 규모의 쇼핑몰에 유명 브랜드 패션 및 용품 매장, 레스토랑, 엔터테인먼트 센터, 행사장이 있습니다.",
      desc: "",
      testimonials: [
        "assets/profile_1.jpeg",
        "assets/profile_2.jpeg",
        "assets/profile_3.jpeg",
        "assets/profile_4.jpeg",
      ],
    ),
    Place(
      name: "코스모 월드",
      asset: "assets/cosmo.jpg",
      location: "2 Chome-8-1 Shinko, Naka Ward, Yokohama, Kanagawa 231-0001 일본",
      rating: 4.5,
      price: 999,
      headline: "거대한 관람차, 고속 롤러코스터 등 다양한 놀이기구가 있는 가족을 위한 놀이공원입니다.",
      desc: "",
      testimonials: [
        "assets/profile_1.jpeg",
        "assets/profile_2.jpeg",
        "assets/profile_3.jpeg",
        "assets/profile_4.jpeg",
      ],
    ),
    Place(
      name: "호시노 온천",
      asset: "assets/hosi.jpg",
      location: "일본 〒389-0111 나가노현 Kitasaku District, 가루이자와마치 나가쿠라",
      rating: 4.5,
      price: 999,
      headline: "도쿄에 위치한 온천",
      desc: "",
      testimonials: [
        "assets/profile_1.jpeg",
        "assets/profile_2.jpeg",
        "assets/profile_3.jpeg",
        "assets/profile_4.jpeg",
      ],
    ),
    Place(
      name: "카부키쵸 골든마치",
      asset: "assets/golden.jpg",
      location: "1 Chome-1-6 Kabukicho, Shinjuku City, Tokyo 160-0021 일본",
      rating: 4.5,
      price: 999,
      headline:
          "축제 분위기가 물씬 풍기는 인기 도심 지역이며, 골목이 좁고 구불구불하고, 아늑한 선술집이 많은 것으로 유명합니다.",
      desc: "",
      testimonials: [
        "assets/profile_1.jpeg",
        "assets/profile_2.jpeg",
        "assets/profile_3.jpeg",
        "assets/profile_4.jpeg",
      ],
    ),
    Place(
      name: "모리타워",
      asset: "assets/mori.jpg",
      location: "6 Chome-10-1 Roppongi, Minato City, Tokyo 106-0032 일본",
      rating: 4.5,
      price: 999,
      headline: "54층 높이의 오피스 타워로, 미술관, 전망대, 상점, 식당이 있습니다.",
      desc: "",
      testimonials: [
        "assets/profile_1.jpeg",
        "assets/profile_2.jpeg",
        "assets/profile_3.jpeg",
        "assets/profile_4.jpeg",
      ],
    ),
  ];

  List<Place> filteredDestinations = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    filteredDestinations.addAll(destinations);
    super.initState();
  }

  void filterSearchResults(String query) {
    List<Place> dummySearchList = destinations;
    if (query.isNotEmpty) {
      List<Place> dummyListData = [];
      dummySearchList.forEach((item) {
        if (item.name.toLowerCase().contains(query.toLowerCase())) {
          dummyListData.add(item);
        }
      });
      setState(() {
        filteredDestinations.clear();
        filteredDestinations.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        filteredDestinations.clear();
        filteredDestinations.addAll(destinations);
      });
    }
  }

  void navigateToSearchResults(List<Place> results) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SearchResultScreen(
          searchResults: results,
          searchKeyword: '',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: searchController,
          onChanged: (value) {
            filterSearchResults(value);
          },
          onSubmitted: (value) {
            // 엔터를 누르면 검색 결과를 즉시 표시하고 검색 결과 화면으로 이동
            filterSearchResults(value);
            navigateToSearchResults(filteredDestinations);
          },
          decoration: InputDecoration(
            hintText: '검색어를 입력해주세요',
            border: InputBorder.none,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: filteredDestinations.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(filteredDestinations[index].name),
            onTap: () {
              // 검색 결과를 새로운 화면으로 전달
              navigateToSearchResults([filteredDestinations[index]]);
            },
          );
        },
      ),
    );
  }
}
