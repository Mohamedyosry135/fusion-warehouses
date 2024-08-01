class ProfileUpdateModel {
  String? name;
  // String? email;
  List<Attachment?>? attachment;

  ProfileUpdateModel(this.name, this.attachment);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    // data['email'] = email;
    if (this.attachment != null) {
      data['attachments'] = this.attachment!.map((v) => v?.toJson()).toList();
    }
    return data;
  }
}
class Attachment {
  String? name;
  String? file;

  Attachment(this.name, this.file);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['file'] = file;
    return data;
  }
}