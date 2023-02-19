import 'package:darurat/data/datasource/emergency_db.dart';
import 'package:darurat/data/model/emergency_contact_model.dart';
import 'package:darurat/utils/constants.dart';
import 'package:flutter/material.dart';

class DataProvider extends ChangeNotifier {
  List<EmergencyContact> get emergencies => _emergencies;
  List<EmergencyContact> _emergencies = [];

  List<EmergencyContact> get mentalHelpHotlines => _mentalHelpHotlines;
  List<EmergencyContact> _mentalHelpHotlines = [];

  List<EmergencyContact> get suicideHotlines => _suicideHotlines;
  List<EmergencyContact> _suicideHotlines = [];

  List emergencyTypes = ['Emergency', 'Mental Help Hotline', 'Suicide Hotline'];

  Future<void> getData() async {
    List<EmergencyContact> _emergencyContacts = await EmergencyDatabase.instance.getEmergencyContacts(Constant.database.emergencyContactTable);
    for (EmergencyContact emergency in _emergencyContacts) {
      if (emergency.type == 'emergency') {
        emergencies.add(emergency);
      }
      if (emergency.type == 'mental help hotline') {
        mentalHelpHotlines.add(emergency);
      }
      if (emergency.type == 'suicide hotline') {
        suicideHotlines.add(emergency);
      }
    }
    notifyListeners();
  }
}
