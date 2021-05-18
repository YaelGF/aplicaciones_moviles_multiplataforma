import "dart:io";

void main() {
  print("Ingrese su edad: ");

  int edad = int.parse(stdin.readLineSync());

  int resultado = edad * 7;

  print("Su edad si fuera perro seria de $resultado");

}