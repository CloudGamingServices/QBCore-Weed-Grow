
local QBCore = exports['qb-core']:GetCoreObject()

-------------------------------- 

QBCore.Functions.CreateUseableItem('weed_seed', function(src)
    UseItem(src)
end)

-------------------------------- 

function getplayer(source)
	xPlayer = QBCore.Functions.GetPlayer
	return xPlayer
end

-------------------------------- 

function nofity(source,text)
    local zrt = getplayer()
    local xPlayer = zrt(source)
    TriggerClientEvent('QBCore:Notify', src, text)
end

-------------------------------- 

function removeitem(source,name,count)
    local src = source
    if Config.Inventory == "default" then
        local zrt = getplayer()
        local xPlayer = zrt(src)	
        xPlayer.Functions.RemoveItem(name, count)
    elseif Config.Inventory == "ox_inventory" then 
        exports.ox_inventory:RemoveItem(src, name, count)
    elseif Config.Inventory == "quasar" then 
        exports['qs-inventory']:RemoveItem(src, name, count)
    else
        
        -- Other Export
    end
end

function getitem(source, item)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    local itemCount = 0

    if xPlayer then
        if Config.Inventory == "default" then
            local itemData = xPlayer.Functions.GetItemByName(item)
            if itemData then
                itemCount = itemData.amount
            end
        elseif Config.Inventory == "ox_inventory" then 
            itemCount = exports.ox_inventory:GetItemCount(source, item)
        elseif Config.Inventory == "quasar" then 
            itemCount = exports['qs-inventory']:GetItemTotalAmount(source, item)
        else
            -- Handle other inventory systems or provide a default behavior
            -- For now, set itemCount to 0 if the inventory system is not recognized
        end
    else
        -- Handle the case where xPlayer is nil (player not found)
    end

    return itemCount or 0
end



-------------------------------- 

function additem(source,n,c)
    local src = source
    if Config.Inventory == "default" then
        local zrt = getplayer()
        local xPlayer = zrt(src)
        xPlayer.Functions.AddItem('weed', amount)
    elseif Config.Inventory == "ox_inventory" then 
        exports.ox_inventory:AddItem(src, n, c)
    elseif Config.Inventory == "quasar" then 
        exports['qs-inventory']:AddItem(src,n,c)
    else
        -- Other Export
    end
end