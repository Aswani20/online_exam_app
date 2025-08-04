import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/di/di.dart';
import 'package:online_exam_app/core/route/app_routes.dart';
import 'package:online_exam_app/core/theme/app_colors.dart';
import 'package:online_exam_app/core/theme/app_styles.dart';
import 'package:online_exam_app/extensions/project_extensions.dart';
import 'package:online_exam_app/project_layers/presentation_layer/profile/cubit/profile_view_model.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final ProfileViewModel _viewModel = getIt<ProfileViewModel>();
  bool _dataInitialized = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _viewModel..getProfile(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            context.l10n.profile,
            style: AppStyles.appBarTitleStyle,
          ),
          automaticallyImplyLeading: false,
          leading: Padding(
            padding: EdgeInsets.only(left: 8),
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          leadingWidth: 30,
        ),
        body: BlocBuilder<ProfileViewModel, ProfileState>(
            builder: (context, state){
              if(state is ProfileLoadingState){
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              else if(state is ProfileErrorState){
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.errMessage)),
                  );
                });
                return const Center(child: Text("Something went wrong."));
              }
              else if(state is ProfileSuccessState){
                if(!_dataInitialized){
                  _populateControllers(state);
                  _dataInitialized = true;
                }

                return SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: buildProfileForm(context, _viewModel)
                );
              }
              else if(state is ProfileUpdatedState){
                if(!_dataInitialized){
                  _populateUpdatedControllers(state);
                  _dataInitialized = true;
                }

                return SingleChildScrollView(
                    padding: const EdgeInsets.all(16.0),
                    child: buildProfileForm(context, _viewModel)
                );
              } else {
                return const Center(child: Text('Initializing...'));
              }
            }
        ),
      ),
    );
  }

  Widget buildProfileForm(BuildContext context, ProfileViewModel viewModel) {
    return Form(
      key: viewModel.formKey,
      child: Column(
        children: [
          _buildTextField(
            controller: viewModel.userNameController,
            label: context.l10n.userName,
            hint: viewModel.userNameController.text,
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: _buildTextField(
                  controller: viewModel.firstNameController,
                  label: context.l10n.firstName,
                  hint: viewModel.firstNameController.text
                ),
              ),
              Expanded(
                child: _buildTextField(
                  controller: viewModel.lastNameController,
                  label: context.l10n.lastName,
                  hint: viewModel.lastNameController.text
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          _buildTextField(
              controller: viewModel.emailController,
              label: context.l10n.email,
              hint: viewModel.emailController.text
          ),
          SizedBox(height: 10),
          _buildPasswordField(
              label: context.l10n.password
          ),
          SizedBox(height: 10),
          _buildTextField(
              controller: viewModel.phoneNumberController,
              label: context.l10n.phoneNumber,
              hint: viewModel.phoneNumberController.text
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
                if(_viewModel.formKey.currentState!.validate()){
                  _viewModel.updateProfile();
                }
            },
            child: Text(context.l10n.update),
          )
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
              labelText: label,
              hintText: hint,
              border: const OutlineInputBorder(),
              isDense: true
          ),
          keyboardType: keyboardType,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter $label';
            }
            return null;
            },
        ),
      ),
    );
  }


  Widget _buildPasswordField({
    required String label,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,
        child: TextFormField(
          enabled: false,
          decoration: InputDecoration(
            labelText: '********',
            hintText: label,
            border: const OutlineInputBorder(),
            suffixIcon: TextButton(
                onPressed: (){
                      Navigator.pushNamed(
                      context,
                      AppRoutes.changePasswordScreen
                  );
                },
                child: Text(
                  context.l10n.change,
                  style: AppStyles.mediumBlack16Style.copyWith(
                    color: AppColors.blue,
                  ),
                )
            )
          ),
        ),
      ),
    );
  }

  void _populateControllers(ProfileSuccessState state) {
    _viewModel.userNameController.text = state.responseEntity.user?.username ?? '';
    _viewModel.firstNameController.text = state.responseEntity.user?.firstName ?? '';
    _viewModel.lastNameController.text = state.responseEntity.user?.lastName ?? '';
    _viewModel.emailController.text = state.responseEntity.user?.email ?? '';
    _viewModel.phoneNumberController.text = state.responseEntity.user?.phone ?? '';
  }

  void _populateUpdatedControllers(ProfileUpdatedState state) {
    _viewModel.userNameController.text = state.responseEntity.user?.username ?? '';
    _viewModel.firstNameController.text = state.responseEntity.user?.firstName ?? '';
    _viewModel.lastNameController.text = state.responseEntity.user?.lastName ?? '';
    _viewModel.emailController.text = state.responseEntity.user?.email ?? '';
    _viewModel.phoneNumberController.text = state.responseEntity.user?.phone ?? '';
  }
}

