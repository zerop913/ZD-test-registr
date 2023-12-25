function validateForm() {
  var requiredFields = ["email", "username", "password"];
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
  }
}

document.addEventListener("DOMContentLoaded", function () {
  const form = document.querySelector("form");
  form.addEventListener("submit", function (event) {
    event.preventDefault();

    const formData = new FormData(form);

    fetch("./php/authorization.php", {
      method: "POST",
      body: formData,
    })
      .then((response) => response.text())
      .then((message) => {
        if (message.includes("Добро пожаловать")) {
          alert(message);
        } else {
          alert(message);
        }
      })
      .catch((error) => console.error("Ошибка:", error));
  });
});
