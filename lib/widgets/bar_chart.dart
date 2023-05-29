import 'package:flutter/material.dart';

class BarChart extends StatelessWidget {
  const BarChart({super.key, required this.expenses});

  final List<double> expenses;

  @override
  Widget build(BuildContext context) {
    double mostEpxensive = 0;
    for (var price in expenses) {
      if (price > mostEpxensive) {
        mostEpxensive = price;
      }
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          const Text(
            'Weekly Spending',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_back_ios_new),
              ),
              const Text(
                'Nov 10, 2022 - Nov 16, 2022',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_forward_ios),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Bar(
                  label: 'Su',
                  amountSpent: expenses[0],
                  mostExpensive: mostEpxensive,
                ),
                Bar(
                  label: 'Mo',
                  amountSpent: expenses[1],
                  mostExpensive: mostEpxensive,
                ),
                Bar(
                  label: 'Tu',
                  amountSpent: expenses[2],
                  mostExpensive: mostEpxensive,
                ),
                Bar(
                  label: 'We',
                  amountSpent: expenses[3],
                  mostExpensive: mostEpxensive,
                ),
                Bar(
                  label: 'Th',
                  amountSpent: expenses[4],
                  mostExpensive: mostEpxensive,
                ),
                Bar(
                  label: 'Fr',
                  amountSpent: expenses[5],
                  mostExpensive: mostEpxensive,
                ),
                Bar(
                  label: 'Sa',
                  amountSpent: expenses[6],
                  mostExpensive: mostEpxensive,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Bar extends StatelessWidget {
  const Bar({
    super.key,
    required this.label,
    required this.amountSpent,
    required this.mostExpensive,
  });

  final String label;
  final double amountSpent;
  final double mostExpensive;

  final double _maxBarHeight = 150;

  @override
  Widget build(BuildContext context) {
    final double finalBarHeight = amountSpent / mostExpensive * _maxBarHeight;
    return Column(
      children: [
        Text(
          '\$${amountSpent.toStringAsFixed(2)}',
          style: TextStyle(fontSize: 12),
        ),
        Container(
          width: 15,
          height: finalBarHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
