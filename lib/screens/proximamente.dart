import 'package:flutter/material.dart';
import 'package:galve/widgets/drawer_menu.dart';

class Proximamente extends StatelessWidget {
  const Proximamente({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          "En construccion",
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
              child: const Center(
                child: Text("Proximamente"),
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
    );
  }
}
