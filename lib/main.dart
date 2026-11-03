import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget _buildButtonColumn(Color color, IconData icon, String label) {    
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: EdgeInsets.only(top: 8),
          child: Text(label, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: color)),
        )
      ],
    );
  }
  
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return MaterialApp(
      title: 'Orientese - Viagens',
      theme: ThemeData(
        primaryColor: Colors.orange[400]
      ),
      home: Builder(
        builder: (context) {

          Widget titleSection = Container(
            padding: const EdgeInsets.all(32),
            child: Row(
              children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text('Curaçao Beach', style: TextStyle(fontWeight: FontWeight.bold),),
                        ),
                        Text('Curaçao', style: TextStyle(color: Colors.grey[500]),),
                      ],
                    )
                  ),
                  Icon(Icons.star, color: Colors.red[500]),
                  Text('41')
                ],
            ),
          );

          Widget interactiveSection = Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButtonColumn(Theme.of(context).primaryColor, Icons.phone, 'Call'),
              _buildButtonColumn(Theme.of(context).primaryColor, Icons.map, 'Route'),
              _buildButtonColumn(Theme.of(context).primaryColor, Icons.share, 'Share')
            ],
          );

          Widget textSection = Container(
            padding: EdgeInsets.all(32),
            child: Text('Curaçao possui cerca de 40 a 48 praias, famosas pelas águas calmas, cristalinas e em tons de azul-turquesa, fora da rota de furacões. O litoral é dividido entre praias públicas (muitas delas selvagens e naturais) e clubes de praia privados, além de passeios para a ilha deserta de Klein Curaçao', softWrap: true),
          );

          return Scaffold(
            appBar: AppBar(
              title: const Text('Orientese - Viagens', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
              backgroundColor: Theme.of(context).primaryColor,
            ),
            body: Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.only(top: screenSize.height*0.03),
                child: ListView(
                  children: [
                    Center(
                      child: Image.asset(
                        'images/praias-de-curacao.jpg',
                        width: screenSize.width * 0.95,
                        height: screenSize.height *0.45,
                        fit: BoxFit.cover,
                      ),
                    ),
                    titleSection,
                    interactiveSection,
                    textSection,
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}