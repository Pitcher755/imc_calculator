import 'package:flutter/material.dart';
import 'package:imc_calculator/core/app_colors.dart';

class ImcResultScreen extends StatelessWidget {
  final int weight;
  final double height;
  const ImcResultScreen({
    super.key,
    required this.weight,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: toolbarResult(),
      body: bodyResult(context),
    );
  }

  Padding bodyResult(BuildContext context) {
    double fixedHeight = height / 100;
    double imcResult = weight / (fixedHeight * fixedHeight);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Tu resultado",
            style: TextStyle(
              fontSize: 38,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                right: 8.0,
                left: 8.0,
                bottom: 32.0,
                top: 32.0,
              ),
              child: Container(
                width: double.infinity,

                decoration: BoxDecoration(
                  color: AppColors.backgroundComponent,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      getTitleByImc(imcResult),
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: getColorByImc(imcResult),
                      ),
                    ),
                    Text(
                      imcResult.toStringAsFixed(2),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 76,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                      child: Text(
                        getDescriptionByImc(imcResult),
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0, left: 8.0, bottom: 16.0),
            child: Container(
              height: 60,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Finalizar", style: TextStyle(color: Colors.white)),
                style: ButtonStyle(
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  backgroundColor: WidgetStateProperty.all(AppColors.primary),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar toolbarResult() {
    return AppBar(
      title: Text("Resultado IMC"),
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
    );
  }

  Color getColorByImc(double imcResult) {
    return switch (imcResult) {
      < 18.5 => Colors.blue, // IMC Bajo
      < 24.9 => Colors.green, // IMC Normal
      < 29.99 => Colors.orange, // IMC Sobrepeso
      _ => Colors.red, // IMC Obesidad
    };
  }

  String getTitleByImc(double imcResult){
    return switch(imcResult){
      < 18.5 => "Peso Bajo",
      < 24.9 => "Peso Normal",
      < 29.99 => "Sobrepeso",
      _ => "Obesidad",
    };
  }

  String getDescriptionByImc(double imcResult){
    return switch(imcResult){
      < 18.5 => "Tu peso es bajo, necesitas comer más y/o ejercitarte más",
      < 24.9 => "Tu peso es normal, ¡bien hecho!",
      < 29.99 => "Tienes sobrepeso, necesitas comer menos y/o ejercitarte más",
      _ => "Tienes obesidad, necesitas comer menos y/o ejercitarte más",
    };
  }
}
