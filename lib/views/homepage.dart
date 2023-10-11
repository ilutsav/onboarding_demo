import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:onboarding_demo/controllers/homepage_controller.dart';
import 'package:onboarding_demo/views/onboarding_page.dart';
import 'package:onboarding_demo/views/widgets.dart';

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
                        const Icon(Icons.arrow_forward_ios),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 18),
                SizedBox(
                  height: 114,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: false,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 113,
                        width: 248,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(7),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x16000000),
                                blurRadius: 8,
                              )
                            ]),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                radius: 22,
                                backgroundImage:
                                    AssetImage("assetss/profile.png"),
                              ),
                            ),
                            SizedBox(width: 10),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Kanxi ko Bhatti",
                                  style: headings().copyWith(fontSize: 18),
                                ),
                                SizedBox(height: 6),
                                Row(
                                  children: List.generate(
                                      5,
                                      (index) => Icon(
                                            Icons.star,
                                            size: 22,
                                            color: Colors.amber,
                                          )),
                                ),
                                SizedBox(height: 6),
                                Text(
                                  "chabahil",
                                  style: subHeadings().copyWith(fontSize: 14),
                                )
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: NavBar(),
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
