import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:untitled1/screens/Envelope.dart';
import 'package:untitled1/screens/calculator.dart';
import 'package:untitled1/screens/walking.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'StateManage/state.dart';
import 'screens/caffeine.dart';
import 'screens/bmi.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox<int>('steps');
  runApp(GetMaterialApp(
    initialRoute: '/',
    getPages: [
      GetPage(
        name: '/one/:param',
        page: () => CInputForm(),
        transition: Transition.zoom
      ),
      GetPage(
        name: '/two',
        page: () => bmiPage(),
      ),
    ],
    title: 'Mainpage',
    theme: ThemeData(fontFamily: 'Cafe'),
    home: MyHomePage(),
  ));
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _bmi;
  var health;
  int _caffeine = Get.arguments;
  int _weight = 0;
  var _toadd;

  // void cal() {
  //   if (_caffeine == null) {
  //     _caffeine = 0;
  //   }
  //   if (Get.arguments == null){
  //   //   _bmi = Get.arguments['bmi'];
  //   //   _caffeine = Get.arguments['caffeine'];
  //   //   _weight  = Get.arguments['weight'];
  //   // }else{
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(
  //         content: Text('값이 없습니다.'),
  //       ),
  //     );
  //   }
  // }

  @override
  final controller = Get.put(CaffeineController());
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/main.jpg'), // 배경 이미지
          ),
        ),
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            body: Center(
              child: Column(children: <Widget>[
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),

                    // appBar: AppBar(
                    //   title: Text("Main page"),
                    // ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Material(
                            color: Colors.transparent,
                            child: Container(
                              margin: EdgeInsets.only(top: 100),
                              width: 160,
                              height: 55,
                              child: Text(
                                "바라다",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: "Cafe",
                                    fontSize: 50,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                          Material(
                            color: Colors.transparent,
                            child: Container(
                              margin: EdgeInsets.only(bottom: 30),
                              width: 180,
                              height: 20,
                              child: Text(
                                "수험생활 건강 지킴이",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black,fontFamily: 'CafeL'),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.all(10),
                                width: 160,
                                height: 45,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Color(0xffFED9E8),
                                      Color(0xffFED9E8)
                                    ],
                                  ),
                                ),
                                child: MaterialButton(
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  shape: StadiumBorder(),
                                  onPressed: () async {
                                    // print(health);
                                    // print(_weight);
                                    // print(_bmi);
                                    // print(health.runtimeType); //새로 추가완료
                                    // final cafew = [_weight,_caffeine];
                                    if (controller.newbmi != 0.00) {
                                      print(health);
                                      // Get.toNamed(
                                      //     '/one/$_weight?caffeine=$_caffeine');
                                      Get.to(() => CInputForm(),transition: Transition.zoom);
                                    }else{
                                      ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(
                                            content: Text('bmi 계산을 완료해야 이용하실 수 있습니다.'),
                                          ));
                                      // print(111);
                                    }
                                  // final plus_coffee = await Get.to(CInputForm(), transition: Transition.zoom);


                                  // setState(() {
                                  //   _caffeine = int.parse(Get.arguments['first']);
                                  // });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          '카페인 계산',
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,fontFamily: 'CafeL'
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                // child: ElevatedButton(
                                //   onPressed: () { Navigator.push(
                                //       context, MaterialPageRoute(builder: (_) => caffeine())); },
                                //   child: Text("Go to caffeine Page"),
                                // ),
                              ),
                              Container(
                                margin: EdgeInsets.all(10),
                                width: 115,
                                height: 45,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(80),
                                  gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Color(0xffFED9E8),
                                      Color(0xffFED9E8)
                                    ],
                                  ),
                                ),
                                child: MaterialButton(
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  shape: StadiumBorder(),
                                  onPressed: (){
                                    // Get.to(() => bmiPage(), arguments: {'bmi': _bmi});
                                    // final health1 = await Get.to(bmiPage(), transition: Transition.zoom);
                                    // health = health1;
                                    // print(health);
                                    // setState(() {
                                    //   _bmi = health[0];
                                    //   _weight = health[1];
                                    //   // print(_weight);
                                    //   // print(_bmi);
                                    // });
                                    Get.to(() => bmiPage(),transition: Transition.zoom);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          'BMI',
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,fontFamily: 'CafeL'
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.all(10),
                                width: 120,
                                height: 45,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Color(0xffc9b7bd),
                                      Color(0xffbfacb3)
                                    ],
                                  ),
                                ),
                                child: MaterialButton(
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  shape: StadiumBorder(),
                                  onPressed: () {
                                    Get.to(() => CalcApp());
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          '계산기',
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,fontFamily: 'CafeL'
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                // child: ElevatedButton(
                                //   onPressed: () { Navigator.push(
                                //       context, MaterialPageRoute(builder: (_) => caffeine())); },
                                //   child: Text("Go to caffeine Page"),
                                // ),
                              ),
                              Container(
                                margin: EdgeInsets.all(10),
                                width: 115,
                                height: 45,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(80),
                                  gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Color(0xffFED9E8),
                                      Color(0xffFED9E8)
                                    ],
                                  ),
                                ),
                                child: MaterialButton(
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  shape: StadiumBorder(),
                                  onPressed: () async {
                                    // WidgetsFlutterBinding.ensureInitialized();
                                    // Hive.openBox<int>('steps');
                                    // runApp(Walking());
                                    Get.to(() => Walking());
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          '만보기',
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                            fontFamily: 'CafeL'
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            width: 320,
                            child: Card(
                                color: Color(0xc8ff93be),
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Container(
                                                child: Text(
                                                  "BMI",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontFamily: "Cafe",
                                                      color: Colors.white),
                                                ),
                                              ),
                                              // Container(
                                              //   child: Text(
                                              //     '$_bmi',
                                              //     style: TextStyle(
                                              //         fontSize: 20,
                                              //         color: Colors.white,fontFamily: 'CafeL'),
                                              //     textAlign: TextAlign.center,
                                              //   ),
                                              // ),
                                              GetBuilder<CaffeineController>(
                                                builder: (_) {
                                                  return Text('${_.newbmi}',
                                                      style: TextStyle(fontSize: 20,color: Colors.white,fontFamily: 'CafeL'),
                                                    textAlign: TextAlign.center,
                                                  );
                                                },
                                              ),
                                            ]),
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Container(
                                                child: Text(
                                                  "카페인",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontFamily: "Cafe",
                                                      color: Colors.white),
                                                ),
                                              ),
                                              Container(
                                                child: GetBuilder<CaffeineController>(
                                                  builder: (_) {
                                                    return Text('${_.newcafe}',
                                                      style: TextStyle(fontSize: 20,color: Colors.white,fontFamily: 'CafeL'),
                                                      textAlign: TextAlign.center,
                                                    );
                                                  },
                                                ),
                                              ),

                                            ]),
                                      ]),
                                )),
                          )
                        ])),
              ]),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Color(0xc8e493f3),
              onPressed:(){
                Get.to(() => Envelope());
              },
              child: Text("💌"),
            )
        ));
  }
}

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key? key, required this.title}) : super(key: key);
//
//
//   final String title;
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
