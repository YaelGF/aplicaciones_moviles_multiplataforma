import "dart:io";

void main(){
  List users =  [];
  Map user = {"Nombre" : "Yael",
              "Telefono" : "775 114 85 10",
              "Email" : "yaelgarcifranco@gmaail.com"};
  users.add(user);
  user = {"Nombre" : "Rodrigo",
              "Telefono" : "775 855 46 92",
              "Email" : "rodrigo@gmaail.com"};
  users.add(user);
  user = {"Nombre" : "Juan",
              "Telefono" : "775 956 45 21",
              "Email" : "juangodinez@gmaail.com"};
  users.add(user);

  String? answer = "y";

  while(answer == "y"){

  print("Menu");
  print("*1 Mostrar registros");
  print("*2 Insertar un nuevo registro");
  print("*3 Modificar un registro");
  print("*4 Borrar un registro");

  String? respuesta = stdin.readLineSync();

  if(respuesta != null){
    switch(respuesta){
      case "1":
        mostrar(users);
	print("Repetir(y/n)?");
	answer = stdin.readLineSync();
      break;
      case "2":
	users = ingresar(users);
	print("Repetir(y/n)?");
	answer = stdin.readLineSync();
      break;
      case "3":
        users = modificar(users);
	print("Repetir(y/n)?");
	answer = stdin.readLineSync();
      break;
      case "4":
	users = borrar(users);
        print("Repetir(y/n)?");
	answer = stdin.readLineSync();
      break;
      default:
        print("Error de opcion marcada");
    }
  }else{
    print("Error en ingreso");
  }
  }
}

void mostrar(users){
  for (var i = 0; i< users.length; i++){
    print("Nombre: ${users[i]["Nombre"]}");
    print("Telefono: ${users[i]["Telefono"]}");
    print("Email: ${users[i]["Email"]}");
    print("*******"*6);
  }
}
List ingresar(users){
  print("Ingresa nombre:");
  String? name = stdin.readLineSync();
  print("Ingresa telefono:");
  String? phone = stdin.readLineSync();
  print("ingresa email:");
  String? email = stdin.readLineSync();
  Map user = {"Nombre" : name,
              "Telefono" : phone,
              "Email" : email};
  users.add(user);
  mostrar(users);
  return users;
}
List borrar(users){
  String? ok;
  print("Nombre a borrar:");
  String? name = stdin.readLineSync();
  for(int i = 0; i < users.length; i++){
    if(users[i]["Nombre"] == name){
      users.remove(users[i]);
      mostrar(users);
      ok = "y";
    }
  }
  if(ok == null){
    print("Registro no encontrado");
  }
  return users;
}
List modificar(users){
  String? ok;
  print("Nombre a modificar:");
  String? name = stdin.readLineSync();
  for(int i = 0; i < users.length; i++){
    if(users[i]["Nombre"] == name){
       print("Que dato quiere modificar");
       print("*1 Nombre");
       print("*2 Telefon");
       print("*3 Email");
       String? key = stdin.readLineSync();
       print("¿Cual sera el nuevo valor?");
       String? actualizacion = stdin.readLineSync();
       switch(key){
	 case "1":
	   key = "Nombre";
	   users[i][key] = actualizacion ;
           mostrar(users);
	   break;
	 case "2":
	   key = "Telefono";
	   users[i][key] = actualizacion ;
           mostrar(users);
	   break;
	 case "3":
	   key = "Email";
	   users[i][key] = actualizacion ;
           mostrar(users);
	   break;
	 default:
	   print("Opcion no valida"); 
       }
       
       ok = "y";
    }
  }
  if(ok == null){
    print("Registro no encontrado");
  }
  return users;
}
