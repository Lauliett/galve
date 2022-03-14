import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:galve/widgets/login_widget.dart';
import 'package:galve/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            color: Color.fromRGBO(125, 103, 249, 1.0),
            image: DecorationImage(
                image: AssetImage("assets/waveHomeLila.png"),
                fit: BoxFit.cover)),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: CardConBorde(
                child: LoginWidget(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


/* No me ha salido xD
class Clipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width / 2, 0);

    var fistControlPoint = Offset(size.width, size.height / 5);
    var firstEnd = Offset(size.width / 4, size.height / 3);

    path.quadraticBezierTo(
        fistControlPoint.dx, fistControlPoint.dy, firstEnd.dx, firstEnd.dy);

    path.lineTo(, y)
    var secondControlPoint = Offset(0, size.height);

    var secondPoint = Offset(size.width - 10, size.height);

    path.quadraticBezierTo(
        0, 3 * size.height / 8, size.width / 2, size.height / 2);

/*Path path = Path();
    path.moveTo(size.width / 2, 0); //Ax, Ay
    path.quadraticBezierTo(size.width, size.height / 8, size.width / 2, size.height / 4); //Bx, By, Cx, Cy
    path.quadraticBezierTo(0, 3 * size.height / 8, size.width / 2, size.height / 2); //Dx, Dy, Ex, Ey
    canvas.drawPath(path, paint);*/
    return path;
  }

  @override
  bool shouldReclip(Clipper oldClipper) => false;
}*/
