
import 'dart:math';

import 'package:dars_29_home/controllers/courses_controller.dart';
import 'package:dars_29_home/models/course.dart';
import 'package:flutter/material.dart';

class ShowCourses extends StatelessWidget {
  ShowCourses({super.key});

  CoursesController coursesController = CoursesController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder  (
      future: coursesController.getCourses(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData) {
          return Center(
            child: Text(
              "Kechirasiz, hech qanaqa malumot topilmadi!",
              style: TextStyle(fontSize: 20, color: Colors.red),
            ),
          );
        }

        if (snapshot.hasError) {
          return Center(
            child: Text(
              "Kechirasiz, malumot olsihda xato yuzaga keldi!",
              style: TextStyle(fontSize: 20, color: Colors.red),
            ),
          );
        }

        final data = snapshot.data;
        List<Course> courses = data!;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for(int i = 0; i < courses.length;i++)
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: InkWell(
                  onTap: (){
                    Map<String,dynamic> mp = {
                      'course':courses[i],
                      'courseId': -1
                    };
                    Navigator.pushNamed(context, '/show-course',arguments: mp);

                  },
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey,width: 3),
                      // color: Color.fromARGB(Random().nextInt(255), Random().nextInt(255), Random().nextInt(255), Random().nextInt(255)),
                      image: DecorationImage(
                        image: NetworkImage('${courses[i].imgUrl}'),
                        fit: BoxFit.fitWidth
                      )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(),
                          Text("${courses[i].lessons.length} lesson",style: TextStyle(fontSize: 20,color: Color.fromARGB(Random().nextInt(255), Random().nextInt(255), Random().nextInt(255), Random().nextInt(255))),)
                        ],
                      ),
                    ),
                  ),
                ),
              )
          ],
        ); // Temporary placeholder
      },
    );
  }
}
