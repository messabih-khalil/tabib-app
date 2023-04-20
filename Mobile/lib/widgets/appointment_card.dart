import 'package:app/utils/colors.dart';
import 'package:flutter/material.dart';

class AppointmentCard extends StatelessWidget {

  final appointment;
  const AppointmentCard({this.appointment});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Date",
                        style: TextStyle(color: AppColors.lightGreyColor),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "21 apr 2023",
                        style: TextStyle(color: AppColors.lightGreyColor),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Specialist :",
                        style: TextStyle(color: AppColors.lightGreyColor),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Time",
                        style: TextStyle(color: AppColors.lightGreyColor),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "13:00",
                        style: TextStyle(color: AppColors.lightGreyColor),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Dentist",
                        style: TextStyle(color: AppColors.lightGreyColor),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Doctor",
                        style: TextStyle(color: AppColors.lightGreyColor),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Dr. khalil",
                        style: TextStyle(color: AppColors.lightGreyColor),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text("")
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(6),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 2,
                            color: const Color.fromARGB(255, 255, 147, 147)),
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                          fontSize: 18,
                          color: const Color.fromARGB(255, 255, 147, 147),
                          fontWeight: FontWeight.bold),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
