// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:crud_with_sqflite/data/update_data_mahasiswa.dart';
import 'package:crud_with_sqflite/database/db_helper.dart';
import 'package:crud_with_sqflite/models/table_mahasiswa.dart';
import 'package:flutter/material.dart';

class DataMahasiswaPage extends StatefulWidget {
  const DataMahasiswaPage({Key? key}) : super(key: key);

  @override
  State<DataMahasiswaPage> createState() => _DataMahasiswaPageState();
}

class _DataMahasiswaPageState extends State<DataMahasiswaPage> {
  DbHelper? dbHelper;
  TableMahasiswa tableMahasiswa = TableMahasiswa();

  Future initDatabase() async {
    await dbHelper!.database();
    setState(() {});
  }

  Future delete(int id) async {
    dbHelper!.deleteData(id);
    setState(() {});
  }

  @override
  void initState() {
    dbHelper = DbHelper();
    initDatabase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Mahasiswa"),
      ),
      body: FutureBuilder<List<TableMahasiswa>>(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final data = snapshot.data![index];
                  return Container(
                    height: 150,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  data.nim.toString(),
                                  style: TextStyle(fontSize: 20),
                                ),
                                Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (_) {
                                      return UpdateDataMahasiswa(
                                          dataMahasiswa: data);
                                    })).then(
                                      (value) => setState(() {}),
                                    );
                                    // setState(() {});
                                  },
                                  child: Icon(
                                    Icons.update,
                                    color: Color.fromARGB(
                                      255,
                                      Random().nextInt(256),
                                      Random().nextInt(256),
                                      Random().nextInt(256),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                              title:
                                                  Text("Apakah anda yakin ?"),
                                              actions: [
                                                MaterialButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  color: Colors.green,
                                                  child: Text(
                                                    "No",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                ),
                                                MaterialButton(
                                                  onPressed: () {
                                                    delete(data.id!)
                                                        .then((value) =>
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                                    SnackBar(
                                                              content: Text(
                                                                  "Data berhasil dihapus"),
                                                              backgroundColor:
                                                                  Colors.green,
                                                            )))
                                                        .then((value) =>
                                                            Navigator.pop(
                                                                context));
                                                  },
                                                  color: Colors.red,
                                                  child: Text(
                                                    "Yes",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ],
                                            ));
                                  },
                                  child: Icon(
                                    Icons.delete,
                                    color: Color.fromARGB(
                                      255,
                                      Random().nextInt(256),
                                      Random().nextInt(256),
                                      Random().nextInt(256),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              data.namaLengkap.toString(),
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              data.email.toString(),
                              style: TextStyle(fontSize: 17),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                });
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
        future: dbHelper!.getDataMahasiswa(),
      ),
    );
  }
}
