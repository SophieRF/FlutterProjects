import 'package:cocktelia/extensions/build_context_extensions.dart';
import 'package:cocktelia/presentation/widgets/categoryCard/model/categorycards_model.dart';
import 'package:cocktelia/presentation/screens/favoritesScreen/favorites_screen.dart';
import 'package:cocktelia/presentation/widgets/categoryCard/categories_card.dart';
import 'package:cocktelia/presentation/widgets/tabBar/tab_bar.dart';
import 'package:cocktelia/ui.theme/color_scheme_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyHomePage extends StatelessWidget{
  const MyHomePage({super.key});

  static Route get route => MaterialPageRoute(builder: (context)=> const MyHomePage());

  @override
  Widget build(BuildContext context) {
    context.categoryCardProvider.loadCategoryCards();
    List<CategoryCardModel> categoryCards =
    context.categoryCardProvider.data;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(110.sp),
          child: const TabAppBar(
            tabCategory: 'Categorías',)
        ), 
        body:categoryCards.isEmpty 
            ? const Center(child: CircularProgressIndicator()) 
            :TabBarView(
          children:[
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    darkBrown,
                    lightBrown,
                  ],
                  begin: Alignment.topCenter, 
                  end: Alignment.bottomCenter, 
                  stops: const [0.0, 1.0],
                ),
              ),
            child: ListView.separated(
              itemCount: categoryCards.length,
              separatorBuilder: (BuildContext context, int index) => SizedBox(height: 18.sp),
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