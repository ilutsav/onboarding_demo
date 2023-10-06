import 'package:flutter/material.dart';
import 'package:onboarding_demo/controllers/onboarding_controller.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class OnBoardingPage extends StatelessWidget {
  final OnBoardingController _controller = OnBoardingController();
  OnBoardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
                controller: _controller.pageController,
                onPageChanged: _controller.selectedPageIndex,
                itemCount: _controller.onboardingPage.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                              _controller.onboardingPage[index].imageAsset),
                          const SizedBox(height: 60),
                          Text(
                            _controller.onboardingPage[index].title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            _controller.onboardingPage[index].description,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
            Positioned(
              bottom: 20,
              left: 20,
              child: Row(
                children: List.generate(
                    _controller.onboardingPage.length,
                    (index) => Obx(() {
                          return Container(
                            margin: EdgeInsets.all(4),
                            height: 12,
                            width: 12,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color:
                                    _controller.selectedPageIndex.value == index
                                        ? Colors.red
                                        : Colors.grey),
                          );
                        })),
              ),
            ),
            Positioned(
                child: FloatingActionButton(
                  onPressed: () {
                    _controller.forwardAction();
                  },
                  child: Obx(() {
                    return Text(_controller.isLastPage ? "Start" : "Next");
                  }),
                ),
                bottom: 20,
                right: 20)
          ],
        ),
      ),
    );
  }
}
