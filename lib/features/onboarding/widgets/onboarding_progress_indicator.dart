import 'package:flutter/material.dart';

class OnboardingProgressIndicator extends StatelessWidget {
  final int currentStep;
  final int totalSteps;

  const OnboardingProgressIndicator({
    super.key,
    required this.currentStep,
    required this.totalSteps,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        totalSteps,
        (index) => Expanded(
          child: Container(
            height: 6,
            margin: EdgeInsets.symmetric(
              horizontal: 4,
            ),
            decoration: BoxDecoration(
              color: index <= currentStep
                  ? const Color(0xFF1C6734)
                  : const Color(0xFF9AE1B7).withOpacity(0.3),
              borderRadius: BorderRadius.circular(3),
            ),
          ),
        ),
      ),
    );
  }
}