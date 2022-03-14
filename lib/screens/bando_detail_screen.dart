import 'package:flutter/material.dart';
import 'package:galve/services/services.dart';
import 'package:galve/widgets/drawer_menu.dart';
import 'package:galve/widgets/widgets.dart';
import 'package:provider/provider.dart';

class BandoDetailScreen extends StatelessWidget {
  const BandoDetailScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bandosService = Provider.of<BandosService>(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          "Bandos",
          style: TextStyle(color: Color.fromRGBO(15, 17, 68, 1.0)),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color.fromRGBO(15, 17, 68, 1.0)),
      ),
      endDrawer: const DrawerMenu(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(right: size.width * 0.075, bottom: 5),
              height: size.height * 0.15,
              alignment: Alignment.bottomRight,
            ),
            TituloContainer(
              bandoService: bandosService,
            ),
            DescripcionContainer(
              bandoService: bandosService,
            ),
            //Expanded(child: GirdHome())
          ],
        ),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/waveHome.png"), fit: BoxFit.cover)),
      ),
    );
  }
}

class TituloContainer extends StatelessWidget {
  final BandosService bandoService;

  const TituloContainer({Key? key, required this.bandoService})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return CardConFondo(
        color: Color.fromRGBO(105, 82, 237, 1.0),
        child: Column(
          children: [
            Container(
                height: size.height * 0.10,
                child: Center(
                  child: Text(
                    bandoService.selectedBando.titulo,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(125, 103, 249, 1.0),
                  borderRadius: BorderRadius.circular(25),
                )),
          ],
        ),
        imagen: AssetImage("assets/tiempohome2.png"));
  }
}

class DescripcionContainer extends StatelessWidget {
  final BandosService bandoService;

  const DescripcionContainer({Key? key, required this.bandoService})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.7,
      color: Color.fromRGBO(105, 82, 237, 1.0),
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [Text(bandoService.selectedBando.descripcion)],
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
