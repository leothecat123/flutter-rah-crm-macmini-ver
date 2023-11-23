import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:rah_crm_project/constants.dart';
import 'package:rah_crm_project/screens/campaign_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:rah_crm_project/components/pop_up_button.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = '/welcome_screen';

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  bool showSpinner = false;
  final formKey = GlobalKey<FormState>();
  late final FormFieldValidator<String>? validator;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    animation = ColorTween(begin: Colors.black, end: Color(0xfff4f4f3))
        .animate(controller);

    controller.forward();

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        body: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 2,
                child: Hero(
                  tag: 'rah_logo',
                  child: Container(
                    color: animation.value,
                    child: ColorFiltered(
                      colorFilter: ColorFilter.mode(
                          Colors.white.withOpacity(0.6), BlendMode.lighten),
                      child: Image.asset('images/RAH_logo.png'),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: Color(0xffc7bdae),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AnimatedTextKit(
                          animatedTexts: [
                            WavyAnimatedText(
                              'Welcome!',
                              textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2,
                              ),
                              speed: Duration(milliseconds: 300),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Log in to your account',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(height: 30),
                        TextFormField(
                            validator: (value) {
                              return value != null && value.isEmpty
                                  ? 'Please enter Email'
                                  : null;
                            },
                            keyboardType: TextInputType.emailAddress,
                            textAlign: TextAlign.center,
                            onChanged: (value) {
                              email = value;
                            },
                            decoration: kTextFieldDecoration.copyWith(
                                hintText: 'Enter your Email')),
                        SizedBox(
                          height: 8.0,
                        ),
                        TextFormField(
                          validator: (value) {
                            return value != null && value.isEmpty
                                ? 'Please enter Password'
                                : null;
                          },
                          obscureText: true,
                          textAlign: TextAlign.center,
                          onChanged: (value) {
                            password = value;
                          },
                          decoration: kTextFieldDecoration.copyWith(
                              hintText: 'Enter your Password'),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          color: Color(0xff5f5d5a),
                          child: MaterialButton(
                            onPressed: () async {
                              final form = formKey.currentState!;
                              final isValid = form.validate();
                              // Navigator.pushNamed(context, CampaignScreen.id);
                              if (isValid) {
                                setState(() {
                                  showSpinner = true;
                                });
                                try {
                                  final User =
                                      await _auth.signInWithEmailAndPassword(
                                          email: email, password: password);
                                  if (User != null) {
                                    Navigator.pushNamed(
                                        context, CampaignScreen.id);
                                    setState(() {
                                      showSpinner = false;
                                    });
                                  }
                                } catch (e) {
                                  print(e);
                                  setState(() {
                                    showSpinner = false;
                                  });
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        titlePadding: EdgeInsets.all(30),
                                        contentPadding: EdgeInsets.all(30),
                                        buttonPadding: EdgeInsets.symmetric(
                                            vertical: 30, horizontal: 25),
                                        backgroundColor: Color(0xfff6f6f5),
                                        title: Text(
                                          'Fail to Log in',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600),
                                        ),
                                        content: Text(
                                          'Please try another email or password',
                                          style: TextStyle(
                                            letterSpacing: 0.8,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        actions: [
                                          popUpButton(
                                            buttonText: 'Cancel',
                                            buttonCallBack: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }
                              }
                            },
                            minWidth: 400,
                            height: 40,
                            child: Text(
                              'Log in',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
