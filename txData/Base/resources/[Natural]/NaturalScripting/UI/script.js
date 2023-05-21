window.addEventListener("message", (event) => {
    const h1 = document.getElementById("counter");
    if (event.data.acao == "update") {
        h1.textContent = "Influência: " + event.data.counter;
    } else if (event.data.acao == "start") {
        $("#counter").fadeIn();
        h1.textContent = "Influência: " + event.data.counter;
    } else if (event.data.acao == "stop") {
        $("#counter").fadeOut();
    }
});