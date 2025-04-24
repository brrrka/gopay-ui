import 'package:flutter/material.dart';

class Riwayat extends StatelessWidget {
  const Riwayat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Riwayat transaksi',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: FilterButton(
                      label: 'Tanggal',
                      onTap: () {
                        showDatePicker(context);
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: FilterButton(
                      label: 'Layanan',
                      onTap: () {
                        showLayananPicker(context);
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: FilterButton(
                      label: 'Metode',
                      onTap: () {
                        showMetodePicker(context);
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              BannerPromosi(),
              SizedBox(height: 16),
              TransaksiGroup(
                tanggal: 'Selasa, 22 Apr 2025',
                items: [
                  TransaksiItem(
                    title: 'IM3 / Tri',
                    amount: '-Rp50.000',
                    amountColor: Colors.black87,
                    subtitle: 'GoPay Saldo',
                    icon: Icons.storefront,
                    iconBackgroundColor: Colors.blue.shade50,
                  ),
                ],
              ),
              SizedBox(height: 16),
              TransaksiGroup(
                tanggal: 'Minggu, 20 Apr 2025',
                items: [
                  TransaksiItem(
                    title: 'Diterima dari afifah',
                    amount: 'Rp24.000',
                    amountColor: Colors.green,
                    subtitle: 'GoPay ****9355',
                    icon: Icons.account_circle,
                    iconBackgroundColor: Colors.blue.shade50,
                  ),
                  DividerWithText(),
                  TransaksiItem(
                    title: 'Diterima dari afifah',
                    amount: 'Rp58.000',
                    amountColor: Colors.green,
                    subtitle: 'GoPay ****9355',
                    icon: Icons.account_circle,
                    iconBackgroundColor: Colors.blue.shade50,
                  ),
                  DividerWithText(),
                  TransaksiItem(
                    title: 'Ditransfer ke Shopeepayxxxxxxxx4',
                    amount: '-Rp27.000',
                    amountColor: Colors.black87,
                    subtitle: 'ShopeePay 0831808664...',
                    icon: Icons.arrow_upward,
                    iconBackgroundColor: Colors.blue.shade50,
                  ),
                  DividerWithText(),
                  TransaksiItem(
                    title: 'GoPay Top Up',
                    amount: 'Rp26.000',
                    amountColor: Color.fromARGB(255, 45, 174, 50),
                    subtitle: 'GoPay Saldo',
                    icon: Icons.add,
                    iconBackgroundColor: Colors.blue.shade50,
                  ),
                ],
              ),
              SizedBox(height: 16),
              TransaksiGroup(
                tanggal: 'Sabtu, 19 Apr 2025',
                items: [
                  TransaksiItem(
                    title: 'Diterima dari afifah',
                    amount: 'Rp25.000',
                    amountColor: Colors.green,
                    subtitle: 'GoPay ****9355',
                    icon: Icons.account_circle,
                    iconBackgroundColor: Colors.blue.shade50,
                  ),
                  DividerWithText(),
                  TransaksiItem(
                    title: 'IM3 / Tri',
                    amount: '-Rp30.000',
                    amountColor: Colors.black87,
                    subtitle: 'GoPay Saldo',
                    icon: Icons.storefront,
                    iconBackgroundColor: Colors.blue.shade50,
                  ),
                  DividerWithText(),
                  TransaksiItem(
                    title: 'Apple',
                    amount: '-Rp15.000',
                    amountColor: Colors.black87,
                    subtitle: 'GoPay Saldo',
                    icon: Icons.storefront,
                    iconBackgroundColor: Colors.blue.shade50,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  final String label;
  final Function()? onTap;

  const FilterButton({super.key, required this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap?.call();
      },
      child: Container(
        height: 40,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: const TextStyle(fontSize: 14, color: Color(0xFF3C3C3C)),
            ),
            const SizedBox(width: 4),
            const Icon(Icons.arrow_drop_down, size: 20, color: Colors.black54),
          ],
        ),
      ),
    );
  }
}

void showDatePicker(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Pilih tanggal transaksi',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Action for the 'Hapus' button can be added here
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 5,
                    ),
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    'Hapus',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            RadioListTile<String>(
              title: const Text(
                '7 hari terakhir',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text('Kam, 17 Apr, 2025 - Rab, 23 Apr, 2025'),
              value: '7 hari terakhir',
              groupValue: '',
              onChanged: (String? value) {},
              controlAffinity: ListTileControlAffinity.trailing,
            ),
            RadioListTile<String>(
              title: const Text(
                '30 hari terakhir',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text('Sel, 25 Mar, 2025 - Rab, 23 Apr, 2025'),
              value: '30 hari terakhir',
              groupValue: '',
              onChanged: (String? value) {},
              controlAffinity: ListTileControlAffinity.trailing,
            ),
            RadioListTile<String>(
              title: const Text(
                '90 hari terakhir',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text('Jum, 24 Jan, 2025 - Rab, 23 Apr, 2025'),
              value: '90 hari terakhir',
              groupValue: '',
              onChanged: (String? value) {},
              controlAffinity: ListTileControlAffinity.trailing,
            ),
            RadioListTile<String>(
              title: const Text(
                'Atur tanggal',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              value: '',
              groupValue: '',
              onChanged: null,
              controlAffinity: ListTileControlAffinity.trailing,
            ),
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 12.0),
                        padding: const EdgeInsets.symmetric(
                          vertical: 12.0,
                          horizontal: 12.0,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          '22 Apr, 2025',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey.shade400,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 30.0),
                        padding: const EdgeInsets.symmetric(
                          vertical: 12.0,
                          horizontal: 12.0,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          '23 Apr, 2025',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey.shade400,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(vertical: 12.0),
                  padding: const EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 16.0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(
                    child: Text(
                      'Pasang Filter',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}

void showLayananPicker(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Filter tipe transaksi',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 5,
                    ),
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    'Hapus',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 16,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.blue,
                      child: Icon(
                        Icons.local_dining,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text('Icon $index', style: const TextStyle(fontSize: 12)),
                  ],
                );
              },
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(vertical: 12.0),
              padding: const EdgeInsets.symmetric(
                vertical: 12.0,
                horizontal: 16.0,
              ),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Text(
                  'Pasang filter',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

void showMetodePicker(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Filter dari metode',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 5,
                    ),
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    'Hapus',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.payment, color: Colors.blue),
                  const SizedBox(width: 10),
                  const Text('GoPay Later'),
                ],
              ),
              trailing: Checkbox(value: false, onChanged: (bool? value) {}),
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.credit_card, color: Colors.green),
                  const SizedBox(width: 10),
                  const Text('Credit Card'),
                ],
              ),
              trailing: Checkbox(value: false, onChanged: (bool? value) {}),
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.account_balance_wallet, color: Colors.orange),
                  const SizedBox(width: 10),
                  const Text('Wallet Transfer'),
                ],
              ),
              trailing: Checkbox(value: false, onChanged: (bool? value) {}),
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(vertical: 12.0),
              padding: const EdgeInsets.symmetric(
                vertical: 12.0,
                horizontal: 16.0,
              ),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Text(
                  'Pasang filter',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

class TransaksiGroup extends StatelessWidget {
  final String tanggal;
  final List<Widget> items;

  const TransaksiGroup({super.key, required this.tanggal, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          tanggal,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        const SizedBox(height: 8),
        Column(children: items),
      ],
    );
  }
}

class TransaksiItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String amount;
  final Color amountColor;
  final IconData icon;
  final Color iconBackgroundColor;

  const TransaksiItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.amountColor,
    required this.icon,
    required this.iconBackgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: iconBackgroundColor,
            ),
            child: Icon(icon, size: 18, color: Colors.blue.shade300),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                amount,
                style: TextStyle(
                  color: amountColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue.shade200,
                    ),
                    child: const Icon(
                      Icons.account_balance_wallet,
                      size: 12,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Text(
                    'GoPay Saldo',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BannerPromosi extends StatelessWidget {
  const BannerPromosi({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset('images/foto1.png', width: 100, fit: BoxFit.contain),
        Spacer(),

        Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 59, 131, 138),
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.only(
            left: 30,
            right: 16,
            top: 12,
            bottom: 12,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Tinggalin kebiasaan boncos',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Dapetin laporan pengeluaran\nlebih lengkap di app GoPay.',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),

              const SizedBox(width: 8),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(8),
                child: Icon(Icons.arrow_forward, color: Colors.green),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class DividerWithText extends StatelessWidget {
  const DividerWithText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 42.0, right: 12.0),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        height: 1,
        color: Colors.grey[350],
      ),
    );
  }
}
