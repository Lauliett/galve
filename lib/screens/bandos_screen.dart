import 'package:flutter/material.dart';
import 'package:galve/provider/providers.dart';
import 'package:galve/services/bandos_service.dart';
import 'package:galve/services/notifications_service.dart';
import 'package:galve/widgets/widgets.dart';
import 'package:provider/provider.dart';

class BandosScreen extends StatelessWidget {
  const BandosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bandosService = Provider.of<BandosService>(context);
    final userProvider = Provider.of<UserProvider>(context);

    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          "Bandos",
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      endDrawer: const DrawerMenu(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            SizedBox(height: size.height * 0.2),
            Container(
              width: double.infinity,
              height: size.height * 0.8,
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(child: ListaBandos(bandosService: bandosService)),
                ],
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25),
                    topLeft: Radius.circular(25)),
              ),
            )
          ],
        ),
        decoration: const BoxDecoration(
            color: Color.fromRGBO(125, 103, 249, 1.0),
            image: DecorationImage(
                image: AssetImage("assets/waveHomeLila.png"),
                fit: BoxFit.cover)),
      ),

      floatingActionButton: (userProvider.objetctUserLogin == null)
          ? null
          : FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.add),
            ),
      // This trailing comma makes auto,
    );
  }
}

class ListaBandos extends StatelessWidget {
  ListaBandos({
    Key? key,
    required this.bandosService,
  }) : super(key: key);

  final BandosService bandosService;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: bandosService.bandos.length,
        itemBuilder: (BuildContext context, int index) => GestureDetector(
              onTap: () {
                bandosService.selectBandoPorIndex(index);
                Navigator.pushNamed(context, 'bando_detalle');
              },
              child: BandoCard(
                bando: bandosService.bandos[index],
              ),
            ));
  }
}
