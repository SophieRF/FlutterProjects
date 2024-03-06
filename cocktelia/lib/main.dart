import 'package:cocktelia/presentation/screens/recipeScreen/changeNotifier/recipescreen_provider.dart';
import 'package:cocktelia/presentation/screens/home_screen.dart';
import 'package:cocktelia/presentation/screens/splash_screen.dart';
import 'package:cocktelia/presentation/widgets/categoryCard/changeNotifier/categorycards_provider.dart';
import 'package:cocktelia/presentation/widgets/recipeCard/changeNotifier/recipecards_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
void main() async{
  runApp(
    const MainApp());
}
class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => RecipeScreenProvider()),
        ChangeNotifierProvider(
          create: (_)=> RecipeCardProvider()),
        ChangeNotifierProvider(
          create: (_)=> CategoryCardProvider()),
      ],
      child: MaterialApp(
          title: 'Cocktail recipe',
          debugShowCheckedModeBanner: false,
          initialRoute: "splash",
          routes: {
            "splash":(context)=>const SplashScreen(),
            "home":(context)=>const MyHomePage(),
          },
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(234, 48, 47, 47)),
            useMaterial3: true,
          ),
          home: const MyHomePage(),
      ),
    );
  }
}


