import 'package:app/providers/specialities.dart';
import 'package:app/widgets/shared/speciality_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SpecialitiesCards extends StatelessWidget {
  const SpecialitiesCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height:
            MediaQuery.of(context).size.height - AppBar().preferredSize.height,
        child: FutureBuilder(
            future: context.watch<Specialities>().getSpecialities(),
            builder: (ctx, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Column(
                children: [
                  SizedBox(
                    height: 180,
                    child: GridView.builder(
                      itemCount:
                          context.watch<Specialities>().specialities.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        mainAxisSpacing: 10.0,
                        crossAxisSpacing: 10.0,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return SpecialityCard(
                          speciality:
                              context.watch<Specialities>().specialities[index],
                        );
                      },
                    ),
                  ),
                ],
              );
            }));
  }
}
