import 'package:flutter/widgets.dart';
import 'package:fluttertest/pockemon/domain/model/Pockemon.dart';
import 'package:fluttertest/pockemon/domain/repository/pockemon-repository.dart';
import 'package:fluttertest/pockemon/domain/useCase/GetPokemonts.dart';

class PokemonProvider with ChangeNotifier{
  List<Pokemon>? _pokemonList;
  GetPokemons getPokemons = GetPokemons(repository: PokemonRepository());
  bool _loading = true;
  PokemonProvider(){
    fetchPokemons();
  }

  List<Pokemon>? get pokemonList => _pokemonList;
  bool get loading => _loading;

  fetchPokemons()async{
    _pokemonList = await getPokemons();
    _loading = false;
    notifyListeners();
  }
}