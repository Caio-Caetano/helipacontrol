import 'package:flutter/material.dart';
import 'package:helipacontrol/widgets/textcustom.dart';

class ResultCard extends StatelessWidget {
  const ResultCard({super.key, this.totalClean, this.resultMember, this.resultPanel});

  final double? totalClean;
  final double? resultMember;
  final double? resultPanel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              generateTitle('Resultados:'),
              const SizedBox(height: 20),
              generateResultText('Total para o membro (40%): R\$$resultMember', bgColor: Colors.greenAccent),
              const SizedBox(height: 20),
              generateResultText('Total para o painel (60%): R\$$resultPanel', bgColor: Colors.white),
              const SizedBox(height: 20),
              generateResultText('Total Limpo: R\$$totalClean', bgColor: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
