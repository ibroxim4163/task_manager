import 'package:flutter/material.dart';

import '../../../data/constants/app_colors.dart';

class HomeShimmer extends StatelessWidget {
  const HomeShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.separated(
          itemBuilder: (context, index) {
            return SizedBox(
              height: 115,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    border: Border.all(
                      color: AppColors.greyColor,
                      width: 3,
                    ),
                  ),
                  child: const Column(
                    children: [
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomBox(
                            width: 80,
                            height: 15,
                            padding: EdgeInsets.only(
                              left: 10,
                              right: 15,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomBox(
                            width: 120,
                            height: 15,
                            padding: EdgeInsets.only(left: 10),
                          ),
                          CustomBox(
                            height: 20,
                            width: 70,
                            padding: EdgeInsets.only(right: 20),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomBox(
                            width: 120,
                            height: 15,
                            padding: EdgeInsets.only(left: 10),
                          ),
                          CustomBox(
                            height: 20,
                            width: 5,
                            padding: EdgeInsets.only(right: 15),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(height: 15),
          itemCount: 7,
        ),
      ),
    );
  }
}

class CustomBox extends StatelessWidget {
  final double height;
  final double width;
  final EdgeInsets? padding;
  const CustomBox({
    this.height = 15,
    this.width = 60,
    this.padding,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: SizedBox(
        height: height,
        width: width,
        child: const DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
            color: AppColors.greyColor,
          ),
        ),
      ),
    );
  }
}
