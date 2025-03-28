import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reservafacil_app/common/constants/app_text_styles.dart';
import 'package:reservafacil_app/common/widgets/dynamic_spacer.dart';
import 'package:reservafacil_app/features/login/logic/providers/login_provider.dart';
import 'package:reservafacil_app/features/reservation/logic/providers/reservation_provider.dart';
import 'package:reservafacil_app/features/reservation/presentation/widgets/reservation_widget.dart';

class ReservationMobile extends StatefulWidget {
  const ReservationMobile({super.key});

  @override
  State<ReservationMobile> createState() => _ReservationMobileState();
}

class _ReservationMobileState extends State<ReservationMobile> {
  late Future<void> reservationsFuture;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    final reservationProvider =
        Provider.of<ReservationProvider>(context, listen: false);
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);
    print(loginProvider.loginModel.account.id);
    reservationsFuture = reservationProvider
        .getReservations(loginProvider.loginModel.account.id);
  }

  @override
  Widget build(BuildContext context) {
    final reservationProvider = Provider.of<ReservationProvider>(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DynamicSpacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Minhas Reservas',
                  style: AppTextStyles.subtitle.copyWith(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Text(
                  'Histórico',
                  style: AppTextStyles.subtitle.copyWith(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            FutureBuilder(
                future: reservationsFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  }
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text('Erro ao carregar reservas'),
                    );
                  }
                  if (reservationProvider.reservations.isEmpty) {
                    return const Center(
                      child: Text('Nenhuma reserva encontrada'),
                    );
                  }
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: reservationProvider.reservations.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                reservationProvider.reservations[index].date,
                                style: AppTextStyles.body,
                              ),
                            ],
                          ),
                          ReservationWidget(
                            reservationModel:
                                reservationProvider.reservations[index],
                          ),
                          SizedBox(
                            height: 32,
                          ),
                        ],
                      );
                    },
                  );
                }),
            SizedBox(
              height: 32,
            ),
          ],
        ),
      ),
    );
  }
}
