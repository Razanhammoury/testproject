 import 'package:flutter/cupertino.dart';

class Patient {
  String ? height ;
  String? Weight;
  DateTime? Diseases;

  Patient({this.height, this.Weight, this.Diseases});
}

// Map toJson() => {
//   'height': height,
//   'Weight': Weight,
//   'Diseases': Diseases,
// };
//
//   Patient.fromJson(Map<String, dynamic> json)
//   : height = json['height'],
//   Weight = json['Weight'],
//   Diseases = json['Diseases'];
//
//   }

