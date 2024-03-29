import 'package:flutter/material.dart';
import 'package:flutter_poke_api/presentation/screens/home_screen.dart';
import 'package:flutter_poke_api/providers/respuesta_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>RespuestaProvider())
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home()
      ),
    );
  }
}
