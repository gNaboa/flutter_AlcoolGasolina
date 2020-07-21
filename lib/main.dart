import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var alcoolController = TextEditingController();
  var gasolinaController = TextEditingController();
  var txtResultado = "Insira os dados";
  var formKey = GlobalKey<FormState>();

  void calculate() {
    setState(() {
      var alcool = double.parse(alcoolController.text);
      var gasolina = double.parse(gasolinaController.text);
      var resultado = alcool / gasolina;

      if (resultado < 0.7) {
        txtResultado = "Abasteça com alcool";
      } else {
        txtResultado = "Abasteça com gasolina";
      }
    });
  }

  void reset() {
    alcoolController.text = "";
    gasolinaController.text = "";
    setState(() {
      txtResultado="Insira os dados";
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alcool ou Gasolina ?"),
        backgroundColor: Colors.blue,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.refresh,
                color: Colors.white,
              ),
              onPressed: reset)
        ],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(
                Icons.attach_money,
                size: 120.0,
                color: Colors.blue,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Alcool(RS)",
                    labelStyle: TextStyle(color: Colors.blue)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blue, fontSize: 25.0),
                controller: alcoolController,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Gasolina(RS)",
                    labelStyle: TextStyle(color: Colors.blue)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blue, fontSize: 25.0),
                controller: gasolinaController,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                child: Container(
                  height: 50.0,
                  child: RaisedButton(
                    onPressed: calculate,
                    child: Text("Calcular",
                        style: TextStyle(color: Colors.white, fontSize: 25.0)),
                    color: Colors.blue,
                  ),

                ),
              ),
              Text(
                txtResultado,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blue, fontSize: 20.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
