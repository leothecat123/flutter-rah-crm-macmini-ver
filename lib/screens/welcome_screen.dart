import 'package:flutter/material.dart';
import 'package:rah_crm_project/constants.dart';
import 'package:rah_crm_project/screens/campaign_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = '/welcome_screen';

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: Color(0xfff4f4f3),
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(0.6), BlendMode.lighten),
                child: Image.asset('images/RAH_logo.png'),
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
                    Text(
                      'Welcome!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Log in to your account',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(height: 30),
                    TextField(
                        keyboardType: TextInputType.emailAddress,
                        textAlign: TextAlign.center,
                        onChanged: (value) {},
                        decoration: kTextFieldDecoration.copyWith(
                            hintText: 'Enter your Email')),
                    SizedBox(
                      height: 8.0,
                    ),
                    TextField(
                      obscureText: true,
                      textAlign: TextAlign.center,
                      onChanged: (value) {},
                      decoration: kTextFieldDecoration.copyWith(
                          hintText: 'Enter your Password'),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      color: Color(0xff5f5d5a),
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.pushNamed(context, CampaignScreen.id);
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
    );
  }
}
