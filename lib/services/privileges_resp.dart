// To parse this JSON data, do
//
//     final userPrivileges = userPrivilegesFromJson(jsonString);

import 'dart:convert';

UserPrivileges userPrivilegesFromJson(String str) =>
    UserPrivileges.fromJson(json.decode(str));

String userPrivilegesToJson(UserPrivileges data) => json.encode(data.toJson());

class UserPrivileges {
  UserPrivileges({
    this.resourcePrivileges,
    this.gridViews,
    this.suborgs,
  });

  List<ResourcePrivilege>? resourcePrivileges;
  List<GridView>? gridViews;
  List<Suborg>? suborgs;

  factory UserPrivileges.fromJson(Map<String, dynamic> json) => UserPrivileges(
    resourcePrivileges: List<ResourcePrivilege>.from(
        json["resource_privileges"]
            .map((x) => ResourcePrivilege.fromJson(x))),
    gridViews: List<GridView>.from(
        json["grid_views"].map((x) => GridView.fromJson(x))),
    suborgs:
    List<Suborg>.from(json["suborgs"].map((x) => Suborg.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "resource_privileges":
    List<dynamic>.from(resourcePrivileges ?? [].map((x) => x.toJson())),
    "grid_views":
    List<dynamic>.from(gridViews ?? [].map((x) => x.toJson())),
    "suborgs": List<dynamic>.from(suborgs ?? [].map((x) => x.toJson())),
  };
}

class GridView {
  GridView({
    this.id,
    this.name,
    this.description,
    this.resource,
    this.columns,
  });

  int? id;
  String? name;
  String? description;
  Resource? resource;
  List<Resource>? columns;

  factory GridView.fromJson(Map<String, dynamic> json) => GridView(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    resource: Resource.fromJson(json["resource"]),
    columns: List<Resource>.from(
        json["columns"].map((x) => Resource.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "resource": resource?.toJson(),
    "columns": List<dynamic>.from(columns ?? [].map((x) => x.toJson())),
  };
}

class Resource {
  Resource({
    this.id,
    this.name,
    this.description,
    this.isActive,
    this.resource,
  });

  int? id;
  String? name;
  String? description;
  bool? isActive;
  int? resource;

  factory Resource.fromJson(Map<String, dynamic> json) => Resource(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    isActive: json["is_active"],
    resource: json["resource"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "is_active": isActive,
    "resource": resource,
  };
}

class ResourcePrivilege {
  ResourcePrivilege({
    this.resourceid,
    this.resourcename,
    this.privileges,
  });

  int? resourceid;
  String? resourcename;
  List<String>? privileges;

  factory ResourcePrivilege.fromJson(Map<String, dynamic> json) =>
      ResourcePrivilege(
        resourceid: json["resourceid"],
        resourcename: json["resourcename"],
        privileges: List<String>.from(json["privileges"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
    "resourceid": resourceid,
    "resourcename": resourcename,
    "privileges": List<dynamic>.from(privileges ?? [].map((x) => x)),
  };
}

class Suborg {
  Suborg({
    this.id,
    this.customerName,
    this.createdBy,
    this.name,
    this.address,
    this.city,
    this.state,
    this.zip,
    this.timeZone,
    this.website,
    this.phoneNumber,
    this.email,
    this.taxId,
    this.isRoot,
    this.isActive,
    this.createdOn,
    this.token,
    this.customer,
  });

  int? id;
  String? customerName;
  String? createdBy;
  String? name;
  dynamic address;
  dynamic city;
  dynamic state;
  dynamic zip;
  dynamic timeZone;
  dynamic website;
  dynamic phoneNumber;
  String? email;
  dynamic taxId;
  bool? isRoot;
  bool? isActive;
  DateTime? createdOn;
  dynamic token;
  int? customer;

  factory Suborg.fromJson(Map<String, dynamic> json) => Suborg(
    id: json["id"],
    customerName: json["customer_name"],
    createdBy: json["created_by"],
    name: json["name"],
    address: json["address"],
    city: json["city"],
    state: json["state"],
    zip: json["zip"],
    timeZone: json["time_zone"],
    website: json["website"],
    phoneNumber: json["phone_number"],
    email: json["email"],
    taxId: json["tax_id"],
    isRoot: json["is_root"],
    isActive: json["is_active"],
    createdOn: DateTime.parse(json["created_on"]),
    token: json["token"],
    customer: json["customer"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "customer_name": customerName,
    "created_by": createdBy,
    "name": name,
    "address": address,
    "city": city,
    "state": state,
    "zip": zip,
    "time_zone": timeZone,
    "website": website,
    "phone_number": phoneNumber,
    "email": email,
    "tax_id": taxId,
    "is_root": isRoot,
    "is_active": isActive,
    "created_on": createdOn?.toIso8601String(),
    "token": token,
    "customer": customer,
  };
}

// To parse this JSON data, do
//
//     final selectedSuborg = selectedSuborgFromJson(jsonString);

SelectedSuborg selectedSuborgFromJson(String str) => SelectedSuborg.fromJson(json.decode(str));

String selectedSuborgToJson(SelectedSuborg data) => json.encode(data.toJson());

class SelectedSuborg {
  SelectedSuborg({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory SelectedSuborg.fromJson(Map<String, dynamic> json) => SelectedSuborg(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}

