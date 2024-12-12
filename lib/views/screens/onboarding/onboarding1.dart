import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_app/constants/app_asset_images.dart';
import 'package:food_app/constants/app_colors.dart';
import 'package:food_app/controllers/onboarding_controller.dart';
import 'package:food_app/routes/app_routes.dart';
import 'package:food_app/views/widgets/switcher.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class Onboarding1 extends StatelessWidget {
  const Onboarding1({super.key});

  void skip() {
    if (kDebugMode) {
      print("User clicked the skip button");
      // skip to the last onboarding page.
      // move the page to the home page
      Get.toNamed(AppRoutes.home);
    }
  }

  void next() {
    if (kDebugMode) {
      print("Next Button clicked");
    }
    // move the page to the home page
    Get.toNamed(AppRoutes.home);
  }

  @override
  Widget build(BuildContext context) {
    final OnboardingController controller = Get.find();

    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              AppAssetImages.onboardingBackground,
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(
                    top: 30, bottom: 20, left: 30, right: 30),
                height: 370,
                decoration: const BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(40))),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: const Text(
                          "We serve incomparable delicacies",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "All the best restaurants with their top menu waiting for you, they cant’t wait for your order!!",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                      const SizedBox(height: 10),
                      const Switcher(index: 0),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                              onPressed: controller.skip,
                              child: const Text(
                                "Skip",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )),
                          InkWell(
                              onTap: controller.next,
                              child: const Row(children: [
                                Text(
                                  'Next ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Icon(FontAwesomeIcons.arrowRight,
                                    size: 17, color: Colors.white, weight: 800)
                              ]))
                        ],
                      )
                    ],
                  ),
                ),
              ))
        ],
      )),
    );
  }
}
