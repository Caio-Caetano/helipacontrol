import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:helipacontrol/functions/calculator_functions.dart';
import 'package:helipacontrol/widgets/textcustom.dart';

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({super.key, required this.notifierMap, required this.callback});

  final ValueNotifier<Map<String, double>> notifierMap;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    final TextEditingController controllerMoney = TextEditingController();

    final CurrencyTextInputFormatter currencyTextInputFormatter = CurrencyTextInputFormatter(locale: 'pt-br', symbol: 'R\$', decimalDigits: 2);

    return SizedBox(
      width: 350,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                generateTitle('Calculadora\nPagamento membro'),
                const SizedBox(height: 15),
                TextFormField(
                  controller: controllerMoney,
                  inputFormatters: [currencyTextInputFormatter],
                  validator: (value) => value != null
                      ? value.isEmpty
                          ? '⚠️ Preencha este campo'
                          : null
                      : null,
                  decoration: const InputDecoration(
                    hintText: 'Digite o valor total em dinheiro sujo',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.green),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.red),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.red),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                const Text('Porcentagem da lavagem: 20%'),
                const Text('Porcentagem para o membro: 40%'),
                const Text('Porcentagem para o painel: 60%'),
                const SizedBox(height: 15),
                ElevatedButton(
                  style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.white)),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      var result = CalculatorFunctions().calculate(currencyTextInputFormatter.getUnformattedValue().toDouble());
                      notifierMap.value = result;
                      callback();
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      'Calcular',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
