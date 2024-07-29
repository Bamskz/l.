--[[
    written by @xn1781 7.28.2024
    tested on: 
    Synapse Z (most stable executor)
]]

--[[ settings ]]

_G.settings = {
    on = true,
    chance = 100,
    hitpart = "Head",
    arrowdist = 15 -- the lower the number the closer the arrow needs to be
}

--[[ vars ]] --

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

local LocalPlayer = Players.LocalPlayer

local Characters = workspace.Characters

--[[ functions ]] --

function GetClosestCharacterToOrigin(Origin)
    local dist = math.huge
    local target
	for i,v in pairs(Characters:GetChildren()) do
		if (v ~= LocalPlayer.Character and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health ~= 0) then
			local dis = (v.HumanoidRootPart.Position-Origin).Magnitude
			if dis < dist then
				target = v
                dist = dis
			end
		end
	end
    return target
end

function Chance(number) 
	return (math.floor(Random.new().NextNumber(Random.new(),0,1) * 100) / 100) <= math.floor(number) / 100
end

--[[ silent aim ]] --

local ArrowResult
local ArrowShot = false
local Hit = false
local ActiveCast = require(ReplicatedStorage.Modules.Tools.Fastcast.Redux.ActiveCast)
local old;old = hookfunction(ActiveCast.new,function(...)
    local results = old(...)
    local names = {}
    for i = 3,10 do
        pcall(function()
            if getinfo(i).name ~= "" then
                table.insert(names,getinfo(i).name)
            end
        end)
    end
    if (table.find(names,"OnFire") and table.find(names,"Fire")) then
        ArrowResult = results
        if Chance(_G.settings.chance) then
            Hit = true
        end
    end
    return results
end)
RunService.RenderStepped:Connect(function()
    if not LocalPlayer or not LocalPlayer.Character then return end
    local tool = LocalPlayer.Character:FindFirstChildOfClass('Tool')
    if not tool then return end
    if not tool:GetAttribute("IsRanged") then return end

    if (ArrowResult and ArrowResult.StateInfo) then
        local Origin = ActiveCast.GetPosition(ArrowResult)
        if (_G.settings.on and Hit) then
            local Closest = GetClosestCharacterToOrigin(Origin)
            local HitPart = _G.settings.hitpart
            if (Closest and Closest:FindFirstChild(HitPart)) then
                if (Closest[HitPart].Position-Origin).Magnitude <= _G.settings.arrowdist then
                    ActiveCast.Pause(ArrowResult)
                    ActiveCast.SetPosition(ArrowResult,Closest[HitPart].Position+Vector3.new(0,0.2 + Closest[HitPart].Size.Y/2,0))
                    ActiveCast.SetVelocity(ArrowResult,Vector3.new(0,-1000,0))
                    ActiveCast.Resume(ArrowResult)
                    Hit = false
                end
            end
        end
    elseif (ArrowResult and not ArrowResult.StateInfo) then
        ArrowResult = nil
    end
end)
