import 'package:flutter/material.dart';
import '../models/transaction_model.dart';
import 'package:intl/intl.dart';

class TransactionTile extends StatelessWidget {
  final TransactionModel tx;

  const TransactionTile({super.key, required this.tx});

  String formatDate(DateTime date) {
    final now = DateTime.now();
    if (date.day == now.day &&
        date.month == now.month &&
        date.year == now.year) {
      return 'Today';
    } else if (date.day == now.subtract(Duration(days: 1)).day &&
        date.month == now.month &&
        date.year == now.year) {
      return 'Yesterday';
    }
    return DateFormat('dd MMM yyyy').format(date);
  }

  IconData getIcon(String title) {
    switch (title.toLowerCase()) {
      case 'shopping':
        return Icons.shopping_bag;
      case 'grocery':
        return Icons.shopping_cart;
      case 'transport':
        return Icons.directions_car;
      case 'payment':
        return Icons.credit_card;
      default:
        return Icons.person;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isIncome = tx.amount > 0;

    return ListTile(
      leading: CircleAvatar(
        child: Icon(getIcon(tx.title), color: Colors.white),
        backgroundColor: Colors.blueAccent,
        radius: 20,
      ),
      title: Text(tx.title, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(formatDate(tx.date)),
      trailing: Text(
        '${isIncome ? '+' : ''}\$${tx.amount.abs()}',
        style: TextStyle(
          color: isIncome ? Colors.blue : Colors.red,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
