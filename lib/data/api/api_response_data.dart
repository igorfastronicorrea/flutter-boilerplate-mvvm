class ApiResponseData<T> {
  StatusResponse status;
  T? data;
  String? message;

  ApiResponseData.success(this.data) : status = StatusResponse.SUCCESS;

  ApiResponseData.error(this.message) : status = StatusResponse.ERROR;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}

enum StatusResponse { SUCCESS, ERROR }
