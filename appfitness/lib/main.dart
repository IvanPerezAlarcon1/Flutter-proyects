import 'package:appfitness/pages/calculadoraimc_page.dart';
import 'package:appfitness/pages/nosotros_page.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    title: 'App Fitness',
    //teclas de acceso rápido
    home: new Casa(),
  ));
}

//STL es para crear clases simples, STF es para crear clases con parámetros
class Casa extends StatefulWidget {
  @override
  _CasaState createState() => _CasaState();
}

class _CasaState extends State<Casa> {
  //Creamos un arreglo de datos imagenes y nombres de ejercicios
  List<Container> listamos = List();

  var arreglox = [
    //Las imagenes deben llamarse en el archivo pubspec.yaml del proyecto
    {"nombre": "Pierna", "imagen": "gluteos.jpg", "deporte": "Trabajo con polea 4 repiticiones de 12"},
    {"nombre": "Pesas", "imagen": "pesas.jpg", "deporte": "Trabajo con pesas."},
    {"nombre": "Cinta Elastica", "imagen": "cinta.jpg", "deporte": "Trabajo con cinta 4 repeticiones de 15"},
    {"nombre": "Cinta", "imagen": "cinta2.jpg", "deporte": "Trabajo con cinta 2 repeticiones de 15"},
    {"nombre": "Abdomen", "imagen": "abdomen2.jpg", "deporte": "Abdomen alto."},
    {"nombre": "Peso", "imagen": "pesas.jpg", "deporte": "Trabajo pesas de 5kg"},
    {"nombre": "Pierna + Gluteos", "imagen": "gluteos.jpg", "deporte": "Trabajo con cinta 4 repeticiones de 15"},
    {"nombre": "Gluteos", "imagen": "gluteos.jpg", "deporte": "Trabajo con cinta 4 repeticiones de 15"},
    {"nombre": "Mas Gluteos", "imagen": "gluteos2.jpg", "deporte": "Trabajo con cinta 4 repeticiones de 15"},
    {"nombre": "Pierna..", "imagen": "gluteos2.jpg", "deporte": "Trabajo con cinta 4 repeticiones de 15"},
    {"nombre": "Barra", "imagen": "barra2.jpg", "deporte": "Trabajo con cinta 4 repeticiones de 15"},
    {"nombre": "Rusa", "imagen": "abducion.jpg", "deporte": "Trabajo con cinta 4 repeticiones de 15"},
    {"nombre": "Pierna..", "imagen": "gluteos2.jpg", "deporte": "Trabajo con cinta 4 repeticiones de 15"},
    {"nombre": "Cinta Elastica", "imagen": "cinta2.jpg", "deporte": "Trabajo con cinta 4 repeticiones de 15"},
    {"nombre": "Peso z", "imagen": "pesas.jpg", "deporte": "Trabajo con cinta 4 repeticiones de 15"},
    {"nombre": "Mancuernas", "imagen": "mancuernas.jpg", "deporte": "Trabajo con cinta 4 repeticiones de 15"},
    {"nombre": "Estiramiento", "imagen": "estiramiento.jpg", "deporte": "Trabajo con cinta 4 repeticiones de 15"},
    {"nombre": "Otro", "imagen": "otro.png", "deporte": "Fortalece pierna y Gluteos"},
    {"nombre": "Otro+", "imagen": "otro1.png", "deporte": "pierna y Gluteos"},
    {"nombre": "mas Ejercicio", "imagen": "gluteos2.jpg", "deporte": "Fortalece pierna y Gluteos"},
    {"nombre": "barra de 5k", "imagen": "barra.jpg", "deporte": "Trabajo con cinta 4 repeticiones de 15"},
  ];

  _listado() async {
    for(var i = 0;i<arreglox.length;i++){
      final arregloxyz = arreglox[i];
      final String imagen = arregloxyz["imagen"];
      listamos.add(new Container(
        padding: new EdgeInsets.all(10.0),
        child: new Card(
          child: new Column(
            children: <Widget>[
              new Hero(
                //llamar la imagen, el nombre y el deporte
                tag: arregloxyz['nombre'],
                child: new Material(
                  //material son metodos de flutter
                  child: new InkWell(
                    onTap: () =>
                    //cuando presionen, hacer lo siguiente
                    Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new Detalle(
                        //esto es cuando presionamos la foto y nos muestra caracteristicas de esta, en este caso la descripcion del ejercicio respectivo
                        nombre: arregloxyz['nombre'],
                        imagen: imagen,
                        deporte: arregloxyz['deporte']
                      ),
                    )),
                    child: new Image.asset(
                      "img/$imagen",
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              new Padding(
                padding: new EdgeInsets.all(10.0),
              ),
              new Text(
                arregloxyz['nombre'],
                style: new TextStyle(fontSize: 20.0),
              ),
            ],
          ),
        ),
      ));

    }
  }

  @override
  void initState() {
    _listado();
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: new AppBar(title: new Text('Fitnes 2019°'), backgroundColor: Colors.orange,),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text('Ejecicios'),
              accountEmail: new Text('codigoalphacol@gmail.com'),
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('img/gluteos2.jpg'),
                )
              ),
              ),
              new Divider(),
              new ListTile(
                //titulo
                title: new Text("Calculadora IMC"),
                //icono
                trailing: new Icon(Icons.fitness_center),
                //al presionar me redirige a tal lado
                onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => Calculadoraimc(),
                )),
              ),

              new Divider(),
              new ListTile(
                //titulo
                title: new Text("Soporte"),
                //icono
                trailing: new Icon(Icons.fitness_center),
                //al presionar me redirige a tal lado
                onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => Nosotros(),
                )),
              )

          ],
        ),
      ),
      body: new GridView.count(
        crossAxisCount: 1, //numero de columnas que se van a usar en la pantalla principal
        mainAxisSpacing: 0.7,
        childAspectRatio: 0.700, //tamaño de cada foto dentro de la cantidad de columnas seleccionadas, si son de tamaño inadecuado mostraran errores
        children: listamos,
        ),

    );
  }
}

//CREACION METODO Detalle
class Detalle extends StatelessWidget {
  Detalle({this.nombre, this.imagen, this.deporte});
  final String nombre;
  final String imagen;
  final String deporte;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      resizeToAvoidBottomPadding: false, //cuando presionemos el teclado, no aparescan overflow o posibles errores
      body: new ListView(
        children: <Widget>[
          new Container(
            height: 240.0,
            child: new Hero(
              tag: nombre,
              child: new Material(
                child: new InkWell(
                  child: new Image.asset(
                    "img/$imagen",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            )),
            new IniciarNombre(
              nombre: nombre,
            ),
            new IniciarIcon(),
            new Informacion(
              deporte: deporte,
            ),
        ],
      ),
    );
  }
}


class IniciarNombre extends StatelessWidget {
  IniciarNombre({this.nombre});
  final String nombre;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: new EdgeInsets.all(10.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  nombre,
                  style: new TextStyle(fontSize: 20.0, color: Colors.blue),
                ),

                new Text(
                  "$nombre\@gmail.com",
                  style: new TextStyle(fontSize: 15.0, color: Colors.blueGrey),
                ),
              ],
            ),
          ),
          new Row(
            children: <Widget>[
              new Icon(
                Icons.star,
                size: 30.0,
                color: Colors.red,
              ),
              new Text(
                "12",
                style: TextStyle(fontSize: 18.0),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class IniciarIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: new EdgeInsets.all(10.0), 
      child: new Row(
        children: <Widget>[
          new IconTec(
            icon: Icons.call,
            tec: "Call"
          ),

           new IconTec(
            icon: Icons.message,
            tec: "Mensaje"
          ),

           new IconTec(
            icon: Icons.photo,
            tec: "Foto"
          ),

        ],
      ),
    );
  }
}

class IconTec extends StatelessWidget {
  IconTec({this.icon,this.tec});
  final IconData icon;
  final String tec;
  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: new Column(
        children: <Widget>[
          new Icon(
            icon,
            size: 50.0,
            color: Colors.blue,
          ),
          new Text(
            tec,
            style: new TextStyle(fontSize: 12.0, color: Colors.blue),
          ),
        ],
      ),
    );
  }
}

class Informacion extends StatelessWidget {
  Informacion({this.deporte});
  final String deporte;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      padding: new EdgeInsets.all(10.0),
      child: new Card(
        child: new Padding(
          padding: const EdgeInsets.all(10.0),
          child: new Text(
            deporte,
            style: new TextStyle(fontSize: 16.0, color: Colors.blue),
          ),
        ),
      ),
    );
  }
}