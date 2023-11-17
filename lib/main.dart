import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rah_crm_project/models/project_data.dart';
import 'package:rah_crm_project/screens/campaign_screen.dart';
import 'package:rah_crm_project/screens/welcome_screen.dart';
import 'package:rah_crm_project/models/gsheet_api.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserSheetsApi.init();
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
