// import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CaffeineController extends GetxController {
  var newcafe = 0.00;
  var newbmi = 0.00;
  int neweight = 0;
  // var margin = 0.00;

  add(var plus){
    newcafe += double.parse(plus);
    update();
  }
  forb(var val){
    newbmi = double.parse(val);
    update();
    print(newbmi);
  }
  forw(int val){
    neweight = val;
    update();
  }
  get margin => neweight * 2.5;
}