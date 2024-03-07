import 'package:flutter/material.dart';
import 'package:google_sheet_project/widgets/custom_widgets.dart';
import 'package:http/http.dart' as http;

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});
  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            mTextField(name, 'Enter Your Name'),
            mTextField(email, 'Enter Your E-Mail'),
            mTextField(phone, 'Enter Your Phone Number'),
            ElevatedButton(
              style: ElevatedButton.styleFrom(minimumSize: Size(300, 50)),
              onPressed: () {
                sendDataToGoogleSheet(context);
              },
              child: const Text(
                'add data',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void sendDataToGoogleSheet(BuildContext context) async {
    try {
      String scriptUrl =
          'https://script.google.com/macros/s/AKfycbzk4ySdkBkFhF5v6jLalQWZ6fLa-vl9VyaDWy3o8oFtNm2J6bkwgFw4UdLzgF_PzrAUow/exec'; // Replace with your Google Apps Script web app URL
      Map<String, String> data = {
        'name': name.text.toString(),
        'email': email.text.toString(),
        'phone': phone.text.toString(),
      };

      var response = await http.post(Uri.parse(scriptUrl), body: data);

      if (response.statusCode == 200) {
        print('Data sent successfully');
      } else {
        print('Failed to send data. Status code: ${response.statusCode}');
        Navigator.pop(context);
      }
    } catch (e) {
      print('Error sending data: $e');
    }
  }
}
