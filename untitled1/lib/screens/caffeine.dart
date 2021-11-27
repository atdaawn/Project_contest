import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../main.dart';

class caffeine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: '카페인 측정기',
      theme: ThemeData(fontFamily: 'CafeL'),
      home: CInputForm(),
    );
  }
}

class CInputForm extends StatefulWidget {
  @override
  _CInputFormState createState() => _CInputFormState();
}

class _CInputFormState extends State<CInputForm> {
  final _caffeineController = TextEditingController();

  double _caffeine = 0;
  var _weight;
  String _message = '섭취한 카페인량을 추가해주세요!';

  void _calculate() {
    // 화면 종료될 때 컨트롤러도 반드시 종료시켜주기
    final double? coffee = double.tryParse(_caffeineController.value.text);

    if (coffee == null || coffee <= 0) {
      setState(() {
        _message = "카페인 입력이 잘못되었어요";
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('다시 입력해주세요!'),
          ),
        );
      });
      return;
    }
    setState(() {
      _weight = Get.parameters['param'];
      print(_weight);
      print(_caffeine);
      print(coffee);
      // int sum = _caffeine + coffee;
      if (_caffeine > _weight * 2.5){
        _message = '권장량을 초과했어요!';
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/bmi.jpg'), // 배경 이미지
          ),
        ),
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            body: Center(
                child: Column(children: <Widget>[
                  Material(
                    color: Colors.transparent,
                    child: Container(
                      margin: EdgeInsets.only(top: 100),
                      width: 270,
                      height: 60,
                      child: Text(
                        "카페인 계산하기",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: "Cafe", fontSize: 38, color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    width: 340,
                    child: Card(
                      color: Colors.white,
                      elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextField(
                              keyboardType:
                              TextInputType.numberWithOptions(decimal: true),
                              decoration: InputDecoration(labelText: '카페인 섭취량 (mg)'),
                              controller: _caffeineController,
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10, bottom: 10),
                              child: Text(
                                '카페인 권장량(청소년) =  1kg 당 2.5mg 이하 \n등록된 몸무게로 오늘 섭취량을 평가해요',
                                style: TextStyle(fontSize: 12, fontFamily: 'CafeL'),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            ElevatedButton(
                              onPressed: _calculate,
                              style: ElevatedButton.styleFrom(
                                  primary: Color(0xffFED9E8),
                                  onPrimary: Colors.black),
                              child: Text(
                                '계산',
                                style: TextStyle(fontFamily: 'CafeL'),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              child: Text(
                                _caffeine == null ? '--' : _caffeine.toStringAsFixed(2),
                                style: TextStyle(fontSize: 50),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              child: Text(
                                _message,
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xffdbbae0), onPrimary: Colors.white),
                      child: Text(
                        "저장",
                        style: TextStyle(color: Colors.black, fontFamily: 'aggroL'),
                      ),
                      onPressed: () {
                        Get.back(result: _caffeine.toStringAsFixed(2));
                      })
                ]))));
  }
}