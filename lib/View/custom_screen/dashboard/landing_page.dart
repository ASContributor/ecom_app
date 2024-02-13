import 'package:ecom_app/Logic/Nav_BLoc/bloc/nav_bloc.dart';
import 'package:ecom_app/View/custom_screen/dashboard/main/catagory/catagory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';

import 'main/cart/cart.dart';
import 'main/home/home_page.dart';
import 'main/otherDetails/otherDetails.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        AnimatedContainer(
          duration: const Duration(seconds: 10),
          child: PageView(
            controller: BlocProvider.of<NavBloc>(context).controller,
            physics: const NeverScrollableScrollPhysics(),
            children: const [HomePage(), Catagory(), Cart(), OtherDetails()],
          ),
        ),
        Positioned(
          bottom: 10,
          left: 18,
          right: 18,
          child: Padding(
            padding: const EdgeInsets.only(),
            child: BlocBuilder<NavBloc, NavState>(
              builder: (context, state) {
                var currentTab;
                if (state is NavInitial) {
                  currentTab = state.activeTab;
                }
                return SnakeNavigationBar.color(
                  snakeViewColor: Colors.black,
                  // showUnselectedLabels: false,
                  showSelectedLabels: true,
                  selectedItemColor: Colors.orange,
                  unselectedItemColor: Colors.white,
                  elevation: 4,
                  currentIndex: currentTab,
                  behaviour: SnakeBarBehaviour.floating,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(48))),
                  height: 68,
                  backgroundColor: Colors.black,
                  selectedLabelStyle: const TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                    fontSize: 12,
                  ),
                  onTap: (index) => setState(() {
                    BlocProvider.of<NavBloc>(context).controller.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.linear);
                    BlocProvider.of<NavBloc>(context)
                        .add(OnTapChangeEvent(currentTab: index));
                  }),
                  items: const [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.home),
                        // activeIcon: Padding(
                        //   padding: EdgeInsets.all(5.0),
                        //   child: CircleAvatar(
                        //     backgroundColor: Colors.deepOrange,
                        //     maxRadius: 4,
                        //   ),
                        // ),
                        label: 'Home'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.category),
                        // activeIcon: Padding(
                        //   padding: EdgeInsets.all(5.0),
                        //   child: CircleAvatar(
                        //     backgroundColor: Colors.deepOrange,
                        //     maxRadius: 4,
                        //   ),
                        // ),
                        label: 'Category'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.shopping_cart),
                        // activeIcon: Padding(
                        //   padding: EdgeInsets.all(5.0),
                        //   child: CircleAvatar(
                        //     backgroundColor: Colors.deepOrange,
                        //     maxRadius: 4,
                        //   ),
                        // ),
                        label: 'Cart'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.person_4_rounded),
                        // activeIcon: Padding(
                        //   padding: EdgeInsets.all(5.0),
                        //   child: CircleAvatar(
                        //     backgroundColor: Colors.deepOrange,
                        //     maxRadius: 4,
                        //   ),
                        // ),
                        label: 'Other'),
                  ],
                );
              },
            ),
          ),
        )
      ]),
    );
  }
}
