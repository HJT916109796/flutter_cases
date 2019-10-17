/// 实用工具类
///
/// created by hujintao
/// created at 2019-10-17
//

import 'dart:math' as Math;
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Utils {

  /// 加载本地Asset图片
  static ImageProvider getAssetImgWithPath(String name,
      {String format: 'png'}) {
    return AssetImage('assets/$name.$format');
  }

  /// 把角度转为Alignment组件可用参数, 一般用于渐变
  /// [start_x] 为start参数的Alignment.x
  /// [start_y] 为start参数的Alignment.y
  /// 以此类推
  static Map<String, double> parseAngleToAlignment(double deg) {
    deg = 180 - deg;

    double rad = Math.pi / 180 * deg;
    double endrad = Math.pi / 180 * (180 + deg);

    Map<String, double> result = {};

    result['beginX'] = Math.cos(rad) * Math.sqrt(2);
    result['beginY'] = -Math.sin(rad) * Math.sqrt(2);
    result['endX'] = Math.cos(endrad) * Math.sqrt(2);
    result['endY'] = -Math.sin(endrad) * Math.sqrt(2);

    return result;
  }

  /// 获取渐变参数
  /// [colors] 渐变颜色
  /// [deg] 渐变角度
  static LinearGradient getLinearGradientParams({List<Color> colors, double deg, List<double> stops}) {

    Map<String, double> alignment = parseAngleToAlignment(deg);

    return LinearGradient(
        colors: colors,
        stops: stops,
        begin: Alignment(alignment['beginX'], alignment['beginY']),
        end: Alignment(alignment['endX'], alignment['endY']));
  }


  /// 添加前置0
  static String addLeadingZero(value, {length: 2}) {
    return (value.toString()).padLeft(length, '0');
  }

  /// 获取时间差
  static Duration getDifferenceDays(int target, {String from = 'now'}) {
    DateTime now = DateTime.now();
    DateTime targetTime = DateTime.fromMillisecondsSinceEpoch(target);

    switch (from) {
      case 'now':
        return targetTime.difference(now);
      case 'target':
        return now.difference(targetTime);
      default:
        return now.difference(targetTime);
    }
  }

  /// 获取时间差
  static Map<String, int> getTimeDifference({int time1, int time2}) {
    if (time1 == null || time2 == null) {
      int now = DateTime.now().millisecondsSinceEpoch;

      time1 = time1 ?? now;
      time2 = time2 ?? now;
    }

    DateTime before =
    DateTime.fromMillisecondsSinceEpoch(Math.min(time1, time2));
    DateTime after =
    DateTime.fromMillisecondsSinceEpoch(Math.max(time1, time2));

    Duration duration = after.difference(before);

    int days = duration.inDays;
    int hours = duration.inHours - duration.inDays * 24;
    int minutes = duration.inMinutes - duration.inHours * 60;
    int seconds = duration.inSeconds - duration.inMinutes * 60;

    return {
      'days': days,
      'hours': hours,
      'minutes': minutes,
      'seconds': seconds,
    };
  }

}