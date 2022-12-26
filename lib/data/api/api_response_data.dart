class ApiResponseData<T> {
  Status status;
  T? data;
  String? message;

  ApiResponseData.success(this.data) : status = Status.SUCCESS;

  ApiResponseData.error(this.message) : status = Status.ERROR;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}

enum Status { SUCCESS, ERROR }
