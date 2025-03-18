// ignore_for_file: use_build_context_synchronously

import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:reservafacil_partners/common/constants/app_colors.dart';
import 'package:reservafacil_partners/common/constants/app_images.dart';
import 'package:reservafacil_partners/common/constants/app_input_styles.dart';
import 'package:reservafacil_partners/common/constants/app_text_styles.dart';
import 'package:reservafacil_partners/common/converters/contact_converter.dart';
import 'package:reservafacil_partners/common/converters/cpf_converter.dart';
import 'package:reservafacil_partners/common/converters/date_converter.dart';
import 'package:reservafacil_partners/common/providers/global_state_provider.dart';
import 'package:reservafacil_partners/common/utils/logger.dart';
import 'package:reservafacil_partners/common/utils/toasts.dart';
import 'package:reservafacil_partners/common/widgets/button/reactive_button.dart';
import 'package:reservafacil_partners/common/widgets/custom_appbar.dart';
import 'package:reservafacil_partners/common/widgets/network_image_widget.dart';
import 'package:reservafacil_partners/features/account/logic/providers/account_provider.dart';
import 'package:reservafacil_partners/features/login/logic/providers/login_provider.dart';
import 'package:reservafacil_partners/features/settings/presentation/widgets/drawer/drawer_item.dart';

class AccountMobile extends StatefulWidget {
  const AccountMobile({super.key});

  @override
  State<AccountMobile> createState() => _AccountMobileState();
}

class _AccountMobileState extends State<AccountMobile> {
  // late Future<void> _future;

  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  // final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final _birthDateController = TextEditingController();
  final _phoneController = TextEditingController();
  // final _cpfController = TextEditingController();

  XFile? _image;
  // XFile? _croppedImage;

  final ImagePicker _picker = ImagePicker();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        final loginProvider =
            Provider.of<LoginProvider>(context, listen: false);
        if (loginProvider.loginModel.account.id != 0) {
          loginProvider.refresh();

          _nameController.text = loginProvider.loginModel.account.name;
          _phoneController.text = (loginProvider.loginModel.account.phone !=
                      null &&
                  loginProvider.loginModel.account.phone!.isNotEmpty)
              ? ContactConverter.format(loginProvider.loginModel.account.phone!)
              : '';
          _birthDateController.text =
              loginProvider.loginModel.account.birthDate != null
                  ? DateConverter.toFormattedString(
                      loginProvider.loginModel.account.birthDate!)
                  : '';
        }
      },
    );
  }

  // Future<void> _refreshUserInfo() async {
  //   // Certifique-se de que `listen: false` está sendo usado
  //   final loginProvider = Provider.of<LoginProvider>(context, listen: false);
  //   await loginProvider.refresh();
  // }

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      // final croppedImage = await ImageCropper().cropImage(
      //   sourcePath: image.path,
      //   aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
      //   compressQuality: 80,
      //   compressFormat: ImageCompressFormat.jpg,
      //   maxHeight: 300,
      //   maxWidth: 300,
      // );
      // final accountProvider = Provider.of<AccountProvider>(context, listen: false);
      // await accountProvider.updateImage = image;
      // final loginProvider = Provider.of<LoginProvider>(context, listen: false);
      // setState(() {
      //   loginProvider.loginModel.account.imageUrl = image.path;
      // });
      // croppedImage.
      // _croppedImage = croppedImage;
      _image = image;
    }
  }

  Future<void> _uploadImage() async {
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);
    final accountProvider =
        Provider.of<AccountProvider>(context, listen: false);

    try {
      if (kIsWeb) {
        await accountProvider.updateProfileImageWeb(
          loginProvider.loginModel.account.id,
          _image,
        );
      } else {
        await accountProvider.updateProfileImage(
          loginProvider.loginModel.account.id,
          _image,
        );
      }
      showSuccessToast(context, message: "Foto atualizada");
    } catch (e) {
      Logger.log(e);
      showErrorToast(context, message: "Erro ao atualizar foto");
    }

    loginProvider.refresh();

    setState(() {});
  }

  Future<void> _removeImage() async {
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);
    final accountProvider =
        Provider.of<AccountProvider>(context, listen: false);

    await accountProvider.removeProfileImage(
      loginProvider.loginModel.account.id,
      loginProvider.loginModel.account.imageUrl!,
    );

    loginProvider.refresh();
  }

  void _openBottomDrawer(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          color: Colors.white,
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.white,
                          backgroundImage: getNetworkImage(
                              imageUrl:
                                  loginProvider.loginModel.account.imageUrl ??
                                      ''),
                          child:
                              loginProvider.loginModel.account.imageUrl == null
                                  ? Text(
                                      loginProvider.loginModel.account.name[0],
                                      style: AppTextStyles.title,
                                    )
                                  : null,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        const Text(
                          'Editar foto de perfil',
                          style: AppTextStyles.button,
                        ),
                      ],
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.close,
                        color: AppColors.gray,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
              DrawerItem(
                // icon: ,
                title: "Escolher foto",
                onTap: () async {
                  await _pickImage().then((_) async {
                    await _uploadImage().then((_) {
                      Navigator.pop(context);
                    });
                  });

                  // Navigator.pushNamed(context, '/account');
                },
                trailingIcon: const Icon(
                  Icons.photo_outlined,
                  color: AppColors.gray,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Divider(
                  color: AppColors.gray.withAlpha(60),
                  height: 1,
                ),
              ),
              DrawerItem(
                trailingIcon: const Icon(
                  Ionicons.trash_outline,
                  color: AppColors.dangerRed,
                ),
                title: "Remover",
                titleStyle: const TextStyle(
                  color: AppColors.dangerRed,
                ),
                onTap: () async {
                  try {
                    await _removeImage();
                    showSuccessToast(context, message: "Foto removida");
                    Navigator.pop(context);
                  } catch (e) {
                    showErrorToast(context, message: "Erro ao remover foto");
                    Navigator.pop(context);
                  }
                  // Navigator.pushNamed(context, '/account');
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showDatePicker() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      final loginProvider = Provider.of<LoginProvider>(context, listen: false);
      // setState(() {
      loginProvider.loginModel.account.birthDate = picked;
      _birthDateController.text = DateConverter.toFormattedString(picked);
      // });
    }
  }

  void _showUpdatePasswordPopup() async {
    bool obscurePassword = true;
    bool obscureConfirmPassword = true;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Alterar Senha'),
              content: Form(
                key: _formKey2,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      controller: _passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, digite sua senha';
                        }
                        if (value.length < 6) {
                          return 'Sua senha deve ter no mínimo 6 caracteres';
                        }
                        if (!value.contains(RegExp(r'[0-9]'))) {
                          return 'Sua senha deve conter números';
                        }

                        return null;
                      },
                      decoration: AppInputStyles.primaryInput.copyWith(
                        labelText: 'Nova Senha',
                        suffixIcon: IconButton(
                          icon: Icon(
                            obscurePassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              obscurePassword = !obscurePassword;
                            });
                          },
                        ),
                      ),
                      obscureText: obscurePassword,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _confirmPasswordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, digite sua senha';
                        }
                        if (value.length < 6) {
                          return 'Sua senha deve ter no mínimo 6 caracteres';
                        }
                        if (!value.contains(RegExp(r'[0-9]'))) {
                          return 'Sua senha deve conter números';
                        }
                        if (value != _passwordController.text) {
                          return 'As senhas não coincidem';
                        }

                        return null;
                      },
                      decoration: AppInputStyles.primaryInput.copyWith(
                        labelText: 'Confirmar Senha',
                        suffixIcon: IconButton(
                          icon: Icon(
                            obscureConfirmPassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              obscureConfirmPassword = !obscureConfirmPassword;
                            });
                          },
                        ),
                      ),
                      obscureText: obscureConfirmPassword,
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancelar'),
                ),
                TextButton(
                  onPressed: () async {
                    if (_formKey2.currentState!.validate()) {
                      final accountProvider =
                          Provider.of<AccountProvider>(context, listen: false);

                      final loginProvider =
                          Provider.of<LoginProvider>(context, listen: false);

                      final globalStateProvider =
                          Provider.of<GlobalStateProvider>(context,
                              listen: false);
                      globalStateProvider.setLoading(true);

                      try {
                        await accountProvider.updatePassword(
                          loginProvider.loginModel.account.id,
                          _passwordController.text,
                        );

                        await loginProvider.refresh();

                        globalStateProvider.setLoading(false);
                        Navigator.of(context).pop();

                        showSuccessToast(context, message: "Senha atualizada");
                      } catch (e) {
                        globalStateProvider.setLoading(false);
                        showErrorToast(context,
                            message: "Erro ao atualizar senha");
                      }

                      // Implement password update logic here
                    }
                  },
                  child: const Text('Salvar'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: [
              CustomAppBar(
                enableBackButton: true,
                centerTitle: true,
                simple: true,
                title: const Text(
                  'Sua Conta',
                  style: AppTextStyles.button,
                ),
              ),
              const SizedBox(height: 16),
              CircleAvatar(
                radius: 60,
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(
                  loginProvider.loginModel.account.imageUrl ?? '',
                ),
                child: loginProvider.loginModel.account.imageUrl == null
                    ? Text(
                        loginProvider.loginModel.account.name[0],
                        style: AppTextStyles.title,
                      )
                    : null,
              ),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () {
                  _openBottomDrawer(context);
                },
                child: Text(
                  "Editar",
                  style: AppTextStyles.body.copyWith(
                    color: AppColors.primaryAlternative,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                loginProvider.loginModel.account.name,
                style: AppTextStyles.title,
              ),
              const SizedBox(height: 24),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nameController,
                      // initialValue: loginProvider.loginModel.account.name,
                      decoration: AppInputStyles.primaryInput.copyWith(
                        labelText: 'Seu nome',
                      ),
                      readOnly: false,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      initialValue: loginProvider.loginModel.account.email,
                      decoration: AppInputStyles.primaryInput.copyWith(
                        labelText: 'Email',
                      ),
                      readOnly: true,
                      style: TextStyle(
                        color: AppColors.gray.withAlpha(130),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      initialValue: CpfConverter.format(
                          loginProvider.loginModel.account.cpfCnpj),
                      decoration: AppInputStyles.primaryInput.copyWith(
                        labelText: 'CPF',
                      ),
                      readOnly: true,
                      style: TextStyle(
                        color: AppColors.gray.withAlpha(130),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _birthDateController,
                      // initialValue:
                      //     loginProvider.loginModel.account.birthDate != null
                      //         ? DateConverter.toFormattedString(
                      //             loginProvider.loginModel.account.birthDate!)
                      //         : '',
                      onTap: () {
                        if (loginProvider.loginModel.account.birthDate !=
                            null) {
                          return;
                        }
                        _showDatePicker();
                      },
                      decoration: AppInputStyles.primaryInput.copyWith(
                        labelText: 'Data de nascimento',
                      ),
                      readOnly:
                          loginProvider.loginModel.account.birthDate != null,
                      style: TextStyle(
                        color:
                            loginProvider.loginModel.account.birthDate != null
                                ? AppColors.gray.withAlpha(130)
                                : null,
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _phoneController,
                      decoration: AppInputStyles.primaryInput.copyWith(
                        labelText: 'Telefone',
                      ),
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        TelefoneInputFormatter(),
                      ],
                      readOnly: false,
                    ),
                    const SizedBox(height: 24),
                    Divider(
                      color: AppColors.gray.withAlpha(60),
                      height: 1,
                    ),
                    const SizedBox(height: 24),
                    ReactiveButton(
                      alternateColor: true,
                      child: Text(
                        "Alterar Senha",
                        style: AppTextStyles.button.copyWith(
                          color: AppColors.primaryAlternative,
                        ),
                      ),
                      onPressed: () {
                        _showUpdatePasswordPopup();
                      },
                    ),
                    const SizedBox(height: 16),
                    ReactiveButton(
                      child: Text(
                        "Salvar",
                        style: AppTextStyles.button.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () async {
                        final accountProvider = Provider.of<AccountProvider>(
                            context,
                            listen: false);
                        final globalStateProvider =
                            Provider.of<GlobalStateProvider>(context,
                                listen: false);
                        if (_formKey.currentState!.validate()) {
                          Logger.log("Validated");
                          globalStateProvider.setLoading(true);

                          try {
                            await accountProvider.updateAccount(
                              loginProvider.loginModel.account.copyWith(
                                name: _nameController.text,
                                phone: _phoneController.text,
                                birthDate: DateFormat('dd/MM/yyyy')
                                    .parse(_birthDateController.text),
                              ),
                            );

                            globalStateProvider.setLoading(false);
                            // Navigator.pop(context);

                            await loginProvider.refresh();
                          } catch (e) {
                            globalStateProvider.setLoading(false);
                            showErrorToast(context,
                                message: "Erro ao atualizar dados");
                          }
                          // showLoadingPopup(context);

                          // toastification
                        }
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
