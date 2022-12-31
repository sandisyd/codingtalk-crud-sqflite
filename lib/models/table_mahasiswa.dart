class TableMahasiswa {
  int? id;
  int? nim;
  String? namaLengkap;
  String? email;
  String? noHp;
  String? prodi;
  String? createdAt;
  String? updatedAt;

  TableMahasiswa(
      {this.id,
      this.nim,
      this.namaLengkap,
      this.email,
      this.noHp,
      this.createdAt,
      this.updatedAt});

  String get tableName => 'tbale_mahasiswa';
  // String get

  @override
  factory TableMahasiswa.fromJson(Map<String, dynamic> json) => TableMahasiswa(
      id: json['id'],
      nim: json['nim'],
      namaLengkap: json['nama_lengkap'],
      email: json['email'],
      noHp: json['no_hp'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at']);
}
