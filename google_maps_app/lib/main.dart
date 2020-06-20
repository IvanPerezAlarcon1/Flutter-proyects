import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //mapa sencillo, solo para buscar
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //se debe instanciar la libreria en el archivo pubspec.yaml para poder importar la libreria aquí
  GoogleMapController mapController;
  
  //importa google maps controller
  String buscarDireccion;
  @override
  Widget build(BuildContext context) {
    //para hacer uso de google maps primero hay que importarlo
    return Scaffold(
      body: Stack(//la propiedad Stack, permite situar en cualquier parte de la pantalla cierto objeto, en este caso el mapa
        children: <Widget>[
          GoogleMap(
            onMapCreated: onMapCreated,//es un metodo para cuando se cree el mapa
                        options: GoogleMapOptions(
                          cameraPosition: CameraPosition(
                            target: LatLng(21.1193733,-869402),//posición en la cual nos situa el mapa cuando se abre por primera vez
                            zoom: 15.0 //
                          ),
                        ),
                      ),
                      //en que parte del mapa situamos la barra de dirección
                      //le damos los rangos de posición
                      Positioned(
                        top: 30.0,
                        right: 15.0,
                        left: 15.0,
                        child: Container(
                          height: 50.0,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),//borde desde cada pantalla redondeado
                            color: Colors.white,
                          ),    
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Ingrese dirección a buscar: ',
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(left: 15.0, top: 15.0),
                              suffixIcon: IconButton(
                                icon: IconButton(
                                  icon: Icon(Icons.search),
                                  onPressed: barraBusqueda,
                                  iconSize: 30.0,
                                )
                              ),
                            ),
                            onChanged: (val){
                              setState((){
                                buscarDireccion = val;
                              });
                            }
                          ), 
                        ),
                      ),
                    ],
                  ),
                );
              }

              //crear la busqueda por dirección
              barraBusqueda(){
                //primero importar la libreria en el archivo pubspec.yaml
                Geolocator().placemarkFromAddress(buscarDireccion).then((result){
                  mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
                    target:
                      LatLng(result[0].position.latitude, result[0].position.longitude),
                      zoom: 10.0 
                  )));
                });
              }
            
              void onMapCreated(GoogleMapController controller) {
                setState(() {
                  mapController = controller;
                });
              }

}

//PARA VALIDAR EL PERMISO DE GOOGLE MAPS, VAMOS AL ARCHIVO android-> app -> src -> main ->AndroidManifest.xml ver video mapa ultimos minutos