import 'package:flutter/material.dart';
import 'package:fluttertest/pockemon/domain/repository/pockemon-repository.dart';
import 'package:fluttertest/pockemon/domain/useCase/GetPokemonts.dart';
import 'package:fluttertest/pockemon/ui/pokemons/PokemoProvider.dart';
import 'package:provider/provider.dart';

import 'PokemonDetailPage.dart';

class PokemonList extends StatelessWidget {
  final getPokemons = GetPokemons(repository: PokemonRepository());

  PokemonList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<PokemonProvider>(
        builder: (context, provider, child) {
          if (provider.loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: provider.pokemonList!.length,
              itemBuilder: (context, index) => ListTile(
                  title: Text(provider.pokemonList![index].name),
                  subtitle: Text(provider.pokemonList![index].name),
                  leading: CircleAvatar(
                    child: Text("${provider.pokemonList![index].type}${provider.pokemonList![index].id}"),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PokemonDetailPage(
                                pokemon: provider.pokemonList![index])));
                  }),
            );
          }
        },
      ),
    );
  }
}
