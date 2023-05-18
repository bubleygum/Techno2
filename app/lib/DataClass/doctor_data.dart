class doctorList{
  final String nama;
  final String jabatan;
  final String pengalaman;
  final String rating;
  final String hargaSesi;
  final String noTelp;

  doctorList({
    required this.nama, 
    required this.jabatan,
    required this.pengalaman,
    required this.rating,
    required this.hargaSesi,
    required this.noTelp,});

  Map<String, dynamic> toJson(){
    return{
      "nama":nama,
      "jabatan": jabatan,
      "pengalaman": pengalaman,
      "rating": rating,
      "hargaSesi": hargaSesi,
      "noTelp": noTelp
    };
  }
  factory doctorList.fromJson(Map<String,dynamic> json){
    return doctorList(
      nama: json['nama'],
      jabatan: json['jabatan'],
      pengalaman: json['pengalaman'],
      rating: json['rating'],
      hargaSesi: json['hargaSesi'],
      noTelp: json['noTelp'],
    );
  }
}