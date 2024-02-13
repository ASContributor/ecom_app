import 'package:ecom_app/common/CTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool centerTitle;
  const CustomAppBar({super.key, required this.title, this.centerTitle = true});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // disable back button in appBar
      automaticallyImplyLeading: false,
      elevation: 0,
      shadowColor: Colors.transparent,

      bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            color: Colors.transparent,
            height: 1,
          )),
      centerTitle: centerTitle,
      title: Text(
        this.title,
        style: TextStyle(
            fontSize: 16.sp,
            color: CTheme.isDarkMode(context) ? Colors.black : Colors.white),
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 18.0),
          child: Icon(Icons.padding),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kTextTabBarHeight);
}
