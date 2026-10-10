import 'package:flutter/material.dart';
import 'package:workshop4/models/foodmenu.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  // ฟังก์ชันเปิดหน้าเพิ่มข้อมูล เมื่อกลับมาให้สั่งอัปเดตหน้าจอทันที
  void _navigateToAddForm() async {
    await Navigator.pushNamed(context, '/add');

    // พอกลับมาจากหน้า AddForm ให้สั่ง setState เพื่อวาดรายการใน emp ใหม่
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("รายการอาหาร"),
        backgroundColor: const Color.fromARGB(255, 235, 145, 10),
        centerTitle: true,
      ),
      // เช็กว่า emp ว่างไหม
      body: emp.isEmpty
          ? const Center(
              child: Text(
                "ยังไม่มีรายการอาหาร\nกดปุ่มด้านล่างเพื่อเพิ่มข้อมูล",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: emp.length, // ใช้จำนวนจาก emp
              itemBuilder: (context, index) {
                final food = emp[index]; // ดึงข้อมูล FoodMenu แต่ละรายการ
                return Card(
                  elevation: 3,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: const Color.fromARGB(255, 243, 149, 9),
                      child: Text('${index + 1}'),
                    ),
                    title: Text(
                      food.name, // ดึงจาก food.name
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(food.component), // ดึงจาก food.component
                    trailing: Text(
                      '${food.price} บาท', // ดึงจาก food.price
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _navigateToAddForm,
        backgroundColor: Colors.green,
        icon: const Icon(Icons.add),
        label: const Text("เพิ่มข้อมูล"),
      ),
    );
  }
}