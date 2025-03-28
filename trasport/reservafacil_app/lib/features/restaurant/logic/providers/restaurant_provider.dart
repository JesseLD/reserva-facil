import 'package:flutter/material.dart';
import 'package:reservafacil_app/core/network/dio_client.dart';
import 'package:reservafacil_app/features/reservation/logic/providers/reservation_provider.dart';
import 'package:reservafacil_app/features/restaurant/data/models/reservation_payload_model.dart';
import 'package:reservafacil_app/features/restaurant/data/models/single_restaurant_model.dart';
import '../../data/repositories/restaurant_repository.dart';
import '../../data/models/restaurant_model.dart';

class RestaurantProvider with ChangeNotifier {
  final RestaurantRepository _repository = RestaurantRepository();
  final _dioClient = DioClient();

  List<String> categories = [
    'Promoções',
    'Lanches',
    'Açaí',
    'Restaurantes',
    'Sushi',
  ];

  SingleRestaurantModel? singleRestaurant;

  final List<RestaurantModel> restaurants = [
    // RestaurantModel(
    //     8,
    //     "Luti's",
    //     "${DioClient.apiUrl}uploads/2025/01/logo-lutis.png",
    //     5.0,
    //     "Lanches",
    //     true,
    //     79.99,
    //     89.99,
    //     8),
    // RestaurantModel(
    //   1,
    //   "McDonald's",
    //   "https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/McDonald%27s_square_2020.svg/640px-McDonald%27s_square_2020.svg.png",
    //   4.7,
    //   "Lanches",
    //   true,
    //   30.99,
    //   50.99,
    //   4,
    // ),
    // RestaurantModel(
    //   2,
    //   "Subway",
    //   "${DioClient.apiUrl}uploads/2025/01/244141566_4376858042361392_2679925626410878642_n.jpg",
    //   5.0,
    //   "Lanches",
    //   false,
    //   59.99,
    //   79.99,
    //   4,
    // ),
    // RestaurantModel(
    //   3,
    //   "Mega Açaíteria",
    //   "https://static.goomer.app/stores/149448/products/mobile_menu/templates/228185/logo_512x512_v1630365126.jpeg",
    //   5.0,
    //   "Açaí",
    //   false,
    //   15.00,
    //   25.00,
    //   4,
    // ),
    // RestaurantModel(
    //   4,
    //   "Açaíteria Mayo",
    //   "${DioClient.apiUrl}uploads/2025/01/16844697736466f80d01ee3_medium.png",
    //   5.0,
    //   "Açaí",
    //   false,
    //   14.00,
    //   32.99,
    //   4,
    // ),
    // RestaurantModel(
    //   5,
    //   "Souza Marmitaria",
    //   "https://http2.mlstatic.com/D_NQ_NP_895858-MLB51393700680_092022-O.webp",
    //   5.0,
    //   "Resutaurantes",
    //   false,
    //   15.00,
    //   30.00,
    //   4,
    // ),
    // RestaurantModel(
    //   6,
    //   "Comida Caseira Borcelle",
    //   "https://marketplace.canva.com/EAGXnVPg42s/1/0/1600w/canva-logo-restaurante-delivery-rustico-BCLsrKM8jcU.jpg",
    //   5.0,
    //   "Resutaurantes",
    //   true,
    //   40.00,
    //   102.00,
    //   8,
    // ),
    // RestaurantModel(
    //   7,
    //   "Loja do Sushi",
    //   "https://acdn.mitiendanube.com/stores/003/114/752/themes/common/ogimage-1581482322-1682625023-76fb6f15e892e24bdfacb3743a8a96441682625023.png?0",
    //   5.0,
    //   "Sushi",
    //   true,
    //   30.00,
    //   89.99,
    //   4,
    // ),
    // RestaurantModel(
    //   8,
    //   "Sunshibar",
    //   "https://static.vecteezy.com/ti/vetor-gratis/p1/18734710-modelo-de-logotipo-de-sushi-logotipo-de-ilustracao-de-estilo-de-iconeial-de-barra-de-fast-food-de-rua-asiatica-ou-loja-sushi-maki-rolo-de-salmao-nigiri-com-pauzinhos-gratis-vetor.jpg",
    //   5.0,
    //   "Sushi",
    //   false,
    //   40.99,
    //   100.00,
    //   4,
    // ),
  ];

  Future<void> getRestaurants() async {
    final response = await _repository.getRestaurants();

    restaurants.clear();
    restaurants.addAll(response);
    notifyListeners();
  }

  Future<void> getRestaurant(int id) async {
    final response = await _repository.getRestaurant(id);

    singleRestaurant = response;
    notifyListeners();
  }

  Future<void> createReservation(ReservationPayloadModel payload) async {
    await _repository.createReservation(payload);
    notifyListeners();
  }
}
