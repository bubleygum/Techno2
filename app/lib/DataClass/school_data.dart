class schoolList{
  final String namaSekolah;
  final String itemIsi;

  schoolList({required this.namaSekolah, required this.itemIsi});

  Map<String, dynamic> toJson(){
    return{
      "namaSekolah":namaSekolah,
      "detail": itemIsi
    };
  }
  factory schoolList.fromJson(Map<String,dynamic> json){
    return schoolList(
      namaSekolah: json['namaSekolah'],
      itemIsi: json['itemIsi']
    );
  }
}