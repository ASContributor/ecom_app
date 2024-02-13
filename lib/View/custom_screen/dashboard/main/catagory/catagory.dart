import 'package:ecom_app/common/mixin/TextStyleMixin.dart';
import 'package:flutter/material.dart';

import 'custom_widgets/topAppBarContainer.dart';

class Catagory extends StatelessWidget with TextMixin {
  const Catagory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
            headerSliverBuilder: (context, value) {
              return [
                SliverAppBar(
                  backgroundColor: Colors.black,
                  automaticallyImplyLeading: false,
                  expandedHeight: 420,
                  pinned: true,
                  floating: true,
                  flexibleSpace: const TopAppBarContainer(),
                  title: Text(
                    'App',
                    style: headingTextStyle(),
                  ),
                  bottom: const TabBar(
                      overlayColor: MaterialStatePropertyAll(
                          Color.fromARGB(66, 255, 153, 0)),
                      dividerColor: Colors.white,
                      labelColor: Colors.white,
                      tabs: [
                        Tab(
                            child: Icon(
                          Icons.padding,
                          color: Colors.white,
                        )),
                        Tab(
                          child: Icon(
                            Icons.radar,
                            color: Colors.white,
                          ),
                        )
                      ]),
                )
              ];
            },
            body: TabBarView(
              children: [Container(), Container()],
            )),
      ),
    );
  }
}
