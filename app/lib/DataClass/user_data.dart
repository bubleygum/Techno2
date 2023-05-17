class UserData {
  String username;
  String phoneNumber;
  String email;
  
  UserData({required this.username, required this.phoneNumber, required this.email});
  Map<String, dynamic> toJson(){
    return{
      "username":username,
      "phone-number": phoneNumber,
      "email": email
    };
  }
  factory UserData.fromJson(Map<String,dynamic> json){
    return UserData(
      username: json['username'],
      phoneNumber: json['phone-number'],
      email: json['email'],
    );
  }
}