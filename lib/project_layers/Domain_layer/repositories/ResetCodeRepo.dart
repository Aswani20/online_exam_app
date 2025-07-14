import 'package:online_exam_app/project_layers/api_layer/entities/ResetCodeEntity.dart';

abstract class ResetCodeRepo{
  Future<ResetCodeEntity> SendCode(String code);
}