import 'package:flutter/material.dart';

class SetReminder extends StatefulWidget {
  const SetReminder({super.key});

  @override
  _SetReminderState createState() => _SetReminderState();
}

class _SetReminderState extends State<SetReminder> {
  String _selectedFrequency = 'Every three months';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF607C6D),
        title: const Center(
          child: Text(
            "Set Reminders",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Container(
        color: const Color(0xFFeaecdf),
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Dermatologists recommend that you check your skin at least once every 3 months.",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: 40,
                color: const Color(0xFFACBCB1),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 16.0),
                    child: Text(
                      "REMINDERS",
                      style: TextStyle(
                        color: Color(0xFF607C6D),
                        fontSize: 17.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Frequency"),
                        PopupMenuButton<String>(
                          onSelected: (String value) {
                            setState(() {
                              _selectedFrequency = value;
                            });
                          },
                          itemBuilder: (BuildContext context) {
                            return [
                              'Never',
                              'Every month',
                              'Every two months',
                              'Every three months',
                              'Every six months'
                            ].map((String choice) {
                              return PopupMenuItem<String>(
                                value: choice,
                                child: Text(choice),
                              );
                            }).toList();
                          },
                          child: Row(
                            children: [
                              Text(
                                _selectedFrequency,
                                style: TextStyle(color: Colors.blue),
                              ),
                              Icon(Icons.arrow_drop_down, color: Colors.blue),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                height: 40,
                color: const Color(0xFFACBCB1),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 16.0),
                    child: Text(
                      "HOW YOU RECEIVE THEM",
                      style: TextStyle(
                        color: Color(0xFF607C6D),
                        fontSize: 17.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Push notification"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Email"),
                        TextButton(
                          onPressed: () {},
                          child: const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Add Email  >",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("SMS"),
                        TextButton(
                          onPressed: () {},
                          child: const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Add Number  >",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
