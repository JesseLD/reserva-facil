import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:reservafacil_partners/common/constants/app_button_styles.dart';
import 'package:reservafacil_partners/common/constants/app_colors.dart';
import 'package:reservafacil_partners/common/constants/app_input_styles.dart';
import 'package:reservafacil_partners/common/constants/app_input_validations.dart';
import 'package:reservafacil_partners/common/constants/app_text_styles.dart';
import 'package:reservafacil_partners/common/providers/global_state_provider.dart';
import 'package:reservafacil_partners/common/utils/logger.dart';
import 'package:reservafacil_partners/common/utils/popups.dart';
import 'package:reservafacil_partners/common/utils/sanitizer.dart';
import 'package:reservafacil_partners/common/utils/toasts.dart';
import 'package:reservafacil_partners/common/widgets/custom_circular_progress_indicator.dart';
import 'package:reservafacil_partners/common/widgets/custom_form_field.dart';
import 'package:reservafacil_partners/features/register/data/models/register_model.dart';
import 'package:reservafacil_partners/features/register/data/models/state_model.dart';
import 'package:reservafacil_partners/features/register/data/models/store_category.dart';
import 'package:reservafacil_partners/features/register/logic/providers/register_provider.dart';
import 'package:dropdown_search/dropdown_search.dart';

class RegisterDesktop extends StatefulWidget {
  const RegisterDesktop({super.key});

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
  final _ownerNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();

  final _cepController = TextEditingController();
  final _cityController = TextEditingController();
  final _addressController = TextEditingController();

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
    final globalStateProvider =
        Provider.of<GlobalStateProvider>(context, listen: false);
    if (globalStateProvider.isLoading) return;

    globalStateProvider.setLoading(true);

    final registerProvider =
        Provider.of<RegisterProvider>(context, listen: false);
    // final loginProvider = Provider.of<LoginProvider>(context, listen: false);

    RegisterModel registerModel = RegisterModel(
      name: _nameController.text,
      email: _emailController.text,
      cpfCnpj: sanitizeNumbers(_phoneController.text),
      password: _passwordController.text,
      cep: sanitizeNumbers(_cepController.text),
      state: selectedState,
      city: _cityController.text,
      address: _addressController.text,
      storeName: _storeNameController.text,
      category: selectedCategory,
      phone: sanitizeNumbers(_phoneController.text),
      reservationCapacity: int.parse(_storeCapacityController.text),
      maxPartySize: int.parse(_storePartyController.text),
    );

    try {
      await registerProvider.register(registerModel, context);

      showSuccessToast(context,
          message:
              "Um e-mail de confirmação foi enviado para ${_emailController.text}. Verifique sua caixa de entrada e siga as instruções para ativar sua conta.");

      _nameController.clear();
      _emailController.clear();
      _cpfCnpjController.clear();
      _passwordController.clear();
      _confirmPasswordController.clear();
      globalStateProvider.setLoading(false);
      Navigator.pushNamed(context, '/login');
    } catch (e) {
      globalStateProvider.setLoading(false);
      if (e.toString().contains("UserAlreadyExistsException")) {
        showErrorPopup(
          context,
          message:
              "O E-mail ou CPF informado já está cadastrado. Tente fazer login ou recuperar sua senha.",
          title: "Erro ao realizar o registro",
        );
      } else {
        showErrorPopup(
          context,
          message: "Erro ao realizar o registro. Tente novamente!",
          title: "Erro ao realizar o registro",
        );
      }
    }
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
    return Scaffold(
      body: FutureBuilder(
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
            // print(registerProvider.states);
            // return Container();
            return SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: AppColors.primaryAlternative,
                            ),
                          ),
                          Text(
                            "Cadastro de Lojista",
                            style: AppTextStyles.title,
                          ),
                          SizedBox(
                            width: 16,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Text(
                            "Dados Pessoais",
                            style: AppTextStyles.subtitle,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomFormField(
                        labelText: "Nome do Proprietário",
                        controller: _ownerNameController,
                        validator: validateGenericText,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomFormField(
                        labelText: "Telefone",
                        controller: _phoneController,
                        validator: validatePhone,
                        keyboardType: TextInputType.phone,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          TelefoneInputFormatter(),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomFormField(
                        labelText: "E-mail",
                        controller: _emailController,
                        validator: validateEmail,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Row(
                        children: [
                          Text(
                            "Endereço",
                            style: AppTextStyles.subtitle,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomFormField(
                        labelText: "CEP",
                        controller: _cepController,
                        keyboardType: TextInputType.number,
                        validator: validateGenericNumber,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          CepInputFormatter(),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      DropdownSearch<StateModel>(
                        // mode: Mode.custom,

                        selectedItem: registerProvider.selectedState,
                        itemAsString: (StateModel item) => item.name,
                        compareFn: (item, selectedItem) => item == selectedItem,
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
                      const SizedBox(
                        height: 16,
                      ),
                      CustomFormField(
                        labelText: "Cidade",
                        controller: _cityController,
                        validator: validateGenericText,
                      ),
                      const SizedBox(
                        height: 16,
                      ),

                      CustomFormField(
                        labelText: "Endereço",
                        hintText: "Cidade, Rua, Avenida, etc.",
                        controller: _addressController,
                        validator: validateGenericText,
                      ),
                      // const SizedBox(
                      //   height: 16,
                      // ),
                      // CustomFormField(
                      //   labelText: "Número",
                      //   controller: _numberController,
                      //   keyboardType: TextInputType.number,
                      // ),
                      // const SizedBox(
                      //   height: 16,
                      // ),
                      // CustomFormField(
                      //   labelText: "Complemento",
                      //   controller: _complementController,
                      // ),

                      const SizedBox(
                        height: 24,
                      ),
                      Row(
                        children: [
                          Text(
                            "Informações da Loja",
                            style: AppTextStyles.subtitle,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      DropdownSearch<StoreCategory>(
                        //                       // mode: Mode.custom,

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
                      CustomFormField(
                        labelText: "Nome da Loja",
                        controller: _storeNameController,
                        validator: validateName,
                      ),

                      const SizedBox(
                        height: 16,
                      ),
                      CustomFormField(
                        labelText: "Capacidade de Pessoas",
                        controller: _storeCapacityController,
                        keyboardType: TextInputType.number,
                        validator: validateGenericNumber,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomFormField(
                        labelText: "Máximo de pessoas por mesa",
                        controller: _storePartyController,
                        keyboardType: TextInputType.number,
                        validator: validateGenericNumber,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomFormField(
                        labelText: "CPF/CNPJ",
                        controller: _cpfCnpjController,
                        validator: validateCpfCnpj,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          CpfOuCnpjFormatter(),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomFormField(
                        labelText: "Senha",
                        controller: _passwordController,
                        validator: validatePassword,
                        obscureText: _obscureText,
                        suffixIcon: IconButton(
                          icon: Icon(_obscureText
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomFormField(
                        labelText: "Confirmar Senha",
                        controller: _confirmPasswordController,
                        validator: (value) {
                          if (value != _passwordController.text) {
                            return "As senhas não coincidem";
                          }
                          return null;
                        },
                        obscureText: _obscureText,
                        suffixIcon: IconButton(
                          icon: Icon(_obscureText
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              style: AppButtonStyles.primaryButtonStyle,
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  _handleRegister();
                                }
                              },
                              child: Text(
                                "Cadastrar",
                                style: AppTextStyles.button.copyWith(
                                  color: Colors.white,
                                ),
                              ),
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
                            child: ElevatedButton(
                              style: AppButtonStyles.secondaryButtonStyle,
                              onPressed: () {
                                // Navigator.pushNamed(context, '/login');
                                Navigator.pop(context);
                              },
                              child: Text(
                                "Entrar no Portal",
                                style: AppTextStyles.button.copyWith(
                                  color: AppColors.primaryAlternative,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
