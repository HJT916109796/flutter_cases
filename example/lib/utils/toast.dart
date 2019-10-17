/// Toast提示组件
///
/// created by hujintao
/// created at 2019-10-17
//
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oktoast/oktoast.dart';
import 'package:flutter/material.dart';

class Toast {

  /// 普通调试
  static show(String msg, {duration = 2000}) {
    showToast(msg,
        duration: Duration(milliseconds: duration), dismissOtherToast: true);
  }

  /// 粉色提示
  static heartShow(String msg, {duration = 2000}) {
    showToast(msg,
        backgroundColor: Color(0xffFFF2F4).withOpacity(0.6),
        textStyle: TextStyle(
          color: Color(0xffFF7E98),
          fontSize: ScreenUtil().setSp(30),
        ),
        duration: Duration(milliseconds: duration),
        dismissOtherToast: true);
  }

  /// 取消提示
  static cancelToast() {
    dismissAllToast();
  }
}