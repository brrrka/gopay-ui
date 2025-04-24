import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        title: const Text(
          'Profilku',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProfileHeader(),
            const Divider(height: 1),

            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                top: 16.0,
                bottom: 8.0,
              ),
              child: Text(
                'Akun',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[700],
                ),
              ),
            ),

            _buildMenuItem(
              icon: Icons.history,
              title: 'Aktivitasku',
              subtitle: 'Cek riwayat & aktivitas aktif',
            ),
            _buildMenuItem(icon: Icons.workspace_premium, title: 'Gojek PLUS'),
            _buildMenuItem(icon: Icons.discount, title: 'Promo'),
            _buildMenuItem(icon: Icons.payment, title: 'Metode Pembayaran'),
            _buildMenuItem(icon: Icons.help, title: 'Pusat bantuan'),
            _buildMenuItem(icon: Icons.business, title: 'Profil bisnis'),
            _buildMenuItem(icon: Icons.language, title: 'Pilihan bahasa'),
            _buildMenuItem(icon: Icons.bookmark, title: 'Alamat favorit'),
            _buildMenuItem(icon: Icons.accessibility, title: 'Aksesibilitas'),
            _buildMenuItem(
              icon: Icons.people,
              title: 'Ajak teman, dapat voucher',
            ),
            _buildMenuItem(icon: Icons.notifications, title: 'Notifikasi'),
            _buildSecurityMenuItem(),
            _buildMenuItem(icon: Icons.settings, title: 'Atur akun'),

            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                top: 16.0,
                bottom: 8.0,
              ),
              child: Text(
                'Info lainnya',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[700],
                ),
              ),
            ),

            _buildMenuItem(icon: Icons.shield, title: 'Kebijakan Privasi'),
            _buildMenuItem(icon: Icons.description, title: 'Ketentuan Layanan'),
            _buildMenuItem(icon: Icons.data_usage, title: 'Atribusi data'),
            _buildRatingMenuItem(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48, 
            height: 48, 
            decoration: const BoxDecoration(
              color: Color(0xFF00880C),
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Text(
                'B',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22, 
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Berka',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  'berkaaldizar8@gmail.com',
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(height: 2),
                Text('+6289517839374', style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 0),
            child: IconButton(
              icon: const Icon(Icons.edit, color: Colors.grey),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    String? subtitle,
  }) {
    return Column(
      children: [
        InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              leading: Icon(
                icon,
                color: Colors.black87,
              ), 
              title: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle:
                  subtitle != null
                      ? Text(
                        subtitle,
                        style: TextStyle(color: Colors.grey[600], fontSize: 12),
                      )
                      : null,
              trailing: const Icon(Icons.chevron_right, color: Colors.grey),
            ),
          ),
        ),
        Divider(
          height: 1,
          color: Colors.grey[300],
        ), 
      ],
    );
  }

  Widget _buildSecurityMenuItem() {
    return Column(
      children: [
        InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              leading: const Icon(
                Icons.security,
                color: Colors.black87,
              ), 
              title: const Text(
                'Keamanan akun',
                style: TextStyle(fontWeight: FontWeight.bold), 
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      'Baru',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.chevron_right, color: Colors.grey),
                ],
              ),
            ),
          ),
        ),
        Divider(height: 1, color: Colors.grey[300]),
      ],
    );
  }

  Widget _buildRatingMenuItem() {
    return Column(
      children: [
        InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              leading: const Icon(
                Icons.star,
                color: Colors.black87,
              ), 
              title: const Text(
                'Beri rating',
                style: TextStyle(fontWeight: FontWeight.bold), 
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'v 5.17.1',
                    style: TextStyle(color: Colors.grey[600], fontSize: 12),
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.chevron_right, color: Colors.grey),
                ],
              ),
            ),
          ),
        ),
        Divider(height: 1, color: Colors.grey[300]), 
      ],
    );
  }
}
