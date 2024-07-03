import 'package:flutter/material.dart';

class Booking extends StatelessWidget {
  const Booking({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Booking"),
        backgroundColor: Colors.amber[600],
        elevation: 0,
        toolbarHeight: 80,
      ),
      body: content(context),
    );
  }

  Widget content(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 40,
          ),
          locationInputField("From?", false, TextEditingController(), true),
          SizedBox(
            height: 20,
          ),
          locationInputField("To?", false, TextEditingController(), true),
          SizedBox(
            height: 30,
          ),
          Text(
            "History",
            style: TextStyle(fontSize: 25),
          ),
          SizedBox(
            height: 10,
          ),
          Text("Faiz-Ahmad-Faiz Road"),
          SizedBox(
            height: 20,
          ),
          Text("Sumbal road"),
          SizedBox(
            height: 20,
          ),
          Text("Shaeen chowk"),
          SizedBox(
            height: 20,
          ),
          Text("Chambeli Road"),
          SizedBox(
            height: 50,
          ),
          GestureDetector(
            onTap: (() => Navigator.of(context).pushNamed('/paymentMethod')),
            child: Container(
              height: 60,
              width: 350,
              decoration: BoxDecoration(
                color: Colors.amber[600],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  "Confirm booking",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget locationInputField(String title, bool isHistory,
    TextEditingController controller, bool isFrom) {
  return Container(
    height: 60,
    width: 350,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 3),
        ),
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Row(
        children: [
          isHistory
              ? Icon(
                  Icons.location_on,
                  color: Colors.green,
                )
              : Icon(
                  Icons.location_searching_outlined,
                  color: title.contains('From') ? Colors.grey : Colors.blue,
                ),
          SizedBox(
            width: 20,
          ),
          isFrom
              ? Expanded(
                  child: DropdownButtonFormField<String>(
                    value: controller.text.isEmpty ? null : controller.text,
                    onChanged: (newValue) {
                      controller.text = newValue!;
                    },
                    items: [
                      "1-8",
                      "1-9",
                      "1-10",
                      "1-11",
                      "1-12",
                      "1-13",
                      "1-14",
                      "1-15",
                      "h-8",
                      "h-9",
                      "h-10",
                      "h-11",
                      "h-12",
                      "h-13",
                      "h-14",
                      "h-15",
                      "G-8",
                      "G-9",
                      "G-10",
                      "G-11",
                      "G-12",
                      "G-13",
                      "G-14",
                      "G-15",
                      "f-8",
                      "F-9",
                      "F-10",
                      "F-11",
                      "F-12",
                      "F-13",
                      "F-14",
                      "F-15",
                      "E-8",
                      "E-9",
                      "E-10",
                      "E-11",
                      "E-12",
                      "E-13",
                      "E-14",
                      "E-15",
                      "D-12",
                      // Add your locations here
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    decoration: InputDecoration(
                      hintText: title,
                      border: InputBorder.none,
                    ),
                  ),
                )
              : Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: title,
                      border: InputBorder.none,
                    ),
                  ),
                ),
        ],
      ),
    ),
  );
}
