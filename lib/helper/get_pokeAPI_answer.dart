import 'package:flutter_poke_api/domain/entities/respuesta.dart';
import 'package:dio/dio.dart';

class GetPokemon {
  final String baseUrl = "https://pokeapi.co/api/v2";
  final Dio _dio = Dio();

  Future<Pokemon> getPokemon() async {
    final int randomPokemonId = _getRandomPokemonId();
    final response = await _dio.get('$baseUrl/pokemon/$randomPokemonId');
    return Pokemon.fromJson(response.data);
  }

  int _getRandomPokemonId() {
    return DateTime.now().microsecondsSinceEpoch % 898 + 1;
  }
}

