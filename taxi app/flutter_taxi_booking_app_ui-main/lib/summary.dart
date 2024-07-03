import 'package:flutter/material.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Summary extends StatelessWidget {
  final double amount;

  const Summary({Key? key, required this.amount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Summary"),
        backgroundColor: Colors.amber[600],
        elevation: 0,
        toolbarHeight: 100,
        actions: [
          // You can remove the Icon from here
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: content(context),
    );
  }

  Widget content(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.amber[200],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Image.asset(
                  'assets/taxi.png',
                  width: 160,
                  height: 160,
                ),
                Text(
                  "\Rupes=$amount", 
                  style: TextStyle(fontSize: 50),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 60,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Rate your last ride : ",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          RatingBar.builder(
            initialRating: 0,
            itemPadding: EdgeInsets.all(15),
            itemCount: 5,
            itemBuilder: ((context, index) => Icon(
                  Icons.star,
                  color: Colors.yellow,
                )),
            onRatingUpdate: (value) {},
          ),
          SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {
              // Show thank you message
              _showThankYouMessage(context);
            },
            child: Container(
              height: 60,
              width: 350,
              decoration: BoxDecoration(
                color: Colors.amber[600],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  "Submit",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showThankYouMessage(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Allah Hafiz"),
          content: Text("Thank you for riding with us!"),
          backgroundColor: Colors.amber,
        );
      },
    );
  }
}
