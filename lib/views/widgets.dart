import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onboarding_demo/controllers/homepage_controller.dart';
import 'package:onboarding_demo/views/homepage.dart';
import 'onboarding_page.dart';

class Items extends StatelessWidget {
  const Items({
    super.key,
    required HomeController homeController,
  }) : _homeController = homeController;
  final HomeController _homeController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 222,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) {
          return Container(
            width: 158,
            height: 220,
            child: Stack(
              children: [
                Positioned(
                    top: 40,
                    child: Container(
                      height: 180,
                      width: 158,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Color(0x16000000), blurRadius: 8),
                        ],
                        borderRadius: BorderRadius.circular(7),
                      ),
                    )),
                Positioned(
                  left: 28,
                  child: CircleAvatar(
                    // backgroundColor: Colors.amber,
                    foregroundImage: AssetImage('assetss/chowmin.jpeg'),
                    radius: 52,
                  ),
                ),
                Positioned(
                  top: 117,
                  left: 23,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Chowmein",
                        style: headings().copyWith(fontSize: 18),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "spicy buff",
                        style: subHeadings(),
                      ),
                      SizedBox(height: 3),
                      Row(
                        children: [
                          Text(
                            "Rs.110",
                            style: headings().copyWith(fontSize: 18),
                          ),
                          SizedBox(width: 5),
                          Obx(() {
                            return IconButton(
                              icon: _homeController.isFavorite.value
                                  ? Icon(Icons.favorite_rounded,
                                      color: Colors.red)
                                  : Icon(Icons.favorite_border),
                              onPressed: () {
                                _homeController.toggleFavorite();
                              },
                            );
                          })
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class QuickPickUp extends StatelessWidget {
  final QuickPickupController _quickPickupController = QuickPickupController();
  final RxInt activeIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _quickPickupController.quickPickup.length,
        itemBuilder: (context, index) {
          return Obx(() {
            return Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: ElevatedButton(
                onPressed: () {
                  activeIndex.value = index;
                  // Get.to(() => OnBoardingPage());
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    activeIndex.value == index
                        ? Color(0xFFE09437)
                        : Colors.grey,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: ShapeDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              _quickPickupController.quickPickup[index].image,
                            ),
                          ),
                          shape: const OvalBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(width: 2),
                    Text(_quickPickupController.quickPickup[index].cusine),
                  ],
                ),
              ),
            );
          });
        },
      ),
    );
  }
}

class NavBar extends StatelessWidget {
  const NavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 105, // Adjust the height as needed
      //color: Colors.black26,
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: BottomNavigationBar(
          type:
              BottomNavigationBarType.fixed, // Use fixed type to remove labels
          backgroundColor: Colors.black,
          selectedItemColor: Color(0xFFE09437),
          iconSize: 26,
          unselectedItemColor: Colors.white,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "", // Set label to an empty string
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.card_travel),
              label: "",
            ),
          ],
        ),
      ),
    );
  }
}
