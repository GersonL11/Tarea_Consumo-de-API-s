import 'package:flutter/material.dart';
import 'package:flutter_poke_api/domain/entities/respuesta.dart';
import 'package:flutter_poke_api/helper/get_pokeAPI_answer.dart';

class RespuestaProvider extends ChangeNotifier {
  final _getPokemon = GetPokemon();
  Pokemon pokemon = Pokemon(id: 1, name: 'Bulbasaur', imageUrl: 'https://...');

  Future<void> loadRespuesta() async {
    await Future.delayed(const Duration(milliseconds: 5000));
    pokemon = await _getPokemon.getPokemon();
    notifyListeners();
  }
}
