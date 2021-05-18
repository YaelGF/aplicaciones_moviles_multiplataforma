import "dart:io";

void main() {

  print("¿El hexagono es regular o irregular (r/i)? ");

  String r = stdin.readLineSync();

  if(r == "r"){

    print("Ingrese el valor de un lado del Hexagono: ");

    double lado = double.parse(stdin.readLineSync());

    double resultado = lado * 6;

    print("Resultado es $resultado");
  
  }
  if (r == "i"){

    double result = 0;

    for(var i = 1; i <= 6; i++){

      print("Ingrese el valor de un lado del Hexagono $i: ");

      double lado = double.parse(stdin.readLineSync());

      result += lado;

    } 

    print("Resultado es $result");

  }

}