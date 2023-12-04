import 'package:flutter/material.dart';
import 'package:flutter_poke_api/providers/respuesta_provider.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void showResponse(RespuestaProvider respuestaProvider) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              if (respuestaProvider.pokemon.name.isNotEmpty)
                Column(
                  children: [
                    Text(
                      '¡Un Pokémon apareció!',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Image.network(
                      respuestaProvider.pokemon.imageUrl,
                      height: 200,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Nombre: ${respuestaProvider.pokemon.name}',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final respuestaProvider = context.watch<RespuestaProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text('PokéAPI'),
        backgroundColor: Colors.teal,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://w0.peakpx.com/wallpaper/177/299/HD-wallpaper-pokemon-kanto.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            bottom: 100,
            child: ElevatedButton(
              onPressed: () async {
                await respuestaProvider.loadRespuesta();
                showResponse(respuestaProvider);
              },
              child: Text(
                '¡Atrápame un Pokémon!',
                style: TextStyle(fontSize: 18),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
