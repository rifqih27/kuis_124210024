import 'package:flutter/material.dart';
import 'package:untitled/pokemon_data.dart';
import 'package:untitled/halamandetail.dart';
import 'package:untitled/tourism_place.dart';

class halamanutama extends StatelessWidget {
  const halamanutama({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: Text('Halaman Utama'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: listPokemon.length,
        itemBuilder: (context, index) {
          final PokemonData pokemon = listPokemon[index];
          return InkWell(
            onDoubleTap: () {

              Navigator.push(context, MaterialPageRoute(builder: (context) => halamandetail(pokemon : pokemon,),
              )
              );
            },
            child: Card(
              child: SizedBox(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height /6 ,
                      child: Image.network(
                        pokemon.image,
                      ),
                    ),
                    Text(pokemon.name),
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
