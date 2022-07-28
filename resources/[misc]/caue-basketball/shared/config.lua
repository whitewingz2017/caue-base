Config = {
    snatch_ball = 50, -- % that you succeed snatching the ball
    allow_dunking = true, -- should people be able to dunk?
    dunk_percent = 20, -- % that you succeed dunking
    easy_mode = true, -- easier to hit the ball, this should be set to true otherwise it is *really* hard to hit the ball

    Courts = {
        { -- Chamberlains
            blip = vector3(-212.88, -1507.64, 31.58),
            start = vector3(-212.88, -1507.64, 31.58),
            ball = vector3(-205.67, -1513.64, 30.64),

            home = {
                vector3(-197.95, -1504.71, 33.97),
                vector3(-197.95, -1504.71, 33.67),
            },

            guest = {
                vector3(-213.09, -1522.69, 33.97),
                vector3(-213.09, -1522.69, 33.67),
            },

            dunking = {
                home = vector4(-198.28, -1505.11, 33.77, 322.52),
                guest = vector4(-212.75, -1522.26, 33.66, 140.95),
            },

            queue = {
                minimum = 1, -- minimum users per team for a match to start
                timer = 15, -- how long (in seconds) until the match starts, after "minimum" users are in queue per team
                game = 300, -- how long (in seconds) a game lasts
            },

            board = {
                enabled = true, -- update the score & time on the board? (this impacts performance, ~0.8ms, but doesn't seem to affect fps)

                heading = 230.0,
                home = vector3(-198.797, -1517.553, 31.623),
                guest = vector3(-200.62, -1519.752, 31.623),
                time = vector3(-199.708, -1518.653, 31.623),
                main = vector3(-199.708, -1518.653, 31.623),
            }
        },
        { -- breze mlo
            blip = vector3(-47.91, -1385.55, 29.49),
            start = vector3(-60.55, -1403.22, 29.49),
            ball = vector3(-60.48, -1395.26, 28.5),

            easy_mode = true, -- makes it easier to make a goal

            home = {
                vector3(-48.9, -1395.35, 31.7),
                vector3(-48.9, -1395.35, 31.4)
            },

            guest = {
                vector3(-72.35, -1395.4, 31.7),
                vector3(-72.35, -1395.4, 31.4)
            },

            dunking = {
                home = vector4(-49.63, -1395.39, 31.5, 261.74),
                guest = vector4(-71.43, -1395.23, 31.5, 92.69)
            },

            queue = {
                minimum = 1, -- minimum users per team for a match to start
                timer = 15, -- how long (in seconds) until the match starts, after "minimum" users are in queue per team
                game = 300, -- how long (in seconds) a game lasts
            },

            -- board = {
            --     enabled = true, -- update the score & time on the board? (this impacts performance, ~0.8ms, but doesn't seem to affect fps)

            --     heading = 180.0,
            --     home = vector3(-59.5, -1404.03, 31.95),
            --     guest = vector3(-62.3, -1404.03, 31.95),
            --     time = vector3(-60.95, -1404.03, 32.225),
            --     main = vector3(-60.44, -1395.18, 29.5),
            -- }
        },
    },
}

Strings = {
    ["blip"] = "Basketball",
    ["home"] = "from home",
    ["guest"] = "Visitor",
    ["join_team"] = "Open ~INPUT_CONTEXT~ to %s on the team \"~b~%s~s~\" (%s no time)\nPress ~INPUT_DETONATE~ para %s no time \"~r~%s~s~\" (%s no time)",
    ["join"] = "join",
    ["leave"] = "leave",

    ["game_progress"] = "There is a game in progress.\nIt ends in: %s %s e %s %s",

    ["waiting"] = "Waiting",
    ["cancelled"] = "The game was canceled due to no players on a team.",

    ["starting"] = "\nThe game starts in %s %s e %s %s",
    ["minute"] = "minute",
    ["minutes"] = "minute",
    ["second"] = "second",
    ["seconds"] = "seconds",

    ["left_queue"] = "You got out of line, after going away.",

    ["steal_ball"] = "Presse [~b~E~s~] to steal the ball",
    ["pickup_ball"] = "Press [~b~E~s~] to catch the ball",
    ["ball_info"] = "Pressu ~INPUT_VEH_DUCK~ to drop the ball\nPress ~INPUT_ATTACK~ to throw the ball\nPress ~INPUT_DETONATE~ to score",

    ["goal"] = "Good pitch! You scored a point for your team.",
    ["better_luck"] = "You didn't catch the ball",
    ["better_luck_dunk"] = "You didn't basket - Better luck next time",

    ["you_lost"] = "Your team ~r~lost~s~. Better luck next time!",
    ["you_won"] = "Your team ~g~ won~s~!",
    ["tie"] = "Your team ~y~ drew~s~ with the other team.",
}