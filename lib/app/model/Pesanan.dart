class Pesanan {
  late String ruang;
  late String nama_pemesan;
  late String pemesan;
  late String jumlah;
  late String kapasitas;
  late String status;

  Pesanan(this.ruang,this.nama_pemesan,this.pemesan,this.jumlah,this.kapasitas,this.status);

  Map<String, dynamic> toMap(){
    var map = <String, dynamic>{
      'ruang': ruang,
      'nama_pemesan': nama_pemesan,
      'pemesan' : pemesan,
      'jumlah' : jumlah,
      'kapasitas' : kapasitas,
      'status' : status
    };
    return map;
  }

  Pesanan.fromMap(Map<String, dynamic> map){
    ruang = map['ruang'];
    nama_pemesan = map['nama_pemesan'];
    pemesan = map['pemesan'];
    jumlah = map['jumlah'];
    kapasitas = map['kapasitas'];
    status = map['status'];
  }
}