import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/pages/login_screen.dart';

class Doctor_Profile extends StatelessWidget {
  var Clinic_AdressController = TextEditingController();
  var Hospital_NameController = TextEditingController();
  var Hospital_AdressController = TextEditingController();
  var Hospital_WorkingHourController = TextEditingController();
  var Clinic_WorkingHourController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await FirebaseAuth.instance.signOut().then((value) => {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ),
                    )
                  });
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              textDirection: TextDirection.rtl,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'طبيب',
                  //textDirection: TextDirection.rtl,

                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    backgroundColor: Colors.green,

                    // fontFamily: 'RobotoMono',
                  ),
                ),
                Text(
                  'معلوماتي الشخصية ',
                  //textDirection: TextDirection.rtl,

                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'cairo ',
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                SizedBox(
                  width: 300.0,
                  child: TextFormField(
                    controller: Clinic_AdressController,
                    keyboardType: TextInputType.text,
                    onFieldSubmitted: (String value) {
                      print(value);
                    },
                    onChanged: (String value) {
                      print(value);
                    },
                    decoration: InputDecoration(
                      labelText: 'عنوان العيادة الشخصية ',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  width: 300.0,
                  child: TextFormField(
                    controller: Clinic_WorkingHourController,
                    keyboardType: TextInputType.number,
                    onFieldSubmitted: (String value) {
                      print(value);
                    },
                    onChanged: (String value) {
                      print(value);
                    },
                    decoration: InputDecoration(
                      labelText: 'أوقات الدوام بالعيادة',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  width: 300.0,
                  child: TextFormField(
                    controller: Hospital_NameController,
                    keyboardType: TextInputType.text,
                    onFieldSubmitted: (String value) {
                      print(value);
                    },
                    onChanged: (String value) {
                      print(value);
                    },
                    decoration: InputDecoration(
                      labelText: 'اسم المشفى الذي أداوم فيه',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  width: 300.0,
                  child: TextFormField(
                    controller: Hospital_AdressController,
                    keyboardType: TextInputType.text,
                    onFieldSubmitted: (String value) {
                      print(value);
                    },
                    onChanged: (String value) {
                      print(value);
                    },
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      labelText: 'عنوان المشفى الذي أداوم فيه',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  width: 300.0,
                  child: TextFormField(
                    controller: Hospital_WorkingHourController,
                    keyboardType: TextInputType.datetime,
                    onFieldSubmitted: (String value) {
                      print(value);
                    },
                    onChanged: (String value) {
                      print(value);
                    },
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      labelText: 'أوقات دوامي  بالمشفى ',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  // constraints: BoxConstraints.expand(),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/lib/237-200x300.jpg"),
                        fit: BoxFit.cover),
                  ),
                  child: const Text(
                    'Image in fullscreen',
                    style: TextStyle(fontSize: 34, color: Colors.red),
                  ),
                ),
                Container(
                  width: double.infinity,
                  color: Colors.blue,
                  child: MaterialButton(
                    onPressed: () {
                      print(Clinic_AdressController.text);
                      print(Clinic_WorkingHourController.text);
                      print(Hospital_AdressController.text);
                      print(Hospital_WorkingHourController.text);
                      print(Hospital_NameController.text);
                    },
                    child: Text(
                      'تم',
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                  //width: 50.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
