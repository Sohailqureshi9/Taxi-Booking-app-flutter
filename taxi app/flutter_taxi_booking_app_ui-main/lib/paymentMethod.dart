import 'package:flutter/material.dart';
import 'PaymentDetailScreen.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment Methods"),
        backgroundColor: Colors.amber[600],
        elevation: 0,
        toolbarHeight: 100,
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: content(context),
      ),
    );
  }

  Widget content(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          paymentMethod(context, "Easypaisa", "assets/Easypaisa.jpg"),
          SizedBox(
            height: 30,
          ),
          paymentMethod(context, "Jazzcash", "assets/jazzcash.png"),
          SizedBox(
            height: 30,
          ),
          paymentMethod(context, "Bank account", "assets/visa.png"),
          SizedBox(
            height: 30,
          ),
           paymentMethod(context, "Cash", "assets/money.png"),
          SizedBox(
            height: 230,
          ),
          
          GestureDetector(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => PaymentDetailsScreen()),
            ),
            child: Container(
              height: 60,
              width: 250,
              decoration: BoxDecoration(
                color: Colors.amber[600],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  "Continue",
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

Widget paymentMethod(BuildContext context, String title, String iconPath) {
  return GestureDetector(
    onTap: () => Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => PaymentDetailsScreen()),
    ),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          )
        ],
      ),
      child: ListTile(
        title: Text(title),
        leading: Container(
          child: Image.asset(iconPath),
          height: 50,
          width: 50,
        ),
        trailing: Icon(Icons.circle_outlined),
      ),
    ),
  );
}
