import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'screens/ProductListScreen.dart';

void main() async {
  // Pastikan semua inisialisasi sudah selesai sebelum runApp()
  WidgetsFlutterBinding.ensureInitialized();

  // Inisialisasi databaseFactory untuk desktop (Windows, macOS, Linux)
  if (!kIsWeb &&
      (defaultTargetPlatform == TargetPlatform.windows ||
          defaultTargetPlatform == TargetPlatform.linux ||
          defaultTargetPlatform == TargetPlatform.macOS)) {
    sqfliteFfiInit(); // Inisialisasi sqflite ffi
    databaseFactory = databaseFactoryFfi; // Set database factory
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductListScreen(),
    );
  }
}
