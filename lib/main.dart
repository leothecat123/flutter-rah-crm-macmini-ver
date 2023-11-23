import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rah_crm_project/models/project_data.dart';
import 'package:rah_crm_project/screens/campaign_screen.dart';
import 'package:rah_crm_project/screens/welcome_screen.dart';
import 'package:rah_crm_project/models/gsheet_api.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserSheetsApi.init();
  await UserSheetsApi.readinit();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyANPs80ubLP6SJsBn6C-uwwCg9xVGcSu-w",
          authDomain: "rah-crm.firebaseapp.com",
          projectId: "rah-crm",
          storageBucket: "rah-crm.appspot.com",
          messagingSenderId: "217301772788",
          appId: "1:217301772788:web:6696d7aea48ee1e93531a1"));
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ProjectData())],
      child: RahCrm()));
}

class RahCrm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        CampaignScreen.id: (context) => CampaignScreen(),
      },
    );
  }
}
