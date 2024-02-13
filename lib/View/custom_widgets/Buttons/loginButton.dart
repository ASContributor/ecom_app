import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget LoginButton(
    {required String ButtonText,
    required Color color,
    required Color TextColor}) {
  return Container(
    margin: EdgeInsets.only(top: 5.h),
    width: 300.w,
    height: 50.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(17),
      color: color,
    ),
    child: Center(
      child: Text(
        ButtonText,
        style: TextStyle(color: TextColor, fontSize: 20.sp),
      ),
    ),
  );
}
