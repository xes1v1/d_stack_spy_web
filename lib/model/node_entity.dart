class NodeEntity {
  bool boundary;
  String identifier;
  String pageType;
  String action;
  bool animated;
  Map<String, dynamic> params;
  bool homePage;
  String target;
  String base64;

  NodeEntity(
      {this.boundary,
      this.identifier,
      this.pageType,
      this.action,
      this.animated,
      this.params,
      this.homePage,
      this.target,
      this.base64});

  NodeEntity.fromJson(Map<String, dynamic> json) {
    boundary = json['boundary'];
    identifier = json['identifier'];
    pageType = json['pageType'];
    action = json['action'];
    animated = json['animated'];
    params = json['params'];
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
    data['params'] = this.params;
    data['homePage'] = this.homePage;
    data['target'] = this.target;
    data['target'] = this.base64;
    return data;
  }
}
