import 'package:ecom_app/Logic/LoginBloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../uitilities/firebase_auth.dart';

class OtherDetails extends StatelessWidget {
  const OtherDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detail')),
      body: Center(child: BackButton(
        onPressed: () {
          BlocProvider.of<LoginBloc>(context).add(SignOut());
        },
      )),
    );
  }
}
