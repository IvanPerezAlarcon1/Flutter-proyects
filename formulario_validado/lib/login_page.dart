import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

//LOS FORMULARIOS SE TRABAJAN CON StatefulWitget

class LoginPage extends StatefulWidget{
  @override 
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
  final scaffolKey = new GlobalKey<ScaffoldState>(); //variable opcional usada para mostrar un appbar
  final formKey = new GlobalKey<FormState>();//llave que nos dará acceso al formulario, es decir comprueba que la key sea verdadera

  String _email;
  String _password;

  @override 

  Widget build(BuildContext context){
    return Scaffold(
      key: scaffolKey,
      appBar: AppBar(title: Text("Validando Formularios"),),
      body: Padding(//se agrega para la estética
        padding: const EdgeInsets.all(20.0),
        child: Form(//esto es un form similar al que usa HTML, para poder mostrar validaciones por pantalla y hacer validaciones
          key: formKey, //nos dice si la llave ingresada es la correcta o no
          child: SingleChildScrollView(//esto evita que la pantalla se deforme al abrir el teclado de la pantalla
            child: Column(
              children: <Widget>[
                TextFormField(
                  //este campo de texto tiene un validador, si el valor ingresado no contiene un @, lo ingresado no es valido y muestra un mensaje
                  //si el campo valor ingresado es valido entonces returna null y no muestra nada
                  validator: (valor) => !valor.contains('@')?'Email Inválido': null,
                  //el valor, se guarda en la variable _email
                  onSaved: (valor) => _email = valor,
                  //label que indica lo que se debe ingresar en el campo
                  decoration: InputDecoration(labelText: 'Email'),
                ),
                SizedBox(height: 20.0,),//para separar ambos textfield
                TextFormField(
                  validator: (valor) => valor.length < 6 ?'La contraseña es muy corta': null,
                  //si la contraseña es valida la guarda en la variable _password
                  onSaved: (valor) => _password = valor,
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                ),
                SizedBox(height: 20.0,),//para separar ambos textfield

                RaisedButton( //boton para enviar los datos, es como el SUBMIT de html
                  child: Text("Enviar Datos"),
                  onPressed: (){
                    final form = formKey.currentState;
                    if(form.validate()){//form.validate sirve para ver si la llave que tenemos es correcta, es decir que todos los campos del formulario esten completos o no contengan errores, si los hay muestra un mensaje de error en el respectivo campo
                      //si la info o llave es correcta, guardamos esa info, para luego mostrarla
                      form.save();
                      mostrarSnackBar();
                    }
                  },
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
  void mostrarSnackBar(){ //SnackBar es un widget que nos permite devolver un mensaje
  final snackbar = SnackBar(
    content: Text("Email: $_email , password: $_password"),
  );
  scaffolKey.currentState.showSnackBar(snackbar);
}
}


