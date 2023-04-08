import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darurat/data/datasource/emergency_db.dart';
import 'package:darurat/data/model/emergency_contact_model.dart';
import 'package:darurat/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

class EmergencyContactProvider extends ChangeNotifier {
  String? get searchContactText => _searchContactText;
  String? _searchContactText;

  bool get isLoading => _isLoading;
  bool _isLoading = false;

  List<EmergencyContact> get foundSearchContact => _foundSearchContact;
  List<EmergencyContact> _foundSearchContact = [];

  List<EmergencyContact> get emergencyContactList => _emergencyContactList;
  List<EmergencyContact> _emergencyContactList = [];

  List<EmergencyContact> get userEmergencyContactList => _userEmergencyContact;
  List<EmergencyContact> _userEmergencyContact = [];

  final CollectionReference _firebaseEmergencyContact = FirebaseFirestore.instance.collection(Constant.fireStore.emergencyContact);

  final CollectionReference _firebaseSubmitContact = FirebaseFirestore.instance.collection(Constant.fireStore.submittedContact);

  final CollectionReference _firebaseReportContact = FirebaseFirestore.instance.collection(Constant.fireStore.reportedContact);

  final CollectionReference _firebaseServerTime = FirebaseFirestore.instance.collection(Constant.fireStore.serverTime);

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
    try {
      DateTime todayDateTime = await _getServerTime();
      String uniqueID = DateFormat('yyyy-MM-dd HH:mm:ss').format(todayDateTime);
      EmergencyContact _emergencyContact = emergencyContact.copyWith(createdTime: todayDateTime);
      await _firebaseSubmitContact.doc(uniqueID).set(_emergencyContact.toJson());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> reportContact(EmergencyContact emergencyContact) async {
    try {
      DateTime todayDateTime = await _getServerTime();
      String uniqueID = DateFormat('yyyy-MM-dd HH:mm:ss').format(todayDateTime);
      EmergencyContact _emergencyContact = emergencyContact.copyWith(createdTime: todayDateTime);
      await _firebaseReportContact.doc(uniqueID).set(_emergencyContact.toJson(withUpdateTime: false));
    } catch (e) {
      rethrow;
    }
  }

  Future<void> getData() async {
    _emergencyContactList = await EmergencyDatabase.instance.getEmergencyContacts(Constant.database.emergencyContactTable);
    _userEmergencyContact = await EmergencyDatabase.instance.getEmergencyContacts(Constant.database.userEmergencyContactTable);
    notifyListeners();
  }

  Future<void> insertUserEmergencyContact(EmergencyContact emergencyContact, bool isShared) async {
    _isLoading = true;
    notifyListeners();

    try {
      await EmergencyDatabase.instance.insert(Constant.database.userEmergencyContactTable, emergencyContact);
      if (isShared) {
        GlobalFunction.checkConnection(
          () async {
            await shareContact(emergencyContact);
          },
        );
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }

      _isLoading = false;
      notifyListeners();
      rethrow;
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> deleteUserEmergencyContact(EmergencyContact emergencyContact) async {
    try {
      await EmergencyDatabase.instance.delete(Constant.database.userEmergencyContactTable, emergencyContact.id!);
      userEmergencyContactList.removeWhere((element) => element.id == emergencyContact.id);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      rethrow;
    }
    notifyListeners();
  }

  Future<void> updateUserEmergencyContact(EmergencyContact emergencyContact) async {
    _isLoading = true;
    notifyListeners();
    try {
      await EmergencyDatabase.instance.update(Constant.database.userEmergencyContactTable, emergencyContact);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }

      _isLoading = false;
      notifyListeners();
      rethrow;
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<DateTime> _getServerTime() async {
    int randomNumber = GlobalFunction.getRandomNumber(10);
    final serverTimestamp = FieldValue.serverTimestamp();
    await _firebaseServerTime.doc(randomNumber.toString()).set({'timestamp': serverTimestamp});
    final serverTime = await _firebaseServerTime.doc(randomNumber.toString()).get();
    Timestamp _timestamp = (serverTime.data()! as Map<String, dynamic>)['timestamp'];
    DateTime todayDate = DateTime.fromMillisecondsSinceEpoch(_timestamp.millisecondsSinceEpoch, isUtc: true);
    // print(DateTime.fromMillisecondsSinceEpoch(_timestamp.millisecondsSinceEpoch, isUtc: true));
    return todayDate;
  }

  void searchContact(String? text) {
    _searchContactText = text?.toLowerCase();
    if (_searchContactText != null) {
      _foundSearchContact = [
        ..._emergencyContactList.where((contact) {
          return contact.name.toLowerCase().contains(_searchContactText!) || contact.number.toLowerCase().contains(_searchContactText!);
        }),
        ..._userEmergencyContact.where((contact) {
          return contact.name.toLowerCase().contains(_searchContactText!) || contact.number.toLowerCase().contains(_searchContactText!);
        })
      ];
    }
    notifyListeners();
  }
}
