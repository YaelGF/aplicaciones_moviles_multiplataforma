import "dart:io";

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
  user = {"Nombre" : "Pendejo",
              "Telefono" : "775 114 95 10",
              "Email" : "pendejo@gmaail.com"};
  users.add(user);

  String a = "y";

  while(a == "y"){

  print("Menu");
  print("*1 Mostrar todos los datos");
  print("*2 Insertar un nuevo registro");
  print("*3 Modificar un registro");
  print("*4 Mostrar Registro");

  var respuesta = stdin.readLineSync();

  if(respuesta != null){
    switch(respuesta){
      case "1":
        mostrar(users);
      break;
      case "2":
        users = ingresar(users);
        a = stdin.readLineSync();
      break;
      case "3":
        print("3");
      break;
      case "4":
      break;
      default:
        print("Error de opcion marcada");
    }
  }else{
    print("Error en ingreso");
  }
  }
}

List ingresar(users){
  var name = stdin.readLineSync();
  var phone = stdin.readLineSync();
  var email = stdin.readLineSync();
  Map user = {"Nombre" : name,
              "Telefono" : phone,
              "Email" : email};
  users.add(user);
  mostrar(users);
  return users;
}
void mostrar(users){
  for (var i = 0; i<users.length;i++){
    print("*"*20);
    print(users[i]["Nombre"]);
    print(users[i]["Telefono"]);
    print(users[i]["Email"]);
  }
}