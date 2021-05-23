ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('dracarys:ajoutreport')
AddEventHandler('dracarys:ajoutreport', function(typereport, reporteur, nomreporter, raison)
    MySQL.Async.execute('INSERT INTO dracarys_report (type, reporteur, nomreporter, raison) VALUES (@type, @reporteur, @nomreporter, @raison)', {
        ['@type'] = typereport,
        ['@reporteur'] = reporteur,
        ['@nomreporter'] = nomreporter,
        ['@raison'] = raison
    })
end)

ESX.RegisterServerCallback('getpoleemploi', function(source, cb)
    MySQL.Async.fetchAll('SELECT type, reporteur, raison FROM dracarys_report', {}, function(result)
        cb(result)  
    end)
end)

RegisterServerEvent('setjob')
AddEventHandler('setjob', function(job)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    xPlayer.setJob(job, 0)  
end)


RegisterServerEvent('Announceureport')
AddEventHandler('Announceureport', function()   
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'VIVE LA FRANCE :', '', 'Nouveau Report!', 'CHAR_MP_FM_CONTACT')
	end
end)





