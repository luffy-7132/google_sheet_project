import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_sheet_project/Screens/second_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> data = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse(
        'https://script.google.com/macros/s/AKfycbyhzMZ8aZrOAbjMVE2FgaaUWdXWqiZuX8zs-bLBUPm_yJpImx3v015I5iKnfyE8gYPE/exec'));
    if (response.statusCode == 200) {
      setState(() {
        var jsonResponse = json.decode(response.body);
        data = jsonResponse['content'];
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Sheets Data'),
      ),
      body: FutureBuilder(
        future: fetchData(),
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Slidable(
                startActionPane: ActionPane(
                  motion: const BehindMotion(),
                  children: [
                    SlidableAction(
                      onPressed: (value) {
                        deleteSheetRow(index + 1);
                      },
                      backgroundColor: Color(0xFFFE4A49),
                      foregroundColor: Colors.white,
                      icon: Icons.delete,
                      label: 'Delete',
                    ),
                  ],
                ),
                child: Card(
                  margin: const EdgeInsets.all(10),
                  color: Colors.grey.shade100,
                  elevation: 7,
                  child: ListTile(
                    title: Text('Name: ${data[index][0]}'),
                    subtitle: Text(
                        'Email: ${data[index][1]},\nPhone: ${data[index][2]}'),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SecondPage(),
            ),
          );
        },
      ),
    );
  }

  Future<void> deleteSheetRow(int rowNumber) async {
    String scriptUrl =
        'https://script.google.com/macros/s/AKfycbyttwCijLVBQ-4WvYbHZQSW_ww1JGm8ZmI_JYQzZ5_tKoFMJX8R3rSiaFA9qY3p7Ahhiw/exec';
    Map<String, String> data = {'rowNumber': rowNumber.toString()};

    var response = await http.post(Uri.parse(scriptUrl), body: data);

    if (response.statusCode == 200) {
      // fetchData();
      print('Row $rowNumber deleted successfully');
    } else {
      print(
          'Failed to delete row $rowNumber. Status code: ${response.statusCode}');
    }
  }
}
