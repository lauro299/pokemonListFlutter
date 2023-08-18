
import 'dart:convert';

import 'package:fluttertest/pockemon/domain/model/Pockemon.dart';
import 'package:http/http.dart' as http;

class PokemonRepository {

  PokemonRepository();

  Future<List<Pokemon>> getPockemons() async {
    final response= await http.get(Uri.parse("https://db.pokemongohub.net/api/pokemon/with-generation/1"));
    if (response.statusCode == 200) {
      final List<dynamic> decodedData = json.decode(response.body);
      return decodedData.map((e) => Pokemon.fromJson(e)).toList();
      //final list = response.body as List<dynamic>;
      //return list.map((e) => Pokemon.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load pockemons');
    }
  }
}