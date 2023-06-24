import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import 'otp.dart';

class MobileNumber extends StatefulWidget {
  MobileNumber({super.key});
  static String verify = '';
  @override
  State<MobileNumber> createState() => _MobileNumberState();
}

class _MobileNumberState extends State<MobileNumber> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            'Please Enter Your Phone Number',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "You'll receive a 4 digit code to verify next",
            style: TextStyle(fontSize: 14, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          IntlPhoneField(
            initialCountryCode: 'IN',
            controller: _controller,
            decoration: InputDecoration(
                labelText: 'Mobile Number',
                border: OutlineInputBorder(borderSide: BorderSide())),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
              height: 56,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  await FirebaseAuth.instance.verifyPhoneNumber(
                    verificationCompleted: (PhoneAuthCredential credential) {},
                    verificationFailed: (FirebaseAuthException e) {},
                    phoneNumber: '+91 ${_controller.text}',
                    codeSent: (String verificationId, int? resendToken) {
                      MobileNumber.verify = verificationId;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Myotp(_controller.text),
                        ),
                      );
                    },
                    codeAutoRetrievalTimeout: (String verificationId) {},
                  );

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Myotp(_controller.text),
                    ),
                  );
                },
                child: Text(
                  'CONTINUE',
                  style: TextStyle(fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(46, 59, 98, 1.0)),
              )),
        ]),
      ),
    ));
  }
}
