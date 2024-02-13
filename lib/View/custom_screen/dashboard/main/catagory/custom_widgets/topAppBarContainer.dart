import 'package:flutter/material.dart';

class TopAppBarContainer extends StatelessWidget {
  const TopAppBarContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Container(
          height: 100,
          color: Colors.black,
        )
      ],
    );
  }
}
