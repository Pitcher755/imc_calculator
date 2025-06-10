import 'package:flutter/material.dart';
import 'package:imc_calculator/core/app_colors.dart';
import 'package:imc_calculator/core/text_styles.dart';

class HeightSelector extends StatefulWidget {
  const HeightSelector({super.key});

  @override
  State<HeightSelector> createState() => _HeightSelectorState();
}

class _HeightSelectorState extends State<HeightSelector> {
  double height = 250;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8, right: 16, left: 16),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.backgroundComponent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Text("ALTURA", style: TextStyles.bodyText),
            Text(
              "${height.toStringAsFixed(0)} cm",
              style: TextStyle(
                color: Colors.white,
                fontSize: 38,
                fontWeight: FontWeight.bold,
              ),
            ),
            Slider(
              value: height,
              onChanged: (value) {
                setState(() {
                  height = value;
                });
              },
              min: 120,
              max: 250,
              divisions: 130,
              label: "${height.toStringAsFixed(0)} cm",
              activeColor: AppColors.primary,
            ),
          ],
        ),
      ),
    );
  }
}
