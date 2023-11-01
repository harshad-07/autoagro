class UserModel{
  String name;
  String email;
  String uid;
  String profilePic;
  String phoneNo;
  String createdAt;
  String password;

  UserModel({required this.name, required this.email, required this.uid, required this.profilePic, required this.phoneNo, required this.createdAt, required this.password});
  
  factory UserModel.fromMap(Map<String, dynamic> map){
    return UserModel(
      name: map['name'] ?? '', 
      email: map['email'] ?? '', 
      uid: map['uid'] ?? '', 
      profilePic: map['profilePic'] ?? '', 
      phoneNo: map['phoneNo'] ?? '',
      createdAt: map['createdAt'] ?? '',
      password: map['password'] ?? '',
    );
  }

  Map<String, dynamic> toMap(){
    return {
      "name": name,
      "email": email,
      "uid": uid,
      "profilePic": profilePic,
      "phoneNo": phoneNo,
      "createdAt": createdAt,
      "password": password
    };
  }
  
}