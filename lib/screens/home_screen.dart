import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:galve/provider/providers.dart';
import 'package:galve/services/bandos_service.dart';
import 'package:galve/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final userProvider = Provider.of<UserProvider>(context);
    //Podemos llamar a algo del provider aunque no lo vayamos a usar, para instanciarlo (si esta en modo lazy),
    //Al llamar aqui al servicio de bandos, conseguimos que se cargen los bandos en el home!
    //ole ole! :)
    final bandosService = Provider.of<BandosService>(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "Galve",
          style: TextStyle(color: Color.fromRGBO(15, 17, 68, 1.0)),
        ),
        leading: Image.asset("assets/escudo.png"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Color.fromRGBO(15, 17, 68, 1.0)),
      ),
      endDrawer: DrawerMenu(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(right: size.width * 0.075, bottom: 5),
              height: size.height * 0.2,
              alignment: Alignment.bottomRight,
              child: userProvider.objetctUserLogin != null
                  ? Text(
                      "Hola " + userProvider.userEmail,
                      style: TextStyle(
                          color: Color.fromRGBO(15, 17, 68, 1.0), fontSize: 20),
                    )
                  : null,
            ),
            TiempoContainer(),
            DashBoardSeccion(),
            //Expanded(child: GirdHome())
          ],
        ),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/waveHome.png"), fit: BoxFit.cover)),
      ),
    );
  }
}

class TiempoContainer extends StatelessWidget {
  const TiempoContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return CardConFondo(
        color: Color.fromRGBO(105, 82, 237, 1.0),
        child: Column(
          children: [
            Container(
                height: 75,
                child: ElTiempo(),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(125, 103, 249, 1.0),
                  borderRadius: BorderRadius.circular(25),
                )),
          ],
        ),
        imagen: AssetImage("assets/tiempohome2.png"));
  }
}

class ElTiempo extends StatelessWidget {
  const ElTiempo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          "assets/temperatura-96.png",
          width: 40,
        ),
        Text("Temperatura"),
        SizedBox(
          width: 20,
        ),
        Image.asset(
          "assets/parcialmente-nublado-lluvia-96.png",
          width: 40,
        ),
        Text("lluvia")
      ],
    );
  }
}

class DashBoardSeccion extends StatelessWidget {
  const DashBoardSeccion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: Color.fromRGBO(105, 82, 237, 1.0),
      child: Container(
        height: size.height * 0.66,
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Expanded(child: GirdHome())
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(25), topLeft: Radius.circular(25)),
        ),
      ),
    );
  }
}

class GirdHome extends StatelessWidget {
  const GirdHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GridView.count(
      shrinkWrap: true,
      mainAxisSpacing: 10,
      padding: EdgeInsets.only(
          left: size.width * 0.075,
          right: size.width * 0.075,
          top: 4,
          bottom: 4),
      crossAxisSpacing: 10,
      childAspectRatio: 1.4,
      crossAxisCount: 2,
      children: [
        ItemGrid(
          image: Image.asset(
            "assets/megafono-96.png",
            width: 80,
          ),
          text: Text("Bandos"),
          onTap: () {
            Navigator.pushNamed(context, "bandos");
          },
          tapRedirection: "bandos",
        ),
        ItemGrid(
            image: Image.asset(
              "assets/calendario-96.png",
              width: 80,
            ),
            text: Text("Eventos"),
            onTap: () {
              Navigator.pushNamed(context, "eventos");
            },
            tapRedirection: "eventos"),
        ItemGrid(
            image: Image.asset(
              "assets/confeti-96.png",
              width: 80,
            ),
            text: Text("Fiestas"),
            onTap: () {
              Navigator.pushNamed(context, "proximamente");
            },
            tapRedirection: "proximamente"),
        ItemGrid(
            image: Image.asset(
              "assets/reloj-96.png",
              width: 80,
            ),
            text: Text("Horarios"),
            onTap: () {
              Navigator.pushNamed(context, "proximamente");
            },
            tapRedirection: "proximamente"),
        ItemGrid(
            image: Image.asset(
              "assets/poste-indicador-96.png",
              width: 80,
            ),
            text: Text("Qué ver"),
            onTap: () {
              launch("https://galve.org/Que_Visitar");
            },
            tapRedirection: "proximamente"),
        ItemGrid(
            image: Image.asset(
              "assets/tienda-96.png",
              width: 80,
            ),
            onTap: () {
              launch("https://galve.org/Servicios");
            },
            text: Text("Servicios"),
            tapRedirection: "proximamente"),
      ],
    );
  }
}

class ItemGrid extends StatelessWidget {
  final Image image;
  final Text text;
  final String tapRedirection;
  final Function onTap;

  const ItemGrid({
    Key? key,
    required this.image,
    required this.text,
    required this.tapRedirection,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: InkResponse(
        onTap: () => onTap(),
        child: CardContainer(
            child: Column(
              children: [image, text],
            ),
            height: 0,
            width: 0,
            padding: 0),
      ),
    );
  }
}
