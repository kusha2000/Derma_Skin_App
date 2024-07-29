import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyPlan extends StatelessWidget {
  const MyPlan({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    DateTime oneYearLater = now.add(Duration(days: 365));
    DateTime threeMonthsLater = now.add(Duration(days: 90));

    // Format the dates
    String oneYearLaterFormatted =
        DateFormat('dd MMM yyyy').format(oneYearLater);
    String threeMonthsLaterFormatted =
        DateFormat('dd MMM yyyy').format(threeMonthsLater);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF607C6D),
        title: const Center(
          child: Text(
            "My Plan",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: const Color(0xFFeaecdf),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                color: const Color(0xFFACBCB1),
                child: const Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 50,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "You have no active plan",
                                style: TextStyle(
                                    color: Color(0xFF607C6D),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "Upgrade your plan today to help keep you safe!",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w300),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          "Benefits:",
                          style: TextStyle(
                              color: Color(0xFF607C6D),
                              fontSize: 19,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.brightness_1, size: 8),
                                SizedBox(width: 8),
                                Expanded(
                                    child: Text('Unlimited free Smart Checks')),
                              ],
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(Icons.brightness_1, size: 8),
                                SizedBox(width: 8),
                                Expanded(
                                    child: Text(
                                        'Map your moles with our body map')),
                              ],
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(Icons.brightness_1, size: 8),
                                SizedBox(width: 8),
                                Expanded(
                                    child: Text(
                                        'Never miss a check with our built in reminders')),
                              ],
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(Icons.brightness_1, size: 8),
                                SizedBox(width: 8),
                                Expanded(
                                    child: Text(
                                        'Help stay safe from UV with our UV index')),
                              ],
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(Icons.brightness_1, size: 8),
                                SizedBox(width: 8),
                                Expanded(
                                    child: Text(
                                        'Know your risks with our skin type and risk profile questionnaires')),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Get your plan today",
                        style: TextStyle(
                            color: Color(0xFF607C6D),
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                          "For best value and protection, we recommended buying a year plan."),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  print("19000 Plan");
                },
                child: Container(
                  child: IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 5.0),
                            child: Container(
                              color: const Color(0xFF607C6D),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "LKR",
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "19000.00",
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            color: const Color(0xFF607C6D),
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "365 days of Derma Plan",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const Text(
                                    "Get full benefits for just LKR 1561.64 a month",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Color(0xFFF5F5F5),
                                        fontWeight: FontWeight.w300),
                                  ),
                                  Text(
                                    "Expires on $oneYearLaterFormatted",
                                    style: const TextStyle(
                                        fontSize: 15,
                                        color: Color(0xFFF5F5F5),
                                        fontWeight: FontWeight.w300),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  print("9700 Plan");
                },
                child: Container(
                  child: IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 5.0),
                            child: Container(
                              color: const Color(0xFF607C6D),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "LKR",
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "9700.00",
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            color: const Color(0xFF607C6D),
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "90 days of Derma Plan",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const Text(
                                    "Get full benefits for just LKR 3233.33 a month",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Color(0xFFF5F5F5),
                                        fontWeight: FontWeight.w300),
                                  ),
                                  Text(
                                    "Expires on $threeMonthsLaterFormatted",
                                    style: const TextStyle(
                                        fontSize: 15,
                                        color: Color(0xFFF5F5F5),
                                        fontWeight: FontWeight.w300),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  text: const TextSpan(
                    text: 'Visit our FAQs to learn more or contact us at ',
                    style: TextStyle(color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'support@derma.com',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
