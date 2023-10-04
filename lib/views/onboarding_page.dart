import 'package:flutter/material.dart';
import 'package:onboarding_demo/controllers/onboarding_controller.dart';

class OnBoardingPage extends StatelessWidget {
  final OnBoardingController controller = OnBoardingController();
  OnBoardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          itemCount: controller.onboardingPage.length,
          itemBuilder: (context, index) {
            return Container(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(controller.onboardingPage[index].imageAsset),
                    SizedBox(height: 60),
                    Text(
                      controller.onboardingPage[index].title,
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                    SizedBox(height: 16),
                    Text(
                      controller.onboardingPage[index].description,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
