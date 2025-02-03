import 'package:flutter/material.dart';
import 'package:reservafacil_app/common/constants/app_images.dart';

ImageProvider<Object> getNetworkImage({ required String imageUrl}) {
  return FadeInImage.assetNetwork(
    placeholder: AppImages.defaultAvatar, // Placeholder temporário
    image: imageUrl, // Usa a URL passada
    fit: BoxFit.cover, // Ajusta a imagem
    imageErrorBuilder: (context, error, stackTrace) {
      return Image.asset(
        AppImages.defaultAvatar,
        fit: BoxFit.cover,
      ); // Imagem padrão
    },
  ).image;
}
