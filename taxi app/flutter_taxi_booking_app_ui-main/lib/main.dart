import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'booking.dart';
import 'home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'paymentMethod.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyDZwFa74VZr6NWaZvL4_d5HEYwoOvSMlLY',
        appId: '1:1096192453786:web:0470e9eec55fb8c6324323',
        messagingSenderId: '1096192453786',
        projectId: 'anish-7483b',
        storageBucket: 'anish-7483b.appspot.com',
      ),
    );
  } else {
    await Firebase.initializeApp();
  }

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => Home(),
        '/booking': (context) => Booking(),
        '/paymentMethod': (context) => PaymentMethod(),
      },
    ),
  );
}
