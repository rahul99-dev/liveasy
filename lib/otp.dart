import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:liveasy/profile_select.dart';
import 'package:pinput/pinput.dart';
import 'input_mobile.dart';

class Myotp extends StatefulWidget {
  final String phone;

  Myotp(this.phone);

  @override
  State<Myotp> createState() => _MyotpState();
}

class _MyotpState extends State<Myotp> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(147, 210, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(147, 210, 243, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );
    var code = '';
    final pinController = TextEditingController();
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
        ),
        body: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                'Verify Phone',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Code sent to  ${widget.phone}',
                style: TextStyle(fontSize: 14, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20,
              ),
              Pinput(
                androidSmsAutofillMethod:
                    AndroidSmsAutofillMethod.smsRetrieverApi,
                controller: pinController,
                pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                onChanged: (value) {
                  code = value;
                },
                length: 6,
                showCursor: true,
              ),
              SizedBox(
                height: 40,
                child: Row(
                  children: [
                    Text(
                      "Didn't receive the code?",
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Request Again',
                        style: TextStyle(color: Colors.black),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                  height: 56,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      try {
                        PhoneAuthCredential credential =
                            PhoneAuthProvider.credential(
                                verificationId: MobileNumber.verify,
                                smsCode: code);

                        // Sign the user in (or link) with the credential
                        await auth.signInWithCredential(credential);
                        if (context.mounted) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => profileSelect()));
                        }
                      } catch (e) {
                        print('ERROR');
                      }
                    },
                    child: Text(
                      'VERIFY AND CONTINUE',
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
