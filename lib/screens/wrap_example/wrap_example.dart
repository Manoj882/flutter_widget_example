import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart'; 
import 'package:flutter_widget_example/screens/wrap_example/models/transaction.dart';

class WrapExample extends StatefulWidget {
  const WrapExample({super.key});

  @override
  State<WrapExample> createState() => _WrapExampleState();
}

class _WrapExampleState extends State<WrapExample> {
  List<Transaction> list = [
    Transaction(
        title: 'Weekly Reward',
        type: 'Weekly',
        prizeImage:
            'https://m.media-amazon.com/images/I/61ZjlBOp+rL._AC_UF1000,1000_QL80_.jpg'),
    
    Transaction(
        title: 'Monthly Reward',
        type: 'Monthly',
        prizeImage:
            'https://m.media-amazon.com/images/I/61ZjlBOp+rL._AC_UF1000,1000_QL80_.jpg'),
    Transaction(
        title: 'Weekly Reward',
        type: 'Weekly',
        prizeImage:
            'https://m.media-amazon.com/images/I/61ZjlBOp+rL._AC_UF1000,1000_QL80_.jpg'),
            Transaction(
        title: 'Bumpar Reward',
        type: 'Bumpar',
        prizeImage:
            'https://laxmihyundai.com/laravel-filemanager/files/1/Press-Releases/Hyundai-Festive-Delight-2077.jpg'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wrap Example'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text('Wrap widget example'),
              SizedBox(
                height: 10,
              ),
              Wrap(
                spacing: 0,
                runSpacing: 8,
                alignment: WrapAlignment.center,
                children: list
                    .map(
                      (item) => PrizeContainer(
                        transaction: item,
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PrizeContainer extends StatelessWidget {
  const PrizeContainer({required this.transaction, super.key});

  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width / 2 - 20;
    return Container(
      width: transaction.type == 'Bumpar' ? double.infinity : width,
      // height: 200,
      padding: const EdgeInsets.all(4),
      //color: Colors.green,
      child: Column(
        children: [
          Text(transaction.title ?? ''),
          CachedNetworkImage(
            height: transaction.type == 'Bumpar' ? 250 : 170,
            width: transaction.type == 'Bumpar' ? double.infinity : width,
            imageUrl: transaction.prizeImage ?? '',
            fit: BoxFit.scaleDown,
          )
        ],
      ),
    );
  }
}
