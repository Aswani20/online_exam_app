
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/di/di.dart';

@module
abstract class StorageModule{
  @lazySingleton
  FlutterSecureStorage get storage => const FlutterSecureStorage();
  // FlutterSecureStorage flutterSecureStorage = getIt<FlutterSecureStorage>();
}