import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'screens/caffeine.dart';
import 'screens/bmi.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
    title: 'Mainpage',
    theme: ThemeData(fontFamily: 'Cafe'),
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
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
            padding: const EdgeInsets.symmetric(vertical: 20),

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
                  height: 80,
                  child: Text(
                    "바라다",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: "newone",
                        fontSize: 45,
                        color: Colors.black),
                  ),
                ),
              ),
                  Material(
                    color: Colors.transparent,
                    child: Container(
                      margin: EdgeInsets.only(bottom:30),
                      width: 180,
                      height: 20,
                      child: Text(
                        "수험생활 건강 지킴이",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: "newone",
                            fontSize: 13,
                            color: Colors.black),
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
                        colors: [Color(0xff797773), Color(0xff7f7f7f)],
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
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontFamily: 'Cafe'),
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
                        colors: [Color(0xff797773), Color(0xff7f7f7f)],
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
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontFamily: 'Cafe'),
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
                        colors: [Color(0xff797773), Color(0xff7f7f7f)],
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
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontFamily: 'Cafe'),
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
                        colors: [Color(0xff797773), Color(0xff7f7f7f)],
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
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontFamily: 'Cafe'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

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
