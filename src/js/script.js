function validateForm() {
  var requiredFields = [
    "name",
    "lastname",
    "patronymic",
    "email",
    "phone",
    "username",
    "password",
  ];
  var isValid = true;

  for (var i = 0; i < requiredFields.length; i++) {
    var fieldName = requiredFields[i];
    var fieldValue = document.getElementsByName(fieldName)[0].value.trim();
    var errorMessageId = fieldName + "-error";
    var errorMessageElement = document.getElementById(errorMessageId);

    if (fieldValue === "") {
      errorMessageElement.innerText = "Обязательное поле";
      isValid = false;
    } else {
      errorMessageElement.innerText = "";
    }

    if (fieldName === "email" && !validateEmail(fieldValue)) {
      errorMessageElement.innerText = "Введите корректный email";
      isValid = false;
    }

    if (fieldName === "phone" && !validatePhone(fieldValue)) {
      errorMessageElement.innerText = "Введите корректный номер телефона";
      isValid = false;
    }

    if (
      (fieldName === "name" ||
        fieldName === "lastname" ||
        fieldName === "patronymic") &&
      !validateName(fieldValue)
    ) {
      errorMessageElement.innerText = "Используйте только буквы в ФИО";
      isValid = false;
    }

    if (fieldName === "username" && !validateUsername(fieldValue)) {
      errorMessageElement.innerText =
        "Логин должен содержать только английские буквы";
      isValid = false;
    }

    if (fieldName === "password" && fieldValue.length < 8) {
      errorMessageElement.innerText =
        "Пароль должен содержать не менее 8 символов";
      isValid = false;
    }
  }

  if (isValid) {
    document.getElementById("success-message").innerText =
      "Все данные введены верно";
  } else {
    document.getElementById("success-message").innerText = "";
  }

  return isValid;
}

function validateEmail(email) {
  var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  return emailRegex.test(email);
}

function validatePhone(phone) {
  var phoneRegex = /^\+?[0-9]+$/;
  return phoneRegex.test(phone);
}

function validateName(name) {
  var nameRegex = /^[a-zA-Zа-яА-Я]+$/;
  return nameRegex.test(name);
}

function validateUsername(username) {
  var usernameRegex = /^[a-zA-Z]+$/;
  return usernameRegex.test(username);
}

function showErrorMessage(fieldId, message) {
  var errorMessageElement = document.getElementById(fieldId + "-error");
  errorMessageElement.innerText = message;
}
