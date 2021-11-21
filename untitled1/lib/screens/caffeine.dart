import 'package:flutter/material.dart';
import 'result_Caffeine.dart';

class caffeine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '카페인 측정기',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CInputForm(),
    );
  }
}

class CInputForm extends StatefulWidget {
  @override
  _CInputFormState createState() => _CInputFormState();
}

class _CInputFormState extends State<CInputForm> {
  final _formKey = GlobalKey<FormState>(); // form 상태를 얻기 위한 키
  final _CheightController = TextEditingController();
  final _CweightController = TextEditingController();

  @override
  void dispose() {
    // 화면 종료될 때 컨트롤러도 반드시 종료시켜주기
    _CheightController.dispose();
    _CweightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATE'),
        ),
        body: Center(
          child: Container(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                  key: _formKey, // form의 key 할당
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'height',
                        ),
                        keyboardType: TextInputType.number, // 숫자 입력만
                        controller: _CheightController,
                        validator: (value) {
                          if(value!.trim().isEmpty) {
                            return 'Input your height';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'weight'
                        ),
                        keyboardType: TextInputType.number,
                        controller: _CweightController,
                        validator: (value) {
                          if(value!.trim().isEmpty) {
                            return 'Input your weight';
                          }
                          return null;
                        },
                      ),
                      Container(
                          margin: const EdgeInsets.all(20.0),
                          alignment: Alignment.centerRight,
                          child: ElevatedButton(
                            onPressed: () {
                              // form 값 검증
                              if(_formKey.currentState!.validate()) {
                                // 검증되면 처리
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CResult(
                                        double.parse(_CheightController.text.trim()),
                                        double.parse(_CweightController.text.trim())
                                    ),
                                  ),
                                );
                              }
                            },
                            child: Text('submit'),
                          )
                      )
                    ],
                  )
              )
          ),
        )
    );
  }
}