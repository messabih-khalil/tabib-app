import 'package:app/providers/doctors.dart';
import 'package:app/utils/spaces.dart';
import 'package:app/widgets/bottom_navigation.dart';
import 'package:app/widgets/shared/doctor_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DoctorsScreen extends StatelessWidget {
  const DoctorsScreen({super.key});
  static const route = '/doctors';
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          args['title'],
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: AppSpaces.container),
        height:
            MediaQuery.of(context).size.height - AppBar().preferredSize.height,
        child: FutureBuilder(
            future: context.watch<DoctorsProvider>().getDoctors(args['id']),
            builder: (ctx, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container(
                    height: MediaQuery.of(context).size.height -
                        AppBar().preferredSize.height,
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: CircularProgressIndicator());
              }
              return ListView.builder(
                  itemCount: context.watch<DoctorsProvider>().doctors.length,
                  itemBuilder: (ctx, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: DoctorCard(
                          doctor:
                              context.watch<DoctorsProvider>().doctors[index]),
                    );
                  });
            }),
      ),
    );
  }
}
