class UserFields {
  static final String adName = 'ad name';
  static final String adNumber = 'ad number';
  static final String adSectId = 'ad sect id';
  static final String saleType = 'sale_type';
  static final String labelId = 'label id';
  static final String sectId = 'http sect id';
  static final String listName = 'table_list_name';
  static final String listId = 'table_list_id';
  static final String rawId = 'table_raw_id';
  static final String p1Id = 'table_p1_id';
  static final String creationDate = 'creation_date';
  static final String action = 'action';
  static final String status = 'status';

  static List<String> getFields() => [
        adName,
        adNumber,
        adSectId,
        saleType,
        labelId,
        sectId,
        listName,
        listId,
        rawId,
        p1Id,
        creationDate,
        action,
        status,
      ];
}

class User {
  final String adName;
  final String adNumber;
  final String? adSectId;
  final String? saleType;
  final String? labelId;
  final String? sectId;
  final String listName;
  final String? listId;
  final String? rawId;
  final String? p1Id;
  final String? creationDate;
  final String? action;
  final String? status;

  User({
    required this.adName,
    required this.adNumber,
    this.adSectId,
    this.saleType,
    this.labelId,
    this.sectId,
    required this.listName,
    this.listId,
    this.rawId,
    this.p1Id,
    this.creationDate,
    this.action,
    this.status,
  });

  Map<String, dynamic> toJson() => {
        UserFields.adName: adName,
        UserFields.adNumber: adNumber,
        UserFields.adSectId: adSectId,
        UserFields.saleType: saleType,
        UserFields.labelId: labelId,
        UserFields.sectId: sectId,
        UserFields.listName: listName,
        UserFields.listId: listId,
        UserFields.rawId: rawId,
        UserFields.p1Id: p1Id,
        UserFields.creationDate: creationDate,
        UserFields.action: action,
        UserFields.status: status,
      };
}
