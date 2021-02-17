console.log("funza")

window.addEventListener("load", () => {

    // BACK BUTTON

    let backButton = document.getElementById("backButton");
    if (backButton != undefined && backButton != null) {
        backButton.onmouseover = function () {
            document.getElementById("backButtonSpan").innerText = "Return";
        }

        backButton.onmouseout = function () {
            document.getElementById("backButtonSpan").innerText = "";
        }
    } else console.log("backButton==null")

});