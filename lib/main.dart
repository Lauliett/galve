import 'package:flutter/material.dart';
import 'package:galve/provider/providers.dart';
import 'package:galve/screens/bando_detail_screen.dart';
import 'package:galve/screens/eventos_screen.dart';
import 'package:galve/screens/screens.dart';
import 'package:galve/services/bandos_service.dart';
import 'package:galve/services/firebase_login_service.dart';
import 'package:galve/shared_preferences/preferences.dart';
import 'package:galve/themes/app_theme.dart';
import 'package:provider/provider.dart';

void main() async => {
      WidgetsFlutterBinding.ensureInitialized(),
      await Preferences.init(),
      runApp(const AppState()),
    };

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Es modo lazy
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FirebaseLoginService()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => BandosService())
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Galve',
      theme: AppTheme.lightTheme,
      initialRoute: 'login_chek',
      routes: {
        'login_chek': (BuildContext context) => LoginCheck(),
        'main': (BuildContext context) => HomeScreen(),
        'login': (BuildContext context) => LoginScreen(),
        'bandos': (BuildContext context) => BandosScreen(),
        'bando_detalle': (BuildContext context) => BandoDetailScreen(),
        'proximamente': (BuildContext context) => Proximamente(),
        'eventos': (BuildContext context) => EventosScreen(),
      },
    );
  }
}
