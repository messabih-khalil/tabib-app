import 'package:app/screens/appointment_screen.dart';
import 'package:app/utils/colors.dart';
import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget {
  final doctor;
  const DoctorCard({this.doctor});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 100,
                width: 100,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    doctor['image'],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doctor['username'],
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Dentist",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.mainDarkColor),
                  ),
                  Text(
                    doctor['user']['phoneNumber'],
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppColors.lightGreyColor),
                  ),
                  Text(
                    "Chlef, Chlef",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppColors.lightGreyColor),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacementNamed(
                  AppointmentScreen.route,
                  arguments: doctor['_id']);
            },
            child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: AppColors.mainDarkColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  "Book Now",
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                )),
          ),
        ]),
      ),
    );
  }
}
