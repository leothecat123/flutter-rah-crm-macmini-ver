import 'package:gsheets/gsheets.dart';
import 'package:rah_crm_project/models/user_field.dart';

class UserSheetsApi {
  static const _credentials = r'''
  {
  "type": "service_account",
  "project_id": "flutter-gs-400310",
  "private_key_id": "cbe2684506197cf04f56f867b8960e37109c996c",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDPgcKu2asYREwH\nO2KFtR5dK/NpXbOf4F7eRlXrqEom885PmjjE/SQHKsG0vn808AfPZh+LsIn3rKuO\nfSnFoQg6tkGyc1jme7OQHsNmFRnmbilhYSwC14eggG5dbfNrYtIHMxaByoPQDAwo\nOuAajZdpFwDiC7S2AZGBcO+JAFV+L5W3dU/yBuGbm7Kzw3G0Uhptwb5MPysoGB0G\nCmqozcUfNTbkJ1GDr+8uJkTuij8rw/j3tdfpMaIiA5ykpRJdaLOWBDsNJo6jwug6\nm39/kKTkzLH3tfx+xEosQknk/0DWHVyuKdqNKV2zn1U4MrHULP20mFp8oCoerj8n\npop96n6xAgMBAAECggEACFNfAc/29u7KlCG0VsQJF1jrl8csLVZ9x/JPgTiL3Rs8\nJGJ+M50qhGUZR4y7It8cmRwyWNL4/ih966Ym9mh7IYvtf+Dz6K9+6WHqmh5vnxi9\nbUxOTUDjjrOIehQux5i775EDrqp29nJ9TGHsWvRiZlOHdApfMkxGz8g9vCP4yirB\nGgN7/j0sSOmYARRVWqY8UkV4tZXvzDzYsF1+WZfBROt6+Ot59WdjYa8SSTI+1MkZ\n64KLXSnjxbHgPyxEOHHOfbBsCDxlvq6kaWy2BLaRNAx/zO7zYhkIdyjaDPeMAMDc\nvD/ndMvgUd7li1jSW/KwlE6hL+xPa/fYoQhP/W28pwKBgQDqq8Bqxnd78rJsTzI0\noDaiBRuJv6h/yPHi5KTJDUh7Y8D1eicOCO6imeXLQB+kNsxvqnSRbyfi3WGIXYPr\nCxSXtjFkxR/ssUNMbcLLawjgUqaWsyCHvbULArOUdAnkg5wFLN/fXYBQDW+mSGs9\nthGPxDlUMzxxEb+6FqLCNeJFDwKBgQDiXfb/+GIGxvUpHsc6vmA1CYDF/q04CRJf\nl56D9DPcxdjV8Ra3WIyNdeGOJh0bRTITliFOSy9I0z8fIN3wZEnLmpx9hnBESDtz\nGTYGjIOv3wqFP1nLTLnoQKYaRaAHvRNUYPPyQiyrJgsiVFyiCzcTfqNSK9eLRAJ3\n72I3ZAyAPwKBgDSiHv8T0nq3XXNTc/Q/tuEx+hI0LWuzuyTjmV4Kn6YlIoMsSZQp\nRrSrhdHHaRFgxQuKlKiF4NFOS/DU4KCYFJ9OWte6KsXgoDKFL7qGIDCH+Rs1w+cO\nEowMqBB00j8xkY3Lmc60XvIVgWQvO/ZUXq37GcybzUOi8nifWRPsF/rbAoGBALI3\nwnhCiILHb0rhhX9VVQ9MnQrE+IFuev2xtEY1JAPD7HR7rCPLXlUdIui0TyQiNUvA\nXhZzERYn4sFSMgnKG2NmJaCaEJdhuxRiG+vKAv+a/YBsoPhzPsaA54U1ncmZ7bb3\n4fewa9SPTiLIAmo9pC3//Pt7suZdNAhS+qObbFAnAoGAF7Jq+jx2bPLtXrlnXEZf\nSwlJht114+R9H8DZs6oUFch0vVBr9A7DrAGQUm+JE2jUOD8cP80Kn/dm3YYU94nm\nflzmhD2XFGF0RMXMaJ5baaETIapq+HszUZf0tmbMx3PupQS8E0q/AARLTRboiEZr\nrbv8EpsnDffzBpsBNWvc58A=\n-----END PRIVATE KEY-----\n",
  "client_email": "crm-flutter-gs@flutter-gs-400310.iam.gserviceaccount.com",
  "client_id": "102545549672822665184",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/crm-flutter-gs%40flutter-gs-400310.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"
}

  ''';
  static final _spreadsheetId = '1C5kiEltA8vzV086_p_scQcY2_BZ7BnI3sHXpiKEj7Gc';
  static final _gsheets = GSheets(_credentials);
  static Worksheet? _userSheet;

  static Future init() async {
    try {
      final spreadsheet = await _gsheets.spreadsheet(_spreadsheetId);
      _userSheet = await _getWorkSheet(spreadsheet, title: 'Copy of ad_list');

      final firstRow = UserFields.getFields();
      _userSheet!.values.insertRow(1, firstRow);
    } catch (e) {
      print('Init Error: $e');
    }
  }

  static Future<Worksheet> _getWorkSheet(
    Spreadsheet spreadsheet, {
    required String title,
  }) async {
    try {
      return await spreadsheet.addWorksheet('Copy of ad_list');
    } catch (e) {
      return spreadsheet.worksheetByTitle(title)!;
    }
  }

  static Future insert(List<Map<String, dynamic>> rowList) async {
    if (_userSheet == null) return;
    _userSheet!.values.map.appendRows(rowList);
  }

  static Future<int> getRowCount() async {
    if (_userSheet == null) return 0;
    final lastRow = await _userSheet!.values.lastRow();
    return lastRow == null ? 0 : int.tryParse(lastRow[10]) ?? 0;
  }

  static Future getAllData() async {
    final allData = await _userSheet!.values.allRows();
    print(allData);
  }
}
