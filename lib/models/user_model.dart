/// users : [{"username":"o.pimple@gmail.com","password":"om123","dob":"2002-17-02","is_logged_in":false},{"username":"o.tari@gmail.com","password":"omkar123","dob":"1993-09-29","is_logged_in":false},{"username":"l.parab@gmail.com","password":"lokesh123","dob":"1999-04-17","is_logged_in":false}]

class UserModel {
  UserModel({
    this.users,
  });

  UserModel.fromJson(dynamic json) {
    if (json['users'] != null) {
      users = [];
      json['users'].forEach((v) {
        users?.add(Users.fromJson(v));
      });
    }
  }

  List<Users>? users;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (users != null) {
      map['users'] = users?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Users {
  Users({
    this.username,
    this.password,
    this.dob,
  });

  Users.fromJson(dynamic json) {
    username = json['username'];
    password = json['password'];
    dob = json['dob'];
  }

  String? username;
  String? password;
  String? dob;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['username'] = username;
    map['password'] = password;
    map['dob'] = dob;
    return map;
  }
}
