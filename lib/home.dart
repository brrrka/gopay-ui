import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  createState() => _GoPayHomePageState();
}

class _GoPayHomePageState extends State<Home> {
  bool showMore = false;
  bool isMinimized = false;
  int _currentIndex = 0;

  final List<Map<String, String>> brandItems = [
    {"image": "images/alfamart.jpg", "title": "Alfamart", "tag": "38% off"},
    {"image": "images/mrt.jpg", "title": "MRT", "tag": "Gratis*"},
    {"image": "images/indomaret.jpg", "title": "Indomaret", "tag": "20% off"},
    {"image": "images/mcdonals.jpg", "title": "McDonald's", "tag": "10% off"},
  ];

  final PageController _pageController = PageController(
    viewportFraction: 1,
    initialPage: 0,
  );
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Color(0xFF00AEEF),
            expandedHeight: 220,
            pinned: true,
            title: Text("GoPay", style: TextStyle(color: Colors.white)),
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.only(left: 16, bottom: 16),
              background: Stack(
                children: [
                  AnimatedOpacity(
                    opacity: isMinimized ? 0.0 : 1.0,
                    duration: Duration(milliseconds: 300),
                    child: Container(
                      padding: const EdgeInsets.only(
                        top: 80.0,
                        left: 16,
                        right: 16,
                        bottom: 16,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "GRATIS GoPay Coins buat kamu 🥳",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Check-in setiap hari di A+ Rewards aplikasi Gopay dan klaim GRATIS hingga 1.400 GoPay Coins!",
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          SizedBox(height: 8),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.blue,
                              shape: StadiumBorder(),
                              padding: EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 8,
                              ),
                            ),
                            child: Text("Check In"),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 40,
                    right: 16,
                    child: GestureDetector(
                      onTap: () {
                        // Mengubah tombol X menjadi tombol profil yang redirect ke halaman profile
                        Navigator.pushNamed(context, '/profile');
                      },
                      child: Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.3),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            'B',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 16)),
          SliverToBoxAdapter(child: _buildGopayContainer()),
          SliverToBoxAdapter(child: SizedBox(height: 16)),
          SliverToBoxAdapter(child: _buildBrandSlider()),
          SliverToBoxAdapter(child: SizedBox(height: 16)),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: _buildCashbackBanner(),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 40)),
        ],
      ),
    );
  }

  Widget _buildBrandSlider() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset('images/gopay.jpg', width: 18, height: 18),
                  SizedBox(width: 4),
                  Text("gopay", style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(height: 6),
              Text(
                "Brand Pilihanmu",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        SizedBox(
          height: 140,
          child: Padding(
            padding: EdgeInsets.only(left: 16),
            child: PageView.builder(
              controller: _pageController,
              itemCount: brandItems.length,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                final item = brandItems[index];
                return Container(
                  margin: EdgeInsets.only(right: 8),
                  child: _brandCard(item),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _brandCard(Map<String, String> item) {
    return Container(
      width: 140,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      padding: EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (item["tag"] != null)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                item["tag"]!,
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
            ),
          SizedBox(height: 8),
          Expanded(child: Image.asset(item["image"]!, fit: BoxFit.contain)),
          SizedBox(height: 4),
          Text(
            item["title"]!,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildCashbackBanner() {
    final List<String> cashbackImages = [
      "images/cashback1.jpg",
      "images/cashback2.jpg",
      "images/cashback3.jpg",
      "images/cashback4.jpg",
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Cashback nggak habis habis? 💸",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 4),
        Text(
          "Bisa dong! Dapetin cashback-nya di mana-mana pakai GoPay. Cek sekarang!",
        ),
        SizedBox(height: 10),
        SizedBox(
          height: 130,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: cashbackImages.length,
            separatorBuilder: (context, index) => SizedBox(width: 10),
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  cashbackImages[index],
                  width: 240,
                  height: 130,
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildGopayContainer() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Membuat 'Your balance' diklik untuk redirect ke halaman riwayat
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/riwayat');
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Your balance',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Rp65',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                ElevatedButton.icon(
                  // Membuat tombol 'Top up' dapat diklik untuk redirect ke halaman topup
                  onPressed: () {
                    Navigator.pushNamed(context, '/topup');
                  },
                  icon: Icon(Icons.add, size: 16),
                  label: Text('Top up'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    elevation: 1,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Colors.grey.shade300),
                    ),
                    textStyle: TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _featureBox(
                    Icons.account_balance,
                    'Pinjam',
                    'Aktifin sekarang',
                    Colors.green,
                  ),
                  SizedBox(width: 10),
                  _featureBox(
                    Icons.monetization_on_outlined,
                    'Coins',
                    '0',
                    Colors.black,
                  ),
                  SizedBox(width: 10),
                  _featureBox(
                    Icons.payment,
                    'PayLater',
                    'Aktifin sekarang',
                    Colors.green,
                  ),
                ],
              ),
            ),
          ),
          Divider(thickness: 0.5, height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // Membuat 'Pay' dapat diklik untuk redirect ke halaman qris
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/qris');
                      },
                      child: _iconColumn(Icons.arrow_upward_rounded, 'Pay'),
                    ),
                    // Membuat 'Top up' lingkaran dapat diklik untuk redirect ke halaman topup
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/topup');
                      },
                      child: _iconColumn(Icons.add_rounded, 'Top up'),
                    ),
                    _iconColumn(Icons.request_page, 'Request'),
                    _iconColumn(Icons.savings, 'Tabungan'),
                  ],
                ),
                if (showMore) ...[
                  SizedBox(height: 20),
                  GridView.count(
                    crossAxisCount: 4,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    childAspectRatio: 1,
                    padding: EdgeInsets.zero,
                    children: [
                      _iconColumn(Icons.account_balance, 'Bank transfer'),
                      _iconColumn(Icons.security, 'Jago'),
                      _iconColumn(Icons.payment, 'PayLater'),
                      _iconColumn(Icons.attach_money, 'Pinjam'),
                      _iconColumn(Icons.history, 'History'),
                      _iconColumn(Icons.help_outline, 'Help'),
                      _iconColumn(Icons.settings, 'Settings'),
                      _iconColumn(Icons.gavel, 'Pinjam BPKB'),
                      _iconColumn(Icons.money_off, 'Cash Out'),
                      _iconColumn(Icons.card_giftcard, 'Gift'),
                      _iconColumn(Icons.add_circle, 'Plus'),
                      _iconColumn(Icons.receipt, 'GoTagihan'),
                      _iconColumn(Icons.star, 'Coins'),
                      _iconColumn(Icons.local_offer, 'Promos'),
                      _iconColumn(Icons.local_parking, 'Parking'),
                      _iconColumn(Icons.receipt_long, 'Expense'),
                      _iconColumn(Icons.savings, 'Simpanan'),
                      _iconColumn(Icons.emoji_events, 'A+ Rewards'),
                      _iconColumn(Icons.health_and_safety, 'Asuransi'),
                    ],
                  ),
                ],
                SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    setState(() {
                      showMore = !showMore;
                    });
                  },
                  child: Text(
                    showMore ? 'See less' : 'See more',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _iconColumn(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, size: 20, color: Colors.blue),
        ),
        SizedBox(height: 6),
        Text(
          label,
          style: TextStyle(fontSize: 12),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _featureBox(
    IconData icon,
    String title,
    String value,
    Color valueColor,
  ) {
    return Container(
      padding: EdgeInsets.all(12),
      width: 140,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.blue, size: 20),
          SizedBox(height: 4),
          Text(title, style: TextStyle(fontSize: 12, color: Colors.grey)),
          SizedBox(height: 2),
          Text(
            value,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: valueColor,
            ),
          ),
        ],
      ),
    );
  }
}
