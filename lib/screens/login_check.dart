import 'package:flutter/material.dart';
import 'package:galve/provider/user_provider.dart';
import 'package:galve/provider/providers.dart';
import 'package:galve/screens/home_screen.dart';
import 'package:galve/services/firebase_login_service.dart';
import 'package:provider/provider.dart';

class LoginCheck extends StatelessWidget {
  const LoginCheck({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginProvider =
        Provider.of<FirebaseLoginService>(context, listen: false);
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    return Scaffold(
      body: FutureBuilder(
        future: loginProvider.leerToken(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            return _contenidoSplashScreen();
          }

          //Así lo hace en que pueda!
          Future.microtask(() => {
                userProvider.recuperarUsuario(),
                Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (_, __, ___) => HomeScreen(),
                        transitionDuration: Duration(seconds: 0)))
              });

          return Container();
        },
      ),
    );
  }
}

class _contenidoSplashScreen extends StatelessWidget {
  const _contenidoSplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 80,
            ),
            Image.asset(
              "assets/escudo.png",
              width: 250,
            ),
            SizedBox(
              height: 20,
            ),
            Text("Cargando datos"),
          ],
        ),
      ),
    );
  }
}
