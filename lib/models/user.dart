class UserModel {
  //final String id;
  final String fullName;
  final String email;
  final String userRole;
  final String? shopName;

  UserModel({
    //required this.id,
    required this.fullName,
    required this.email,
    required this.userRole,
    this.shopName,
  });

  UserModel.fromData(Map<String, dynamic> data)
      : //id = data['id'],
        fullName = data['fullName'],
        email = data['email'],
        userRole = data['userRole'],
        shopName = data['shopName'];

  Map<String, dynamic> toJson() => {
        //'id': id,
        'fullName': fullName,
        'email': email,
        'userRole': userRole,
        'shopName': shopName,
      };
}
