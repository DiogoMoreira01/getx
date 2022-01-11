import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(home: Home()));
}

class Controller extends GetxController {
  var count = 0.obs;
  increment() => count.value++;
}

class Home extends StatelessWidget {
  @override
  Widget build(context) {
    // Instancie sua classe usando Get.put() para torná-la disponível para todas as rotas subsequentes
    final Controller c = Get.put(Controller());

    return Scaffold(
        // Use Obx(()=> para atualizar Text() sempre que a contagem é alterada.
        appBar: AppBar(title: Obx(() => Text("Total de cliques: ${c.count}"))),
        body: Center(
            child: ElevatedButton(
                child: Text("Ir pra Outra tela"),
                onPressed: () => Get.to(Outra()))),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add), onPressed: c.increment));
  }
}

class Outra extends StatelessWidget {
  // Você pode pedir o Get para encontrar o controller que foi usado em outra página e redirecionar você pra ele.
  final Controller c = Get.find();
  @override
  Widget build(context) => Scaffold(body: Center(child: Text("${c.count}")));
}
