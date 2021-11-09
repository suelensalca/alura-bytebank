import 'package:bytebank_persistencia/http/webclient.dart';
import 'package:bytebank_persistencia/models/transaction.dart';
import 'package:flutter/material.dart';
import 'screens/dashboard.dart';

void main() {
  runApp(const BytebankApp());
  // findAll().then((transactions) => print('new transactions $transactions'));
}

class BytebankApp extends StatelessWidget {
  const BytebankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return MaterialApp(
      theme: theme.copyWith(
          colorScheme: theme.colorScheme.copyWith(
            primary: Colors.green[900],
            secondary: Colors.blueAccent[700],
          ),
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.blueAccent[700],
            textTheme: ButtonTextTheme.primary,
          )),
      home: const Dashboard(),
    );
  }
}
