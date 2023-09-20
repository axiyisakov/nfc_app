import 'package:flutter/material.dart';
import 'package:nfc_app/nfc/nfc_page.dart';

/*
Created by Axmadjon Isaqov on 19:40:53 20.09.2023
&© 2023 @axiy.dev 
*/
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const NFCPage(),
    );
  }
}
