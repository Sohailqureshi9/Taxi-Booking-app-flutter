import 'package:flutter/material.dart';
import 'package:learning/summary.dart';

class PaymentDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment Details"),
        backgroundColor: Colors.amber,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: PaymentDetailsForm(),
        ),
      ),
    );
  }
}

class PaymentDetailsForm extends StatefulWidget {
  @override
  _PaymentDetailsFormState createState() => _PaymentDetailsFormState();
}

class _PaymentDetailsFormState extends State<PaymentDetailsForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _pinController = TextEditingController();
  TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _phoneNumberController,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(labelText: 'Phone Number'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your phone number';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _pinController,
            obscureText: true,
            decoration: InputDecoration(labelText: 'PIN'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your PIN';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _amountController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Amount'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the amount';
              }
              return null;
            },
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _showConfirmationDialog(context);
              }
            },
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Transaction Successful"),
          content: Text("The money has been sent successfully!"),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context)
                    .pop(); // Pop both the dialog and the payment details screen
                double amount = double.tryParse(_amountController.text) ?? 0.0;
                _navigateToSummaryScreen(context, amount);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _navigateToSummaryScreen(BuildContext context, double amount) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Summary(amount: amount)),
    );
  }
}