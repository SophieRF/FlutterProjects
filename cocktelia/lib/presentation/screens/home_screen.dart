import 'package:cocktelia/models/categorycards_model.dart';
import 'package:cocktelia/presentation/widgets/categoryCard/changeNotifier/categorycards_provider.dart';
import 'package:cocktelia/presentation/screens/favorites_screen.dart';
import 'package:cocktelia/presentation/widgets/categoryCard/categories_card.dart';
import 'package:cocktelia/presentation/widgets/tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget{
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
  Provider.of<CategoryCardProvider>(context).loadCategoryCards();
  List<CategoryCardModel> categoryCards =
    Provider.of<CategoryCardProvider>(context).data;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(110),
          child: TabAppBar(
            tabCategory: 'Categorías',)
        ), 
        body:categoryCards.isEmpty 
            ? const Center(child: CircularProgressIndicator()) 
            :TabBarView(
          children:[
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 31, 23, 15),
                    Color.fromARGB(255, 66, 57, 50),
                  ],
                  begin: Alignment.topCenter, 
                  end: Alignment.bottomCenter, 
                  stops: [0.0, 1.0],
                ),
              ),
            child: ListView.separated(
              itemCount: categoryCards.length,
              separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 18),
              itemBuilder: (context, index) {
                return CategoryCard(categoryCards: categoryCards[index]);
              },
            ),
          ),
          const FavoritesMenu(),
          ],
        ),
      ),
    );
  }
}