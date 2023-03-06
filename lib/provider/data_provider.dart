import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darurat/data/datasource/emergency_db.dart';
import 'package:darurat/data/model/emergency_contact_model.dart';
import 'package:darurat/utils/constants.dart';
import 'package:darurat/utils/global_function.dart';
import 'package:flutter/material.dart';

class EmergencyContactProvider extends ChangeNotifier {
  List<EmergencyContact> get emergencyContactList => _emergencyContactList;
  List<EmergencyContact> _emergencyContactList = [];

  List<EmergencyContact> get userEmergencyContactList => _userEmergencyContact;
  List<EmergencyContact> _userEmergencyContact = [];

  final CollectionReference _firebaseEmergencyContact = FirebaseFirestore.instance.collection(Constant.fireStore.emergencyContact);

  final CollectionReference _firebaseSubmitContact = FirebaseFirestore.instance.collection(Constant.fireStore.submittedContact);

  final CollectionReference _firebaseReportContact = FirebaseFirestore.instance.collection(Constant.fireStore.reportedContact);

  final CollectionReference _firebaseAppVersion = FirebaseFirestore.instance.collection(Constant.fireStore.appVersion);

  Future<void> checkVersion() async {
    final _appVersionDoc = await _firebaseAppVersion.doc('1').get();
    try {
      Map<String, dynamic> _appVersionJson = _appVersionDoc.data() as Map<String, dynamic>;
      final _appVersion = _appVersionJson[Constant.fireStore.appVersion];
      bool _isUpdated = _appVersion == Constant.appConfig.appVersion;
      if (!_isUpdated) {
        await _firebaseEmergencyContact.get().then((QuerySnapshot querySnapshot) {
          _emergencyContactList.clear();
          for (var doc in querySnapshot.docs) {
            _emergencyContactList.add(EmergencyContact.fromJson(doc.data() as Map<String, dynamic>));
          }
        });
        // print('_emergencyContactDoc ${_emergencyContactDoc.docs}');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> shareContact(EmergencyContact emergencyContact) async {
    String uniqueID = GlobalFunction.generateUniqueID();
    try {
      await _firebaseSubmitContact.doc(uniqueID).set(emergencyContact.toJson());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> reportContact(EmergencyContact emergencyContact) async {
    String uniqueID = GlobalFunction.generateUniqueID();
    try {
      final timestamp = FieldValue.serverTimestamp();
      // DateTime dateTime = timestamp.toDate();
      // print(timestamp.);
      // EmergencyContact _emergencyContact = emergencyContact.copyWith(createdTime: FieldValue.serverTimestamp());
      // await _firebaseReportContact.doc(uniqueID).set(_emergencyContact.toJson());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> getData() async {
    _emergencyContactList = await EmergencyDatabase.instance.getEmergencyContacts(Constant.database.emergencyContactTable);
    _userEmergencyContact = await EmergencyDatabase.instance.getEmergencyContacts(Constant.database.userEmergencyContactTable);
    notifyListeners();
  }

  Future<void> insertUserEmergencyContact(EmergencyContact emergencyContact) async {
    await EmergencyDatabase.instance.insert(Constant.database.userEmergencyContactTable, emergencyContact);
    // _userEmergencyContact.add(emergencyContact);
    notifyListeners();
  }
}
