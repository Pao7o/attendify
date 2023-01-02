import 'dart:convert';

class AppUser {
  String username;
  String email;
  String uid;
  String phoneNumber;
  AppUser({
    required this.username,
    required this.email,
    required this.uid,
    required this.phoneNumber,
  });

  AppUser copyWith({
    String? username,
    String? email,
    String? uid,
    String? phoneNumber,
  }) {
    return AppUser(
      username: username ?? this.username,
      email: email ?? this.email,
      uid: uid ?? this.uid,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'username': username});
    result.addAll({'email': email});
    result.addAll({'uid': uid});
    result.addAll({'phoneNumber': phoneNumber});

    return result;
  }

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      username: map['username'] ?? '',
      email: map['email'] ?? '',
      uid: map['uid'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AppUser.fromJson(String source) =>
      AppUser.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AppUser(username: $username, email: $email, uid: $uid, phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AppUser &&
        other.username == username &&
        other.email == email &&
        other.uid == uid &&
        other.phoneNumber == phoneNumber;
  }

  @override
  int get hashCode {
    return username.hashCode ^
        email.hashCode ^
        uid.hashCode ^
        phoneNumber.hashCode;
  }
}
