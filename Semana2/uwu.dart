void main(){
  List users =  [];
  Map user = {"Nombre" : "Yael",
              "Telefono" : "775 114 85 10",
              "Email" : "yaelgarcifranco@gmaail.com"};
  users.add(user);
  user = {"Nombre" : "Rodrigo",
              "Telefono" : "775 114 92 10",
              "Email" : "rodrigo@gmaail.com"};
  users.add(user);
  user = {"Nombre" : "Rodrigo",
              "Telefono" : "775 114 92 10",
              "Email" : "rodrigo@gmaail.com"};
  users.add(user);
  print(users);
  print(users[2]["Nombre"]);
}