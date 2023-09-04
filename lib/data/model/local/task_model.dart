class TaskModel {
  int? id;
  String? taskName;
  String? description;
  int? dueDate;
  bool? notification;
  bool? isCompleted;
  String? createDate;

  TaskModel({
    this.taskName,
    this.createDate,
    this.id,
    this.description,
    this.dueDate,
    this.notification,
    this.isCompleted,
  });

  TaskModel.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    dueDate = json['dueDate'];
    notification = json['notification'] == 1;
    isCompleted = json['isCompleted'] == 1;
    taskName = json['taskName'];
    description = json['description'];
    createDate = json['created_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['dueDate'] = this.dueDate;
    data['notification'] = this.notification;
    data['isCompleted'] = this.isCompleted;
    data['taskName'] = this.taskName;
    data['description'] = this.description;
    data['createdDate'] = this.createDate;
    return data;
  }
}
