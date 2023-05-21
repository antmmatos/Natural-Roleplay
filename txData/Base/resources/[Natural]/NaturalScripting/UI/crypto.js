let chart;
window.addEventListener("message", (event) => {
    var data = event.data;
    if (data.empty) {
        $('.cryptoList').empty();
    }
    if (data.ShowUI) {
        $('.MainDiv').css('visibility', 'visible').hide().fadeIn('slow');
        $("h3").text(data.PlayerName + "'s Wallet");
        Object.keys(data.CryptoListData).forEach((element) => {
            element = data.CryptoListData[element]
            $(".cryptoList").append(
                `<li><img class="CryptoImage" src=${element["image"]} alt="" /><span id="${element["label"]}" class="LabelToClip">${element["label"]}</span><span id="${element["label"]}Balance" class="balanceOnLi">Balance: 0.001237 (≈ €18,000)</span><!--<button id="${element["label"]}" class="BuyCryptoClass">Buy</button><button id="${element["label"]}" class="SellCryptoClass">Sell</button><button id="${element["label"]}" class="ConvertCryptoClass">Convert</button>--><button id="${element["label"]}" class="CryptoChartBtn ChartCryptoClass">See Chart</button></li>`
            );
        });
        var ListItem;
        Object.keys(data.PlayerAccounts).forEach((account) => {
            Object.keys(data.CryptoListData).forEach((element) => {
                element = data.CryptoListData[element]
                if (account == element["name"]) {
                    ListItem = document.getElementById(element["label"].charAt(0).toUpperCase() + element["label"].slice(1) + "Balance")
                    if (ListItem == null) { console.log(data.PlayerAccounts); console.log(account); return; }
                    ListItem.innerHTML = "Balance: " + element["symbol"] + " " + data.PlayerAccounts[account].toFixed(8) + " (≈ €" + (data.PlayerAccounts[account] * element["price"]).toFixed(2) + ")";
                }
            });
        });
        document.onkeyup = function (data) {
            if (data.which == 27) {
                exit();
            }
        };
    } else if (data.SetCryptoChart) {
        if (data.Error) {
            $('.MainDiv').css('visibility', 'visible').hide().fadeIn('slow');
            fetch(`https://${GetParentResourceName()}/SendChartErrorNotification`, {
                method: "POST"
            });
        } else {
            var jsonCryptoData = JSON.parse(data.ChartData)
            document.getElementById("cryptoName").innerHTML = data.Currency;
            document.getElementById("Balance").innerHTML = "Balance: " + data.CurrencyData["symbol"] + " " + data.AccountsData.toFixed(8) + " (≈ €" + (data.AccountsData * data.CurrencyData["price"]).toFixed(2) + ")";
            document.getElementById("Price").innerHTML = "Price ≈ € " + jsonCryptoData[data.Currency][jsonCryptoData[data.Currency].length-1]["price"].toFixed(2);
            const image = document.getElementsByClassName("CryptoImageData")[0];
            image.src = data.CurrencyData["image"];
            var CryptoValues = [];
            var CryptoValuesDate = [];
            for (var i = 0; i < Object.keys(jsonCryptoData[data.Currency]).length; i++) {
                CryptoValues.push(timeConverter(jsonCryptoData[data.Currency][i]["date"]));
                CryptoValuesDate.push(jsonCryptoData[data.Currency][i]["price"]);
            }
            var canvas = document.getElementById("Canvas");
            var ctx = canvas.getContext('2d');
            const chartToCreate = {
                labels: CryptoValues,
                datasets: [{
                    label: data.Currency + " Price",
                    data: CryptoValuesDate,
                    fill: false,
                    borderColor: 'rgb(75, 192, 192)',
                    tension: 0.1
                }]
            };
            chart = new Chart(ctx, {
                type: 'line',
                data: chartToCreate,
                options: {
                    responsive: true,
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    },
                    plugins: {
                        legend: {
                            onClick: null
                        }
                    }
                }
            });
            const btns = document.getElementById("buttonList")
            btns.innerHTML = `<button id="${data.Currency}" class="BuyCryptoClass">Buy</button><button id="${data.Currency}" class="SellCryptoClass">Sell</button><button id="${data.Currency}" class="ConvertCryptoClass">Convert</button>`;
            $('.CryptoDiv').css('visibility', 'visible').hide().fadeIn('slow');
            document.onkeyup = function (data) {
                if (data.which == 27) {
                    chart.destroy();
                    exit();
                } else if (data.which == 8) {
                    chart.destroy();
                    $('.CryptoDiv').fadeOut(500, function () {
                        $('.CryptoDiv').css({ "visibility": "hidden" });
                    });
                    $('.MainDiv').css('visibility', 'visible').hide().fadeIn('slow');
                }
            };
        }
    }
});

function timeConverter(UNIX_timestamp) {
    var date = new Date(UNIX_timestamp);
    var time = date.toLocaleDateString("en-GB");
    return time;
}

function exit() {
    $(".cryptoList").animate({ scrollTop: 0 }, "slow");
    $('.MainDiv').fadeOut(500, function () {
        $('.MainDivv').css({ "visibility": "hidden" });  // <-- Style Overwrite 
    });
    $('.CryptoDiv').fadeOut(500, function () {
        $('.CryptoDiv').css({ "visibility": "hidden" });  // <-- Style Overwrite 
    });
    $('.cryptoList').empty();
    chart?.destroy();
    fetch(`https://${GetParentResourceName()}/Close`, {
        method: "POST",
    });
}

$(document).on("click", ".BuyCryptoClass", function (event) {
    $('.MainDiv').fadeOut(500, function () {
        $('.MainDiv').css({ "visibility": "hidden" });  // <-- Style Overwrite 
    });
    exit();
    fetch(`https://${GetParentResourceName()}/BuyCrypto`, {
        method: "POST",
        body: JSON.stringify({
            Crypto: event.target.id
        })
    });
});
$(document).on("click", ".SellCryptoClass", function (event) {
    $('.MainDiv').fadeOut(500, function () {
        $('.MainDiv').css({ "visibility": "hidden" });  // <-- Style Overwrite 
    });
    exit();
    fetch(`https://${GetParentResourceName()}/SellCrypto`, {
        method: "POST",
        body: JSON.stringify({
            Crypto: event.target.id
        })
    });
});
$(document).on("click", ".ConvertCryptoClass", function (event) {
    $('.MainDiv').fadeOut(500, function () {
        $('.MainDiv').css({ "visibility": "hidden" });  // <-- Style Overwrite 
    });
    exit();
    fetch(`https://${GetParentResourceName()}/ConvertCrypto`, {
        method: "POST",
        body: JSON.stringify({
            Crypto: event.target.id
        })
    });
});
$(document).on("click", ".ChartCryptoClass", function (event) {
    $('.MainDiv').fadeOut(500, function () {
        $('.MainDiv').css({ "visibility": "hidden" });  // <-- Style Overwrite 
    });
    fetch(`https://${GetParentResourceName()}/SetCrypto`, {
        method: "POST",
        body: JSON.stringify({
            Crypto: event.target.id
        })
    });
});