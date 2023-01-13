class ApiResponse<T> {
  StatusResponse status;
  T? data;
  String? message;

  ApiResponse.initial(this.message) : status = StatusResponse.INITIAL;

  ApiResponse.loading(this.message) : status = StatusResponse.LOADING;

  ApiResponse.completed(this.data) : status = StatusResponse.COMPLETED;

  ApiResponse.error(this.message) : status = StatusResponse.ERROR;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}

enum StatusResponse { INITIAL, LOADING, COMPLETED, ERROR }
