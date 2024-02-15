import 'package:ecom_app/Logic/LoginBloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../custom_widgets/Buttons/loginButton.dart';
import '../../custom_widgets/appBar/appBar.dart';
import '../../custom_widgets/backgroundColor/backgroundGradient.dart';
import '../../custom_widgets/login/login_widget.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController Emailcontroller = TextEditingController();

  TextEditingController Passcontroller = TextEditingController();

  final bool emailVelidator = false;

  final bool passwordVelidator = false;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<LoginBloc>(context).add(CheckStatusEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(title: 'Log In'),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BackgroundGradient(),
          child: Container(
            color: Colors.grey.withOpacity(0.5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      reusableIcon(iconName: 'google'),
                      reusableIcon(iconName: 'apple'),
                      reusableIcon(iconName: "facebook")
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                reusableText(Customtext: 'Or use your email accountto login'),
                Expanded(flex: 2, child: LoginRegistrationForm(context))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Form LoginRegistrationForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20),
        child: Column(
          children: [
            CustomInputBox(
                title: 'Email',
                hintText: 'Enter Email',
                IconName: 'user',
                controller: Emailcontroller,
                validator: emailVelidator,
                type: 'email'),
            CustomInputBox(
                title: 'Password',
                hintText: 'Enter Password',
                IconName: 'lock',
                controller: Passcontroller,
                validator: passwordVelidator,
                type: 'password'),
            const SizedBox(
              height: 100,
            ),
            Column(
              children: [
                BlocListener<LoginBloc, LoginState>(
                  listener: (context, state) {
                    if (state is Auth) {
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/', (route) => false);
                    }
                  },
                  child: GestureDetector(
                    onTap: () async {
                      BlocProvider.of<LoginBloc>(context).add(LoginWithEmail(
                          Email: Emailcontroller.text,
                          Pass: Passcontroller.text,
                          context));
                    },
                    child: LoginButton(
                        ButtonText: 'Login',
                        color: Colors.blue,
                        TextColor: Colors.white),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: LoginButton(
                      ButtonText: 'Register',
                      color: Colors.black,
                      TextColor: Colors.white),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  bool isValidEmail(email) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
  }
}
