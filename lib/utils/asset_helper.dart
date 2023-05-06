import 'dart:ui';

abstract class AssetHelper {
   static String images(String imageName) {
     return 'assets/png/$imageName';
   }
  //
  // static String icons(String imageName) {
  //   return 'assets/icons/$imageName';
  // }
  //
  // static get inventoryIcon => icons("");
  // static get customersIcon => icons("");
  // //---------------------------------------------
  //
  // static get appImageUrl => ApiPaths.baseUrl + ApiPaths.imagePath;
  // //---------------------------------------------

   static get splashImage => images("splash.png");
   static get splashIcon => images("Vector.png");
   static get profileImage => images("propic.png");
   static get loginImage => images("components.png");
   static get mailCheck => images("mailcheck.png");
   static get edit => images("edit.png");
   static get addShopImage => images("addshop.png");
   static get shop => images("shop.png");
   static get swatch => images("swatch.png");
}
