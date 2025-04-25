class TransactionModel {
  final String title;
  final double amount;
  final DateTime date;

  TransactionModel({
    required this.title,
    required this.amount,
    required this.date,
  });

  factory TransactionModel.fromMap(Map<String, dynamic> data) {
    return TransactionModel(
      title: data['title'],
      amount: (data['amount'] as num).toDouble(),
      date: DateTime.parse(data['date']),
    );
  }
}
