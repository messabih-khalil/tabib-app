import 'package:app/providers/appointments.dart';
import 'package:app/screens/app_home.dart';
import 'package:app/utils/colors.dart';
import 'package:app/utils/spaces.dart';
import 'package:app/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:app/widgets/booking_screen_widgets/horizontal_calendar.dart';
import 'package:app/widgets/booking_screen_widgets/time_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AppointmentScreen extends StatelessWidget {
  static const route = '/book-appointment';

  Map<String, String> appointmentData = {"doctor": "", "date": "", "time": ""};

  // Set date
  void setDate(String date) {
    appointmentData["date"] = date;
  }

  // Set Time
  void setTime(String time) {
    appointmentData["time"] = time;
  }

  @override
  Widget build(BuildContext context) {
    final String doctorId =
        ModalRoute.of(context)!.settings.arguments as String;

    appointmentData['doctor'] = doctorId;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Doctor Appointment',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: AppSpaces.container),
        height:
            MediaQuery.of(context).size.height - AppBar().preferredSize.height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                DateFormat('MMM, yyyy').format(DateTime.now()),
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              HorizontalCalendar(setDate),
              SizedBox(
                height: 15,
              ),
              Text(
                "Chose A Time",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              TimePicker(setTime),
              Container(
                  height: 100,
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 50,
                    child: GestureDetector(
                      onTap: () async {
                        if (appointmentData['date'] != '' &&
                            appointmentData['time'] != '') {
                          await Provider.of<Appointments>(context,
                                  listen: false)
                              .addAppointment(appointmentData);

                          Navigator.of(context)
                              .pushReplacementNamed(AppHome.route);
                        }
                      },
                      child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(8),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: AppColors.mainDarkColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            "Apply",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
