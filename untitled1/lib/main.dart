import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'screens/caffeine.dart';
import 'screens/bmi.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
    title: 'Mainpage',
    theme: ThemeData(fontFamily: 'CafeL'),
    home: MyHomePage(),
  ));
}
//
// var _bmi = Get.arguments;
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             fit: BoxFit.cover,
//             image: AssetImage('assets/picture.png'), // 배경 이미지
//           ),
//         ),
//         child: Padding(
//             padding: const EdgeInsets.symmetric(vertical: 20),
//
//             // appBar: AppBar(
//             //   title: Text("Main page"),
//             // ),
//             child:
//                 Column(mainAxisAlignment: MainAxisAlignment.start, children: [
//               Material(
//                 color: Colors.transparent,
//                 child: Container(
//                   margin: EdgeInsets.only(top: 100),
//                   width: 160,
//                   height: 80,
//                   child: Text(
//                     "바라다",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                         fontFamily: "newone",
//                         fontSize: 45,
//                         color: Colors.black),
//                   ),
//                 ),
//               ),
//                   Material(
//                     color: Colors.transparent,
//                     child: Container(
//                       margin: EdgeInsets.only(bottom:30),
//                       width: 180,
//                       height: 20,
//                       child: Text(
//                         "수험생활 건강 지킴이",
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                             fontFamily: "newone",
//                             fontSize: 13,
//                             color: Colors.black),
//                       ),
//                     ),
//                   ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Container(
//                     margin: EdgeInsets.all(10),
//                     width: 160,
//                     height: 45,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(30),
//                       gradient: LinearGradient(
//                         begin: Alignment.centerLeft,
//                         end: Alignment.centerRight,
//                         colors: [Color(0xffFED9E8), Color(0xffFED9E8)],
//                       ),
//                     ),
//                     child: MaterialButton(
//                       materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                       shape: StadiumBorder(),
//                       onPressed: () {
//                         Navigator.push(context,
//                             MaterialPageRoute(builder: (_) => caffeine()));
//                       },
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: <Widget>[
//                             Text(
//                               '카페인 계산',
//                               style: TextStyle(
//                                   fontSize: 25,
//                                   color: Colors.black,
//                                   fontFamily: 'Cafe'),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     // child: ElevatedButton(
//                     //   onPressed: () { Navigator.push(
//                     //       context, MaterialPageRoute(builder: (_) => caffeine())); },
//                     //   child: Text("Go to caffeine Page"),
//                     // ),
//                   ),
//                   Container(
//                     margin: EdgeInsets.all(10),
//                     width: 115,
//                     height: 45,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(80),
//                       gradient: LinearGradient(
//                         begin: Alignment.centerLeft,
//                         end: Alignment.centerRight,
//                         colors: [Color(0xffFED9E8), Color(0xffFED9E8)],
//                       ),
//                     ),
//                     child: MaterialButton(
//                       materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                       shape: StadiumBorder(),
//                       onPressed: () {
//                         Get.to(() => bmiPage());
//                       },
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: <Widget>[
//                             Text(
//                               'BMI',
//                               style: TextStyle(
//                                   fontSize: 25,
//                                   color: Colors.black,
//                                   fontFamily: 'Cafe'),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Container(
//                     margin: EdgeInsets.all(10),
//                     width: 160,
//                     height: 45,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(30),
//                       gradient: LinearGradient(
//                         begin: Alignment.centerLeft,
//                         end: Alignment.centerRight,
//                         colors: [Color(0xffFED9E8), Color(0xffFED9E8)],
//                       ),
//                     ),
//                     child: MaterialButton(
//                       materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                       shape: StadiumBorder(),
//                       onPressed: () {
//                         Navigator.push(context,
//                             MaterialPageRoute(builder: (_) => caffeine()));
//                       },
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: <Widget>[
//                             Text(
//                               '카페인 계산',
//                               style: TextStyle(
//                                   fontSize: 25,
//                                   color: Colors.black,
//                                   fontFamily: 'Cafe'),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     // child: ElevatedButton(
//                     //   onPressed: () { Navigator.push(
//                     //       context, MaterialPageRoute(builder: (_) => caffeine())); },
//                     //   child: Text("Go to caffeine Page"),
//                     // ),
//                   ),
//                   Container(
//                     margin: EdgeInsets.all(10),
//                     width: 115,
//                     height: 45,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(80),
//                       gradient: LinearGradient(
//                         begin: Alignment.centerLeft,
//                         end: Alignment.centerRight,
//                         colors: [Color(0xffFED9E8), Color(0xffFED9E8)],
//                       ),
//                     ),
//                     child: MaterialButton(
//                       materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                       shape: StadiumBorder(),
//                       onPressed: () {
//                         Get.to(() => bmiPage());
//                       },
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: <Widget>[
//                             Text(
//                               'BMI',
//                               style: TextStyle(
//                                   fontSize: 25,
//                                   color: Colors.black,
//                                   fontFamily: 'Cafe'),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//
//             ])));
//   }
// }

//**************************************************************************************
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _bmi = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/picture.png'), // 배경 이미지
          ),
        ),
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),

            // appBar: AppBar(
            //   title: Text("Main page"),
            // ),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
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
                        fontFamily: "Cafe", fontSize: 50, color: Colors.black),
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
                    style: TextStyle(fontSize: 15, color: Colors.black),
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
                        colors: [Color(0xffFED9E8), Color(0xffFED9E8)],
                      ),
                    ),
                    child: MaterialButton(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      shape: StadiumBorder(),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => caffeine()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              '카페인 계산',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
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
                        colors: [Color(0xffFED9E8), Color(0xffFED9E8)],
                      ),
                    ),
                    child: MaterialButton(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      shape: StadiumBorder(),
                      onPressed: () {
                        Get.to(() => bmiPage());
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'BMI',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
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
                    width: 160,
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Color(0xffFED9E8), Color(0xffFED9E8)],
                      ),
                    ),
                    child: MaterialButton(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      shape: StadiumBorder(),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => caffeine()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              '카페인 계산',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
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
                        colors: [Color(0xffFED9E8), Color(0xffFED9E8)],
                      ),
                    ),
                    child: MaterialButton(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      shape: StadiumBorder(),
                      onPressed: () {
                        Get.to(() => bmiPage());
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'BMI',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
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
                    color: Color(0xffDD95B9),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                          Container(
                            child: Text(
                              "BMI", style: TextStyle(fontSize: 20, fontFamily: "Cafe",color: Colors.white),
                            ),
                          ),
                          Container(
                            child: Text(
                                _bmi == null ? '입력하세요' : _bmi!.toStringAsFixed(2),
                                style: TextStyle(fontSize: 20, color: Colors.white),
                                textAlign: TextAlign.center,
                            ),
                          ),
                        ]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                child: Text(
                                  "카페인", style: TextStyle(fontSize: 20, fontFamily: "Cafe",color: Colors.white),
                                ),
                              ),
                              Container(
                                child: Text(
                                  _bmi == null ? '입력하세요' : _bmi!.toStringAsFixed(2),
                                  style: TextStyle(fontSize: 20, color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ]),
                      ]),
                    )),
              )
            ])));
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
