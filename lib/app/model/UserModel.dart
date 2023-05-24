class UserModel {
  late String nama;
  late String katasandi;

  UserModel(this.nama,this.katasandi);

  Map<String, dynamic> toMap(){
    var map = <String, dynamic>{
      'nama': nama,
      'katasandi': katasandi
    };
    return map;
  }

  UserModel.fromMap(Map<String, dynamic> map){
    nama = map['nama'];
    katasandi = map['katasandi'];
  }
}