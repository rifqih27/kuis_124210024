import 'package:flutter/material.dart';
import 'package:untitled/pokemon_data.dart';
import 'package:untitled/tourism_place.dart';
import 'package:url_launcher/url_launcher.dart';

class halamandetail extends StatelessWidget {
  const halamandetail({super.key, required this.pokemon});
  final PokemonData pokemon;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Halaman Detail"),
        backgroundColor: Colors.orange,
        actions: <Widget>[

          IconButton(onPressed: (){}, icon:Icon(Icons.favorite)

          ),
        ],


      ),
      body: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width,
            child: Image.network(pokemon.image),
          ),
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Center(child: Column(
              children: [
                Text(
                  pokemon.name,
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: Colors.red
                  ),
                ),Text("type"),
                Text(
                  pokemon.type[0],
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Text("weakness"),
                Text(pokemon.weakness[0]),
                SizedBox(height: 10,),
                Text("pro evolution"),
                Text(pokemon.prevEvolution[0]),
              ],
            ),
            ),
          ),
          SizedBox(height: 40,),
          IconButton(onPressed: (){
            _launcher(pokemon.wikiUrl);
          }, icon: Icon(Icons.link)),
          SizedBox(height: 20,),

          IconButton(onPressed: (){
            _launcher("https://spada.upnyk.ac.id");
          }, icon: Icon(Icons.link)),

          SizedBox(height: 20,),


        ],

      ),
    );
  }
  Future<void> _launcher(String url) async{
    final Uri _url = Uri.parse(url);
    if(!await launchUrl(_url)){
      throw Exception("gagal membuka url : $_url");
    }
  }
}
