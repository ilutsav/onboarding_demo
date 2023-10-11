import 'package:get/get.dart';
import 'package:onboarding_demo/models/homepage_info.dart';

class QuickPickupController extends GetxController {
  List<HomePageInfo> quickPickup = [
    HomePageInfo("Newari", "assetss/order.png"),
    HomePageInfo("Tharu", "assetss/cook.png"),
    HomePageInfo("Tharu", "assetss/cook.png"),
  ];
}

class HomeController extends GetxController {
  final RxBool isFavorite = false.obs;

  void toggleFavorite() {
    isFavorite.value = !isFavorite.value;
  }
}
