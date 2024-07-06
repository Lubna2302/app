import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stock Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StockDashboard(),
    );
  }
}

class StockDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stocks'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.qr_code),
            onPressed: () {},
          ),
          CircleAvatar(
            child: Text('A'),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildMarketIndex(
                    'NIFTY 50', '24,323.85', '+21.70 (0.09%)', Colors.green),
                _buildMarketIndex(
                    'BANK NIFTY', '52,660.35', '-443.35 (0.83%)', Colors.red),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildButton('Explore'),
                _buildButton('Holdings'),
                _buildButton('Aniket\'s Watchlist'),
              ],
            ),
            SizedBox(height: 16),
            Text('Most bought on Groww',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _buildStockCard(
                      'NBCC (India)', '₹188', '+1.93 (1.03%)', Colors.green),
                  _buildStockCard(
                      'HDFC Bank', '₹1,648', '-79.05 (4.58%)', Colors.red),
                  _buildStockCard(
                      'IRFC', '₹188', '+10.51 (5.91%)', Colors.green),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.show_chart),
            label: 'Stocks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: 'Mutual Funds',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.payment),
            label: 'Pay',
          ),
        ],
      ),
    );
  }

  Widget _buildMarketIndex(
      String name, String value, String change, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(name, style: TextStyle(fontSize: 16)),
        SizedBox(height: 4),
        Text(value,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        SizedBox(height: 4),
        Text(change, style: TextStyle(color: color)),
      ],
    );
  }

  Widget _buildButton(String text) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(text),
    );
  }

  Widget _buildStockCard(
      String name, String value, String change, Color color) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(value,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(change, style: TextStyle(color: color)),
          ],
        ),
      ),
    );
  }
}
