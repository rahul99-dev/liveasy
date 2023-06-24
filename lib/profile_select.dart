import 'package:flutter/material.dart';

class profileSelect extends StatefulWidget {
  const profileSelect({super.key});

  @override
  State<profileSelect> createState() => _profileSelectState();
}

class _profileSelectState extends State<profileSelect> {
  int _value = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Please Select Your Profile',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(border: Border.all()),
            child: Row(
              children: [
                Radio(
                  activeColor: Color.fromRGBO(46, 59, 98, 1.0),
                  value: 1,
                  groupValue: _value,
                  onChanged: ((value) {
                    setState(() {
                      _value = value!;
                    });
                  }),
                ),
                Image.asset('images/home.png'),
                SizedBox(
                  width: 20,
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Shipper',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        'Lorem ipsum dolor sit amet,\nconsectetur adipiscing',
                        style: TextStyle(fontSize: 11, color: Colors.grey),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(border: Border.all()),
            child: Row(
              children: [
                Radio(
                  activeColor: Color.fromRGBO(46, 59, 98, 1.0),
                  value: 2,
                  groupValue: _value,
                  onChanged: ((value) {
                    setState(() {
                      _value = value!;
                    });
                  }),
                ),
                Image.asset('images/transport.png'),
                SizedBox(
                  width: 20,
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Transport',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        'Lorem ipsum dolor sit amet,\nconsectetur adipiscing',
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'CONTINUE',
                    style: TextStyle(fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(46, 59, 98, 1.0)),
                )),
          ),
        ],
      ),
    );
  }
}
