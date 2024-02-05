


class UserModel {
  String id;
  String firstName;
  String lastName;
  String username;
  String email;
  String phone;
  String? password;
  String profileImage;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.phone,
    this.password,
    required this.profileImage
  });


  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'username': username,
      'email': email,
      'phone': phone,
      'password': password,
      'profileImage': profileImage
    };
  }


  String get fullName => '$firstName $lastName';

  static List<String>  nameParts(fullName){
    return fullName.split(' ');
  }

  static String generateUsername(fullName){
    List<String> nameParts = fullName.split(' ');
    String firstName = nameParts[0];
    String lastName = nameParts.length > 1 ? nameParts[1] : '';

    String camelCaseUsername = "$firstName$lastName";
    String usernameWithPrefix = "cwt_$camelCaseUsername";
    return usernameWithPrefix;
  }

  static UserModel empty(){
    return UserModel(
      id: '',
      firstName: '',
      lastName: '',
      username: '',
      email: '',
      phone: '',
      password: '',
      profileImage: ''
    );
  }

 
}
