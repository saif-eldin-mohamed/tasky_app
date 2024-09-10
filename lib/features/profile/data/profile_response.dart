import 'package:json_annotation/json_annotation.dart';
part 'profile_response.g.dart';

@JsonSerializable()
class ProfileResponse {

  int? experienceYears;
   @JsonKey(name: 'username')
  String? phoneNumber;
 String? displayName;
 
 
String? level;
    String? address;
  ProfileResponse({
 this.address,this.displayName,this.experienceYears,
 this.level,
 this.phoneNumber
    });



  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseFromJson(json);
}

