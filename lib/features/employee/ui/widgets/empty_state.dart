import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'No employees loaded yet',
        style: TextStyle(color: Color(0xFF64748B), fontSize: 15),
      ),
    );
  }
}
