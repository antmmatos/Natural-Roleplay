Locales["sv"] = {
    -- // MISC \\--
    ["radiosuggestion"] = "Öppna Radio",

    -- // COMMAND \\--
    ["command_help"] = "Byt radio kanal",
    ["channel_name"] = "Radio kanal (nummer)",
    ["channel_help"] = "Frekvensen / radio kanalen som du vill byta till",

    -- // NOTIFICATIONS \\--
    ["muted"] = "Du muteade: %s",
    ["unmuted"] = "Du unmuteade: %s",
    ["left"] = "Du lämnade radion",
    ["onanonymous"] = "Du satt igång anonymnt läge",
    ["offanonymous"] = "Du stängde av anonymnt läge",
    ["invalid_params"] = "Värdena som du skrev in är ogiltiga",
    ["change_radio"] = "Du gick med i radio kanal %s",
    ["locked_channel"] = "Du har inte tillgång till radio kanal %s",
    ["player_dead"] = "Du kan inte byta kanaler medans du är död",

    -- // UI / HTML \\--
    ui = {
        notifications = {
            leftRadioTitle = "Lämnade radion",
            leftRadioText = "Du lämnade radio frekvensen",

            lockedChannelTitle = "Låst kanal",
            lockedChannelText = "Du har inte tillgång till denna radio frekvens!",

            joinedRadioTitle = "Gick med i radio",
            joinedRadioText = "Du gick med i radio frekvensen {0}"
        },

        general = {
            goback = "Gå tillbaka",
            volumeUp = "Sänk volymen",
            volumeDown = "Höj volymen",
            turnOff = "Stäng av",
            turnOn = "Sätt på"
        },

        settings = {
            darkMode = "Mörkt läge",
            anonymous = "Anonymtläge",
            allowDrag = "Tillåt dragging",
            size = "Storlek"
        },

        radioMembers = {
            title = "Radio Medlemmar",
            notInChannel = "Du är inte med i någon radio frekvens",
            emptyMembersList = "Denna radio kanal är tom"
        },

        joinRadio = {
            title = "Gå med i radio",
            frequency = "Frekvens",
            join = "Joina frekvens",
            leave = "Lämna frekvens"
        },

        info = {
            statusTitle = "Din status",
            status = "Min status",
            frequency = "Frekvens: {0}",
            radioStatus = "Radio Status",
            openRadioMembers = "Öppna radio medlemmar",
            openSettings = "Öppna inställningar",
            settings = "Inställningar",
            joinRadio = "Gå med i radio",
            notInRadio = "Inte i nån radio",
            inRadio = "I en radio"
        }
    }
}
