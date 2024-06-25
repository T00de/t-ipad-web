local display = false

function SetDisplay(bool)
    display = bool
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        type = "ui",
        status = bool,
    })
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsControlJustReleased(1, 74) then 
            SetDisplay(not display)
        end
        if IsControlJustReleased(1, 322) and display then 
            SetDisplay(false)
        end
    end
end)

RegisterNUICallback('focus', function(data, cb)
    SetDisplay(false)
    cb('ok')
end)
