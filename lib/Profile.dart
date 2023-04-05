import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  var heightController = TextEditingController();
  var wightController = TextEditingController();
  var DiseasesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              textDirection: TextDirection.rtl,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('معلوماتي الشخصية',
                  //textDirection: TextDirection.rtl,

                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    backgroundColor: Colors.green,

                   // fontFamily: 'RobotoMono',
                  ),
                ),


                SizedBox(
                  height: 40.0,
                ),
                SizedBox(
                  width: 200.0,
                  child: TextFormField(
                    controller: heightController,
                    keyboardType: TextInputType.number,
                    onFieldSubmitted: (String value) {
                      print(value);
                    },
                    onChanged: (String value) {
                      print(value);
                    },

                    decoration: InputDecoration(
                      labelText: 'الطول ',
                      border: OutlineInputBorder(),

                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  width: 200.0,
                  child: TextFormField(
                    controller: wightController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    onFieldSubmitted: (String value) {
                      print(value);
                    },
                    onChanged: (String value) {
                      print(value);
                    },
                    decoration: InputDecoration(
                      labelText: 'الوزن',
                      border: OutlineInputBorder(),

                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),



                TextFormField(
                  controller: DiseasesController,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  onFieldSubmitted: (String value) {
                    print(value);
                  },
                  onChanged: (String value) {
                    print(value);
                  },
                  decoration: InputDecoration(
                    labelText: 'قائمة الامراض',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                
                Container(
                  constraints: BoxConstraints.expand(),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/lib/237-200x300.jpg"),
                        fit: BoxFit.cover),
                  ),
                  child: const Text(
                    'Image in fullscreen',
                    style: TextStyle(fontSize: 34, color: Colors.red),
                  ),
                )

                // Container(
                //   width: double.infinity,
                //   color: Colors.blue,
                //   child: MaterialButton(
                //     onPressed: () {
                //       print(heightController.text);
                //       print(wightController.text);
                //     },
                //     child: Text(
                //       'تسجيل دخول',
                //       textDirection: TextDirection.rtl,
                //       style: TextStyle(
                //         color: Colors.white,
                //       ),
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: 20.0,
                //   //width: 50.0,
                // ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
