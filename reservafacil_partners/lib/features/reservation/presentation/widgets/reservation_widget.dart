// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:ionicons/ionicons.dart';
import 'package:reservafacil_partners/common/constants/app_colors.dart';

import 'package:reservafacil_partners/features/reservation/data/models/reservation_model.dart';

class ReservationWidget extends StatefulWidget {
  ReservationModel reservationModel;
  ReservationWidget({
    Key? key,
    required this.reservationModel,
  }) : super(key: key);

  @override
  State<ReservationWidget> createState() => _ReservationWidgetState();
}

class _ReservationWidgetState extends State<ReservationWidget> {
  double value = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                          widget.reservationModel.restaurant.logoUrl),
                      radius: 16,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      widget.reservationModel.restaurant.name,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Icon(
                  Ionicons.chevron_forward_outline,
                  size: 14,
                  color: Colors.grey,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Divider(
              color: Colors.grey[200],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(Ionicons.checkmark_circle, color: Colors.green, size: 16),
                const SizedBox(width: 8),
                Text(
                  'Reserva Concluída',
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 14,
                  ),
                ),
                Text(
                  ' • ',
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 14,
                  ),
                ),
                Text(
                  'N° ${widget.reservationModel.reservationNumber}',
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey[200],
                  child: Text(
                    widget.reservationModel.numberOfPeople.toString(),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                    ),
                  ),
                  radius: 12,
                ),
                const SizedBox(width: 8),
                Text(
                  "Pessoas",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Divider(
              color: Colors.grey[200],
            ),
            const SizedBox(height: 8),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Avaliação",
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 14,
                  ),
                ),
                RatingStars(
                  valueLabelVisibility: false,
                  value: widget.reservationModel.rating.toDouble(),
                  starBuilder: (index, color) => Icon(
                    Ionicons.star,
                    color: color,
                    size: 14,
                  ),
                  starCount: 5,
                  starSize: 14,
                  maxValue: 5,
                  starSpacing: 2,
                  starOffColor: Colors.grey[300]!,
                  starColor: Colors.orange,
                )
              ],
            ),
            const SizedBox(height: 8),
            Divider(
              color: Colors.grey[200],
            ),
            const SizedBox(height: 8),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    "Ajuda",
                    style: TextStyle(
                      color: AppColors.primaryAlternative,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: Text(
                    "Comentário",
                    style: TextStyle(
                      color: AppColors.primaryAlternative,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            )
            // Row(
            //   children: [
            //     const Icon(
            //       Icons.calendar_today,
            //       color: Colors.black,
            //       size: 16,
            //     ),
            //     const SizedBox(width: 8),
            //     Text(
            //       widget.reservationModel.date,
            //       style: const TextStyle(
            //         color: Colors.black,
            //         fontSize: 14,
            //       ),
            //     ),
            //   ],
            // ),
            // const SizedBox(height: 8),
            // Row(
            //   children: [
            //     const Icon(
            //       Icons.access_time,
            //       color: Colors.black,
            //       size: 16,
            //     ),
            //     const SizedBox(width: 8),
            //     Text(
            //       widget.reservationModel.time,
            //       style: const TextStyle(
            //         color: Colors.black,
            //         fontSize: 14,
            //       ),
            //     ),
            //   ],
            // ),
            // const SizedBox(height: 8),
            // Row(
            //   children: [
            //     const Icon(
            //       Icons.people,
            //       color: Colors.black,
            //       size: 16,
            //     ),
            //     const SizedBox(width: 8),
            //     Text(
            //       widget.reservationModel.people.toString(),
            //       style: const TextStyle(
            //         color: Colors.black,
            //         fontSize: 14,
            //       ),
            //     ),
            //   ],
            // ),
            // const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
