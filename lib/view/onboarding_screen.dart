import 'package:cellsandcell/constants/color.dart';
import 'package:cellsandcell/controller/onboarding_controller.dart';
import 'package:cellsandcell/view/loginscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = OnboardingController();
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
                controller: _controller.pageController,
                onPageChanged: _controller.selectedpageIndex,
                itemCount: _controller.onboardingPages.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 300,
                          height: 300,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      _controller.onboardingPages[index].image),
                                  fit: BoxFit.fill)),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          _controller.onboardingPages[index].title,
                          style: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32.0),
                          child: Text(
                            _controller.onboardingPages[index].description,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 20, color: Colors.black54),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
            Positioned(
              bottom: 20,
              left: 20,
              child: Row(
                  children: List.generate(
                      _controller.onboardingPages.length,
                      (index) => Obx(() {
                            return Container(
                              margin: const EdgeInsets.all(4),
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                  color: _controller.selectedpageIndex.value ==
                                          index
                                      ? purple
                                      : Colors.black26,
                                  shape: BoxShape.circle),
                            );
                          }))),
            ),
            Positioned(
                right: 20,
                bottom: 20,
                child: FloatingActionButton(
                    backgroundColor: purple,
                    elevation: 0,
                    onPressed: () {
                      _controller.isLastPage
                          ? Get.offAll(LoginScreen())
                          : _controller.ForwardAction();
                    },
                    child: Obx(() {
                      return Text(
                        _controller.isLastPage ? 'Start' : 'Next',
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18),
                      );
                    })))
          ],
        ),
      ),
    );
  }
}
