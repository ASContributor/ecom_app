import 'package:flutter/material.dart';

import '../../../../custom_widgets/appBar/appBar.dart';
import 'custom_widgets/custom_shape.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        centerTitle: false,
        title: 'Current User',
      ),
      body: Container(
          child: SingleChildScrollView(
        child: Column(children: [
          ClipPath(
            clipper: CustomeShape(),
            child: Container(
              color: Colors.black,
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 2.5,
                width: MediaQuery.of(context).size.width,
                child: Stack(children: [
                  Positioned(
                    right: -200,
                    top: -220,
                    child: Container(
                        width: 400,
                        height: 400,
                        decoration: BoxDecoration(
                          color: Colors.orange.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(300),
                        )),
                  ),
                  Positioned(
                    right: -270,
                    bottom: -150,
                    child: Container(
                        width: 400,
                        height: 400,
                        decoration: BoxDecoration(
                          color: Colors.orange.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(300),
                        )),
                  )
                ]),
              ),
            ),
          ),
        ]),
      )),
    );
  }
}
