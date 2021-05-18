import "dart:io";

void main() {
  print("Ingrese el valor de la base: ");

  double base = double.parse(stdin.readLineSync());

  print("Ingrese el valor de la altura: ");

  double altura = double.parse(stdin.readLineSync());

  int resultado = ((base * altura)/30).floor();

  print("La cantidad de pokemones que cabrian seria de  $resultado");

}
