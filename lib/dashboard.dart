import 'dart:async';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class ServiceModel {
  final String name;
  final Color color;
  final String iconPath;

  ServiceModel({
    required this.name,
    required this.color,
    required this.iconPath,
  });
}

class _DashboardState extends State<Dashboard> {
  final List<String> makananList = [
    'Nasi Goreng',
    'Mie Ayam',
    'Sate Padang',
    'Rendang',
    'Ayam Geprek',
  ];

  final List<ServiceModel> services = [
    ServiceModel(
      name: 'GoRide',
      color: const Color(0xFF00AA13),
      iconPath: 'images/goride.png',
    ),
    ServiceModel(
      name: 'GoCar',
      color: const Color(0xFF00AA13),
      iconPath: 'images/gocar.png',
    ),
    ServiceModel(
      name: 'GoFood',
      color: const Color(0xFFEE2737),
      iconPath: 'images/gofood.png',
    ),
    ServiceModel(
      name: 'GoSend',
      color: const Color(0xFF00AA13),
      iconPath: 'images/gosend.png',
    ),
    ServiceModel(
      name: 'GoMart',
      color: const Color(0xFFED2739),
      iconPath: 'images/gomart.png',
    ),
    ServiceModel(
      name: 'GoTagihan',
      color: const Color(0xFF0081A0),
      iconPath: 'images/gotagihan.png',
    ),
    ServiceModel(
      name: 'GoTix',
      color: const Color(0xFFFF0066),
      iconPath: 'images/gotix.png',
    ),
  ];

  int _currentIndex = 0;
  Timer? _timer;

  // Controller untuk scroll
  final ScrollController _scrollController = ScrollController();
  bool _isScrolled = false;

  @override
  void initState() {
    super.initState();
    _startHintChanger();

    // Tambahkan listener untuk scroll
    _scrollController.addListener(_scrollListener);
  }

  // Listener untuk mendeteksi scroll
  void _scrollListener() {
    if (_scrollController.offset > 10 && !_isScrolled) {
      setState(() {
        _isScrolled = true;
      });
    } else if (_scrollController.offset <= 10 && _isScrolled) {
      setState(() {
        _isScrolled = false;
      });
    }
  }

  void _startHintChanger() {
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % makananList.length;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GoPay UI',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            // Body content
            CustomScrollView(
              controller: _scrollController,
              slivers: [
                SliverPadding(
                  padding: EdgeInsets.only(top: 85),
                  sliver: SliverToBoxAdapter(
                    child: Column(
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 220,
                              child: Image.asset(
                                'images/jumbotron.png',
                                fit: BoxFit.cover,
                              ),
                            ),

                            Positioned(
                              left: 20,
                              right: 20,
                              bottom: -60,
                              child: _buildGopayContainer(),
                            ),
                          ],
                        ),

                        // Content area
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 20,
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 60),

                              Wrap(
                                spacing: 4,
                                runSpacing: 16,
                                children: [
                                  ...services.map((service) {
                                    return SizedBox(
                                      width: 80,
                                      child: ServiceItem(service: service),
                                    );
                                  }).toList(),
                                  SizedBox(
                                    width: 80,
                                    child: Column(
                                      children: [
                                        Container(
                                          width: 60,
                                          height: 60,
                                          decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            borderRadius: BorderRadius.circular(
                                              15,
                                            ),
                                          ),
                                          child: const Icon(
                                            Icons.more_horiz,
                                            color: Colors.grey,
                                            size: 30,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        const Text(
                                          'Lainnya',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(height: 20),

                              // GoPay Plus
                              Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 15,
                                ),
                                decoration: BoxDecoration(
                                  color: Color(0xFF00880C),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        Icons.add,
                                        color: Color(0xFF00880C),
                                        size: 20,
                                        weight: 1000,
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Expanded(
                                      child: Text(
                                        'Diskon s.d. 10rb/transaksi. Yuk, langganan',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Container(
                                      height: 20,
                                      width: 20,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        shape: BoxShape.circle,
                                      ),
                                      child: FaIcon(
                                        FontAwesomeIcons.arrowRight,
                                        size: 14,
                                        color: Color(0xFF00880C),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              const SizedBox(height: 20),

                              // Promo Card
                              _buildPromoCard(
                                'images/promo1.png',
                                'Gopay Pinjam',
                                'Cicilan mulai dari 0.06%/hari! Segera aktifkan dan rasakan kemudahannya',
                              ),

                              SizedBox(height: 20),

                              _buildPromoCard(
                                'images/promo2.jpg',
                                'Cobain Kirim Barang Besar, Diskon s.d. Rp100.000! ✅',
                                'Khusus Buat kamu, GoBox kasih kamu diskon s.d. Rp100.000 yang bisa kamu pakai untuk kirim barang besar, pindahan, beli peralatan furniture, hingga angkut motor untuk di service.',
                              ),

                              SizedBox(height: 20),

                              _buildPromoCard(
                                'images/promo3.jpg',
                                'Bepergian ke Mana pun, Lebih Hemat Naik GoCar/GoRide 🚗',
                                'Lagi mau bepergian? Mending pake GoCar/GoRide aja karena udah pasti aman dan nyaman. Selain itu bayarnya lebih hemat karena ada voucher diskon senilai total Rp50.000 pakai GoPay',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // Sticky Header
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                height: 90,
                decoration: BoxDecoration(
                  color: _isScrolled ? Colors.white : const Color(0xFF03AA15),
                  boxShadow:
                      _isScrolled
                          ? [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            ),
                          ]
                          : [],
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: SafeArea(
                  bottom: false,
                  child: Row(
                    children: [
                      Expanded(
                        child: Stack(
                          alignment: Alignment.centerLeft,
                          children: [
                            Container(
                              height: 100,
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 12),
                              child: Icon(
                                Icons.search,
                                size: 30,
                                color: Colors.grey[600],
                              ),
                            ),
                            Positioned(
                              left: 60,
                              child: Text(
                                makananList[_currentIndex],
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.grey, width: 0.5),
                        ),
                        child: const CircleAvatar(
                          radius: 24,
                          backgroundColor: Colors.white,
                          child: Icon(Icons.person, color: Color(0xFF00880C)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            border: Border(top: BorderSide(color: Colors.grey.shade200)),
          ),
          child: Container(
            child: Row(
              children: [
                Expanded(
                  child: _buildNavItem('images/bottombar/home.png', 'Home', 0),
                ),
                Expanded(
                  child: _buildNavItem(
                    'images/bottombar/promos.png',
                    'Promo',
                    1,
                  ),
                ),
                Expanded(
                  child: _buildNavItem(
                    'images/bottombar/orders.png',
                    'Aktivitas',
                    2,
                  ),
                ),
                Expanded(
                  child: _buildNavItem('images/bottombar/chat.png', 'Chat', 3),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGopayContainer() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey, width: 0.1),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Row(
          children: [
            Container(
              height: 30,
              width: 30,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                shape: BoxShape.circle,
              ),
              child: Image.asset('images/wallet.png', fit: BoxFit.contain),
            ),
            const SizedBox(width: 15),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Rp150.703',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
                Text(
                  '0 Coins',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
            const Spacer(),
            Column(
              children: [
                Container(
                  height: 23,
                  width: 23,
                  decoration: BoxDecoration(
                    color: const Color(0xFF09B0D6),
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: Color(0xFF09B0D6), width: 0.5),
                  ),
                  child: const Icon(
                    Icons.arrow_upward_rounded,
                    color: Colors.white,
                    weight: 1000,
                    size: 20,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Bayar',
                  style: TextStyle(color: Colors.black, fontSize: 12),
                ),
              ],
            ),

            SizedBox(width: 20),

            Column(
              children: [
                Container(
                  height: 23,
                  width: 23,
                  decoration: BoxDecoration(
                    color: const Color(0xFF09B0D6),
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: Color(0xFF09B0D6), width: 0.5),
                  ),
                  child: const Icon(
                    Icons.add_rounded,
                    color: Colors.white,
                    weight: 2000,
                    size: 20,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Top Up',
                  style: TextStyle(color: Colors.black, fontSize: 12),
                ),
              ],
            ),

            SizedBox(width: 20),

            Column(
              children: [
                Container(
                  height: 23,
                  width: 23,
                  decoration: BoxDecoration(
                    color: const Color(0xFF09B0D6),
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(color: Color(0xFF09B0D6), width: 0.5),
                  ),
                  child: const Icon(
                    Icons.more_horiz_rounded,
                    color: Colors.white,
                    weight: 2000,
                    size: 20,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Lainnya',
                  style: TextStyle(color: Colors.black, fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildPromoCard(String images, String title, String subtitle) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: Colors.grey, width: 0.5),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 2,
          blurRadius: 5,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    clipBehavior: Clip.antiAlias,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Gambar tanpa padding apapun
        Container(
          width: double.infinity,
          child: Image.asset(images, fit: BoxFit.fitWidth),
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                subtitle,
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _buildNavItem(String icon, String label, int index) {
  bool isSelected = index == 0;
  return InkWell(
    onTap: () {},
    child: Padding(
      padding: EdgeInsets.only(bottom: 5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            height: 4,
            color: isSelected ? const Color(0xFF00880C) : Colors.transparent,
          ),
          SizedBox(height: 8),
          Image.asset(icon, width: 20, height: 20),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: isSelected ? const Color(0xFF00880C) : Colors.grey,
            ),
          ),
        ],
      ),
    ),
  );
}

class ServiceItem extends StatelessWidget {
  final ServiceModel service;

  const ServiceItem({required this.service});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: service.color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Image.asset(service.iconPath, width: 30, height: 30)],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          service.name,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
