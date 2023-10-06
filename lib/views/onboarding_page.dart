import 'package:flutter/material.dart';
import 'package:onboarding_demo/controllers/onboarding_controller.dart';

class OnBoardingPage extends StatelessWidget {
  final OnBoardingController controller = OnBoardingController();
  OnBoardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
                itemCount: controller.onboardingPage.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                              controller.onboardingPage[index].imageAsset),
                          const SizedBox(height: 60),
                          Text(
                            controller.onboardingPage[index].title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            controller.onboardingPage[index].description,
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
                    controller.onboardingPage.length,
                    (index) => Container(
                          margin: EdgeInsets.all(4),
                          height: 12,
                          width: 12,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.red),
                        )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
