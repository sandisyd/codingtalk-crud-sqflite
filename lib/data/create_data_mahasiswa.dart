// ignore_for_file: prefer_const_constructors

import 'package:crud_with_sqflite/database/db_helper.dart';
import 'package:crud_with_sqflite/home_page.dart';
import 'package:crud_with_sqflite/models/table_mahasiswa.dart';
import 'package:flutter/material.dart';

class CreateDataMahasiswa extends StatefulWidget {
  const CreateDataMahasiswa({Key? key}) : super(key: key);

  @override
  State<CreateDataMahasiswa> createState() => _CreateDataMahasiswaState();
}

class _CreateDataMahasiswaState extends State<CreateDataMahasiswa> {
  TextEditingController nimController = TextEditingController();
  TextEditingController namaLengkapController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController noHpController = TextEditingController();

  DbHelper dbHelper = DbHelper();
  TableMahasiswa tableMahasiswa = TableMahasiswa();

  @override
  void initState() {
    dbHelper.database();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form Mahasiswa"),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("NIM"),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: nimController,
              decoration: InputDecoration(
                  hintText: 'Masukkan nim Anda',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
            SizedBox(
              height: 10,
            ),
            Text("Nama Lengkap"),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: namaLengkapController,
              decoration: InputDecoration(
                  hintText: 'Masukkan Nama Anda',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
            SizedBox(
              height: 10,
            ),
            Text("Email"),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                  hintText: 'Masukkan Email Anda',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
            SizedBox(
              height: 10,
            ),
            Text("No Handphone"),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: noHpController,
              decoration: InputDecoration(
                  hintText: 'Masukkan noHp Anda',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: () {
                  dbHelper
                      .inserDataMahasiswa({
                        'nim': nimController.text,
                        'nama_lengkap': namaLengkapController.text,
                        'email': emailController.text,
                        'no_hp': noHpController.text,
                        'created_at': DateTime.now().toString(),
                        'updated_at': DateTime.now().toString()
                      })
                      .then(
                        (value) => ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.green,
                            content: Text("Data Berhasil dibuat"),
                          ),
                        ),
                      )
                      .then((value) => Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (_) => HomePage()),
                          (route) => false));
                },
                child: Text("Register")),
          ],
        ),
      ),
    );
  }
}
