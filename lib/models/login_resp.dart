class User {
  String? status;
  String? token;
  EmployeeDetails? employeeDetails;
  String? message;

  User({this.status, this.token, this.employeeDetails, this.message, int? userId});

  User.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    token = json['token'];
    employeeDetails = json['Employee Details'] != null
        ? new EmployeeDetails.fromJson(json['Employee Details'])
        : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['token'] = this.token;
    if (this.employeeDetails != null) {
      data['Employee Details'] = this.employeeDetails!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class EmployeeDetails {
  int? id;
  String? userId;
  String? name;
  String? dob;
  String? gender;
  String? phone;
  String? address;
  String? email;
  String? password;
  String? vp;
  String? profilePic;
  String? employeeId;
  String? branchId;
  String? departmentId;
  String? designationId;
  String? companyDoj;
  String? documents;
  String? accountHolderName;
  String? accountNumber;
  String? bankName;
  String? bankIdentifierCode;
  String? branchLocation;
  String? taxPayerId;
  String? salaryType;
  String? salary;
  String? isActive;
  String? apiToken;
  String? createdBy;
  String? createdAt;
  String? updatedAt;

  EmployeeDetails(
      {this.id,
        this.userId,
        this.name,
        this.dob,
        this.gender,
        this.phone,
        this.address,
        this.email,
        this.password,
        this.vp,
        this.profilePic,
        this.employeeId,
        this.branchId,
        this.departmentId,
        this.designationId,
        this.companyDoj,
        this.documents,
        this.accountHolderName,
        this.accountNumber,
        this.bankName,
        this.bankIdentifierCode,
        this.branchLocation,
        this.taxPayerId,
        this.salaryType,
        this.salary,
        this.isActive,
        this.apiToken,
        this.createdBy,
        this.createdAt,
        this.updatedAt});

  EmployeeDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    dob = json['dob'];
    gender = json['gender'];
    phone = json['phone'];
    address = json['address'];
    email = json['email'];
    password = json['password'];
    vp = json['vp'];
    profilePic = json['profile_pic'];
    employeeId = json['employee_id'];
    branchId = json['branch_id'];
    departmentId = json['department_id'];
    designationId = json['designation_id'];
    companyDoj = json['company_doj'];
    documents = json['documents'];
    accountHolderName = json['account_holder_name'];
    accountNumber = json['account_number'];
    bankName = json['bank_name'];
    bankIdentifierCode = json['bank_identifier_code'];
    branchLocation = json['branch_location'];
    taxPayerId = json['tax_payer_id'];
    salaryType = json['salary_type'];
    salary = json['salary'];
    isActive = json['is_active'];
    apiToken = json['api_token'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['dob'] = this.dob;
    data['gender'] = this.gender;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['email'] = this.email;
    data['password'] = this.password;
    data['vp'] = this.vp;
    data['profile_pic'] = this.profilePic;
    data['employee_id'] = this.employeeId;
    data['branch_id'] = this.branchId;
    data['department_id'] = this.departmentId;
    data['designation_id'] = this.designationId;
    data['company_doj'] = this.companyDoj;
    data['documents'] = this.documents;
    data['account_holder_name'] = this.accountHolderName;
    data['account_number'] = this.accountNumber;
    data['bank_name'] = this.bankName;
    data['bank_identifier_code'] = this.bankIdentifierCode;
    data['branch_location'] = this.branchLocation;
    data['tax_payer_id'] = this.taxPayerId;
    data['salary_type'] = this.salaryType;
    data['salary'] = this.salary;
    data['is_active'] = this.isActive;
    data['api_token'] = this.apiToken;
    data['created_by'] = this.createdBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}