import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:take_note/Services/todo_Database.dart';
import 'package:take_note/View/home_View.dart';
import 'package:take_note/global/ChangeTheme.dart';

void main() {
  //Ekaran bslatıladan temel widgetelri hazırla
  WidgetsFlutterBinding.ensureInitialized();
  //Databaseyi initialize et
  DatabaseService().initialize();

  //Ekan deyişimini uyhulamak ver bu verileri her yerde kulanmak için
  runApp(
    MultiProvider(
      providers: [
        ListenableProvider<DatabaseService>(
          create: (_) => DatabaseService(),
          builder: (context, child) => Main(),
        ),
        ChangeNotifierProvider(create: (_) => ThemeChange()),
      ],
    ),
  );
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeChange().currentTheme,
      home: HomeView(),
    );
  }
}
