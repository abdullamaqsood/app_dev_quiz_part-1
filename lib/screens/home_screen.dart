import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/transaction_bloc.dart';
import '../widgets/transaction_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TransactionBloc()..add(LoadTransactions()),
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('MONDAY', style: TextStyle(color: Colors.grey)),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('17 Nov',
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold)),
                    Text('\$2,983',
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue)),
                  ],
                ),
                const SizedBox(height: 20),
                const Text('Transactions', style: TextStyle(fontSize: 18)),
                const SizedBox(height: 10),
                Expanded(
                  child: BlocBuilder<TransactionBloc, TransactionState>(
                    builder: (context, state) {
                      if (state is TransactionLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is TransactionLoaded) {
                        return ListView.builder(
                          itemCount: state.transactions.length,
                          itemBuilder: (context, index) {
                            return TransactionTile(
                                tx: state.transactions[index]);
                          },
                        );
                      }
                      return const Text('Error loading data.');
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
