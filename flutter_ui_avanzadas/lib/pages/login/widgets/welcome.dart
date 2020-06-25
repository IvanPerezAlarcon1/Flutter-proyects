import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ui_avanzadas/utils/responsive.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key key}): super(key: key); 

  @override
  Widget build(BuildContext context) {

    final Responsive responsive = Responsive.of(context); //creamos una variable para poder adaptar el texto a la pantalla donde se muestra


    return AspectRatio(//este widget es para que el tamaño  de altura se adapte a cualquier dispositivo en una relacion dada
      aspectRatio: 16/9,
          child: LayoutBuilder( //es un contenedor simple
          //este es un widget de tipo stack para poder generar la ilustración que muestra en la zona top, también se deben conocer las
          //dimenciones del contenedor en donde se colocarán las imagenes, es decir Welcome en este caso
          builder: (_,constraints){
            return Container(
              //color: Colors.red, //le colocamos color para poder distinguirlo solamente en un comienzo
              child: Stack(
                //usamos un widget de tipo stack dentro del contenedor de color rojo
                children: <Widget>[
                  Positioned(//dimensiones de las nubes traseras
                    top: 0,//distancia de la imagen desde arriba hacia abajo
                    right: 0,
                    left: 0,
                    child: SvgPicture.asset('assets/pages/login/clouds.svg',
                    width: constraints.maxWidth,
                    height: constraints.maxHeight*0.71, //tamaño de la imagen de las nubes
                  )),

                  Positioned(//propiedades de la linea divisoria
                    top: constraints.maxHeight*0.7,//definimos que la linea divisoria este al 70% de la altura max del contaniner
                    child: Column(//ponemos a la barra dentro de un container, y abajo de esta un texto
                      children: <Widget>[
                        Container(//container de linea separadora
                          height: 5, 
                          width: constraints.maxWidth,//grosor de la linea //se debe usar la variable constraints para poder determinar el ancho max en un widget Positioned dentro de un widget stack
                          color: Color(0xffeeeeee),
                    ),
                    SizedBox(
                      height: 15,//distancia desde la linea devisora hasta donde aparece el texto
                    ),
                    Text("¡Welcome!",style: TextStyle(
                      fontSize:responsive.ip(3),//que el tamaño del texto de tanto % del valor de la diagonal
                      fontWeight: FontWeight.bold,
                      fontFamily: 'raleway',
                      ),),
                      ],
                    ),
                  ),

                  Positioned(//dimensiones de la imagen de la chica
                    top: constraints.maxHeight*0.29,//distancia de la imagen desde arriba hacia abajo
                    child: SvgPicture.asset('assets/pages/login/woman.svg',
                    width: constraints.maxWidth*0.27,
                    //height: constraints.maxHeight*0.4,
                  )),//container con la imagen crrespondiente
                  Positioned(//dimensiones de la imagen del chico
                    top: constraints.maxHeight*0.13,
                    right: 10,
                    child: SvgPicture.asset('assets/pages/login/man.svg',
                    width: constraints.maxWidth*0.18,
                  )),
                ],
              ),
            );
          },//función que recibe 2 parámetros, el _ se usa para indicar que no se usa ese parámetro

      ),
    );
  }
}