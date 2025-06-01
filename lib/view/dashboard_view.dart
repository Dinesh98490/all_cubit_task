
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student/cubit/dashboard_cubit.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dashboard")),
      body: GridView(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        children: <Widget>[
          _buildCard(
            context,
            icon: Icons.add,
            label: 'Counter Cubit',
            onTap: () => context.read<DashboardCubit>().openCounterView(context),
          ),
          _buildCard(
            context,
            icon: Icons.calculate,
            label: 'Arithmetic Cubit',
            onTap: () => context.read<DashboardCubit>().openArithmeticView(context),
          ),
          _buildCard(
            context,
            icon: Icons.person,
            label: 'Student Cubit',
            onTap: () => context.read<DashboardCubit>().openStudentView(context),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(BuildContext context,
      {required IconData icon,
        required String label,
        required VoidCallback onTap}) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48),
            const SizedBox(height: 10),
            Text(label),
          ],
        ),
      ),
    );
  }
}
