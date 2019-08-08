import 'package:recipes/pages/admin/show_recipe.dart';
import 'package:recipes/pages/maps_page.dart';
import 'package:recipes/widgets/home_page.dart';

abstract class Content {
  Future<HomePageRecipes> lista();
  //Future<InicioPage> recetas(String id);
  Future<MapsPage> mapa();
  //Future<ListMyrecipe> myrecipe();
  Future<InicioPage> admin();
}

class ContentPage implements Content {
  @override
  Future<InicioPage> admin() async{
    return InicioPage();
  }

  @override
  Future<HomePageRecipes> lista()async {
    return HomePageRecipes();
  }

  @override
  Future<MapsPage> mapa() async{
    return MapsPage();
  }

}