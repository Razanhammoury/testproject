import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/assets/provider.dart';
import '../models/reminder.dart';
// import '../provider.dart';


class DetailsScreen extends StatefulWidget {
  DetailsScreen({super.key, this.reminderId});
  int? reminderId;
  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  String? simiReminderName = "";
  String? simiReminderDate;
  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();
    return FutureBuilder(
        future: Provider.of<ReminderProvider>(context, listen: false).loadReminders(),
        builder: (context, snapshot) {


          return Consumer<ReminderProvider>(
              builder: ((context, provider, child) {
                Reminder reminder = provider.reminders.firstWhere(
                      (element) => element.id == widget.reminderId,
                );
            simiReminderDate ??= DateFormat('yyyy-MM-dd').format(DateTime.now());
            List<SimiReminder> simireminders = [];
            simireminders = List<SimiReminder>.from(
                jsonDecode(reminder.simiReminders!)
                    .map((i) => SimiReminder.fromJson(i)));

            return Scaffold(
              backgroundColor: Colors.white70,
              appBar: AppBar(
                title: Wrap(
                  children: [
                    Text(reminder.reminderName!,
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                    )
                  ],
                ),
              ),
              body: Container(
                child: Column(
                  children: [
                    Container(
                      color: Colors.black54,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                                width: 150,
                                child: TextField(
                                  style: TextStyle(
                                      color: Colors.teal),
                                  controller: _controller,
                                  onChanged: (value) {
                                    simiReminderName = value;
                                  },
                                  decoration: const InputDecoration(
                                      hintStyle: TextStyle(color: Colors.white),
                                      hintText: "simi reminder name",
                                      fillColor: Colors.white,
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.teal)),
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.teal)),
                                      disabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.teal))),
                                )),
                            Row(
                              children: [
                                Text(simiReminderDate!, style: TextStyle(color: Colors.teal),
                                ),
                                IconButton(
                                  onPressed: (() async {
                                    DateTime? pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1950),
                                      lastDate: DateTime(2100),
                                      builder: (context, child) {
                                        return Theme(
                                          data: Theme.of(context).copyWith(
                                            dialogBackgroundColor: Colors.black,
                                            colorScheme:
                                            const ColorScheme.light(
                                              primary: Colors.teal,
                                              onPrimary: Colors.white,
                                              onSurface: Colors.white,
                                            ),
                                            textButtonTheme:
                                            TextButtonThemeData(
                                              style: TextButton.styleFrom(
                                                foregroundColor: Colors.teal,
                                              ),
                                            ),
                                          ),
                                          child: child!,
                                        );
                                      },
                                    );

                                    setState(() {
                                      simiReminderDate =
                                          DateFormat('yyyy-MM-dd').format(pickedDate!);
                                    });
                                  }),
                                  icon: const Icon(
                                    Icons.date_range,
                                    color: Colors.teal,
                                  ),
                                ),
                              ],
                            ),
                            IconButton(
                                onPressed: (() {
                                  FocusScope.of(context).unfocus();
                                  _controller.clear();
                                  simireminders.add(SimiReminder(
                                      simiReminderName: simiReminderName == "" ? "UNAMED simireminder" : simiReminderName,
                                      simiReminderDate: simiReminderDate,
                                      simiReminderCompleted: false));
                                  simiReminderDate = DateFormat('yyyy-MM-dd')
                                      .format(DateTime.now());

                                  provider.updatesimiReminder(
                                      reminder.id, jsonEncode(simireminders));
                                  setState(() {});
                                }),
                                icon: const Icon(
                                  Icons.add_box,
                                  color: Colors.teal,
                                ))
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        child: ListView.builder(
                          itemCount: simireminders.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                                leading: IconButton(
                                    icon: Icon(
                                        simireminders[index].simiReminderCompleted == false ? Icons.check_box_outline_blank : Icons.check_box,
                                        color: simireminders[index].simiReminderCompleted == false ? Colors.teal : const Color.fromARGB(255, 156, 168, 173)),
                                    onPressed: () {
                                      simireminders[index].simiReminderCompleted = !simireminders[index].simiReminderCompleted!;

                                      provider.updatesimiReminder(reminder.id, jsonEncode(simireminders));

                                      setState(() {});
                                    },
                                    color: simireminders[index].simiReminderCompleted == false ? const Color.fromARGB(255, 0, 8, 12) : const Color.fromARGB(255, 156, 168, 173)),
                                trailing: Text(
                                  simireminders[index].simiReminderDate!,
                                  style: TextStyle(
                                      color: simireminders[index].simiReminderCompleted == false ? Colors.teal : const Color.fromARGB(255, 156, 168, 173)),
                                ),
                                title: Text(
                                  simireminders[index].simiReminderName!,
                                  style: TextStyle(
                                      color: simireminders[index].simiReminderCompleted == false ? Colors.white : const Color.fromARGB(255, 156, 168, 173)),
                                ));
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
              }));
        });
  }
}
