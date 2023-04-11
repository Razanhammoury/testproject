import 'package:flutter/cupertino.dart';

class Notification {
  int? Notification_ID;
  int? Reciver_ID;
  String ? Title ;
  String? Body;
  DateTime? Date_Time;

  Notification({this.Notification_ID, this.Reciver_ID, this.Date_Time, this.Body ,this.Title});
}
