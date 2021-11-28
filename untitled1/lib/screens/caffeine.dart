import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/StateManage/state.dart';
import '../main.dart';

class caffeine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: [
        // GetPage(
        //   // name: '/first/:param',
        //   // page: () => MyHomePage(),
        // ),
      ],
    );
  }
}

class CInputForm extends StatefulWidget {
  @override
  _CInputFormState createState() => _CInputFormState();
}

class _CInputFormState extends State<CInputForm> {
  var _caffeine;
  // int _caffeine = Get.arguments[1];
  // int _weight = Get.arguments[0];
  final _caffeineController = TextEditingController();

  // double _caffeine = 0;
  String _message = '섭취한 카페인량을 추가해주세요!';

  _calculate() {
    // 화면 종료될 때 컨트롤러도 반드시 종료시켜주기
    final double? coffee = double.tryParse(_caffeineController.value.text);
    // int coffee2 = coffee!.round();
    if(_caffeine == null){
      _caffeine = 0;
    }
    if (coffee == null) {
      setState(() {
        _message = "카페인 입력이 잘못되었어요";
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('다시 입력해주세요!'),
          ),
        );
      });
      return 0;
    }else{
      return coffee;
    }


    // print(_caffeine);
    // print(_weight);
    // print(_caffeine.runtimeType);
    //
    //
    // setState(() {
    //   // _weight = Get.parameters['param'];
    //   print(_weight);
    //   print(_caffeine);
    //   print(coffee2);
    //   // coffee.round();
    //   _caffeine = _caffeine + coffee2;
    //   // int sum = _caffeine + coffee;
    //   if (_caffeine > _weight * 2.5){
    //     _message = '권장량을 초과했어요!';
    //   }
    // });
  }
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CaffeineController());
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/caffeine.jpg'), // 배경 이미지
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
                                '카페인 권장량(청소년) =  1kg 당 2.5mg 이하 \n등록된 몸무게로 오늘 섭취량을 평가해요\n섭취량을 감소시키고 싶으면 (-) 기호를 아용하세요!',
                                style: TextStyle(fontSize: 12, fontFamily: 'CafeL'),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            ElevatedButton(
                              onPressed: (){
                                // onPressed: (){
                                // controller.add(_calculate.toStringAsFixed(2)),
                                final double? coffee = double.tryParse(_caffeineController.value.text);
                                // int coffee2 = coffee!.round();
                                if (coffee == null) {
                                  setState(() {
                                    _message = "카페인 입력이 잘못되었어요";
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('다시 입력해주세요!'),
                                      ),
                                    );
                                  });
                                }else{
                                  controller.add(coffee.toStringAsFixed(2));
                                }
                                // var margin = controller.neweight * 2.5;
                                setState(() {
                                  if (controller.newcafe > controller.margin){
                                      _message = '권장량을 초과했어요!';
                                  }else if(controller.newcafe <0){
                                    _message = '값을 수정해주세요';
                                  }else{
                                    _message = '권장량 이내에요!';
                                  }
                                });
                      // },
                      },
                              style: ElevatedButton.styleFrom(
                                  primary: Color(0xffFED9E8),
                                  onPrimary: Colors.black),
                              child: Text(
                                '더하기',
                                style: TextStyle(fontFamily: 'CafeL'),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            // Container(
                            //   child: Text(
                            //     _caffeine.toString(),
                            //
                            //     textAlign: TextAlign.center,
                            //   ),
                            // ),
                            GetBuilder<CaffeineController>(
                              builder: (_) {
                                return Text('${_.newcafe}',
                                    style: TextStyle(fontSize: 50));
                              },
                            ),
                            // SizedBox(
                            //   height: 20,
                            // ),
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: GetBuilder<CaffeineController>(
                                builder: (_) {
                                  return Text('권장량 : ${_.margin}',
                                      style: TextStyle(fontSize: 15, fontFamily: 'CafeL'),textAlign: TextAlign.center);
                                },
                              ),
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
                  // ElevatedButton(
                  //     style: ElevatedButton.styleFrom(
                  //         primary: Color(0xffdbbae0), onPrimary: Colors.white),
                  //     child: Text(
                  //       "저장",
                  //       style: TextStyle(color: Colors.black, fontFamily: 'aggroL'),
                  //     ),
                  //     onPressed: () {
                  //       Get.to(() => MyHomePage());
                  //     })
                ]))));
  }
}