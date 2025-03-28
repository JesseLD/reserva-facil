import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reservafacil_app/common/constants/app_button_styles.dart';
import 'package:reservafacil_app/common/constants/app_colors.dart';
import 'package:reservafacil_app/common/constants/app_input_styles.dart';
import 'package:reservafacil_app/common/constants/app_text_styles.dart';
import 'package:reservafacil_app/common/utils/popups.dart';
import 'package:reservafacil_app/features/login/logic/providers/login_provider.dart';
import 'package:reservafacil_app/features/restaurant/data/models/reservation_payload_model.dart';
import 'package:reservafacil_app/features/restaurant/logic/providers/restaurant_provider.dart';

class RestaurantDetails extends StatelessWidget {
  const RestaurantDetails({super.key});

  void showReservationPopup(BuildContext context) {
    final TextEditingController peopleController = TextEditingController();
    final TextEditingController observationController = TextEditingController();
    DateTime? selectedDateTime;

    final formKey = GlobalKey<FormState>();

    final restaurantProvider =
        Provider.of<RestaurantProvider>(context, listen: false);
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Fazer Reserva'),
          content: StatefulBuilder(
            builder: (context, setState) {
              return Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      controller: peopleController,
                      keyboardType: TextInputType.number,
                      decoration: AppInputStyles.primaryInputVariation.copyWith(
                        labelText: 'Número de pessoas',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Campo obrigatório';
                        }

                        if (int.parse(value) >
                            restaurantProvider.singleRestaurant!.maxPartySize) {
                          return 'Número de pessoas excede o limite';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: observationController,
                      decoration: AppInputStyles.primaryInputVariation.copyWith(
                        labelText: 'Observações',
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            selectedDateTime != null
                                ? 'Data: ${selectedDateTime!.day}/${selectedDateTime!.month} ${selectedDateTime!.hour}:${selectedDateTime!.minute.toString().padLeft(2, '0')}'
                                : 'Selecione uma data',
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.calendar_today),
                          onPressed: () async {
                            final date = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate:
                                  DateTime.now().add(const Duration(days: 365)),
                            );
                            if (date != null) {
                              final time = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              );
                              if (time != null) {
                                setState(() {
                                  selectedDateTime = DateTime(
                                    date.year,
                                    date.month,
                                    date.day,
                                    time.hour,
                                    time.minute,
                                  );
                                });
                              }
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              style: AppButtonStyles.primaryButtonStyle.copyWith(
                padding: WidgetStateProperty.all(
                  const EdgeInsets.symmetric(horizontal: 32),
                ),
              ),
              onPressed: () async {
                if (!formKey.currentState!.validate()) {
                  return;
                }

                final partySize = int.tryParse(peopleController.text);
                if (partySize == null || selectedDateTime == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Preencha todos os campos')),
                  );
                  return;
                }

                ReservationPayloadModel payload = ReservationPayloadModel(
                    storeId: restaurantProvider.singleRestaurant!.id,
                    userId: loginProvider.loginModel.account.id,
                    partySize: partySize,
                    date: selectedDateTime!,
                    observation: observationController.text);

                // Aqui você pode chamar um método do Provider ou API para salvar a reserva
                // print(
                //     'Reservando para $partySize pessoas em $selectedDateTime');

                showLoadingPopup(context);

                await restaurantProvider.createReservation(payload);

                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
              child: Text(
                'Reservar',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final restaurantProvider = Provider.of<RestaurantProvider>(context);
    final restaurant = restaurantProvider.singleRestaurant!;

    final String storeName = restaurant.name;

    final List<String> days = [
      'Segunda-feira',
      'Terça-feira',
      'Quarta-feira',
      'Quinta-feira',
      'Sexta-feira',
      'Sábado',
      'Domingo',
    ];

    // Criar mapa com horários por dia da semana
    final Map<int, String> openingMap = {
      for (var i = 0; i < 7; i++) i: 'Fechado'
    };

    for (var schedule in restaurant.openingHours) {
      openingMap[schedule.weekDay] =
          '${schedule.openingTime} - ${schedule.closeTime}';
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryAlternative,
        title: Text(
          storeName,
          style: AppTextStyles.subtitleAlt.copyWith(
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showReservationPopup(context);
          // Implementar ação do botão
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.shopping_cart, color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Horários de Funcionamento',
                  style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 8),
              ...List.generate(7, (index) {
                return ListTile(
                  title: Text('${days[index]}: ${openingMap[index]}'),
                );
              }),
              const SizedBox(height: 24),
              Text('Produtos', style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 8),
              ...restaurant.products.map((product) => ListTile(
                    title: Text(product.name),
                    trailing: Text('R\$ ${product.price.toStringAsFixed(2)}'),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
