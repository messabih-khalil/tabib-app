import 'package:app/providers/appointments.dart';
import 'package:app/utils/spaces.dart';
import 'package:app/widgets/appointment_card.dart';
import 'package:app/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyAppointments extends StatelessWidget {
  static const route = '/my-appointments';
  const MyAppointments({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "My Appointments",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpaces.container),
        child: Container(
          height: MediaQuery.of(context).size.height -
              AppBar().preferredSize.height,
          child: SingleChildScrollView(
            child: Container(
                height: MediaQuery.of(context).size.height -
                    AppBar().preferredSize.height,
                child: FutureBuilder(
                    future: context.watch<Appointments>().getMyAppointments(),
                    builder: (ctx, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return ListView.builder(
                        itemBuilder: (ctx, index) {
                          return AppointmentCard(appointment : context.watch<Appointments>().appointments[index]);
                        },
                        itemCount: context.watch<Appointments>().appointments.length,
                      );
                    })),
          ),
        ),
      ),
    );
  }
}
