import 'package:flutter/material.dart';

// --- MODEL DATA ---
class ChatItem {
  final String name;
  final String platNomor;
  final String message;
  final String time;
  final String location;
  final String status;
  final Color statusColor;
  final int unreadCount;
  final String? serviceIcon;
  final bool isCompleted;
  final List<Message> messageHistory;

  ChatItem({
    required this.name,
    this.platNomor = 'BA 4461 OM',
    required this.message,
    required this.time,
    required this.location,
    required this.status,
    required this.statusColor,
    this.unreadCount = 0,
    this.serviceIcon,
    this.isCompleted = false,
    required this.messageHistory,
  });
}

enum MessageType { user, driver, systemInfo, systemWarning, dateChip }

class Message {
  final String text;
  final String time;
  final MessageType type;

  Message({required this.text, this.time = "", required this.type});
}

// --- HALAMAN DAFTAR CHAT ---
class Pesan extends StatelessWidget {
  const Pesan({super.key});

  @override
  Widget build(BuildContext context) {
    return const ChatListPage();
  }
}

class ChatListPage extends StatelessWidget {
  const ChatListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ChatItem> chats = [
      ChatItem(
        name: 'Febi Ramadani',
        platNomor: 'BA 4461 OM',
        message: 'Perjalanan selesai!',
        time: '11/06/25',
        location: 'Driver sudah menyelesaikan pesanan',
        status: 'Selesai',
        statusColor: Colors.grey,
        isCompleted: true,
        messageHistory: [
          Message(text: '11 Jun', type: MessageType.dateChip),
          Message(
            text:
                'Driver kamu mungkin lagi nyetir, bisa jadi responnya agak telat.',
            type: MessageType.systemInfo,
          ),
          Message(
            text: 'Titik jemput sesuai aplikasi',
            time: '06:10 PM',
            type: MessageType.user,
          ),
          Message(text: 'Oke 👍', time: '06:10 PM', type: MessageType.user),
          Message(
            text: 'Baik, saya ke sana ya',
            time: '06:10 PM',
            type: MessageType.driver,
          ),
          Message(
            text: 'Mohon ditunggu',
            time: '06:10 PM',
            type: MessageType.driver,
          ),
          Message(
            text: 'Driver kamu sudah sampai di titik jemput.',
            type: MessageType.systemWarning,
          ),
          Message(
            text: 'Perjalanan selesai! Kamu bisa liat riwayat chat.',
            type: MessageType.systemWarning,
          ),
        ],
      ),
      ChatItem(
        name: 'Driver',
        message: 'Terimakasih 🙏...',
        time: '10/06/25',
        unreadCount: 1,
        location: 'McDonald\'s, Padang A.Yani',
        status: 'Aktif',
        statusColor: Colors.green,
        serviceIcon: 'images/gofood.png',
        isCompleted: false,
        messageHistory: [
          Message(text: '10 Jun', type: MessageType.dateChip),
          Message(
            text: 'Baik, saya menuju resto',
            time: '09:30 AM',
            type: MessageType.driver,
          ),
          Message(
            text: 'Terimakasih 🙏...',
            time: '09:32 AM',
            type: MessageType.driver,
          ),
        ],
      ),
      ChatItem(
        name: 'Andi Pratama',
        platNomor: 'BA 1234 XY',
        message: 'Sudah sampai di depan',
        time: '09/06/25',
        location: 'Jl. Sudirman No. 15',
        status: 'Selesai',
        statusColor: Colors.grey,
        isCompleted: true,
        messageHistory: [
          Message(text: '09 Jun', type: MessageType.dateChip),
          Message(
            text: 'Saya dalam perjalanan ke lokasi jemput',
            time: '08:15 AM',
            type: MessageType.driver,
          ),
          Message(
            text: 'Sudah sampai di depan',
            time: '08:25 AM',
            type: MessageType.driver,
          ),
        ],
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          'Chat',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(height: 1, color: Colors.grey[200]),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Pilihan fitur",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      _buildFeatureButton(
                        context,
                        Icons.inbox_outlined,
                        'Inbox',
                        () {},
                      ),
                      const SizedBox(width: 16),
                      _buildFeatureButton(
                        context,
                        Icons.help_outline,
                        'Bantuan',
                        () {
                          try {
                            Navigator.pushNamed(context, '/bantuan');
                          } catch (e) {
                            debugPrint('Navigation error: $e');
                          }
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Divider(thickness: 4, color: Color(0xFFF2F2F2)),
                  const SizedBox(height: 16),
                  const Text(
                    "Chat kamu",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => _buildChatItemTile(context, chats[index]),
              childCount: chats.length,
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.grey.shade200)),
        ),
        child: Row(
          children: [
            Expanded(
              child: _buildNavItem(
                context,
                'images/bottombar/home.png',
                'Home',
                0,
              ),
            ),
            Expanded(
              child: _buildNavItem(
                context,
                'images/bottombar/promos.png',
                'Promo',
                1,
              ),
            ),
            Expanded(
              child: _buildNavItem(
                context,
                'images/bottombar/orders.png',
                'Aktivitas',
                2,
              ),
            ),
            Expanded(
              child: _buildNavItem(
                context,
                'images/bottombar/chat-active.png',
                'Chat',
                3,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureButton(
    BuildContext context,
    IconData icon,
    String label,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.green.shade50,
            ),
            child: Icon(icon, color: Colors.green.shade800, size: 28),
          ),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }

  Widget _buildChatItemTile(BuildContext context, ChatItem chat) {
    return InkWell(
      onTap: () {
        try {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => ChatDetailPage(chat: chat)),
          );
        } catch (e) {
          debugPrint('Navigation error: $e');
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.grey[300],
                  child: const Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 35,
                  ),
                ),
                if (chat.serviceIcon != null)
                  Positioned(
                    bottom: -4,
                    right: -4,
                    child: CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Icon(
                          Icons.restaurant,
                          size: 16,
                          color: Colors.green.shade800,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    chat.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    chat.message,
                    style: const TextStyle(color: Colors.black54),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    chat.location,
                    style: const TextStyle(color: Colors.black54, fontSize: 12),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: chat.statusColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        chat.status,
                        style: TextStyle(
                          color: chat.statusColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  chat.time,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
                if (chat.unreadCount > 0) ...[
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '${chat.unreadCount}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context,
    String icon,
    String label,
    int index,
  ) {
    bool isSelected = index == 3; // Chat page is index 3
    return InkWell(
      onTap: () {
        if (index == 0) {
          Navigator.pushReplacementNamed(context, '/');
        } else if (index == 1) {
          Navigator.pushNamed(context, '/promo');
        } else if (index == 2) {
          // Navigate to Activities (implement later)
        } else if (index == 3) {
          // Already on chat page
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              height: 4,
              color: isSelected ? const Color(0xFF00880C) : Colors.transparent,
            ),
            const SizedBox(height: 8),
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
}

class ChatDetailPage extends StatefulWidget {
  final ChatItem chat;
  const ChatDetailPage({super.key, required this.chat});

  @override
  State<ChatDetailPage> createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  final TextEditingController _controller = TextEditingController();
  late List<Message> _messages;

  @override
  void initState() {
    super.initState();
    _messages = List.from(widget.chat.messageHistory);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _sendMessage() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    setState(() {
      _messages.add(Message(text: text, time: "Now", type: MessageType.user));
    });
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey[300],
              child: const Icon(Icons.person, color: Colors.white),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.chat.name,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    widget.chat.platNomor,
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.call_outlined, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return _buildMessageBubble(_messages[index]);
              },
            ),
          ),
          widget.chat.isCompleted
              ? _buildCompletedChatFooter()
              : _buildChatInput(),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(Message msg) {
    switch (msg.type) {
      case MessageType.user:
        return _buildUserMessage(msg);
      case MessageType.driver:
        return _buildDriverMessage(msg);
      case MessageType.systemInfo:
      case MessageType.systemWarning:
        return _buildSystemMessage(msg);
      case MessageType.dateChip:
        return _buildDateChip(msg);
    }
  }

  Widget _buildUserMessage(Message msg) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.only(bottom: 8, left: 50),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: const Color(0xFFDCF8C6),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Flexible(child: Text(msg.text)),
            if (msg.time.isNotEmpty) ...[
              const SizedBox(width: 8),
              Text(
                msg.time,
                style: const TextStyle(fontSize: 10, color: Colors.grey),
              ),
              const SizedBox(width: 4),
              const Icon(Icons.done_all, size: 14, color: Colors.blueAccent),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildDriverMessage(Message msg) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 8, right: 50),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Flexible(child: Text(msg.text)),
            if (msg.time.isNotEmpty) ...[
              const SizedBox(width: 8),
              Text(
                msg.time,
                style: const TextStyle(fontSize: 10, color: Colors.grey),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildSystemMessage(Message msg) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(
            msg.type == MessageType.systemWarning
                ? Icons.warning_amber_rounded
                : Icons.info_outline,
            size: 20,
            color: Colors.black54,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              msg.text,
              style: const TextStyle(color: Colors.black54),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateChip(Message msg) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 12),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: const Color(0xFFE1E1E1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          msg.text,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildChatInput() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey.shade200)),
      ),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  hintText: 'Ketik pesan...',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.send, color: Color(0xFF00880C)),
              onPressed: _sendMessage,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCompletedChatFooter() {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: SafeArea(
        child: Text(
          "Chat udah selesai. Kamu masih bisa baca percakapan ini buat beberapa jam ke depan.",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey[600]),
        ),
      ),
    );
  }
}
