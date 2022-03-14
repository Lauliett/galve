import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

//Plugin:https://pub.dev/packages/syncfusion_flutter_calendar

//Podemos tener varios tipos de vistas

class EventosScreen extends StatelessWidget {
  const EventosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          "Eventos",
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            SizedBox(height: size.height * 0.15),
            Container(
              width: double.infinity,
              height: size.height * 0.85,
              child: SfCalendar(
                //Tenemos multiples vistas
                view: CalendarView.month,
                initialSelectedDate: DateTime.now(),
                todayHighlightColor: Color.fromRGBO(50, 211, 117, 1.0),
                backgroundColor: Colors.grey.shade200,
                showNavigationArrow: true,
                monthViewSettings: const MonthViewSettings(
                    showAgenda: true,
                    numberOfWeeksInView: 5,
                    appointmentDisplayMode:
                        MonthAppointmentDisplayMode.appointment),
                cellBorderColor: Color.fromRGBO(15, 17, 68, 1.0),
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
      /*
      body: Column(
        children: [          
          SfCalendar(
            //Tenemos multiples vistas
            view: CalendarView.month,
            dataSource: EventosDataSource(getAppointments()),
            initialSelectedDate: DateTime.now(),
            todayHighlightColor: Color.fromRGBO(50, 211, 117, 1.0),
            backgroundColor: Colors.grey.shade200,
            showNavigationArrow: true,
            monthViewSettings: const MonthViewSettings(
                showAgenda: true,
                numberOfWeeksInView: 5,
                appointmentDisplayMode: MonthAppointmentDisplayMode.appointment),
            cellBorderColor: Color.fromRGBO(15, 17, 68, 1.0),
          ),
        ],
      ),*/
    );
  }
}
