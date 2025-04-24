// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProfileModel {

  
  final String? username;
  final String? full_name;
  final String? avatar_url;
  final String? bio;
  final String? specialization;
  final String? cover_image_url;
  ProfileModel({
     this.username,
     this.full_name,
     this.avatar_url,
     this.bio,
     this.specialization,
     this.cover_image_url,
  });
  

  ProfileModel copyWith({
    String? username,
    String? full_name,
    String? avatar_url,
    String? bio,
    String? specialization,
    String? cover_image_url,
  }) {
    return ProfileModel(
      username: username ?? this.username,
      full_name: full_name ?? this.full_name,
      avatar_url: avatar_url ?? this.avatar_url,
      bio: bio ?? this.bio,
      specialization: specialization ?? this.specialization,
      cover_image_url: cover_image_url ?? this.cover_image_url,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'full_name': full_name,
      'avatar_url': avatar_url,
      'bio': bio,
      'specialization': specialization,
      'cover_image_url': cover_image_url,
    };
  }

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      username: map['username'] as String,
      full_name: map['full_name'] as String,
      avatar_url: map['avatar_url'] as String,
      bio: map['bio'] as String,
      specialization: map['specialization'] as String,
      cover_image_url: map['cover_image_url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfileModel.fromJson(String source) => ProfileModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProfileModel(username: $username, full_name: $full_name, avatar_url: $avatar_url, bio: $bio, specialization: $specialization, cover_image_url: $cover_image_url)';
  }

  @override
  bool operator ==(covariant ProfileModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.username == username &&
      other.full_name == full_name &&
      other.avatar_url == avatar_url &&
      other.bio == bio &&
      other.specialization == specialization &&
      other.cover_image_url == cover_image_url;
  }

  @override
  int get hashCode {
    return username.hashCode ^
      full_name.hashCode ^
      avatar_url.hashCode ^
      bio.hashCode ^
      specialization.hashCode ^
      cover_image_url.hashCode;
  }
}
