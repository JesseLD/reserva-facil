// ignore_for_file: use_build_context_synchronously

import 'package:brasil_fields/brasil_fields.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:reservafacil_partners/common/constants/app_colors.dart';
import 'package:reservafacil_partners/common/constants/app_images.dart';
import 'package:reservafacil_partners/common/constants/app_input_styles.dart';
import 'package:reservafacil_partners/common/constants/app_input_validations.dart';
import 'package:reservafacil_partners/common/constants/app_text_styles.dart';
import 'package:reservafacil_partners/common/providers/global_state_provider.dart';
import 'package:reservafacil_partners/common/utils/functions.dart';
import 'package:reservafacil_partners/common/utils/logger.dart';
import 'package:reservafacil_partners/common/utils/popups.dart';
import 'package:reservafacil_partners/common/utils/sanitizer.dart';
import 'package:reservafacil_partners/common/utils/toasts.dart';
import 'package:reservafacil_partners/common/widgets/button/reactive_button.dart';
import 'package:reservafacil_partners/common/widgets/custom_circular_progress_indicator.dart';
import 'package:reservafacil_partners/features/login/logic/providers/login_provider.dart';
import 'package:reservafacil_partners/features/register/data/models/register_model.dart';
import 'package:reservafacil_partners/features/register/data/models/state_model.dart';
import 'package:reservafacil_partners/features/register/data/models/store_category.dart';
import 'package:reservafacil_partners/features/register/logic/providers/register_provider.dart';

class RegisterDesktop extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  RegisterDesktop({super.key});

  @override
  State<RegisterDesktop> createState() => _RegisterDesktopState();
}

class _RegisterDesktopState extends State<RegisterDesktop> {
  late Future loadDataFuture;

  @override
  void initState() {
    super.initState();

    loadDataFuture = _loadData();
  }

  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _birthDateController = TextEditingController();

  final _cepController = TextEditingController();
  final _cityController = TextEditingController();
  final _neighborhoodController = TextEditingController();
  final _addressController = TextEditingController();
  final _numberController = TextEditingController();
  final _complementController = TextEditingController();

  final _cpfCnpjController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _storeNameController = TextEditingController();
  final _storeCapacityController = TextEditingController();
  final _storePartyController = TextEditingController();

  StateModel selectedState =
      StateModel(id: 0, name: "Selecione um estado", uf: "");
  StoreCategory selectedCategory =
      StoreCategory(id: 0, name: "Selecione uma especialidade");

  bool _isCpf = true;

  bool _obscureText = true;
  void _handleRegister() async {
    // final globalStateProvider =
    //     Provider.of<GlobalStateProvider>(context, listen: false);
    // if (globalStateProvider.isLoading) return;

    // globalStateProvider.setLoading(true);

    // final registerProvider =
    //     Provider.of<RegisterProvider>(context, listen: false);
    // // final loginProvider = Provider.of<LoginProvider>(context, listen: false);

    // RegisterModel registerModel = RegisterModel(
    //   name: _nameController.text,
    //   email: _emailController.text,
    //   cpfCnpj: _cpfCnpjController.text.replaceAll(RegExp(r'[.\-]'), ""),
    //   password: _passwordController.text,
    // );

    // try {
    //   await registerProvider.register(registerModel, context);

    //   showSuccessToast(context,
    //       message:
    //           "Um e-mail de confirmação foi enviado para ${_emailController.text}. Verifique sua caixa de entrada e siga as instruções para ativar sua conta.");

    //   _nameController.clear();
    //   _emailController.clear();
    //   _cpfCnpjController.clear();
    //   _passwordController.clear();
    //   _confirmPasswordController.clear();
    //   globalStateProvider.setLoading(false);
    //   Navigator.pushNamed(context, '/login');
    // } catch (e) {
    //   globalStateProvider.setLoading(false);
    //   if (e.toString().contains("UserAlreadyExistsException")) {
    //     showErrorPopup(
    //       context,
    //       message:
    //           "O E-mail ou CPF informado já está cadastrado. Tente fazer login ou recuperar sua senha.",
    //       title: "Erro ao realizar o registro",
    //     );
    //   } else {
    //     showErrorPopup(
    //       context,
    //       message: "Erro ao realizar o registro. Tente novamente!",
    //       title: "Erro ao realizar o registro",
    //     );
    //   }
    // }
  }

  Future<void> _loadData() async {
    final registerProvider =
        Provider.of<RegisterProvider>(context, listen: false);
    await registerProvider.getStates();
    await registerProvider.getCategories();
  }

  @override
  Widget build(BuildContext context) {
    final registerProvider = Provider.of<RegisterProvider>(context);

    return FutureBuilder(
      future: loadDataFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CustomCircularProgressIndicator(),
          );
        }

        if (snapshot.hasError) {
          return Center(
            child: Text("Erro ao carregar dados: ${snapshot.error}"),
          );
        }

        return SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppImages.logoMidUp,
                      width: 200,
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Row(
                      children: [
                        Text(
                          "Cadastre sua Loja",
                          style: AppTextStyles.title.copyWith(
                            color: AppColors.darkGray,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Divider(),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Text(
                          "Informações Pessoais",
                          style: AppTextStyles.subtitle.copyWith(
                            color: AppColors.gray,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      decoration: AppInputStyles.primaryInputVariation.copyWith(
                        label: const Text("Nome completo"),
                        hintText: "Digite seu nome completo",
                      ),
                      controller: _nameController,
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.length < 3) {
                          return 'Por favor, digite seu nome';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _phoneController,
                            decoration:
                                AppInputStyles.primaryInputVariation.copyWith(
                              label: const Text("Celular "),
                              hintText: "Digite seu número de celular",
                            ),
                            keyboardType: TextInputType.phone,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              TelefoneInputFormatter(),
                            ],
                            // controller: _emailController,
                            validator: validatePhone,

                            onChanged: (value) async {
                              final phone = cleanNumber(value);

                              if (phone.length == 11) {
                                showLoadingPopup(context);
                                final result =
                                    await registerProvider.checkPhone(phone);

                                // Logger.log("Existe? $result");
                                Navigator.pop(context);
                                if (result) {
                                  showErrorPopup(
                                    context,
                                    title: "Telefone já cadastrado",
                                    message:
                                        "Telefone inválido ou já cadastrado. Verifique os dados e tente novamente. Se o Seu Telefone estiver correto, entre em contato conosco.",
                                  );
                                }
                              }
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: TextFormField(
                            decoration:
                                AppInputStyles.primaryInputVariation.copyWith(
                              label: const Text("E-mail "),
                              hintText: "Digite seu e-mail",
                            ),
                            controller: _emailController,
                            validator: validateEmail,
                          ),
                        ),
                        // const SizedBox(
                        //   width: 16,
                        // ),
                        // Expanded(
                        //   child: TextFormField(
                        //     decoration:
                        //         AppInputStyles.primaryInputVariation.copyWith(
                        //       label: const Text("Data de Nascimento "),
                        //       hintText: "Digite sua data de nascimento",
                        //     ),
                        //     controller: _birthDateController,
                        //     // controller: _emailController,
                        //     keyboardType: TextInputType.number,
                        //     inputFormatters: [
                        //       FilteringTextInputFormatter.digitsOnly,
                        //       DataInputFormatter(),
                        //     ],
                        //     validator: validateBirthDate,
                        //   ),
                        // ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Divider(),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Text(
                          "Endereço",
                          style: AppTextStyles.subtitle.copyWith(
                            color: AppColors.gray,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration:
                                AppInputStyles.primaryInputVariation.copyWith(
                              label: const Text("CEP"),
                              hintText: "Digite seu CEP",
                            ),
                            // controller: _emailController,
                            controller: _cepController,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              CepInputFormatter(),
                            ],
                            validator: validateCEP,
                            onChanged: (value) async {
                              String cep = sanitizeNumbers(value);

                              if (cep.length == 8) {
                                Logger.log("CEP: $cep");
                                // showLoadingPopup(context);
                                await registerProvider.getStateCity(cep);

                                setState(() {
                                  _cityController.text =
                                      registerProvider.stateCityModel.city;

                                  registerProvider.selectedState =
                                      registerProvider.states.firstWhere(
                                          (element) =>
                                              element.uf ==
                                              registerProvider
                                                  .stateCityModel.uf);
                                  // Navigator.pop(context);
                                });
                              }
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: DropdownSearch<StateModel>(
                            // mode: Mode.custom,

                            selectedItem: registerProvider.selectedState,
                            itemAsString: (StateModel item) => item.name,
                            compareFn: (item, selectedItem) =>
                                item == selectedItem,
                            items: registerProvider.states,
                            onChanged: (value) {
                              Logger.log("Selected State: $value");
                              if (value != null) {
                                selectedState = value;
                              }
                            },
                            dropdownDecoratorProps: DropDownDecoratorProps(
                              dropdownSearchDecoration:
                                  AppInputStyles.primaryInputVariation.copyWith(
                                label: const Text("Estado"),
                                hintText: "Selecione seu estado",
                              ),
                            ),
                            // items: states,
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: TextFormField(
                            decoration:
                                AppInputStyles.primaryInputVariation.copyWith(
                              label: const Text("Cidade"),
                              hintText: "Digite sua Cidade",
                            ),
                            // controller: _emailController,
                            controller: _cityController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor, digite sua Cidade';
                              }
                              if (value.length < 2) {
                                return 'Por favor, digite uma Cidade válida';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    // Row(
                    //   children: [
                    //     Expanded(
                    //       child: TextFormField(
                    //         decoration:
                    //             AppInputStyles.primaryInputVariation.copyWith(
                    //           label: const Text("Bairro"),
                    //           hintText: "Digite seu o Bairro",
                    //         ),
                    //         controller: _neighborhoodController,
                    //         // controller: _emailController,
                    //         validator: (value) {
                    //           if (value == null || value.isEmpty) {
                    //             return 'Por favor, digite seu Bairro';
                    //           }
                    //           if (value.length < 2) {
                    //             return 'Por favor, digite um Bairro válido';
                    //           }
                    //           return null;
                    //         },
                    //       ),
                    //     ),
                    //     const SizedBox(
                    //       width: 16,
                    //     ),
                    //     Expanded(
                    //       child: TextFormField(
                    //         decoration:
                    //             AppInputStyles.primaryInputVariation.copyWith(
                    //           label: const Text("Endereço"),
                    //           hintText: "Digite seu Endereço",
                    //         ),
                    //         controller: _addressController,
                    //         // controller: _emailController,

                    //         validator: (value) {
                    //           if (value == null || value.isEmpty) {
                    //             return 'Por favor, digite seu Endereço';
                    //           }
                    //           if (value.length < 2) {
                    //             return 'Por favor, digite um Endereço válido';
                    //           }
                    //           return null;
                    //         },
                    //       ),
                    //     ),
                    //     const SizedBox(
                    //       width: 16,
                    //     ),
                    //     Expanded(
                    //       child: TextFormField(
                    //         decoration:
                    //             AppInputStyles.primaryInputVariation.copyWith(
                    //           label: const Text("Número"),
                    //           hintText: "Digite seu Número",
                    //         ),
                    //         controller: _numberController,
                    //         // controller: _emailController,
                    //         keyboardType: TextInputType.number,
                    //         validator: (value) {
                    //           if (value == null || value.isEmpty) {
                    //             return 'Por favor, digite seu Número';
                    //           }
                    //           if (value.length < 2) {
                    //             return 'Por favor, digite um Número válido';
                    //           }
                    //           return null;
                    //         },
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      decoration: AppInputStyles.primaryInputVariation.copyWith(
                        label: const Text("Endereço Completo"),
                        hintText: "Digite seu endereço completo",
                      ),
                      controller: _addressController,
                      validator: (value) {
                        if (_addressController.text.isEmpty ||
                            _addressController.text.length < 5) {
                          return 'Por favor, digite seu endereço completo';
                        }
                        return null;
                      },
                      // onChanged: (value) {},
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Divider(),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Text(
                          "Informações Fiscais",
                          style: AppTextStyles.subtitle.copyWith(
                            color: AppColors.gray,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Checkbox(
                          checkColor: Colors.white,
                          activeColor: AppColors.primaryAlternative,
                          value: _isCpf,
                          onChanged: (value) {
                            setState(() {
                              _isCpf = value!;
                            });
                          },
                        ),
                        Text(
                          "CPF",
                          style: AppTextStyles.body.copyWith(
                            color: AppColors.lightGray,
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Checkbox(
                          checkColor: Colors.white,
                          activeColor: AppColors.primaryAlternative,
                          value: !_isCpf,
                          onChanged: (value) {
                            setState(() {
                              _isCpf = !value!;
                            });
                          },
                        ),
                        Text(
                          "CNPJ",
                          style: AppTextStyles.body.copyWith(
                            color: AppColors.lightGray,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      decoration: AppInputStyles.primaryInputVariation.copyWith(
                        label: _isCpf ? const Text("CPF") : const Text("CNPJ"),
                        hintText: _isCpf ? "Digite seu CPF" : "Digite seu CNPJ",
                      ),
                      controller: _cpfCnpjController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        _isCpf ? CpfInputFormatter() : CnpjInputFormatter(),
                      ],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, digite seu ${_isCpf ? "CPF" : "CNPJ"}';
                        }
                        if (_isCpf && value.length < 11) {
                          return 'Por favor, digite um CPF válido';
                        }
                        if (!_isCpf && value.length < 18) {
                          return 'Por favor, digite um CNPJ válido';
                        }

                        return null;
                      },
                      onChanged: (value) {
                        if (_isCpf) {
                          if (value.replaceAll(RegExp(r'[^\d]'), '').length ==
                              11) {
                            final result = CPFValidator.isValid(value);
                            if (!result) {
                              return showErrorPopup(
                                context,
                                title: "CPF inválido",
                                message:
                                    "CPF inválido ou já cadastrado. Verifique os dados e tente novamente. Se o Seu CPF estiver correto, entre em contato conosco.",
                              );
                            }
                          }
                        } else {
                          if (value.replaceAll(RegExp(r'[^\d]'), '').length ==
                              18) {
                            final result = CNPJValidator.isValid(value);

                            if (!result) {
                              return showErrorPopup(
                                context,
                                title: "CNPJ inválido",
                                message:
                                    "CNPJ inválido ou já cadastrado. Verifique os dados e tente novamente. Se o Seu CNPJ estiver correto, entre em contato conosco.",
                              );
                            }
                          }
                        }

                        final cpfCnpj = cleanNumber(value);

                        if (cpfCnpj.length == 11) {
                          showLoadingPopup(context);
                          registerProvider.checkCpfCnpj(cpfCnpj).then((result) {
                            Logger.log("Existe? $result");
                            Navigator.pop(context);
                            if (result) {
                              showErrorPopup(
                                context,
                                title: "CPF já cadastrado",
                                message:
                                    "CPF inválido ou já cadastrado. Verifique os dados e tente novamente. Se o Seu CPF estiver correto, entre em contato conosco.",
                              );
                            }
                          });
                        } else if (cpfCnpj.length == 14) {
                          showLoadingPopup(context);
                          registerProvider.checkCpfCnpj(cpfCnpj).then((result) {
                            Navigator.pop(context);
                            if (result) {
                              showErrorPopup(
                                context,
                                title: "CNPJ já cadastrado",
                                message:
                                    "CNPJ inválido ou já cadastrado. Verifique os dados e tente novamente. Se o Seu CNPJ estiver correto, entre em contato conosco.",
                              );
                            }
                          });
                        }
                      },
                    ),

                    const SizedBox(
                      height: 16,
                    ),
                    DropdownSearch<StoreCategory>(
                      // mode: Mode.custom,

                      selectedItem: registerProvider.categories.first,
                      itemAsString: (StoreCategory item) => item.name,
                      compareFn: (item, selectedItem) => item == selectedItem,
                      items: registerProvider.categories,
                      onChanged: (value) {
                        Logger.log("Selected State: $value");
                        if (value != null) {
                          selectedCategory = value;
                        }
                      },
                      dropdownDecoratorProps: DropDownDecoratorProps(
                        dropdownSearchDecoration:
                            AppInputStyles.primaryInputVariation.copyWith(
                          label: const Text("Especialidade"),
                          hintText: "Selecione sua especialidade",
                        ),
                      ),
                      // items: states,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Divider(),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Text(
                          "Informações de Acesso",
                          style: AppTextStyles.subtitle.copyWith(
                            color: AppColors.gray,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      decoration: AppInputStyles.primaryInputVariation.copyWith(
                        label: const Text("Nome da Loja"),
                        hintText: "Digite o nome da sua loja",
                      ),
                      controller: _storeNameController,
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.length < 3) {
                          return 'Por favor, digite seu nome';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        TextFormField(
                          decoration:
                              AppInputStyles.primaryInputVariation.copyWith(
                            label: const Text("Capacidade do Estabelecimento"),
                            hintText:
                                "Digite a capacidade do seu estabelecimento",
                          ),
                          controller: _storeCapacityController,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, digite a capacidade do seu estabelecimento';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          decoration:
                              AppInputStyles.primaryInputVariation.copyWith(
                            label: const Text("Assentos por reserva"),
                            hintText:
                                "Digite a quantidade de assentos por reserva",
                          ),
                          controller: _storePartyController,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, digite a quantidade de assentos por reserva';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),

                    TextFormField(
                      decoration: AppInputStyles.primaryInputVariation.copyWith(
                        label: const Text("Sua Senha"),
                        hintText: "Digite sua senha",
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                      ),
                      controller: _passwordController,
                      obscureText: _obscureText,
                      validator: validatePassword,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    TextFormField(
                      decoration: AppInputStyles.primaryInputVariation.copyWith(
                        label: const Text("Confirmar Senha"),
                        hintText: "Confirme sua senha",
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                      ),
                      obscureText: _obscureText,
                      controller: _confirmPasswordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, digite sua senha';
                        }

                        if (value != _passwordController.text) {
                          return 'As senhas não são iguais';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    // Row(
                    //   children: [
                    //     Expanded(
                    //       child: ElevatedButton(
                    //         style: AppButtonStyles.primaryButtonStyle,
                    //         onPressed: () async {
                    //           if (_formKey.currentState!.validate()) {
                    //             // ScaffoldMessenger.of(context).showSnackBar(
                    //             //   const SnackBar(
                    //             //     content: Text('Processando...'),
                    //             //   ),
                    //             // );
                    //             _handleRegister();
                    //           }
                    //         },
                    //         child: registerProvider.isLoading
                    //             ? const SizedBox(
                    //                 width: 24,
                    //                 height: 24,
                    //                 child: CircularProgressIndicator.adaptive(
                    //                   // value: ,
                    //                   backgroundColor: Colors.white,
                    //                   valueColor: AlwaysStoppedAnimation<Color>(
                    //                     AppColors.primary,
                    //                   ),
                    //                 ),
                    //               )
                    //             : const Text(
                    //                 "Criar Conta",
                    // style: TextStyle(
                    //   color: Colors.white,
                    //   fontSize: 16,
                    //   fontWeight: FontWeight.bold,
                    // ),
                    //               ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    ReactiveButton(
                        child: const Text(
                          "Criar Conta",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            final value = _emailController.text;
                            if (RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                .hasMatch(value)) {
                              showLoadingPopup(context);
                              final result =
                                  await registerProvider.checkEmail(value);
                              Navigator.pop(context);
                              if (result) {
                                showErrorPopup(
                                  context,
                                  title: "E-mail já cadastrado",
                                  message:
                                      "E-mail inválido ou já cadastrado. Verifique os dados e tente novamente. Se o Seu E-mail estiver correto, entre em contato conosco.",
                                );
                              } else {
                                _handleRegister();
                              }
                            }
                            // _handleRegister();
                          }
                        }),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text(
                      "Ou",
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    GestureDetector(
                      onTap: () {
                        final loginProvider =
                            Provider.of<LoginProvider>(context, listen: false);
                        if (registerProvider.cameFromLogin) {
                          registerProvider.cameFromLogin = false;
                          Navigator.pop(context);
                        } else {
                          loginProvider.cameFromRegister = true;
                          Navigator.pushNamed(context, '/login');
                        }
                      },
                      child: RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: "Já tem uma conta? ",
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: "Faça login",
                              style: TextStyle(
                                color: Color(0xFFFF6900),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
