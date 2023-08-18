import 'package:fluttertest/pockemon/domain/model/Pockemon.dart';
import 'package:fluttertest/pockemon/domain/repository/pockemon-repository.dart';

class GetPokemons {
  final PokemonRepository repository;

  GetPokemons({required this.repository});

  @override
  Future<List<Pokemon>> call() async {
    return await repository.getPockemons();
  }
}
