import 'package:bmi_app/custormer_files/custormerdata.dart';
import 'package:flutter/material.dart';

class CustomersPage extends StatefulWidget {
  const CustomersPage({super.key,});

  @override
  State<StatefulWidget> createState() {
    return CustomersPageState();
  }
}

class CustomersPageState extends State<CustomersPage> {
  var arrData = [
    {'Name': 'Mauli', 'MO.NO': 7498958281, 'unread': 4},
    {'Name': 'Raman', 'MO.NO': 7498958281, 'unread': 4},
    {'Name': 'Govinda', 'MO.NO': 7498958281, 'unread': 4},
    {'Name': 'Rushikesh', 'MO.NO': 7498958281, 'unread': 4},
    {'Name': 'Radha', 'MO.NO': 7498958281, 'unread': 4},
    {'Name': 'Mangesh', 'MO.NO': 7498958281, 'unread': 4},
    {'Name': 'Mahadev', 'MO.NO': 7498958281, 'unread': 4},
    {'Name': 'Tatyasaheb', 'MO.NO': 7498958281, 'unread': 4},
    {'Name': 'Muktta', 'MO.NO': 7498958281, 'unread': 4},
    {'Name': 'Kalinda', 'MO.NO': 7498958281, 'unread': 4},
    {'Name': 'Suman', 'MO.NO': 7498958281, 'unread': 4},
    {'Name': 'Janhavi', 'MO.NO': 7498958281, 'unread': 4},
    {'Name': 'Motiram', 'MO.NO': 7498958281, 'unread': 4},
    {'Name': 'Daivshala', 'MO.NO': 7498958281, 'unread': 4},
    {'Name': 'Bibhishan', 'MO.NO': 7498958281, 'unread': 4},
    {'Name': 'Asha', 'MO.NO': 7498958281, 'unread': 4},
    {'Name': 'Urmila', 'MO.NO': 7498958281, 'unread': 4},
    {'Name': 'Shital', 'MO.NO': 7498958281, 'unread': 4},
    {'Name': 'Anushka', 'MO.NO': 7498958281, 'unread': 4},
    {'Name': 'Avish', 'MO.NO': 7498958281, 'unread': 4},
    {'Name': 'Anita', 'MO.NO': 7498958281, 'unread': 4},
    {'Name': 'Gitanjali', 'MO.NO': 7498958281, 'unread': 4},
    {'Name': 'Kishor', 'MO.NO': 7498958281, 'unread': 4},
    {'Name': 'Swaranjali', 'MO.NO': 7498958281, 'unread': 4},
    {'Name': 'Swaraj', 'MO.NO': 7498958281, 'unread': 4},
    {'Name': 'Vasant', 'MO.NO': 7498958281, 'unread': 4},
    {'Name': 'Nagesh', 'MO.NO': 7498958281, 'unread': 4},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.blue.shade300, Colors.purple.shade300])),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Customerdata()),
              );
            },
            child: ListView(
              children: arrData
                  .map(
                    (value) => Padding(
                      padding: const EdgeInsets.all(5),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.blue.shade400),
                          gradient: LinearGradient(
                            colors: [
                              Colors.blue.shade300,
                              Colors.deepOrange.shade300,
                            ],
                          ),
                        ),
                        child: ListTile(
                          leading: const Icon(Icons.account_circle_sharp),
                          title: Text(value['Name'].toString()),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
