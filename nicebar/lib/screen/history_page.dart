import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nicebar/common/functions.dart';
import 'package:nicebar/component/cart_item_widget.dart';
import 'package:nicebar/main.dart';

import 'package:nicebar/provider/record_provider.dart';
import 'package:provider/provider.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  void initState() {
    super.initState();
    recordProvider.load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Records"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<RecordProvider>(builder: (context, listener, oldWidget) {
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: listener.records.length,
                  itemBuilder: (context, index) {
                    final record = listener.records[index];
                    return ExpansionTile(
                      title: Text("Record  ${DateFormat("dd/MM/y hh:mm:ss").format(record.date)}"),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          recordProvider.removeRecord(record);
                        },
                      ),
                      children: getCartItemInterset(record.products)
                          .map((p) => CartItemWidget(product: p, quantity: getQuantityOf(p.id, record.products)))
                          .toList(),
                    );
                  });
            }),
          ),
        ],
      ),
    );
  }
}
