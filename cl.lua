Config = {
    ["prop_traffic_03b"] = true,
    ["prop_traffic_lightset_01"] = true,
    ["prop_traffic_01a"] = true,
    ["prop_traffic_01b"] = true,
    ["prop_traffic_01d"] = true,
    ["prop_traffic_02b"] = true,
    ["prop_traffic_02a"] = true,
    ["prop_streetlight_11c"] = true,
    ["prop_streetlight_10"] = true,
    ["prop_streetlight_12a"] = true,
    ["prop_streetlight_11b"] = true,
    ["prop_streetlight_06"] = true,
    ["prop_streetlight_07a"] = true,
    ["prop_streetlight_11a"] = true,
    ["prop_streetlight_15a"] = true,
    ["prop_streetlight_07b"] = true,
    ["prop_streetlight_09"] = true,
    ["prop_snow_streetlight_09"] = true,
    ["prop_streetlight_12b"] = true,
    ["prop_streetlight_08"] = true,
    ["prop_streetlight_04"] = true,
    ["prop_streetlight_14a"] = true,
    ["prop_streetlight_02"] = true,
    ["prop_streetlight_03c"] = true,
    ["prop_snow_streetlight01"] = true,
    ["prop_streetlight_05_b"] = true,
    ["prop_streetlight_03"] = true,
    ["prop_streetlight_01b"] = true,
    ["prop_streetlight_03b"] = true,
    ["prop_streetlight_03d"] = true,
    ["prop_traffic_03a"] = true,
    ["prop_snow_streetlight_01_frag_"] = true,
    ["prop_streetlight_03e"] = true,
    ["prop_streetlight_05"] = true,
    ["prop_streetlight_16a"] = true,
    ["prop_streetlight_01"] = true
}

Citizen.CreateThread(function (threadId)
    local ScriptConfig={}
    for k, v in pairs(Config) do
        ScriptConfig[GetHashKey(k)]=v
    end
    
    while true do
        local GamePool = GetGamePool('CObject')
        for i = 1, #GamePool, 1 do
            local entityModel = GetEntityModel(GamePool[i])
            if ScriptConfig[entityModel] then
                FreezeEntityPosition(GamePool[i],true)
                SetEntityCanBeDamaged(GamePool[i],false)
            end
        end
        Wait(1000)
    end
end)