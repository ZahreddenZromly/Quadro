import 'package:flutter/material.dart';





class paymentGateway extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
        appBar: AppBar(
          title: Text('Draggable Sheet Example'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return PaymentSheet();
                },
              );
            },
            child: Text('Open Payment Sheet'),
          ),
        ),
    );
  }
}
class PaymentSheet extends StatefulWidget {
  @override
  _PaymentSheetState createState() => _PaymentSheetState();
}

class _PaymentSheetState extends State<PaymentSheet> {
  String _currentPaymentMethod = 'نقداً';
  List<String> _paymentOptions = [
    'نقداً',
    'محفظة',
    'سداد',
    'البطاقة المصرفية اونلاين',
    'ادفعلي',
    'تداول',
    'موبي كاش'
  ];

  List<IconData> _paymentIcons = [
    Icons.money,
    Icons.account_balance_wallet,
    Icons.payment,
    Icons.credit_card,
    Icons.payment,
    Icons.attach_money,
    Icons.payment
  ];

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      maxChildSize: 1,
      minChildSize: 0.5,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: _paymentOptions.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      elevation: 5,
                      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        leading: Icon(_paymentIcons[index]),
                        title: Text(
                          _paymentOptions[index],
                          style: TextStyle(fontSize: 18),
                        ),
                        trailing: _currentPaymentMethod == _paymentOptions[index]
                            ? CircleAvatar(
                          backgroundColor: Colors.teal,
                          radius: 10,
                          child: Icon(
                            Icons.check,
                            size: 15,
                            color: Colors.white,
                          ),
                        )
                            : null,
                        onTap: () {
                          setState(() {
                            _currentPaymentMethod = _paymentOptions[index];
                          });
                        },
                        selected: _currentPaymentMethod == _paymentOptions[index],
                      ),
                    );
                  },
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.teal), // Change the background color here
                ),
                onPressed: () {
                  // Implement logic for confirming the selection
                  print('Selected payment method: $_currentPaymentMethod');
                  Navigator.pop(context);
                },
                child: Text('Confirm',style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        );
      },
    );
  }
}