class workshopList{
  final String namaPelatihan;
  final String itemIsi;

  workshopList({required this.namaPelatihan, required this.itemIsi});

  Map<String, dynamic> toJson(){
    return{
      "namaPelatihan":namaPelatihan,
      "detail": itemIsi
    };
  }
  factory workshopList.fromJson(Map<String,dynamic> json){
    return workshopList(
      namaPelatihan: json['namaPelatihan'],
      itemIsi: json['itemIsi']
    );
  }
}