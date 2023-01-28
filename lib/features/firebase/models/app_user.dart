class AppUser {
  String firstName;
  String lastName;
  String username;
  String email;
  String uid;
  String phoneNumber;
  String profilePhotoUrl;
  AppUser(
      {required this.firstName,
      required this.lastName,
      required this.username,
      required this.email,
      required this.uid,
      required this.phoneNumber,
      required this.profilePhotoUrl});

  AppUser copyWith(
      {String? firstName,
      String? lastName,
      String? username,
      String? email,
      String? uid,
      String? phoneNumber,
      String? profilePhotoUrl}) {
    return AppUser(
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        username: username ?? this.username,
        email: email ?? this.email,
        uid: uid ?? this.uid,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        profilePhotoUrl: profilePhotoUrl ?? this.profilePhotoUrl);
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'firstName': firstName});
    result.addAll({'lastName': lastName});
    result.addAll({'username': username});
    result.addAll({'email': email});
    result.addAll({'uid': uid});
    result.addAll({'phoneNumber': phoneNumber});
    result.addAll({"profilePhotoUrl": profilePhotoUrl});

    return result;
  }

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
        firstName: map['firstName'] ?? '',
        lastName: map['lastName'] ?? '',
        username: map['username'] ?? '',
        email: map['email'] ?? '',
        uid: map['uid'] ?? '',
        phoneNumber: map['phoneNumber'] ?? '',
        profilePhotoUrl: map['profilePhotoUrl'] ?? '');
  }

  Map<String, dynamic> toJson() {
    final result = <String, dynamic>{};

    result.addAll({'firstName': firstName});
    result.addAll({'lastName': lastName});
    result.addAll({'username': username});
    result.addAll({'email': email});
    result.addAll({'uid': uid});
    result.addAll({'phoneNumber': phoneNumber});
    result.addAll({'profilePhotoUrl': profilePhotoUrl});

    return result;
  }

  factory AppUser.fromJson(Map<String, dynamic> map) {
    return AppUser(
        firstName: map['firstName'] ?? '',
        lastName: map['lastName'] ?? '',
        username: map['username'] ?? '',
        email: map['email'] ?? '',
        uid: map['uid'] ?? '',
        phoneNumber: map['phoneNumber'] ?? '',
        profilePhotoUrl: map['profilePhotoUrl'] ?? '');
  }

  @override
  String toString() {
    return 'AppUser(firstName: $firstName, lastName: $lastName, username: $username, email: $email, uid: $uid, phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AppUser &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.username == username &&
        other.email == email &&
        other.uid == uid &&
        other.phoneNumber == phoneNumber &&
        other.profilePhotoUrl == profilePhotoUrl;
  }

  @override
  int get hashCode {
    return firstName.hashCode ^
        lastName.hashCode ^
        username.hashCode ^
        email.hashCode ^
        uid.hashCode ^
        phoneNumber.hashCode ^
        profilePhotoUrl.hashCode;
  }
}
