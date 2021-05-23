ESX = nil
Citizen.CreateThread(function()
	while ESX == nil do
	  TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
	  Citizen.Wait(0)
	end
  end)



  function KeyboardInput(TextEntry, ExampleText, MaxStringLenght)

    AddTextEntry('FMMC_KEY_TIP1', TextEntry) 
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLenght) 
    blockinput = true 

    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do 
        Citizen.Wait(0)
    end
  end


  function listereport()
    
    f5.Menu["~o~liste des reports"].b = {}
    	local players = ESX.Game.GetPlayers()
	for i=1, #players, 1 do
    local id = GetPlayerServerId(players[i])
    ESX.TriggerServerCallback('getpoleemploi', function(dracarys)
      for k, v in pairs(dracarys) do
          table.insert(f5.Menu["~o~liste des reports"].b, {name = "~r~Nom : " .. v.reporteur, ask = "~g~ID : " .. id, askX = true})		
      end
      OpenMenu('~o~liste des reports')

    end)
  end
end

  

 
f5 = {
	Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {0, 0, 0}, Title = "Report" },
	Data = { currentMenu = "Menu interactions", GetPlayerName() }, 
    Events = {
		onSelected = function(self, _, btn, PMenu, menuData, currentButton, currentBtn, currentSlt, result, slide)
			PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
			local slide = btn.slidenum
			local btn = btn.name
			local check = btn.unkCheckbox
			local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
			local playerPed = PlayerPedId()
			local coords = GetEntityCoords(playerPed)
			if btn == "~r~Fermer le menu" then
        CloseMenu('')
        elseif btn == "~g~Faire un report" then
        local nameResults = KeyboardInput("Nom du Joueur/Description:", "", 35)
        local reasonResults = KeyboardInput("Raison du Report: ", "", 200)
            local playerName = GetPlayerName(PlayerId())
            local typereport = "Report"
            TriggerServerEvent('Announceureport')
                 TriggerServerEvent('dracarys:ajoutreport', typereport, playerName, nameResults, reasonResults)
            ESX.ShowNotification('~b~Report ~r~envoyer ~y~avec ~g~succès !')

    
                elseif btn == "~o~Liste des reports" then
                  listereport()
          
      
end
end




	},
	
	Menu = { 
		["Menu interactions"] = { 
			b = { 
                {name = "~g~Faire un report", ask = ">", askX = true}, 
                {name = "~o~Liste des reports", ask = ">", askX = true}, 
                {name = "~p~---------------------------------------------------------------------", askX = true},
                {name = "~r~Fermer le menu", ask = ">", askX = true}, 
			}
        },
        ["~o~liste des reports"] = { 
          b = {}
            },
    
	}
}
		
RegisterCommand('report', function(source) 	
    CreateMenu(f5)
end, false)


Citizen.CreateThread(function()
  while true do
	Citizen.Wait(0)
	if ragdoll then
	  SetPedToRagdoll(GetPlayerPed(-1), 1000, 1000, 0, 0, 0, 0)
	end
  end
end)

print("^0======================================================================^7")
print("^0[^4Author^0] ^7:^0 ^DRACARYS^7")
print("^0[^4Author^0] ^7:^0 ^Dracarys#4727^7")
print("^0======================================================================^7")
