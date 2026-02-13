class UserModel {
  final String uid;
  final String name;
  final String email;
  final String image; 

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'image': image,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      image: map['image'] ?? '',
    );
  }

  UserModel copyWith({
    String? uid,
    String? name,
    String? email,
    String? image,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      email: email ?? this.email,
      image: image ?? this.image,
    );
  }
}
