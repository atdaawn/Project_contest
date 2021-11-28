import 'package:flutter/material.dart';
import 'package:untitled1/StateManage/state.dart';
import '../main.dart';
import 'package:get/get.dart';

class bmi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(
            name: '/home/:param',
            page: () => MyHomePage(),
            transition: Transition.zoom
        ),
        GetPage(
          name: '/two',
          page: () => bmiPage(),
        ),
      ],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'CafeL'),
      title: 'bmi 측정기',
      home: bmiPage(),
    );
  }
}

class bmiPage extends StatefulWidget {
  @override
  _bmiPageState createState() => _bmiPageState();
}

class _bmiPageState extends State<bmiPage> {
  // the controller for the text field associated with "height"
  final _heightController = TextEditingController();

  // the controller for the text field associated with "weight"
  final _weightController = TextEditingController();

  // The BMI
  // double? _bmi;

  // the message at the beginning
  String _message = '키와 몸무게를 입력하세요!';


  // void goout(){
  //   final double? height = double.tryParse(_heightController.value.text);
  //   final double? weight = double.tryParse(_weightController.value.text);
  //   if (height == null || height <= 0 || weight == null || weight <= 0) {
  //     setState(() {
  //       _message = "키와 몸무게 입력이 잘못되었어요";
  //       return False
  //     });
  // }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CaffeineController());
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
                  width: 250,
                  height: 60,
                  child: Text(
                    "BMI 계산하기",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: "Cafe", fontSize: 38, color: Colors.white),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                width: 320,
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
                          decoration: InputDecoration(labelText: '키 (cm)'),
                          controller: _heightController,
                        ),
                        TextField(
                          keyboardType:
                              TextInputType.numberWithOptions(decimal: true),
                          decoration: InputDecoration(
                            labelText: '몸무게 (kg)',
                          ),
                          controller: _weightController,
                        ),
                        ElevatedButton(
                          onPressed: (){
                            // var bmi = _calculate; controller.forw(_weight.round());
                          // controller.forb(bmi.round());
                            final double? height = double.tryParse(_heightController.value.text);
                            final double? weight = double.tryParse(_weightController.value.text);
                            if(height == null || height <= 0 || weight == null || weight <= 0) {
                              setState(() {
                                _message = "키와 몸무게 입력이 잘못되었어요";
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('다시 입력해주세요!'),
                                  ),
                                );
                              });
                            }else{
                             var _bmi = (weight / ((height * height) / 10000)).toStringAsFixed(2);
                              controller.forw(weight.round());
                              controller.forb(_bmi);
                             setState(() {
                               if (double.parse(_bmi) < 18.5) {
                                 _message = "저체중이에요!";
                               } else if (double.parse(_bmi) < 25) {
                                 _message = '정상입니다!';
                               } else if (double.parse(_bmi) < 30) {
                                 _message = '과체중이에요!';
                               } else {
                                 _message = '고도비만이에요!';
                               }
                             });

                            }
                          },
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
                          child: GetBuilder<CaffeineController>(
                            builder: (_) {
                              return Text('${_.newbmi}',
                                  style: TextStyle(fontSize: 50));
                            },
                          ),
                        ),

                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: Text(
                            _message,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16),
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
              //       // Get.to(() => MyHomePage(), arguments: {'bmi': _bmi, 'weight':_weight});
              //       // final golist = [(_bmi.round()), (_weight.round())];
              //       // Get.back(result: golist);
              //       Get.to(() => MyHomePage());
              //     })
            ]))));
  }
}
