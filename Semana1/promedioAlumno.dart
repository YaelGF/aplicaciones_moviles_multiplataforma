import "dart:io";

void main() {
  print("Ingrese la primera calificacion: ");

  double cal1 = double.parse(stdin.readLineSync()) * .2;

  print("Ingrese la segunda calificacion: ");

  double cal2 = double.parse(stdin.readLineSync()) * .3;

  print("Ingrese la tercera calificacion: ");

  double cal3 = double.parse(stdin.readLineSync()) * .5;

  double resultado =  cal1 + cal2 + cal3;

  print("Resultado es $resultado");

}