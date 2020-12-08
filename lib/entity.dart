class NodeEntity {
  String messageType;
  NodeData data;

  NodeEntity({this.messageType, this.data});

  NodeEntity.fromJson(Map<String, dynamic> json) {
    messageType = json['messageType'];
    data = json['data'] != null ? new NodeData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['messageType'] = this.messageType;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class NodeData {
  bool boundary;
  String identifier;
  String pageType;
  String action;
  bool animated;
  bool homePage;
  String target;

  NodeData(
      {this.boundary,
      this.identifier,
      this.pageType,
      this.action,
      this.animated,
      this.homePage,
      this.target});

  NodeData.fromJson(Map<String, dynamic> json) {
    boundary = json['boundary'];
    identifier = json['identifier'];
    pageType = json['pageType'];
    action = json['action'];
    animated = json['animated'];
    homePage = json['homePage'];
    target = json['target'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['boundary'] = this.boundary;
    data['identifier'] = this.identifier;
    data['pageType'] = this.pageType;
    data['action'] = this.action;
    data['animated'] = this.animated;
    data['homePage'] = this.homePage;
    data['target'] = this.target;
    return data;
  }

  ///暂时使用target来判断是否是同一个对象
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is NodeData && other.target == target;
  }

  @override
  int get hashCode => target.hashCode;
}
