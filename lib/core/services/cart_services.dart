// import 'package:flutter_templete/core/data/models/apis/meal_model.dart';
// import 'package:flutter_templete/core/data/models/cart_model.dart';
// import 'package:flutter_templete/ui/shared/utils.dart';
// import 'package:get/get.dart';

// class CartService {
//   List<CartModel> cartList = storage.getCartList();
//   RxInt cartCount=0.obs;
//   CartService(){
//     getCartCount();
//   }
//   void addToCart({
//     required MealModel model,
//     required int count,
//     //كل كبسة واحد
//     Function? afterAdd,
//     //بعد مايضيف شو بدي ياه يعمل
//   }) {
//     double mealTotal = calcMealTotal(
//       count: count,
//       model: model,
//     );
//     if (getCartModel(model) != null) {
//       //موجود
//       int index = getIndex(getCartModel(model)!);
//       //جبت اندكس
//       //اسند لمتحول اذا اكتر من مرة منشان التعديل وهالقصص
//       cartList[index].count = cartList[index].count! + count;
//       cartList[index].total = cartList[index].total! + mealTotal;
//     } else {
//       cartList.add(CartModel(
//         count: count,
//         total: mealTotal,
//         meal: model,
//       ));
//     }

//     storage.setCartList(cartList);
//     if (afterAdd != null) afterAdd();
//     // Get.to(CartView());
//   }

//   void removeFromCartList(CartModel model) {
//     cartList.remove(model);
//     storage.setCartList(cartList);
//   }

// //حساب القيمة
//   double calcMealTotal({
//     required MealModel model,
//     required int count,
//   }) {
//     return (model.price! * count).toDouble();
//   }

//   CartModel? getCartModel(MealModel model) {
//     //اذا عندي الاوبجيكت كامل بتحل الوضع موجودة والاندكس
//     //ممكن ما يكون موجود
//     //يطلب شي ما موجود اساسا
//     try {
//       return cartList.firstWhere((element) => element.meal!.id == model.id);
//     } catch (e) {
//       //بتعمل اكسبشن بدونا
//       return null;
//     }
//     //اور يليس لاتقبل نل
//   }

// //كاونت كل الميل
//   int getCartCount() {
//     //قيمة ابتدائية
//     return cartList.fold(
//         0, (previousValue, element) => previousValue + element.count!);
//   }



class CartService {
  // RxList<CartModel> cartList = storage.getCartList().obs;

  // RxInt cartCount = 0.obs;
  // //؟

  // RxDouble subTotal = 0.0.obs;
  // RxDouble tax = 0.0.obs;
  // RxDouble deliverFees = 0.0.obs;
  // RxDouble total = 0.0.obs;

  // CartService() {
  //   getCartCount();
  //   calcCartTotal();
  // }

  // void addToCart({
  //   required MealModel model,
  //   required int count,
  //   Function? afterAdd,
  // }) {
  //   double mealTotal = calcMealTotal(count: count, model: model);
  //   if (getCartModel(model) != null) {
  //     int index = getIndex(getCartModel(model)!);
  //     cartList[index].count = cartList[index].count! + count;
  //     cartList[index].total = cartList[index].total! + mealTotal;
  //   } else {
  //     cartList.add(CartModel(
  //       count: count,
  //       total: mealTotal,
  //       meal: model,
  //     ));
  //   }
  //   storage.setCartList(cartList);
  //   cartCount.value += count;
  //   if (afterAdd != null) afterAdd();

  //   calcCartTotal();
  // }

  // void removeFromCartList(CartModel model) {
  //   cartList.remove(model);
  //   cartCount.value -= model.count!;

  //   storage.setCartList(cartList);

  //   calcCartTotal();
  // }

  // void changeCount(
  //     {required bool incress,
  //     required CartModel model,
  //     Function? afterChange}) {
  //   CartModel? result = getCartModel(model.meal!);

  //   int index = getIndex(result!);

  //   if (incress) {
  //     result.count = result.count! + 1;
  //     result.total = result.total! + model.meal!.price!.toDouble();
  //     cartCount.value += 1;
  //     calcCartTotal();
  //   } else {
  //     if (result.count! > 1) {
  //       result.count = result.count! - 1;
  //       result.total = result.total! - model.meal!.price!.toDouble();
  //       cartCount.value -= 1;
  //       calcCartTotal();
  //     }
  //   }

  //   cartList.remove(result);
  //   cartList.insert(index, result);

  //   storage.setCartList(cartList);
  //   if (afterChange != null) afterChange();
  // }

  // void clearCart() {
  //   cartList.clear();
  //   cartCount.value = getCartCount();
  //   calcCartTotal();

  //   storage.setCartList(cartList);
  // }

  // double calcMealTotal({required MealModel model, required int count}) {
  //   return (model.price! * count).toDouble();
  // }

  // CartModel? getCartModel(MealModel model) {
  //   try {
  //     return cartList.firstWhere(
  //       (element) => element.meal!.id == model.id,
  //     );
  //   } catch (e) {
  //     return null;
  //   }
  // }

  // int getCartCount() {
  //   cartCount.value = cartList.fold(
  //       0, (previousValue, element) => previousValue + element.count!);

  //   return cartCount.value;
  // }

  // int getIndex(CartModel model) => cartList.indexOf(model);

  // void calcCartTotal() {
  //   subTotal.value = 0.0;
  //   tax.value = 0.0;
  //   deliverFees.value = 0.0;
  //   total.value = 0.0;

  //   subTotal.value = cartList.fold(
  //       0, (previousValue, element) => previousValue + element.total!);
  //   tax.value += subTotal.value * taxAmount;
  //   deliverFees.value += (subTotal.value + tax.value) * deliverAmount;
  //   total.value = subTotal.value + deliverFees.value + tax.value;
  // }
}
