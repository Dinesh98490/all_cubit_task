
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:student/cubit/arthimatic_cubit.dart';
import 'package:student/model/arthimatic_model.dart';
import 'package:student/state/arthimatic_state.dart';

class ArithmeticView extends StatefulWidget {
  const ArithmeticView({super.key});

  @override
  State<ArithmeticView> createState() => _ArithmeticViewState();
}

class _ArithmeticViewState extends State<ArithmeticView> {
  final TextEditingController _aController = TextEditingController();
  final TextEditingController _bController = TextEditingController();

  double _parse(String value) => double.tryParse(value) ?? 0;

  @override
  Widget build(BuildContext context) {
    final arithmeticCubit = context.read<ArithmeticCubit>();

    return Scaffold(
      appBar: AppBar(title: const Text("Arithmetic Cubit")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _aController,
              decoration: const InputDecoration(labelText: 'Enter first number'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _bController,
              decoration: const InputDecoration(labelText: 'Enter second Bumber'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 10,
              children: [
                ElevatedButton(
                  onPressed: () {
                    final model = ArithmeticModel(
                      numberA: _parse(_aController.text),
                      numberB: _parse(_bController.text),
                    );
                    arithmeticCubit.add(model);
                  },
                  child: const Text('Add'),
                ),
                ElevatedButton(
                  onPressed: () {
                    final model = ArithmeticModel(
                      numberA: _parse(_aController.text),
                      numberB: _parse(_bController.text),
                    );
                    arithmeticCubit.subtract(model);
                  },
                  child: const Text('Subtract'),
                ),
                ElevatedButton(
                  onPressed: () {
                    final model = ArithmeticModel(
                      numberA: _parse(_aController.text),
                      numberB: _parse(_bController.text),
                    );
                    arithmeticCubit.multiply(model);
                  },
                  child: const Text('Multiply'),
                ),
                ElevatedButton(
                  onPressed: () {
                    final model = ArithmeticModel(
                      numberA: _parse(_aController.text),
                      numberB: _parse(_bController.text),
                    );
                    arithmeticCubit.divide(model);
                  },
                  child: const Text('Divide'),
                ),
                ElevatedButton(
                  onPressed: () => arithmeticCubit.clear(),
                  child: const Text('Clear'),
                ),
              ],
            ),
            const SizedBox(height: 30,width:double.infinity),
            BlocBuilder<ArithmeticCubit, ArithmeticState>(
              builder: (context, state) {
                return Column(
                  children: [
                    Text(
                      'Result: ${state.result.toStringAsFixed(2)}',
                      style: const TextStyle(fontSize: 24),
                    ),
                    if (state.message.isNotEmpty)
                      Text(
                        state.message,
                        style: const TextStyle(color: Colors.red),
                      ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
