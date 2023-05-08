class User {
   String? name;
   String? email;
   String? password;
   String? passwordConfirm;

  User({ this.name , this.email,  this.password,  this.passwordConfirm});


  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'password': password,
        'passwordConfirm': passwordConfirm,
      };
}