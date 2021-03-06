import 'package:flutter/material.dart';
import 'package:music_player/src/models/audioplayer_model.dart';
import 'package:music_player/src/pages/musica_payer_page.dart';
import 'package:music_player/src/theme/theme.dart';
import 'package:provider/provider.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => new AudioPlayerModel(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Music player',
        theme: miTema,
        home: MusicPlayerPage(),
      ),
    );
  }
}