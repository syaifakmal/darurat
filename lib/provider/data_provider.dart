import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darurat/data/datasource/emergency_db.dart';
import 'package:darurat/data/model/emergency_contact_model.dart';
import 'package:darurat/utils/constants.dart';
import 'package:flutter/material.dart';

class DataProvider extends ChangeNotifier {
  // List<EmergencyContact> get emergencies => _emergencies;
  // List<EmergencyContact> _emergencies = [];
  //
  // List<EmergencyContact> get mentalHelpHotlines => _mentalHelpHotlines;
  // List<EmergencyContact> _mentalHelpHotlines = [];
  //
  // List<EmergencyContact> get suicideHotlines => _suicideHotlines;
  // List<EmergencyContact> _suicideHotlines = [];

  List<EmergencyContact> get listData => _listData;
  List<EmergencyContact> _listData = [];

  CollectionReference _firebaseEmergencyContact = FirebaseFirestore.instance.collection(Constant.fireStore.emergencyContact);

  final CollectionReference _firebaseAppVersion = FirebaseFirestore.instance.collection(Constant.fireStore.appVersion);

  List emergencyTypes = ['Emergency', 'Mental Help Hotline', 'Suicide Hotline'];

  Future<void> checkVersion() async {
    final _appVersionDoc = await _firebaseAppVersion.doc('1').get();
    try {
      Map<String, dynamic> _appVersionJson = _appVersionDoc.data() as Map<String, dynamic>;
      final _appVersion = _appVersionJson[Constant.fireStore.appVersion];
      bool _isUpdated = _appVersion == Constant.appConfig.appVersion;
      if (!_isUpdated) {
        await _firebaseEmergencyContact.get().then((QuerySnapshot querySnapshot) {
          _listData.clear();
          querySnapshot.docs.forEach((doc) {
            _listData.add(EmergencyContact.fromJson(doc.data() as Map<String, dynamic>));
          });
        });
        // print('_emergencyContactDoc ${_emergencyContactDoc.docs}');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> getData() async {
    _listData = await EmergencyDatabase.instance.getEmergencyContacts(Constant.database.emergencyContactTable);
    notifyListeners();
  }
}
