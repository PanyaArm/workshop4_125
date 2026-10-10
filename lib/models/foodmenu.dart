// ignore: unused_import
import 'package:flutter/material.dart';

// 1. ประกาศ enum สำหรับชนิดอาหาร (ที่ item.dart เรียกใช้)
enum FoodType {
  ttype1(ty: "ต้ม"),
  ttype2(ty: "สุขภาพ"),
  ttype3(ty: "ทอด/ย่าง"),
  ttype4(ty: "อบ"),
  ttype5(ty: "ฟาสต์ฟู๊ด");

  const FoodType({required this.ty});
  final String ty;
}

enum Foodpic {
  menu1(namefood: "สุกี้", image: "assets/images/1.png"),
  menu2(namefood: "สลัดรวม", image: "assets/images/2.png"),
  menu3(namefood: "สเต็กหมู", image: "assets/images/3.png"),
  menu4(namefood: "สเต็กเนื้อ", image: "assets/images/4.png"),
  menu5(namefood: "แฮมเบอร์เกอร์", image: "assets/images/5.png"),
  menu6(namefood: "พิซซ่า", image: "assets/images/6.png"),
  menu7(namefood: "ก๋วยเตี๋ยว", image: "assets/images/7.png");

  const Foodpic({required this.image, required this.namefood});
  final String image;
  final String namefood; // เพิ่มตัวแปรนี้
}

// 3. Class ข้อมูลอาหาร
class FoodMenu {
  String name;
  FoodType type;
  String component;
  int price;
  Foodpic foodpic;

  FoodMenu({
    required this.name,
    required this.type,
    required this.component,
    required this.price,
    required this.foodpic,
  });
}

// 4. ลิสต์รายการอาหารเริ่มต้น
List<FoodMenu> menuList = [
  FoodMenu(
    name: "สุกี้ผักรวม",
    type: FoodType.ttype1,
    component: "ไข่ไก่, เกี๊ยวกุ้ง, ปูอัด, เบคอน, ผักสด",
    price: 299,
    foodpic: Foodpic.menu1,
  ),
  FoodMenu(
    name: "สลัดผัก",
    type: FoodType.ttype2,
    component: "แครอท, มะเขือเทศ, ผักรวม",
    price: 159,
    foodpic: Foodpic.menu2,
  ),
  FoodMenu(
    name: "สเต๊กหมู",
    type: FoodType.ttype3,
    component: "เนื้อหมูหมัก, เฟรนช์ฟรายส์, สลัด",
    price: 189,
    foodpic: Foodpic.menu3,
  ),
  FoodMenu(
    name: "ก๋วยเตี๋ยวต้มยำ",
    type: FoodType.ttype1,
    component: "เส้น, เครื่องต้มยำ, ต้นหอม",
    price: 120,
    foodpic: Foodpic.menu7,
  ),
  FoodMenu(
    name: "สเต็กเนื้อวากิว",
    type: FoodType.ttype3,
    component: "เนื้อวัว, ไข่ดาว, ของทานเล่น",
    price: 250,
    foodpic: Foodpic.menu4,
  ),
  FoodMenu(
    name: "พิซซ่า",
    type: FoodType.ttype4,
    component: "แป้ง, ไส้กรอก/แฮม, ชีส",
    price: 95,
    foodpic: Foodpic.menu6,
  ),
  FoodMenu(
    name: "แฮมเบอร์เกอร์",
    type: FoodType.ttype5,
    component: "ขนมปัง, เนื้อสัตว์, ผักสด",
    price: 189,
    foodpic: Foodpic.menu5,
  ),
];
List<FoodMenu> emp = [];