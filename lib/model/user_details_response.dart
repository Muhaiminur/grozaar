class UserDetailsResponse {
  /*
{
  "id": 12,
  "first_name": "rest live",
  "last_name": null,
  "username": "nuruzzamanhimel",
  "email": "nuruzzaman.himel147@gmail.com",
  "phone": "01622-819925",
  "gender": null,
  "email_verified_at": "2025-05-15T07:30:08.000000Z",
  "type": "Customer",
  "status": "active",
  "avatar": "users/1747549497_1986011939_12.jpg",
  "created_by": null,
  "updated_by": 12,
  "created_at": "2025-05-15T06:16:33.000000Z",
  "updated_at": "2025-05-18T06:24:57.000000Z",
  "deleted_at": null,
  "avatar_url": "https://grozaar.heizoelscout.com/storage/users/1747549497_1986011939_12.jpg",
  "full_name": "rest live ",
  "is_email_verified": "1",
  "supplier_name": "",
  "status_badge": "<span class=\"badge bg-success\">ACTIVE</span>"
}
*/

  String? id;
  String? firstName;
  String? lastName;
  String? username;
  String? email;
  String? phone;
  String? gender;
  String? emailVerifiedAt;
  String? type;
  String? status;
  String? avatar;
  String? createdBy;
  String? updatedBy;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? avatarUrl;
  String? fullName;
  String? isEmailVerified;
  String? supplierName;
  String? statusBadge;

  UserDetailsResponse({
    this.id,
    this.firstName,
    this.lastName,
    this.username,
    this.email,
    this.phone,
    this.gender,
    this.emailVerifiedAt,
    this.type,
    this.status,
    this.avatar,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.avatarUrl,
    this.fullName,
    this.isEmailVerified,
    this.supplierName,
    this.statusBadge,
  });

  UserDetailsResponse.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    firstName = json['first_name']?.toString();
    lastName = json['last_name']?.toString();
    username = json['username']?.toString();
    email = json['email']?.toString();
    phone = json['phone']?.toString();
    gender = json['gender']?.toString();
    emailVerifiedAt = json['email_verified_at']?.toString();
    type = json['type']?.toString();
    status = json['status']?.toString();
    avatar = json['avatar']?.toString();
    createdBy = json['created_by']?.toString();
    updatedBy = json['updated_by']?.toString();
    createdAt = json['created_at']?.toString();
    updatedAt = json['updated_at']?.toString();
    deletedAt = json['deleted_at']?.toString();
    avatarUrl = json['avatar_url']?.toString();
    fullName = json['full_name']?.toString();
    isEmailVerified = json['is_email_verified']?.toString();
    supplierName = json['supplier_name']?.toString();
    statusBadge = json['status_badge']?.toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['username'] = username;
    data['email'] = email;
    data['phone'] = phone;
    data['gender'] = gender;
    data['email_verified_at'] = emailVerifiedAt;
    data['type'] = type;
    data['status'] = status;
    data['avatar'] = avatar;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    data['avatar_url'] = avatarUrl;
    data['full_name'] = fullName;
    data['is_email_verified'] = isEmailVerified;
    data['supplier_name'] = supplierName;
    data['status_badge'] = statusBadge;
    return data;
  }
}
