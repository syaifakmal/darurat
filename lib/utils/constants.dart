import 'dart:io';

class Constant {
  ///AppConfig
  static AppConfig? _appConfig;

  static AppConfig get appConfig {
    _appConfig ??= AppConfig();
    return _appConfig!;
  }

  ///Database
  static DatabaseDetails? _database;

  static DatabaseDetails get database {
    _database ??= DatabaseDetails();
    return _database!;
  }

  ///FireStore Collections
  static FireStoreCollection? _fireStore;

  static FireStoreCollection get fireStore {
    _fireStore ??= FireStoreCollection();
    return _fireStore!;
  }

  /// sharePreference
  static const isDarkMode = 'isDarkMode';

  ///error msg
  static const connectionFailedMsg = 'Connection failed, please check your internet connection';
}

class AppConfig {
  final String appVersion = '1.0.0';
  final String appName = 'Darurat';
  final String deviceOS = Platform.isAndroid ? 'Android' : 'IOS';
  // static final bool isDevelopment = true;
}

class DatabaseDetails {
  final String databaseName = 'emergency.db';
  final String emergencyContactTable = 'emergency_contact';
  final String userEmergencyContactTable = 'user_emergency_contact';
  final String initialJsonData = 'assets/darurat-defult.json';
}

class FireStoreCollection {
  final String appVersion = 'app_version';
  final String emergencyContact = 'emergency_contact';
  final String reportedNumber = 'reported_numbers';
  final String submittedNumber = 'submitted_numbers';
}
