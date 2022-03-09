RegisterNetEvent("caue-login:switchCharacter")
AddEventHandler("caue-login:switchCharacter", function()
    TransitionToBlurred(500)
    DoScreenFadeOut(500)

    Citizen.Wait(1000)

    TriggerServerEvent("caue-login:switchCharacter")

    Citizen.Wait(500)

    TriggerEvent("caue-base:sessionStarted")
end)