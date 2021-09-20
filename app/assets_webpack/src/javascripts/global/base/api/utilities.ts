export default class Utilities {
  static getRequest(url) {
    return new Promise(function (resolve, reject) {
      $.ajax({
        url: url,
        dataType: "json",
        contentType: "application/json",
        method: "GET",
        success: resolve,
        error: reject,
      })
    })
  }

  static postRequest(url, data, raw = false) {
    if (!raw) data = JSON.stringify(data)

    return new Promise(function (resolve, reject) {
      $.ajax({
        url: url,
        dataType: "json",
        contentType: raw ? false : "application/json",
        method: "POST",
        data: data,
        success: resolve,
        error: reject,
        processData: !raw,
      })
    })
  }

  static patchRequest(url, data) {
    return new Promise(function (resolve, reject) {
      $.ajax({
        url: url,
        dataType: "json",
        contentType: "application/json",
        method: "PATCH",
        data: JSON.stringify(data),
        success: resolve,
        error: reject,
      })
    })
  }

  static deleteRequest(url) {
    return new Promise(function (resolve, reject) {
      $.ajax({
        url: url,
        dataType: "json",
        contentType: "application/json",
        method: "DELETE",
        success: resolve,
        error: reject,
      })
    })
  }

  // Function to track status of requests
  static reflectResponse(promise) {
    return promise.then(
      (result) => { return { data: result, success: true }  },
      (error)  => { return { error: error, success: false } }
    )
  }
}
