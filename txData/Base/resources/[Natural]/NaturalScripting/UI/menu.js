const timeout = 150;

window.addEventListener("message", (event) => {
    if (event.data.type === "open") {
        const list = document.getElementById("menu-list");
        const title = document.createElement("h1");
        title.innerHTML = "Natural Roleplay";
        title.classList.add("menu-title");
        list.appendChild(title);
        const hr = document.createElement("hr");
        list.appendChild(hr);
        for (let i = 0; i < event.data.menu.length; i++) {
            const element = document.createElement("div");
            element.innerHTML = "<i class='" + event.data.menu[i].icon + "'></i>" + event.data.menu[i].name;
            element.classList.add("menu-item");
            element.id = event.data.menu[i].id;
            element.addEventListener("click", () => {
                $.post("https://NaturalScripting/menuAction", JSON.stringify({ id: element.id }));
            });
            list.appendChild(element);
        }
        $("#menu-list").animate({ right: "0px", opacity: "1" }, timeout);
    } else if (event.data.type === "close") {
        $("#menu-list").animate({ right: "-20px", opacity: "0" }, timeout);
        setTimeout(() => {
            const list = document.getElementById("menu-list");
            while (list.firstChild) {
                list.removeChild(list.firstChild);
            }
            $.post("https://NaturalScripting/closedMenu");
        }, 1000);
    }
});

document.onkeyup = function (data) {
    if (data.which == 27) {
        $.post("https://NaturalScripting/closeMenu");
    }
}