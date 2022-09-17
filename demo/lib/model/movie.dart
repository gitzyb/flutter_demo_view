
import 'package:flutter/cupertino.dart';

class Movie{
  const Movie({
    required this.name,
    required this.intro,
    required this.poster,
    required this.date,
    required this.price,
});
  //名称
  final String name;
  //简介
  final String intro;
  //海报图
  final String poster;
  //日期
  final String date;
  //票价
  final String price;
}