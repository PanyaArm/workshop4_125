import 'package:flutter/material.dart';
import 'package:workshop4/models/foodmenu.dart';

class AddForm extends StatefulWidget {
  const AddForm({Key? key}) : super(key: key);

  @override
  State<AddForm> createState() => _AddFormState();
}

class _AddFormState extends State<AddForm> {
  final _formKey = GlobalKey<FormState>();

  String _name = '';
  String _component = '';
  int _price = 0;

  // กำหนดค่าเริ่มต้นสำหรับ Dropdown (อ้างอิงตาม Model)
  FoodType _selectedType = FoodType.values.first;
  Foodpic _selectedPic = Foodpic.values.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('เพิ่มข้อมูล'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                // ชื่ออาหาร
                TextFormField(
                  decoration: const InputDecoration(labelText: 'ชื่ออาหาร'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณากรอกชื่ออาหาร';
                    }
                    return null;
                  },
                  onSaved: (value) => _name = value!,
                ),
                const SizedBox(height: 10),

                // ชนิดอาหาร
                DropdownButtonFormField<FoodType>(
                  value: _selectedType,
                  decoration: const InputDecoration(labelText: 'ชนิดอาหาร'),
                  items: FoodType.values.map((type) {
                    return DropdownMenuItem(
                      value: type,
                      child: Text(type.ty),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedType = value!;
                    });
                  },
                ),
                const SizedBox(height: 10),

                // เลือกรูปภาพ
                DropdownButtonFormField<Foodpic>(
                  value: _selectedPic,
                  decoration: const InputDecoration(labelText: 'เลือกรูปภาพ'),
                  items: Foodpic.values.map((pic) {
                    return DropdownMenuItem(
                      value: pic,
                      child: Row(
                        children: [
                          Text(pic.namefood),
                          const SizedBox(width: 10),
                          Image.asset(
                            pic.image,
                            width: 30,
                            height: 30,
                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(Icons.fastfood, size: 20),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedPic = value!;
                    });
                  },
                ),
                const SizedBox(height: 10),

                // ส่วนประกอบสำคัญ
                TextFormField(
                  decoration: const InputDecoration(labelText: 'ส่วนประกอบสำคัญ'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณากรอกส่วนประกอบ';
                    }
                    return null;
                  },
                  onSaved: (value) => _component = value!,
                ),
                const SizedBox(height: 10),

                // ราคา
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'ราคา',
                    suffixText: 'บาท',
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณากรอกราคา';
                    }
                    if (int.tryParse(value) == null) {
                      return 'กรุณากรอกเป็นตัวเลข';
                    }
                    return null;
                  },
                  onSaved: (value) => _price = int.parse(value!),
                ),
                const SizedBox(height: 25),

                // ปุ่มบันทึก
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();

                        // 1. เพิ่มข้อมูลเข้า menuList หลัก
                        menuList.add(
                          FoodMenu(
                            name: _name,
                            type: _selectedType,
                            component: _component,
                            price: _price,
                            foodpic: _selectedPic,
                          ),
                        );

                        // 2. แสดงแจ้งเตือนแถบเขียวด้านล่าง
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('บันทึกสำเร็จ! $_name'),
                            backgroundColor: Colors.green,
                          ),
                        );

                        // 3. ปิดหน้าฟอร์มเพื่อกลับไปหน้ารายการ
                        Navigator.pop(context);
                      }
                    },
                    child: const Text('บันทึก', style: TextStyle(color: Colors.white)),
                  ),
                ),
                const SizedBox(height: 10),

                // ปุ่มรีเซ็ต
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: OutlinedButton(
                    onPressed: () {
                      _formKey.currentState!.reset();
                    },
                    child: const Text('รีเซ็ต'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}