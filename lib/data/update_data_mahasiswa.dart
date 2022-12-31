// ignore_for_file: prefer_const_constructors

import 'package:crud_with_sqflite/database/db_helper.dart';
import 'package:crud_with_sqflite/home_page.dart';
import 'package:crud_with_sqflite/models/table_mahasiswa.dart';
import 'package:flutter/material.dart';

class UpdateDataMahasiswa extends StatefulWidget {
  final TableMahasiswa? dataMahasiswa;
  const UpdateDataMahasiswa({Key? key, this.dataMahasiswa}) : super(key: key);

  @override
  State<UpdateDataMahasiswa> createState() => _UpdateDataMahasiswaState();
}

class _UpdateDataMahasiswaState extends State<UpdateDataMahasiswa> {
  TextEditingController nimController = TextEditingController();
  TextEditingController namaLengkapController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController noHpController = TextEditingController();

  DbHelper dbHelper = DbHelper();
  TableMahasiswa tableMahasiswa = TableMahasiswa();

  @override
  void initState() {
    dbHelper.database();
    nimController.text = widget.dataMahasiswa!.nim.toString();
    namaLengkapController.text = widget.dataMahasiswa!.namaLengkap.toString();
    emailController.text = widget.dataMahasiswa!.email.toString();
    noHpController.text = widget.dataMahasiswa!.noHp.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Mahasiswa"),
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
                      .updateDataMahasiswa(widget.dataMahasiswa!.id!, {
                        'nim': nimController.text,
                        'nama_lengkap': namaLengkapController.text,
                        'email': emailController.text,
                        'no_hp': noHpController.text,
                        'updated_at': DateTime.now().toString()
                      })
                      .then(
                        (value) => ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.green,
                            content: Text("Data Berhasil diupdate"),
                          ),
                        ),
                      )
                      .then((value) => Navigator.pop(context));
                  // setState(() {});
                },
                child: Text("Update data")),
          ],
        ),
      ),
    );
  }
}
