import 'package:crud_with_sqflite/data/create_data_mahasiswa.dart';
import 'package:crud_with_sqflite/data/data_mahasiswa.dart';
import 'package:flutter/material.dart';

//ignore_for_file: prefer_const_constructors
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DataMahasiswaPage(),
                    ),
                  );
                  setState(() {});
                },
                child: Text("Data Mahasiswa")),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CreateDataMahasiswa(),
                    ),
                  );
                },
                child: Text("Create Data Mahasiswa"))
          ],
        ),
      ),
    );
  }
}
