// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Envelope extends StatelessWidget {
  final List<String> entries = <String>[
    '너의 지금 소망을 입 밖에 내어 열 번 말해 봐.\n반드시 이루어질거야.',
    '잘 안된다고 멈춰 서지 마.',
    '꿀팁! 수면사이클은 90분 주기라서 \n4시간잘바에는 3시간 자는게 낫고 \n5시간 잘거면 4시간 반 자는게 낫습니당',
    '한계를 두지 마.',
    '<필기구 추천>\n\n회색펜: 사라사 그레이 0.3\n검정펜:시그노 0.28\n하늘색펜:시그노 0.38\n하이라이터:지구 투명 색연필 노랑',
    '노력은 배신하지 않는다.\n신은 지켜보고 있으니까.',
    '기운과 끈기는 모든 것을 이겨낸다.',
    '모두 백지 공부법 하세요!!!',
    '모든 것은 너의 힘이 될거야!',
    '네가 지금 편한 이유는 내리막길을 걷고 있기 때문이다.',
    '전 솔직히 국어공부가 제일 힘들었음..\n일단 토론 희곡 빼고 비문학 공부할때 속독하는법 알아두시면 편함.\n문제읽고 속독하고 풀면 시간단축b \n문학은 많은 문학작품 알아두는것밖에.. 문법은 제가볼땐 나오는거 또나오고 또나옴ㅋㅋ 많이 풀어보세용',
    '역시 암기과목은 반복이 최고되는것같네욤',
    '매일 열심히 하는 모습 멋져!',
    '99도까지 열심히 온도를 올려놓아도 마지막 1도를 넘기지 못하면 물이 끓지 않는다.\n\n물을 끓이는 건 마지막 1도.\n\n포기하고 싶은 바로 그 1분이다.\n\n- 김연아'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/envl.jpg'), // 배경 이미지
          ),
        ),
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            body: Center(
            child: ListView.separated(
              padding: const EdgeInsets.only(top: 50),
              itemCount: entries.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: const EdgeInsets.all(16),
                  child: Text('${entries[index]}'),
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
            ),
        )));
  }
}
