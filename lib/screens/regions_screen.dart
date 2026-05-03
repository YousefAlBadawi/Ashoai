import 'dart:ui';
import 'package:flutter/material.dart';
import 'sub_regions_screen.dart';
import 'background_painter.dart'; // استدعاء ملف الخلفية

class RegionsScreen extends StatelessWidget {
  const RegionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // طبقة الخلفية
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF0D001A), Color(0xFF1A0033)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: CustomPaint(painter: GlowyBackgroundPainter()),
            ),
          ),
          
          // طبقة الواجهة
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      IconButton(onPressed: (){ Navigator.pop(context); }, icon: const Icon(Icons.arrow_back, color: Colors.white)),
                      const SizedBox(width: 10),
                      const Text('اختر المنطقة', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      children: [
                        _buildRegionCard(context, 'باسوس', Icons.location_city, true),
                        _buildRegionCard(context, 'قريباً', Icons.lock_outline, false),
                        _buildRegionCard(context, 'قريباً', Icons.lock_outline, false),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRegionCard(BuildContext context, String name, IconData icon, bool isActive) {
    return GestureDetector(
      onTap: isActive
          ? () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SubRegionsScreen(regionName: 'باسوس')));
            }
          : null,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            decoration: BoxDecoration(
              color: isActive ? Colors.white.withOpacity(0.1) : Colors.white.withOpacity(0.02),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: isActive ? Colors.white.withOpacity(0.2) : Colors.white.withOpacity(0.05)),
              boxShadow: isActive
                  ? [BoxShadow(color: const Color(0xFF7B2FBE).withOpacity(0.2), blurRadius: 15, offset: const Offset(0, 5))]
                  : [],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: isActive ? const Color(0xFFD8B4FE) : Colors.white24, size: 40),
                const SizedBox(height: 15),
                Text(name, style: TextStyle(color: isActive ? Colors.white : Colors.white24, fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}