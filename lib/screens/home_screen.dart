import 'package:flutter/material.dart';
import 'package:mt_first_flutter/widgets/buildings.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final String InduckSrc =
      "https://lh6.googleusercontent.com/proxy/f8wkbjBQXojWRlu4lU7W4BizMThgPthrris7n7hJMHX_sC8lhLbt0kf6LAM-pVIer7Jsp66KWwoSIMcM68E";

  final List<String> buildings = [
    '정석학술정보관',
    '60주년 기념관',
    '하이테크센터',
    '5호관',
    '2호관',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        elevation: 2,
        title: const Text(
          "인하대 열람실",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 200,
                  child: Image.network(
                    InduckSrc,
                    headers: const {
                      "User-Agent":
                          "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
                    },
                  ),
                ),
                const Column(
                  children: [
                    Text("다음 수업장소는....."),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                              text: "60주년 기념관",
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 20)),
                          TextSpan(
                            text: " 입니다!!",
                          )
                        ],
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                              text: "해동라운지",
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 20)),
                          TextSpan(
                            text: " 어떠신가요?",
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            for (var name in buildings)
              building(
                buildingName: name,
              )
          ],
        ),
      ),
    );
  }
}
