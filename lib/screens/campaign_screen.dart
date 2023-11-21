import 'package:flutter/material.dart';
import 'package:rah_crm_project/components/menu_button.dart';
import 'package:rah_crm_project/screens/welcome_screen.dart';
import 'package:rah_crm_project/screens/campaign_list_screen.dart';
import 'package:rah_crm_project/screens/blank_screen.dart';

class CampaignScreen extends StatefulWidget {
  static const String id = '/campaign_screen';

  @override
  State<CampaignScreen> createState() => _CampaignScreenState();
}

class _CampaignScreenState extends State<CampaignScreen> {
  bool showCampaignList = false;

  void displayCampaignScreen() {
    setState(() {
      showCampaignList = !showCampaignList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: FlexibleSpaceBar(
          background: Padding(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 40),
            child: Row(
              children: [
                Hero(
                  tag: 'rah_logo',
                  child: Container(
                    child: Image.asset('images/RAH_logo_light.png'),
                  ),
                ),
              ],
            ),
          ),
        ),
        backgroundColor: Color(0xff5f5d5a),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.person)),
          IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, WelcomeScreen.id);
              },
              icon: Icon(Icons.logout)),
        ],
      ),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: Color(0xfff6f6f5),
              child: Column(
                children: [
                  SizedBox(height: 50),
                  MenuButton(
                    title: 'Campaign List',
                    callList: displayCampaignScreen,
                  ),
                  SizedBox(
                    height: 3,
                    width: 160,
                    child: Container(
                      color: Color(0xffdecdb6),
                    ),
                  ),
                  MenuButton(
                    title: 'Advertisement(Coming soon)',
                    callList: () {},
                  ),
                  SizedBox(
                    height: 3,
                    width: 160,
                    child: Container(
                      color: Color(0xffdecdb6),
                    ),
                  ),
                  MenuButton(
                    title: 'Customer(Coming Soon)',
                    callList: () {},
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: showCampaignList ? CampaignListScreen() : BlankScreen(),
          ),
        ],
      ),
    );
  }
}
