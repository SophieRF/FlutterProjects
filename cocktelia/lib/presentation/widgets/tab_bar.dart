import 'package:cocktelia/ui.theme/styles/text_style_app.dart';
import 'package:flutter/material.dart';

class TabAppBar extends StatelessWidget{
  final String tabCategory;
  const TabAppBar({super.key, required this.tabCategory});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('CocktElia',
      style: textStyleBase.h132,),
      backgroundColor: const Color.fromARGB(255, 31, 23, 15),
      bottom: TabBar(
        labelColor: const Color.fromARGB(255, 218, 205, 191),
        unselectedLabelColor: const Color.fromARGB(227, 116, 110, 110),
        tabs:[
          Text(tabCategory,
          style: textStyleBase.h120,
          ),
          Text('Favoritos',
          style: textStyleBase.h120,),
        ], 
      ),
    );
  }
}

