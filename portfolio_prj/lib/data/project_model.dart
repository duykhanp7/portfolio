import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_model.freezed.dart';
part 'project_model.g.dart';

@freezed
class ProjectModel with _$ProjectModel {
  factory ProjectModel({
    @Default('') String url,
    @Default('') String title,
    @Default('') String content,
    @Default('') String techStack,
    @Default('') String urlLivePreview,
    @Default('') String urlViewCode,
  }) = _ProjectModel;

  factory ProjectModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectModelFromJson(json);
}
