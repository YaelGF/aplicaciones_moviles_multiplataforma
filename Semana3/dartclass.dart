import "dart:io";
void main (){
  List sensors =  [];
  Map sensor = {"id_sensor" : 1,
              "Valor" : "1",
              "fecha_registro" : "07/06/2021" };
  sensors.add(sensor);
  sensor = {"id_sensor" : 2,
              "Valor" : "1",
              "fecha_registro" : "07/06/2021" };
  sensors.add(sensor); 
  sensor = {"id_sensor" : 3,
              "Valor" : "0",
              "fecha_registro" : "07/06/2021" };
  sensors.add(sensor);
  print("Registros a ingresar:");
  String? str = stdin.readLineSync();
  if (str == null){
    print("error");
  }else{
   int? cantidad = int.parse(str);
   Sensor sn = Sensor();
   for(var i = 1; i<= cantidad; i++){
     sn.ingresar(sensors);
   }
   sn.mostrar(sensors);
  } 
}

class Sensor{
 List ingresar(sensors){
   var date = "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}";
   print("Ingresa Valor:");
   String? valor = stdin.readLineSync();
   Map sensor = {"id_sensor" : id(sensors),
               "Valor" : valor,
               "fecha_registro" : date};
   sensors.add(sensor);
   return sensors;
 }
 void mostrar(sensors){
   for (var i = 0; i< sensors.length; i++){
     print("*******"*6);
     print("id_sensor: ${sensors[i]["id_sensor"]}");
     print("Valor: ${sensors[i]["Valor"]}");
     print("fecha_registro: ${sensors[i]["fecha_registro"]}");
   }
 }
 int id(sensors){
  int size = sensors.length;
  size++; 
  return size;
 }
}
