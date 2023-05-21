$(document).ready(function () {
    var s_Handbrake;
    var speedText = '';
    HealthBar = new ProgressBar.Circle("#health", {
        color: "#d11002",
        trailColor: "#4f0500",
        strokeWidth: 12,
        trailWidth: 12,
        duration: 250,
        easing: "easeInOut",
    });

    ArmourBar = new ProgressBar.Circle("#armour", {
        color: "#1e8c01",
        trailColor: "#215713",
        strokeWidth: 12,
        trailWidth: 12,
        duration: 250,
        easing: "easeInOut",
    });

    StaminaBar = new ProgressBar.Circle("#stamina", {
        color: "#ffb700",
        trailColor: "#876100",
        strokeWidth: 12,
        trailWidth: 12,
        duration: 250,
        easing: "easeInOut",
    });

    HungerBar = new ProgressBar.Circle("#hunger", {
        color: "#bf6102",
        trailColor: "#6e3700",
        strokeWidth: 12,
        trailWidth: 12,
        duration: 250,
        easing: "easeInOut",
    });

    ThirstBar = new ProgressBar.Circle("#thirst", {
        color: "#0083ab",
        trailColor: "#013445",
        strokeWidth: 12,
        trailWidth: 12,
        duration: 250,
        easing: "easeInOut",
    });

    StressBar = new ProgressBar.Circle("#stress", {
        color: "#ab028c",
        trailColor: "#5c0148",
        strokeWidth: 12,
        trailWidth: 12,
        duration: 250,
        easing: "easeInOut",
    });

    VoiceBar = new ProgressBar.Circle("#voice", {
        color: "#ffffff",
        trailColor: "#b3b3b3",
        strokeWidth: 12,
        trailWidth: 12,
        duration: 250,
        easing: "easeInOut",
    });

    FuelBar = new ProgressBar.Circle("#fuel", {
        color: "#db7500",
        trailColor: "#4d2900",
        strokeWidth: 12,
        trailWidth: 12,
        duration: 250,
        easing: "easeInOut",
    });

    VoiceBarPath = document.querySelector('#voice > svg > path:last-child');
    window.addEventListener("message", (event) => {
        var data = event.data;
        if (data.setHud) {
            switch (data.voice) {
                case 1:
                    data.voice = 33;
                    break;
                case 2:
                    data.voice = 66;
                    break;
                case 3:
                    data.voice = 100;
                    break;
                default:
                    data.voice = 66;
                    break;
            }
            if (data.health <= 0) {
                HealthBar.animate(0);
            }
            else {
                HealthBar.animate(data.health / 100);
            }
            ArmourBar.animate(data.armour / 100);
            HungerBar.animate(data.hunger / 100);
            ThirstBar.animate(data.thirst / 100);
            StaminaBar.animate(data.stamina / 100);
            VoiceBar.animate(data.voice / 100);
            StressBar.animate(data.stress / 100);
            if ((data.health / 100) == 1) {
                $(".health").fadeOut(500);
            } else {
                $(".health").fadeIn(500);
            }
            if ((data.armour / 100) == 0) {
                $(".armour").fadeOut(500);
            } else {
                $(".armour").fadeIn(500);
            }
            if (parseFloat(data.hunger / 100).toFixed(2) >= 0.95) {
                $(".hunger").fadeOut(500);
            } else {
                $(".hunger").fadeIn(500);
            }
            if (parseFloat(data.thirst / 100).toFixed(2) >= 0.95) {
                $(".thirst").fadeOut(500);
            } else {
                $(".thirst").fadeIn(500);
            }
            if ((data.stamina / 100) == 1) {
                $(".stamina").fadeOut(500);
            } else {
                $(".stamina").fadeIn(500);
            }
            if (parseFloat(data.stress / 100).toFixed(2) <= 0.10) {
                $(".stress").fadeOut(500);
            } else {
                $(".stress").fadeIn(500);
            }
            if (data.radioOn > 0) {
                $("#voice > i").removeClass("fa-microphone");
                $("#voice > i").addClass("fa-walkie-talkie");
                if (data.talkingRadio) {
                    $("#voice > i").css("color", "#ff4a4a");
                } else if (data.isTalking) {
                    $("#voice > i").css("color", "#faee4d");
                    VoiceBarPath.setAttribute("stroke", "#faee4d");
                } else {
                    $("#voice > i").css("color", "#ffffff");
                    VoiceBarPath.setAttribute("stroke", "#ffffff");
                }
            } else {
                $("#voice > i").removeClass("fa-walkie-talkie");
                $("#voice > i").addClass("fa-microphone");
                if (data.isTalking) {
                    $("#voice > i").css("color", "#faee4d");
                    VoiceBarPath.setAttribute("stroke", "#faee4d");
                } else {
                    $("#voice > i").css("color", "#ffffff");
                    VoiceBarPath.setAttribute("stroke", "#ffffff");
                }
            }
        }
        if (data.ShowHud) {

            inVehicle = true;
            s_PlayerID = data.PlayerID;
            s_Rpm = data.CurrentCarRPM;
            s_Speed = data.CurrentCarSpeed;
            s_Kmh = data.CurrentCarKmh;
            s_Gear = data.CurrentCarGear;
            s_IL = data.CurrentCarIL;
            s_Handbrake = data.CurrentCarHandbrake;
            s_Brake = data.CurrentCarBrake;
            s_LS_r = data.CurrentCarLS_r;
            s_LS_o = data.CurrentCarLS_o;
            s_LS_h = data.CurrentCarLS_h;
            fuel = data.CurrentCarFuel;
            CalcSpeed = s_Kmh;
            CalcRpm = (s_Rpm * 9);

            if (CalcSpeed > 999) {
                CalcSpeed = 999;
            }
            $(".fuel").fadeIn(500);
            FuelBar.animate(fuel / 100);
            // Vehicle RPM display
            $("#rpmshow").attr("data-value", CalcRpm.toFixed(2));

            // Vehicle Gear display
            if (s_Gear == 0) {
                $(".geardisplay span").html("R");
                $(".geardisplay").attr("style", "color: #FFF;border-color:#FFF;");
            } else {
                $(".geardisplay span").html(s_Gear);
                if (CalcRpm > 7.5) {
                    $(".geardisplay").attr("style", "color: rgb(235,30,76);border-color:rgb(235,30,76);");
                } else {
                    $(".geardisplay").removeAttr("style");
                }
            }

            // Vehicle speed display
            if (CalcSpeed > 100) {
                var tmpSpeed = Math.floor(CalcSpeed) + '';
                speedText = '<span class="int1">' + tmpSpeed.substr(0, 1) + '</span><span class="int2">' + tmpSpeed.substr(1, 1) + '</span><span class="int3">' + tmpSpeed.substr(2, 1) + '</span>';
            } else if (CalcSpeed > 10 && CalcSpeed < 100) {
                var tmpSpeed = Math.floor(CalcSpeed) + '';
                speedText = '<span class="gray int1">0</span><span class="int2">' + tmpSpeed.substr(0, 1) + '</span><span class="int3">' + tmpSpeed.substr(1, 1) + '</span>';
            } else if (CalcSpeed > 0 && CalcSpeed < 10) {
                speedText = '<span class="gray int1">0</span><span class="gray int2">0</span><span class="int3">' + Math.floor(CalcSpeed) + '</span>';
            } else {
                speedText = '<span class="gray int1">0</span><span class="gray int2">0</span><span class="gray int3">0</span>';
            }

            // Handbrake
            if (s_Handbrake) {
                $(".handbrake").html("HBK");
            } else {
                $(".handbrake").html('<span class="gray">HBK</span>');
            }

            // Brake ABS
            if (s_Brake > 0) {
                $(".abs").html("ABS");
            } else {
                $(".abs").html('<span class="gray">ABS</span>');
            }

            // Display speed and container
            $(".speeddisplay").html(speedText);
            $("#container").fadeIn(500);

        } else if (data.HideHud) {
            $(".fuel").fadeOut(500);
            // Hide GUI
            $("#container").fadeOut(500);
            inVehicle = false;
        }
    });
});