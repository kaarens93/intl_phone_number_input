// import 'package:flutter/material.dart';
// import 'package:intl_phone_number_input/intl_phone_number_input.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Scaffold(
//         appBar: AppBar(title: Text('Demo')),
//         body: MyHomePage(),
//       ),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   final GlobalKey<FormState> formKey = GlobalKey<FormState>();

//   final TextEditingController controller = TextEditingController();
//   String initialCountry = 'NG';
//   PhoneNumber number = PhoneNumber(isoCode: 'NG');

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: formKey,
//       child: Container(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             InternationalPhoneNumberInput(
//               onInputChanged: (PhoneNumber number) {
//                 print(number.phoneNumber);
//               },
//               onInputValidated: (bool value) {
//                 print(value);
//               },
//               ignoreBlank: false,
//               autoValidate: false,
//               selectorTextStyle: TextStyle(color: Colors.black),
//               initialValue: number,
//               textFieldController: controller,
//               inputBorder: OutlineInputBorder(),
//             ),
//             RaisedButton(
//               onPressed: () {
//                 formKey.currentState.validate();
//               },
//               child: Text('Validate'),
//             ),
//             RaisedButton(
//               onPressed: () {
//                 getPhoneNumber('+15417543010');
//               },
//               child: Text('Update'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void getPhoneNumber(String phoneNumber) async {
//     PhoneNumber number =
//         await PhoneNumber.getRegionInfoFromPhoneNumber(phoneNumber, 'US');

//     setState(() {
//       this.number = number;
//     });
//   }

//   @override
//   void dispose() {
//     controller?.dispose();
//     super.dispose();
//   }
// }

import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(appBar: AppBar(title: Text('Demo')), body: MyHomePage()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController controller = TextEditingController();
  String initialCountry = 'US';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InternationalPhoneNumberInput(
              selectorTextStyle: TextStyle(fontSize: 16),
              onInputChanged: (PhoneNumber number) {
                print(number.phoneNumber);
              },
              onInputValidated: (bool value) {
                print(value);
              },
              ignoreBlank: true,
              autoValidate: false,
              // initialValue: PhoneNumber(isoCode: 'US'),
              textFieldController: controller,
              // inputBorder: OutlineInputBorder(),
              selectorType: PhoneInputSelectorType.DIALOG,
            ),
            RaisedButton(
              onPressed: () {
                formKey.currentState.validate();
              },
              child: Text('Validate'),
            ),
            RaisedButton(
              onPressed: () {
                getPhoneNumber('+15417543010');
              },
              child: Text('Update'),
            ),
          ],
        ),
      ),
    );
  }

  void getPhoneNumber(String phoneNumber) async {
    PhoneNumber number =
        await PhoneNumber.getRegionInfoFromPhoneNumber(phoneNumber, 'US');

    String parsableNumber = await PhoneNumber.getParsableNumber(number);
    controller.text = parsableNumber;

    setState(() {
      initialCountry = number.isoCode;
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
