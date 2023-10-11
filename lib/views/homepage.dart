import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:onboarding_demo/controllers/homepage_controller.dart';
import 'package:onboarding_demo/views/onboarding_page.dart';

class QuickPickUp extends StatelessWidget {
  final QuickPickupController _quickPickupController = QuickPickupController();
  QuickPickUp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _quickPickupController.quickPickup.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ElevatedButton(
              onPressed: () {
                Get.to(() => OnBoardingPage());
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                Color(0xFFE09437),
              )),
              // width: 157,
              //height: 70,
              // decoration: ShapeDecoration(
              //   color: Color(0xFFE09437),
              //   shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(31),
              //   ),
              // ),
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
                            image: AssetImage(_quickPickupController
                                .quickPickup[index].image)),
                        shape: OvalBorder(),
                      ),
                    ),
                  ),
                  SizedBox(width: 2),
                  Text(_quickPickupController.quickPickup[index].cusine)
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class SearchBox extends StatelessWidget {
  const SearchBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(),
      child: Stack(children: [Icon(Icons.search)]),
    );
  }
}

class HomePage extends StatelessWidget {
  final HomeController _homeController = Get.put(HomeController());
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      child: Icon(Icons.menu),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x14000000),
                              blurRadius: 9,
                              offset: Offset(0, 1),
                              spreadRadius: 0,
                            ),
                          ]),
                    ),
                    Text(
                      "Search Food",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 28,
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assetss/profile.png')),
                          borderRadius: BorderRadius.circular(6),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x14000000),
                              blurRadius: 9,
                              offset: Offset(0, 1),
                              spreadRadius: 0,
                            ),
                          ]),
                    ),
                  ],
                ),
                SizedBox(height: 26),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 293,
                      height: 48,
                      padding: const EdgeInsets.all(15),
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        shadows: [
                          BoxShadow(
                            color: Color(0x1E000000),
                            blurRadius: 12,
                            offset: Offset(0, 3),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          SearchBox(),
                          SizedBox(width: 7),
                          Text(
                            'Spicy Wings',
                            style: TextStyle(
                              color: Color(0xFF252830),
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(7),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x1E000000),
                              blurRadius: 12,
                              offset: Offset(0, 3),
                              spreadRadius: 0,
                            )
                          ]),
                      child: const Icon(Icons.tune),
                    )
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      'Quick pickups',
                      style: headings(),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                QuickPickUp(),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Text(
                      "Our Best Sellers",
                      style: headings(),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Items(homeController: _homeController),
                SizedBox(height: 18),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Favorite Resturants",
                      style: headings(),
                    ),
                    Row(
                      children: [
                        Text(
                          "See all",
                          style: headings().copyWith(
                              fontWeight: FontWeight.w400, fontSize: 18),
                        ),
                        Icon(Icons.arrow_forward_ios),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 18),
                Container(
                  height: 113,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 113,
                        width: 248,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(7),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x16000000),
                                blurRadius: 8,
                              )
                            ]),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          iconSize: 28,
          landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
          backgroundColor: Colors.black26,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          selectedItemColor: Color(0xFFE09437),
          unselectedItemColor: Colors.white,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "",
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline), label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.card_travel), label: ""),
          ]),

      // bottomNavigationBar: Container(
      //   color: Colors.black,
      //   padding: EdgeInsets.all(20.0),
      //   child: Row(
      //     crossAxisAlignment: CrossAxisAlignment.center, // Optional
      //     mainAxisAlignment:
      //         MainAxisAlignment.spaceEvenly, // Change to your own spacing
      //     children: [
      //       Icon(
      //         Icons.home_outlined,
      //         color: Color(0xFFE09437),
      //       ), //REPLACE WITH ICON
      //       Icon(
      //         Icons.person_outline,
      //         color: Colors.white,
      //       ),
      //       Icon(
      //         Icons.favorite_border,
      //         color: Colors.white,
      //       ),
      //       Icon(Icons.card_travel, color: Colors.white),
      //     ],
      //   ),
      // ),
    );
  }
}

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
                  left: 25,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Chowmin",
                        style: headings(),
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
                            style: headings(),
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

TextStyle headings() {
  return const TextStyle(
    color: Colors.black,
    fontSize: 23,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w700,
    height: 0,
  );
}

TextStyle subHeadings() {
  return const TextStyle(
    color: Color(0xFF757575),
    fontSize: 13,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
    height: 0,
  );
}
