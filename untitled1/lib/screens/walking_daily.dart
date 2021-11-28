import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'package:jiffy/jiffy.dart';
import 'package:pedometer/pedometer.dart';
import 'package:google_fonts/google_fonts.dart';

class DailyStepsPage extends StatefulWidget {
  @override
  _DailyStepsPageState createState() => _DailyStepsPageState();
}

class _DailyStepsPageState extends State<DailyStepsPage> {
  Pedometer? _pedometer;
  StreamSubscription<int>? _subscription;
  Box<int> stepsBox = Hive.box('steps');
  int? todaySteps;

  final Color carbonBlack = Color(0xffffffff);

  @override
  void initState() {
    super.initState();
    startListening();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/walking.jpg'), // 배경 이미지
          ),
        ),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    margin: EdgeInsets.only(top: 120, bottom: 40),
                    child: Text(
                      "오늘의 걸음 수",
                      style: TextStyle(
                          fontSize: 40,
                          fontFamily: 'Cafe',
                          color: Color(0xffff89b0)),
                    )),
                Card(
                  color: Color(0xffff89b0).withOpacity(1),
                  // elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35)),
                  child: Container(
                    margin: const EdgeInsets.only(
                      top: 10,
                      bottom: 30,
                      right: 20,
                      left: 20,
                    ),
                    child: Column(
                      children: <Widget>[
                        gradientShaderMask(
                          child: Text(
                            todaySteps?.toString() ?? '0',
                            style: GoogleFonts.darkerGrotesque(
                              fontSize: 80,
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        Container(
                          width: 125,
                          alignment: Alignment.center,
                          child: Text(
                            "걸음",
                            style: TextStyle(
                                fontSize: 28,
                                color: Colors.white,
                                fontFamily: 'Cafe'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 40, bottom: 10),
                  child: Text(
                    '체력 관리 또한 수험생활 중 신경써야 하는 부분 중 하나에요!\n하루 2000보씩이라도 걸어보는 건 어때요?',
                    style: TextStyle(fontSize: 12, fontFamily: 'CafeL'),
                    textAlign: TextAlign.center,
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        ));
  }

  @override
  void dispose() {
    stopListening();
    super.dispose();
  }

  Widget gradientShaderMask({required Widget child}) {
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        colors: [
          Color(0xffffbed9),
          Color(0xffffdcea),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
      child: child,
    );
  }

  void startListening() {
    _pedometer = Pedometer();
    _subscription = _pedometer!.pedometerStream.listen(
      getTodaySteps,
      onError: _onError,
      onDone: _onDone,
      cancelOnError: true,
    );
  }

  void _onDone() => print("Finished pedometer tracking");

  void _onError(error) => print("Flutter Pedometer Error: $error");

  Future<int?> getTodaySteps(int value) async {
    print(value);
    int savedStepsCountKey = 999999;
    int savedStepsCount = stepsBox.get(savedStepsCountKey, defaultValue: 0);

    int todayDayNo = Jiffy(DateTime.now()).dayOfYear;
    if (value < savedStepsCount) {
      // Upon device reboot, pedometer resets. When this happens, the saved counter must be reset as well.
      savedStepsCount = 0;
      // persist this value using a package of your choice here
      stepsBox.put(savedStepsCountKey, savedStepsCount);
    }

    // load the last day saved using a package of your choice here
    int lastDaySavedKey = 888888;
    int lastDaySaved = stepsBox.get(lastDaySavedKey, defaultValue: 0);

    // When the day changes, reset the daily steps count
    // and Update the last day saved as the day changes.
    if (lastDaySaved < todayDayNo) {
      lastDaySaved = todayDayNo;
      savedStepsCount = value;

      stepsBox
        ..put(lastDaySavedKey, lastDaySaved)
        ..put(savedStepsCountKey, savedStepsCount);
    }

    setState(() {
      todaySteps = value - savedStepsCount;
    });
    stepsBox.put(todayDayNo, todaySteps);
    return todaySteps; // this is your daily steps value.
  }

  void stopListening() {
    _subscription!.cancel();
  }
}
