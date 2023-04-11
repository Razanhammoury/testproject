import 'package:flutter/material.dart';
import '../models/reminder.dart';
// import 'package:medical_care_project/models/reminder.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// import 'package:medical_care_project/pages/type_page.dart';
import 'package:provider/provider.dart';
// import '../provider.dart';
import 'detailspage.dart';
import '../models/reminder.dart';
import 'package:time_range_picker/time_range_picker.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:virtual_keyboard_multi_language/virtual_keyboard_multi_language.dart';



class Add_Medicine extends StatelessWidget {
  var Medicine_Name = TextEditingController();
  var Medicine_Type= TextEditingController();
  var Dose  = TextEditingController();
  var Repeat  = TextEditingController();
  var Med_Stock  = TextEditingController();
  var Date  = TextEditingController();
  var Remaining_Quantity  = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'إضافة دواء',
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                TextFormField(
                  controller: Medicine_Name,
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (String value) {
                    print(value);
                  },
                  onChanged: (String value) {
                    print(value);
                  },
                  decoration: InputDecoration(
                    labelText: 'اسم الدواء',
                    icon: IconButton(
                        onPressed: () {
                         //open camera ocr
                        },
                        icon: const Icon(Icons.camera_alt_sharp, color: Colors.green, size: 50,
                        )),



                    border: OutlineInputBorder(),
                  ),

                ),
                SizedBox(
                  height: 15.0,
                ),
                TextFormField(
                  controller:Medicine_Type,
                  keyboardType: TextInputType.text,
                  onFieldSubmitted: (String value) {
                    print(value);
                  },
                  onChanged: (String value) {
                    print(value);
                  },
                  decoration: InputDecoration(
                    labelText: 'نوع الدواء',

                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),

                TextFormField(
                  controller: Dose,
                  keyboardType: TextInputType.text,
                  onFieldSubmitted: (String value) {
                    print(value);
                  },
                  onChanged: (String value) {
                    print(value);
                  },
                  decoration: InputDecoration(
                    labelText: 'جرعة الدواء',
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(
                  height: 20.0,
                ),

                TextFormField(
                  controller: Med_Stock,
                  keyboardType: TextInputType.text,
                  onFieldSubmitted: (String value) {
                    print(value);
                  },
                  onChanged: (String value) {
                    print(value);
                  },
                  decoration: InputDecoration(
                    labelText: 'مخزون الدواء',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),

                TextFormField(
                  controller: Remaining_Quantity,
                  keyboardType: TextInputType.number,
                  onFieldSubmitted: (String value) {
                    print(value);
                  },
                  onChanged: (String value) {
                    print(value);
                  },
                  decoration: InputDecoration(
                    labelText: 'ضبط التذكير للكمية المتبقية',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),

                TextFormField(
                  controller: Repeat,
                  keyboardType: TextInputType.number,
                  onFieldSubmitted: (String value) {
                    print(value);
                  },
                  onChanged: (String value) {
                    print(value);
                  },
                  decoration: InputDecoration(
                    labelText: 'تكرار الدواء',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),

                // TextFormField(
                //   controller: Date,
                //   keyboardType: TextInputType.datetime,
                //   onFieldSubmitted: (String value) {
                //     print(value);
                //   },
                //   onChanged: (String value) {
                //     print(value);
                //   },
                //   decoration: InputDecoration(
                //     labelText: 'الوقت',
                //
                //     // icon: IconButton(
                //     //   onPressed: (() async {
                //     //     DateTime? pickedDate = await showDatePicker(
                //     //       context: context,
                //     //       initialDate: DateTime.now(),
                //     //       firstDate: DateTime(1950),
                //     //       lastDate: DateTime(2100),
                //     //       builder: (context, child) {
                //     //         return Theme(
                //     //           data: Theme.of(context).copyWith(
                //     //             dialogBackgroundColor: Colors.black,
                //     //             colorScheme: const ColorScheme.light(
                //     //               primary: Colors.teal,
                //     //               onPrimary: Colors.white,
                //     //               onSurface: Colors.white,
                //     //             ),
                //     //             textButtonTheme: TextButtonThemeData(
                //     //               style: TextButton.styleFrom(
                //     //                 foregroundColor: Colors.teal,
                //     //               ),
                //     //             ),
                //     //           ),
                //     //           child: child!,
                //     //         );
                //     //       },
                //     //    );
                //     //
                //     //     // setState(() {
                //     //     //   reminderDate = DateFormat('yyyy-MM-dd').format(pickedDate!);
                //     //     // });
                //     //   }),
                //     //   icon: const Icon(Icons.date_range, color: Colors.teal,),
                //     // ),
                //
                //
                //
                //     icon: IconButton(
                //         onPressed: () {
                //           showDateRangePicker(
                //           context: context,
                //               firstDate: DateTime.now(),
                //               lastDate: DateTime(2070));
                //     builder: (context, child) {
                //       return Theme(
                //         data: Theme.of(context).copyWith(
                //           dialogBackgroundColor: Colors.black,
                //           colorScheme: const ColorScheme.light(
                //             primary: Colors.teal,
                //             onPrimary: Colors.white,
                //             onSurface: Colors.white,
                //           ),
                //           textButtonTheme: TextButtonThemeData(
                //             style: TextButton.styleFrom(
                //               foregroundColor: Colors.teal,
                //             ),
                //           ),
                //         ),
                //         child: child!,
                //       );
                //     };
                //         },
                //         icon: const Icon(Icons.calendar_month, color: Colors.green, size: 50,
                //         )),
                //
                //
                //
                //     border: OutlineInputBorder(),
                //   ),
                // ),
                // SizedBox(
                //   height: 20.0,
                // ),

                TextFormField(
                  controller: Date,
                  keyboardType: TextInputType.datetime,
                  onFieldSubmitted: (String value) {
                    print(value);
                  },
                  onChanged: (String value) {
                    print(value);
                  },
                  decoration: InputDecoration(
                    labelText: 'الساعة',

                    // icon: IconButton(
                    //     onPressed: () {
                    //        DateTimePicker(
                    //         type: DateTimePickerType.dateTimeSeparate,
                    //         dateMask: 'd MMM, yyyy',
                    //         initialValue: DateTime.now().toString(),
                    //         firstDate: DateTime(2000),
                    //         lastDate: DateTime(2100),
                    //         icon: Icon(Icons.event),
                    //         dateLabelText: 'Date',
                    //         timeLabelText: "Hour",
                    //         selectableDayPredicate: (date) {
                    //           // Disable weekend days to select from the calendar
                    //           if (date.weekday == 6 || date.weekday == 7) {
                    //             return false;
                    //           }
                    //
                    //           return true;
                    //         },
                    //         onChanged: (val) => print(val),
                    //         validator: (val) {
                    //           print(val);
                    //           return null;
                    //         },
                    //         onSaved: (val) => print(val),
                    //       );
                    //     },
                    //     icon: const Icon(Icons.access_time, color: Colors.green, size: 50,
                    //     )),





                   // border: OutlineInputBorder(),
                  ),

                ),
                SizedBox(
                  height: 20.0,
                ),


              // * there is problem with RaiseButton

                //      Center(
                //       child: RaisedButton(
                //         onPressed: () async {
                //           TimeRange result = await showTimeRangePicker(
                //             context: context,
                //           );
                //           print("result " + result.toString());
                //         },
                //         child: Text("Pure"),
                //       ),
                // ),


                Container(
                  width: double.infinity,
                  color: Colors.green,
                  child: MaterialButton(
                    onPressed: () {
                      print(Medicine_Name.text);
                      print(Medicine_Type.text);
                      print(Dose.text);
                      print(Med_Stock.text);
                      print(Repeat.text);
                      print(Remaining_Quantity.text);
                      print(Date.text);

                    },
                    child: Text(
                      'إضافة دواء',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                // Row(
                //                 //   mainAxisAlignment: MainAxisAlignment.center,
                //                 //   children: [
                //                 //     Text(
                //                 //       'Don\'t have an account?',
                //                 //     ),
                //                 //     TextButton(
                //                 //       onPressed: () {},
                //                 //       child: Text(
                //                 //         'Register Now',
                //                 //       ),
                //                 //     ),
                //                 //   ],
                //                 // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}