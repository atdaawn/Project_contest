import 'package:flutter/material.dart';
import '../main.dart';
import 'package:get/get.dart';

class bmi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Cafe'),
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
  double? _bmi;

  // the message at the beginning
  String _message = '키와 몸무게를 입력하세요!';

  void _calculate() {
    final double? height = double.tryParse(_heightController.value.text);
    final double? weight = double.tryParse(_weightController.value.text);

    // Check if the inputs are valid
    if (height == null || height <= 0 || weight == null || weight <= 0) {
      setState(() {
        _message = "키와 몸무게 입력이 잘못되었어요";
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('다시 입력해주세요!'),
          ),
        );
      });
      return;
    }

    setState(() {
      _bmi = weight / ((height * height) / 10000);
      if (_bmi! < 18.5) {
        _message = "저체중이에요!";
      } else if (_bmi! < 25) {
        _message = '정상입니다~';
      } else if (_bmi! < 30) {
        _message = '과체중이에요!';
      } else {
        _message = '고도비만이에요!';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/picture.png'), // 배경 이미지
          ),
        ),
        child: Scaffold(
            resizeToAvoidBottomInset : false,
            backgroundColor: Colors.transparent,
            body: Center(
                child: Column(children: <Widget>[

              Container(
                margin: EdgeInsets.only(top:190, bottom: 20),
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
                          onPressed: _calculate,
                          child: Text('계산'),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          child: Text(
                            _bmi == null ? '--' : _bmi!.toStringAsFixed(2),
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
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.cyan, onPrimary: Colors.white),
                  child: Icon(Icons.home, color: Colors.white),
                  onPressed: () {
                    Get.to(() => MyApp(), arguments: _bmi);
                  })
            ]))));
  }
}
