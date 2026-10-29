
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/mata_kuliah.dart';

class BerandaScreen extends StatelessWidget {
  const BerandaScreen({super.key});

  static const List<MataKuliah> _jadwal = [
    MataKuliah(
      kode: 'IF-024',
      nama: 'Pemrograman Mobile II',
      sks: 3,
      hari: 'Senin',
    ),
    MataKuliah(
      kode: 'IF-021',
      nama: 'Basis Data',
      sks: 3,
      hari: 'Selasa',
    ),
    MataKuliah(
      kode: 'IF-022',
      nama: 'Pemrograman Web',
      sks: 3,
      hari: 'Rabu',
    ),
    MataKuliah(
      kode: 'IF-023',
      nama: 'Analisis dan Desain Sistem',
      sks: 3,
      hari: 'Kamis',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final tanggalHariIni = DateFormat(
      'EEEE, d MMMM y',
      'id_ID',
    ).format(DateTime.now());

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'KampusKu',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF1565C0),
        foregroundColor: Colors.white,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.notifications_outlined),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            tanggalHariIni,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFF1565C0),
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Selamat Datang!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Kelola kegiatan kuliahmu dengan mudah.',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Menu Utama',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _MenuCard(
                  icon: Icons.calendar_month,
                  title: 'Jadwal',
                  color: Colors.blue,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _MenuCard(
                  icon: Icons.assignment,
                  title: 'Tugas',
                  color: Colors.orange,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _MenuCard(
                  icon: Icons.info_outline,
                  title: 'Informasi',
                  color: Colors.green,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            'Jadwal Mata Kuliah',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 12),
          for (final mk in _jadwal)
            Card(
              margin: const EdgeInsets.only(bottom: 10),
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Color(0xFFE3F2FD),
                  child: Icon(
                    Icons.school,
                    color: Color(0xFF1565C0),
                  ),
                ),
                title: Text(
                  mk.nama,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text('${mk.kode} • ${mk.hari} • ${mk.sks} SKS'),
              ),
            ),
        ],
      ),
    );
  }
}

class _MenuCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;

  const _MenuCard({
    required this.icon,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 18,
          horizontal: 4,
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 30),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
