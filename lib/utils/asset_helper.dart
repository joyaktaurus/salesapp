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
   static get splashTwo => images("logolake.png");
   static get loginImage => images("components.png");
   static get lakeSmall => images("lakesmall.png");
   static get briefcase => images("Briefcase_.png");
   static get calender => images("Alternate Calendar_.png");
   static get email => images("Envelope_.png");
   static get password => images("password.png");
   static get document => images("New Document.png");
   static get leaveRequest => images("File Signature_.png");
   static get user => images("User Circle_.png");
   static get clock => images("icon _Clock_.png");
}
