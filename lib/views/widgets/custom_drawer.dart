import 'package:dars_29_home/views/screens/edit_courses.dart';
import 'package:dars_29_home/views/screens/home_screen.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          SizedBox(height: 30,),
          ListTile(
            title: Text("Courses"),
            trailing: IconButton(
              onPressed: (){
                Navigator.pushReplacementNamed(context, '/');
              },
              icon: Icon(Icons.keyboard_arrow_right),
            ),
          ),
          SizedBox(height: 20,),
          ListTile(
            title: Text("Edit Courses"),
            trailing: IconButton(
              onPressed: (){
                Navigator.pushReplacementNamed(context, '/edit-course');
                // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => EditCourses()));
              },
              icon: Icon(Icons.edit),
            ),
          ),
          SizedBox(height: 20,),
          ListTile(
            title: Text("Exit"),
            trailing: IconButton(
              onPressed: (){
                Navigator.pushReplacementNamed(context, '/login-page');
                // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => EditCourses()));
              },
              icon: Icon(Icons.exit_to_app),
            ),
          ),
        ],
      )
    );
  }
}
