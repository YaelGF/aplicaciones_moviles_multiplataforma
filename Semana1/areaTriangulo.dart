import "dart:io";

void main() {
  print("Ingrese el valor de la base: ");

  double base = double.parse(stdin.readLineSync());

  print("Ingrese el valor de la altura: ");

  double altura = double.parse(stdin.readLineSync());

  double resultado = (base * altura)/2;

  print("Resultado es $resultado");

}
