import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecom_app/Logic/introBloc/intro_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../uitilities/firebase_auth.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Scaffold(
          body: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: BlocBuilder<IntroBloc, IntroState>(
                builder: (context, state) {
                  return Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      PageView(
                        controller:
                            BlocProvider.of<IntroBloc>(context).pageController,
                        onPageChanged: (index) {
                          state.page = index;
                          BlocProvider.of<IntroBloc>(context).add(IntroInitial(
                            index: index,
                          ));
                        },
                        children: [
                          IntroPage(
                            ImageUrl: 'assets/images/reading.png',
                            title: 'Firest see Learning',
                            subTitle:
                                'Forget about a  for of paper all knowlage in learning',
                            ButtonText: 'Next',
                          ),
                          IntroPage(
                            ImageUrl: 'assets/images/boy.png',
                            title: '',
                            subTitle: '',
                            ButtonText: 'Next',
                          ),
                          IntroPage(
                            ImageUrl: 'assets/images/man.png',
                            title: '',
                            subTitle: '',
                            ButtonText: 'Get Started',
                          ),
                        ],
                      ),
                      Positioned(
                          bottom: 70.h,
                          child: DotsIndicator(
                            position:
                                BlocProvider.of<IntroBloc>(context).state.page,
                            dotsCount: 3,
                            decorator: DotsDecorator(
                                color: Colors.black.withOpacity(0.5),
                                activeColor: Colors.blue,
                                activeSize: Size(18.w, 10.h),
                                activeShape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5))),
                          ))
                    ],
                  );
                },
              ),
            ),
          ),
        ));
  }
}

class IntroPage extends StatelessWidget {
  IntroPage(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.ImageUrl,
      required this.ButtonText});
  final String title;
  final String subTitle;
  final String ImageUrl;
  final String ButtonText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              height: 400.h,
              width: 400.w,
              child: Image(image: AssetImage(ImageUrl))),
          Text(
            title,
            style: TextStyle(fontSize: 30.sp),
          ),
          Text(
            subTitle,
            style: TextStyle(
                fontSize: 15.sp, color: Colors.black.withOpacity(0.5)),
          ),
          GestureDetector(
            onTap: () {
              var index = BlocProvider.of<IntroBloc>(context).state.page;

              if (index < 2) {
                print(index);

                BlocProvider.of<IntroBloc>(context)
                    .pageController
                    .animateToPage(index + 1,
                        curve: Curves.decelerate,
                        duration: const Duration(microseconds: 3000));
              } else {
                setfirstTime();
                Navigator.pushNamedAndRemoveUntil(
                    context, 'login/', (route) => false);
              }
            },
            child: Container(
              margin: EdgeInsets.only(top: 40.h),
              width: 300.w,
              height: 50.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17),
                color: Colors.blue,
              ),
              child: Center(
                child: Text(
                  ButtonText,
                  style: TextStyle(color: Colors.white, fontSize: 20.sp),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> setfirstTime() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool('seen', true);
  }
}
