import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart' show required;//de este package solo se usara required
import 'dart:math' as math;//le asignamos un alias

//esta clase permite saber dimensiones y el dispositivo desde el cual se ve la app
class Responsive{
  final double width,height,inch;

  Responsive({
    @required this.width,
    @required this.height,
    @required this.inch
  });

  //funcion estática que me retorne una instacia de la clase Responsive y recibe como parámetro un build context
  factory Responsive.of(BuildContext context){
    final MediaQueryData data = MediaQuery.of(context);//el metodo of, retorna una instancia del metodo MediaQueryData
    final size = data.size;
    //inch es la diagonal de la pantalla donde se ve la app
    final inch = math.sqrt(math.pow(size.width, 2) + math.pow(size.height, 2));
    //BuildContext es el contexto en el que se construye un widget específico
    return Responsive(width: size.width, height: size.height,inch: inch,);//instancia de la clase Responsive
  }

  //retorna % del ancho de la pantalla que quiero obtener, dado por el parametro percent
  double wp(double percent){
    return this.width*percent / 100;
  }

  //retorna % del alto de la pantalla que quiero obtener, dado por el parametro percent
  double hp(double percent){
    return this.height*percent / 100;
  }

  //retorna % de la diagonal de la pantalla que quiero obtener, dado por el parametro percent
  double ip(double percent){
    return this.inch*percent / 100;
  }
}
