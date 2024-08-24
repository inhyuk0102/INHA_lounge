// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:mt_first_flutter/widgets/lounges.dart';

const String InduckSrc =
    "https://lh6.googleusercontent.com/proxy/f8wkbjBQXojWRlu4lU7W4BizMThgPthrris7n7hJMHX_sC8lhLbt0kf6LAM-pVIer7Jsp66KWwoSIMcM68E";

Map<String, dynamic> loungesInfo = {
  "60주년 기념관": [
    ["해동라운지", "60주년 기념관 1층", null, "몰라", "혼잡"],
    ["월천라운지", "60주년 기념관 1층", null, "몰라", "보통"],
    ["대충 창가자리", "60주년 기념관 1층", null, "무휴", "혼잡"]
  ],
  "정석학술정보관": [
    ["정석 라운지", "1층", null, "몰루", "혼잡"]
  ],
  "하이테크센터": [
    [
      "해동 스터디룸",
      "하이테크센터 123호",
      "https://engcollege.inha.ac.kr/sites/engineering/images/fac_07.jpg",
      "05:00 ~ 24:00 연중무휴",
      "혼잡"
    ],
    [
      "학생라운지 스터디룸",
      "하이테크센터 021호",
      "https://engcollege.inha.ac.kr/sites/engineering/images/fac_12.jpg",
      "05:00 ~ 24:00 연중무휴",
      "보통",
    ],
    [
      "해동돋을볕 라운지",
      "하이테크센터 122호",
      "https://engcollege.inha.ac.kr/sites/engineering/images/fac_06.jpg",
      "24시간 연중무휴",
      "원활"
    ]
  ],
  '5호관': [
    ["Tlqkf", "힣", null, "히히힣", "원활"]
  ],
  '2호관': [
    [
      "해동나눔 라운지",
      "2북 695호",
      null,
      "24시간 연중무휴",
      "원활",
    ]
  ],
};

Map<String, dynamic> loungesPath = {
  "60주년 기념관": [
    "60주년 기념관 1층",
    "60주년 기념관 1층",
    "60주년 기념관 1층",
  ],
  "정석학술정보관": ["1층"],
  "하이테크센터": [
    "하이테크센터 123호",
    "하이테크센터 021호",
    "하이테크센터 122호",
  ],
  '5호관': ["d"],
  '2호관': ["2북 695호"],
};
Map<String, dynamic> LoungesImg = {
  "60주년 기념관": [InduckSrc],
  "정석학술정보관": [InduckSrc],
  "하이테크센터": [
    "https://engcollege.inha.ac.kr/sites/engineering/images/fac_07.jpg",
    "https://engcollege.inha.ac.kr/sites/engineering/images/fac_12.jpg",
    "https://engcollege.inha.ac.kr/sites/engineering/images/fac_06.jpg",
  ],
  '5호관': [InduckSrc],
  '2호관': ["https://engcollege.inha.ac.kr/sites/engineering/images/fac_05.jpg"],
};
Map<String, dynamic> LoungesTime = {
  "60주년 기념관": ["해동라운지", "정석라운지", "대충 창가자리"],
  "정석학술정보관": ["1층 라운지"],
  "하이테크센터": [
    "05:00 ~ 24:00 연중무휴",
    "05:00 ~ 24:00 연중무휴",
    "24시간 연중무휴",
  ],
  '5호관': ["몰라"],
  '2호관': ["해동나눔 라운지"],
};

class buildings_screen extends StatefulWidget {
  bool isLiked = false;
  final String BuildingName;
  buildings_screen({super.key, required this.BuildingName});

  @override
  State<buildings_screen> createState() => _buildings_screenState();
}

class _buildings_screenState extends State<buildings_screen> {
  onheartTap() {
    setState(() {
      widget.isLiked = !widget.isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        elevation: 2,
        title: Text(
          widget.BuildingName,
          style: const TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Expanded(child: makeList(widget.BuildingName)),
        ],
      ),
    );
  }

  ListView makeList(String BuildingName) {
    return ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(
              width: 20,
              height: 20,
            ),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        itemCount: loungesInfo[BuildingName].length,
        itemBuilder: (context, index) {
          var loungee = loungesInfo[BuildingName][index];

          return lounge(
            LoungeName: loungee[0],
            loungesPath: loungee[1],
            LoungesImg: loungee[2] ??
                "https://lh6.googleusercontent.com/proxy/f8wkbjBQXojWRlu4lU7W4BizMThgPthrris7n7hJMHX_sC8lhLbt0kf6LAM-pVIer7Jsp66KWwoSIMcM68E",
            LoungesTime: loungee[3],
            LoungesStatus: loungee[4] ?? "원활",
          );
        });
  }
}
