import 'package:flutter/material.dart';
import 'package:galve/model/user_login.dart';
import 'package:galve/provider/login_form_provider.dart';
import 'package:galve/provider/user_provider.dart';
import 'package:galve/services/services.dart';
import 'package:provider/provider.dart';

import 'package:galve/widgets/widgets.dart';

class LoginWidget extends StatelessWidget {
  final Map<String, String> formvalues = {
    'email': '',
    'password': '',
  };

  LoginWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/escudo.png",
            width: 150,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text("LOGIN",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(15, 17, 68, 1.0))),
          const SizedBox(
            height: 20,
          ),
          //¿Qué hace esto? Nos crea una instancia de mi loggin form provider a la vez que puede dibujar
          //o redibujar los widgets cuando sea necesario / solo va a vivir en este scope
          ChangeNotifierProvider(
            create: (_) => LoginFormProvider(),
            child: FormLogin(formvalues: formvalues),
          ),
        ],
      ),
    );
  }
}

class FormLogin extends StatelessWidget {
  const FormLogin({
    Key? key,
    required this.formvalues,
  }) : super(key: key);

  final Map<String, String> formvalues;

  @override
  Widget build(BuildContext context) {
    //El provider
    final loginForm = Provider.of<LoginFormProvider>(context);
    final usuarioLogin = Provider.of<UserProvider>(context);
    final firebaseLoginService =
        Provider.of<FirebaseLoginService>(context, listen: false);

    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: loginForm.formKey,
      child: Container(
        width: double.infinity,
        color: Colors.white,
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            CustomInputField(
                initialValue: usuarioLogin.userEmail,
                formPropierty: 'email',
                formValues: formvalues,
                hintText: "Introduce tu email",
                suffixicon: Icons.email,
                keyboardType: TextInputType.emailAddress),
            const SizedBox(
              height: 20,
            ),
            CustomInputField(
              initialValue: usuarioLogin.userEmail,
              formPropierty: 'password',
              formValues: formvalues,
              hintText: "Introduce tu contraseña",
              suffixicon: Icons.lock_outline_rounded,
              obscureText: true,
            ),
            const SizedBox(
              height: 30,
            ),
            (usuarioLogin.objetctUserLogin == null)
                ? BotonLogin(
                    firebaseLoginService: firebaseLoginService,
                    loginForm: loginForm,
                    formvalues: formvalues,
                    usuarioLogin: usuarioLogin)
                : ElevatedButton(
                    onPressed: () {
                      usuarioLogin.quitUserLogin();
                      firebaseLoginService.logout();
                      Navigator.pushReplacementNamed(context, 'main');
                    },
                    child: const Center(
                      child: Text("Salir"),
                    )),
          ],
        ),
      ),
    );
  }
}

class BotonLogin extends StatelessWidget {
  const BotonLogin({
    Key? key,
    required this.loginForm,
    required this.formvalues,
    required this.usuarioLogin,
    required this.firebaseLoginService,
  }) : super(key: key);

  final LoginFormProvider loginForm;
  final Map<String, String> formvalues;
  final UserProvider usuarioLogin;
  final FirebaseLoginService firebaseLoginService;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        //Recordar: esto es para quitar el teclado de la pantalla!
        FocusScope.of(context).requestFocus(FocusNode());
        //Asi llamamos al objeto ese que esta guardando el provider.

        loginForm.email =
            (formvalues['email'] == null) ? "" : formvalues['email']!;
        loginForm.password =
            (formvalues['password'] == null) ? "" : formvalues['password']!;

        if (!loginForm.isValidForm()) {
          print('Formulario No valido');
          return;
        }

        //Ahora vamos a validar el login contra firebase
        final String? mensajeDeError = await firebaseLoginService.login(
            loginForm.email, loginForm.password);

        if (mensajeDeError != null) {
          NotificationsService.showSnackbar("Datos de acceso incorrectos");
          //print(mensajeDeError);
          return;
        }
        UserLogin usuarioLogeado = UserLogin(
          loginForm.email,
        );

        usuarioLogin.userLoginSet = usuarioLogeado;
        usuarioLogin.guardarUsuario();

        Navigator.pushReplacementNamed(context, 'main');
      },
      child: const Center(
        child: Text('ENTRAR'),
      ),
    );
  }
}
