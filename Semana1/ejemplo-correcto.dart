import "dart:io";

void main() {
  print("Ingrese el valor de la base: ");

  var base = double.tryParse(stdin.readLineSync() ?? "");

  print("Ingrese el valor de la altura: ");


  if (base == null) {

    print("no se pueden meter valores nulos");

  } else {

    var altura = double.tryParse(stdin.readLineSync() ?? "");

    if(altura == null){

      print("no se pueden meter valores nulos");

    }else{

      var result = (base * altura) / 2;

      print("Resultado es $result");

    }
  }
}

