import 'package:ecom_app/View/custom_widgets/login/validation/Email_validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget reusableIcon({iconName}) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(50)),
      height: 40.h,
      width: 40.w,
      child: Image.asset(
        "assets/icons/$iconName.png",
        fit: BoxFit.fill,
      ),
    ),
  );
}

Widget reusableText({required String Customtext}) {
  return Container(
    margin: EdgeInsets.only(bottom: 5.h),
    child: Text(
      Customtext,
      style: TextStyle(color: Colors.black.withOpacity(0.5), fontSize: 14.sp),
    ),
  );
}

Widget CustomInputBox(
    {required String hintText,
    required String IconName,
    required String title,
    required TextEditingController controller,
    required validator,
    required String type}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(bottom: 0, left: 6, top: 8),
        child: Text(
          title,
          style: TextStyle(
            color: Colors.black.withOpacity(0.6),
          ),
        ),
      ),
      Container(
          margin: const EdgeInsets.only(top: 0.5),
          padding: const EdgeInsets.only(left: 10, right: 10),
          decoration: BoxDecoration(
            // color: Colors.yellow,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            border: Border.all(width: 1, style: BorderStyle.solid),
          ),
          child: Row(
            children: [
              Flexible(
                child: Image.asset('assets/icons/$IconName.png', width: 22),
                fit: FlexFit.loose,
                flex: 1,
              ),
              const SizedBox(
                height: 4,
                width: 4,
              ),
              Flexible(
                  flex: 3,
                  child: TextFormField(
                    obscureText: type == 'password' ? true : false,
                    validator: (value) {
                      if (value!.isEmpty && isValidPassword(value)) {
                        return 'Password require';
                      } else {
                        return null;
                      }
                    },
                    controller: controller,
                    decoration: InputDecoration(
                        // labelText: 'Email',
                        focusColor: Colors.transparent,
                        hintText: hintText,
                        border: InputBorder.none),
                    style: TextStyle(
                      decorationThickness: 0.0,
                    ),
                  )),
            ],
          )),
    ],
  );
}
