import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

final _InitService initService = _InitService();

/// Init service when run Project
class _InitService{

  static final _InitService _instance = _InitService.internal();
  _InitService.internal();

  factory _InitService() => _instance;

  _InitService._();


  init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await GetStorage.init();
  }
}