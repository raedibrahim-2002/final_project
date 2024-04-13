class UserModel {
  String? name;
  String? email;
  String? phone;
  String? image;
  String? token;

  // constructor
  UserModel(this.name, this.email, this.token, this.phone, this.image);

  // named constructor
  UserModel.fromJson({required Map<String, dynamic> data}) {
    //Refatoring json => map
    name = data['name'];
    email = data['email'];
    token = data['token'];
    phone = data['phone'];
    image = data['image'];
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'token': token,
      'phone': phone,
      'image': image,
    };
  }
}