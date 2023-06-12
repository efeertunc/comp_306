class Status {
  String? approvalStatus;
  int? numApprovedOrders;

  Status({this.approvalStatus, this.numApprovedOrders});

  Status.fromJson(Map<String, dynamic> json) {
    approvalStatus = json['approval_status'];
    numApprovedOrders = json['num_approved_orders'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['approval_status'] = this.approvalStatus;
    data['num_approved_orders'] = this.numApprovedOrders;
    return data;
  }
}