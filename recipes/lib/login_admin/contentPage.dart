abstract class Content {
  // Future<HomePageRecipes> lista();
  // Future<InicioPage> recetas(String id);
  // Future<MapsPage> mapa();
  // Future<ListMyrecipe> myrecipe();
  // Future<InicioPage> admin();
}

class ContentPage implements Content {
  @override
  Future admin() {
    return null;
  }

  @override
  Future lista() {
    return null;
  }

  @override
  Future mapa() {
    return null;
  }

  @override
  Future myrecipe() {
    return null;
  }

  @override
  Future recetas(String id) {
    return null;
  }  
}