import 'package:flutter/material.dart';
import 'package:workshop4/models/foodmenu.dart';
import 'package:workshop4/screen/addform.dart';

class Item extends StatefulWidget {
  const Item({Key? key}) : super(key: key);

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('รายการอาหาร'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () async {
              // รอให้หน้าเพิ่มข้อมูลทำงานเสร็จ แล้วสั่งรีเฟรชหน้าจอ
              await Navigator.pushNamed(context, '/add');
              setState(() {});
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // 1. ส่วนแสดงรายการอาหาร
          Expanded(
            child: ListView.builder(
              itemCount: menuList.length,
              itemBuilder: (context, index) {
                FoodMenu food = menuList[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  child: ListTile(
                    leading: Image.asset(
                      food.foodpic.image,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.fastfood, size: 40);
                      },
                    ),
                    title: Text(food.name),
                    subtitle: Text('${food.type.ty} - ${food.component}'),
                    trailing: Text(
                      '${food.price} ฿',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // 2. ปุ่ม + สีเหลืองด้านล่าง
          SizedBox(
            width: 100,
            height: 100,
            child: IconButton(
              icon: const Icon(
                Icons.add,
                size: 40,
                color: Colors.amber,
              ),
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddForm(),
                  ),
                );
                setState(() {});
              },
            ),
          ),
        ],
      ),
    );
  }
}