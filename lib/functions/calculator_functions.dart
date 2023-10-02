class CalculatorFunctions {
  Map<String, double> calculate(double money) {
    double percentCleaner = 0.2;
    double totalClean = 0;
    double totalMember = 0;
    double totalPanel = 0;

    // Retirar parte da lavagem
    totalClean = money - (money * percentCleaner);

    // Parte dos membros 40%
    totalMember = totalClean * 0.4;

    // Parte do painel 60%
    totalPanel = totalClean * 0.6;

    return {
      'totalClean': totalClean,
      'totalMember': totalMember,
      'totalPanel': totalPanel,
    };
  }
}
