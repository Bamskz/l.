--- [[ START OF SOURCE ]] ---

if getgenv().executed then
	return
end
getgenv().executed = true

local t = tick()

repeat task.wait() until game:IsLoaded()

local Players = game:GetService("Players")
local LocalPlayer = game.Players.LocalPlayer
local Character = LocalPlayer:WaitForChild("Character")
local RootPart = Character:FindFirstChild("HumanoidRootPart")

local sVersion = "v1.6.2"

local NotificationHolder = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Module.Lua"))()
local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Client.Lua"))()

local normTag = "Lumware "..sVersion.." (Premium) ⭐"

local bro = Instance.new("Sound", game.CoreGui)
bro.SoundId = "rbxassetid://5153735602"
bro.Volume = 1
bro.Name = "i_think"

local bro2 = Instance.new("Sound", game.CoreGui)
bro2.SoundId = "rbxassetid://5153736658"
bro2.Volume = 1
bro2.Name = "im_retarded"

local nobro = Instance.new("Sound", game.CoreGui)
nobro.SoundId = "rbxassetid://138088905"
nobro.Volume = 1
nobro.Name = "i_have_autism"

print("yooo")

task.wait(1)
bro:Play()
Notification:Notify(
	{Title = "Lumware "..sVersion.." (Premium) is loaded.", Description = "You're whitelisted, "..LocalPlayer.DisplayName.."! Make sure to vouch in the #vouch channel after using this."},
	{OutlineColor = Color3.fromRGB(110, 255, 124),Time = 10, Type = "default"},
	{Image = "http://www.roblox.com/asset/?id=", ImageColor = Color3.fromRGB(0, 255, 60)}
)

task.wait(1)
Notification:Notify(
	{Title = "Please wait until loader is finished.", Description = "Please wait for the GUI to load in fully, make sure to wait until the 'Others' page to load as well."},
	{OutlineColor = Color3.fromRGB(110, 255, 124),Time = 10, Type = "default"},
	{Image = "http://www.roblox.com/asset/?id=", ImageColor = Color3.fromRGB(0, 255, 60)}
)

task.wait(1)
Notification:Notify(
	{Title = "Changelog ("..sVersion.."):", Description = "Teleport feature is here! check LocalPlayer Tab at the end of the feature. (Thanks len.)"},
	{OutlineColor = Color3.fromRGB(110, 255, 124),Time = 15, Type = "default"},
	{Image = "http://www.roblox.com/asset/?id=", ImageColor = Color3.fromRGB(0, 255, 60)}
)

task.wait(1)
Notification:Notify(
	{Title = "Removed Rollback.", Description = "This is only for testing and will added back in the future once SV3 dropped in."},
	{OutlineColor = Color3.fromRGB(110, 255, 124),Time = 15, Type = "default"},
	{Image = "http://www.roblox.com/asset/?id=", ImageColor = Color3.fromRGB(0, 255, 60)}
)


task.wait(3)

-- init
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/zMaaaaaaark/UI-/main/uilib2.lua"))()
local venyx = library.new(normTag, 5013109572)

-- themes
local themes = {
	Background = Color3.fromRGB(24, 24, 24),
	Glow = Color3.fromRGB(0, 0, 0),
	Accent = Color3.fromRGB(10, 10, 10),
	LightContrast = Color3.fromRGB(20, 20, 20),
	DarkContrast = Color3.fromRGB(14, 14, 14),  
	TextColor = Color3.fromRGB(255, 255, 255)
}

local RunService = game:GetService("RunService")
local StarterGui = game:GetService("StarterGui")
local UserInputService = game:GetService("UserInputService")
local mouse = Players.LocalPlayer:GetMouse()
local nevermore_modules = rawget(require(game:GetService("ReplicatedStorage").Framework.Nevermore), "_lookupTable")
local network = rawget(nevermore_modules, "Network")
local remotes_table = getupvalue(getsenv(network).GetEventHandler, 1)
local events_table = getupvalue(getsenv(network).GetFunctionHandler, 1)
local modules = {}
local remotes = {}
local lines = {}
local texts = {}
local players = {}
local boxes = {}
local boxoutlines = {}
local healthbars = {}
local healthbaroutlines = {}

local straferange = 1
local ARROW
local closest
local flying
local holdingm2 = false
local aimbotLocked
local retard
local shot = false
local arrowsshooted = 1
local angle = 0

local walkspeed = 16
local infjump
local antidamage
local autospawn
local noclipping = false
local apdist = 1
local autoparry_chance = 1
local antiparry_chance = 1
local tracersenabled
local nofall
local textenabled
local noclip
local stompaura
local jumppower = 50
local killsay = false
local killaura = false
local hidename = false
local aimbot
local silentaim
local autoequip = false
local nospread
local jumppowerenabled = false
local walkspeedenabled = false
local instantcharge = false
local boxesenabled = false
local targetStrafe = false

local debounce = false
local AutoCD_Debounce = true
local AntiCD_Debounce = true
local autoparrycooldown = 0
local kahealthenabled
local killaurahitcooldown = 0.065

local HL = Instance.new("Highlight",game.CoreGui)
HL.FillColor = Color3.fromRGB(97, 242, 136)
HL.FillTransparency = 1
HL.OutlineTransparency = 1

-- CONFIGURATIONS

local Settings = {

	--// Auto-Parry Configs
	autoparry = false,
	equiptool = false,
	apdist = 1,
	autoparrycooldown = 0,
	remAP = false,
	kpAP = false,

	--// Anti-Parry Configs
	antiparry = false,
	antiparryrange = 15,
	antiparrycooldown = 0,

	--// Parry Miscallenous
	noparrycd = false,
	noparrycollision = false,
	noparryslow = false,
	noparrystun = false,

	--// LocalPlayer
	infstam = false,
	infiniteair = false,
	nodashcd = false,
	nojumpcooldown = false,
	noragdoll = false,
	instantrev = false,
	autospawn = false,
	fastres = false,
	noclipping = false,
	walkspeedenabled = false,
	jumppowerenabled = false,
	antidown = false,
	nfd = false,
	nbt = false,
	fastplrrev = false,
	nkb = false,
	arwd = false,
	vfly = false,
	rfly = false,
	strafe = false,
	straferange = 1,
	ctp = false,
	tpkeybind = _G.TPKeybind,

	instantthrow = false,
	nocarryslow = false,
	nothrowslow = false,

	--// Kill Aura
	killaura = false,
	kawhitelist = false,
	kacooldownewapon = false,
	kaparrycheck = false,
	killauradistance = 1,
	attackoneka = false,
	attackmultika = false,
	kahealthenabled = false,
	None = false,

	stompaura = false,
	finish = false,
	glory = false,

	--// Ranged Stuffs
	aimbot = false,
	silentaim = false,
	highlight = false,
	highlightcolor = Color3.fromRGB(255, 255, 255),
	silentaimhitchance = 1,
	silentaimhitboxexpander = 1,
	hitpart = "",
	WallBang = false,
	norecoil = false,
	nospread = false,
	nogravity = false,
	infrange = false,	
	instacharge = false,

	--// ESP
	Box = false,
	Tracers = false,
	Names = false,
	NamesSize = 1,

	--// Miscallenous
	did = false,

};

makefolder("Lumware")

function SaveSettings()
	local JSON
	local HttpService = game:service('HttpService')
	JSON = HttpService:JSONEncode(Settings)
	if isfile('Lumware\\LumwareConfig.cfg') then
		delfile('Lumware\\LumwareConfig.cfg')
	end
	Settings.highlightcolor = HL.OutlineColor
	writefile('Lumware\\LumwareConfig.cfg', JSON)
	if isfile('Lumware\\LumwareConfig.cfg') then
		if readfile('Lumware\\LumwareConfig.cfg', Settings.killaura == true) then
			Settings.killaura = true
			if Settings.killaura == false then
				Settings.killaura = true
			end
		end
	end
end

function LoadSettings()
	local HttpService = game:service('HttpService')
	if isfile('Lumware\\LumwareConfig.cfg') then
		Settings = HttpService:JSONDecode(readfile('Lumware\\LumwareConfig.cfg'))
	end
end

function ResetSettings()
	local HttpService = game:service('HttpService')
	if isfile('Lumware\\LumwareConfig.cfg') then
		delfile('Lumware\\LumwareConfig.cfg')
	end
end

function Rejoin()
	local ts = game:GetService("TeleportService")
	ts:Teleport(game.PlaceId, game.Players.LocalPlayer)
end

LoadSettings() -- Load settings from before

-- END OF CONFIGURATIONS

for i,v in pairs(nevermore_modules) do
	modules[i] = require(v)
end

setmetatable(remotes, {
	__call = function(table2, ...)
		local args = {...}

		table.insert(args, print)

		table2[args[1]]:FireServer(args[2])
	end
})

do
	for i, v in pairs(remotes_table) do
		-- index is name, value is info table
		remotes[i] = rawget(v, "Remote")
	end
	for i, v in pairs(events_table) do
		-- index is name, value is info table
		remotes[i] = rawget(v, "Remote")
	end
end

local old;old=hookfunction(debug.info,function(context,type)
	if context == 2 and type == "s" then
		return true
	end
	return old(context,type)
end)

RunService.Stepped:Connect(function()
	for i, v in pairs(getconnections(game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid"):GetPropertyChangedSignal("WalkSpeed"))) do
		v:Disable()
	end
	for i, v in pairs(getconnections(game:GetService("Players").LocalPlayer.Character.Humanoid:GetPropertyChangedSignal("JumpPower"))) do
		v:Disable()
	end
	for _,v in pairs(getconnections(game:GetService("ScriptContext").Error)) do
		v:Disable()
	end
	for _,v in pairs(getconnections(game:GetService("LogService").MessageOut)) do
		v:Disable()
	end
		--[[
		modules["AntiCheatConstants"].ANTI_CHEAT_KICK_MSG = ""
		modules["AntiCheatConstants"].REQUIRED_CHARACTER_BODY_MOVER_TAG_NAME = "vqwe4vq54w7-5fb1-w9wv-834f-324135c454"
		modules["AntiCheatConstants"].ANTI_CHEAT_KICK_MSG = nil
		modules["AntiCheatConstants"].REQUIRED_CHARACTER_BODY_MOVER_TAG_NAME = nil
		]]
end)

--// hook funcs
hookfunction(modules["AntiCheatHandlerClient"]._startModule, function(...)
	return
end)

hookfunction(modules["AntiCheatHandlerClient"].createNotification, function(...)
	return
end)

hookfunction(modules["AntiCheatHandlerClient"].punish, function(...)
	return
end)

hookfunction(modules["AntiCheatHandler"].punish, function(...)
	return
end)

hookfunction(modules["AntiCheatHandler"].getIsBodyMoverCreatedByGame, function(...)
	return 
end)

hookfunction(modules["LimbDismembermentHandlerClient"].getIsLimbDismembermentEnabled, function(...)
	return
end)

hookfunction(modules["LimbDismembermentHandlerClient"].createLimbDismembermentWound, function(...)
	return
end)

hookfunction(modules["LimbDismembermentHandlerClient"].createBoneFragment, function(...)
	return
end)

hookfunction(modules["LimbDismembermentHandlerClient"].detachPart, function(...)
	return
end)

hookfunction(modules["LimbDismembermentHandlerClient"]._initModule, function(...)
	return
end)

hookfunction(modules["LimbDismembermentHandlerClient"]._startModule, function(...)
	return
end)

hookfunction(modules["LimbDismembermentHandler"].setIsLimbDismembered, function(...)
	return
end)

hookfunction(modules["LimbDismembermentHandler"].getCanDismemberLimb, function(...)
	return
end)

hookfunction(modules["LimbDismembermentHandler"].getIsLimbDismembered, function(...)
	return
end)

hookfunction(modules["LimbDismembermentHandler"].getRandomLimb, function(...)
	return
end)

hookfunction(modules["LimbDismembermentHandler"].getIsLethalLimb, function(...)
	return
end)

--[[
do
	
	local anticheats = {
		'AntiBodyMoverClient',
		'AntiFlyClient',
		'AntiInfJumpClient',
		'AntiInjectClient',
		'AntiSpeedClient',
		'SanityChecksClient',
		'AntiCheatHandlerClient',
		'AntiCheatHandler',
		'LightingUtil'
	}
	
	local reg = getreg()
	for i=1,#reg do
		local thread = reg[i]
		if not (type(thread) == 'thread') then continue end

		local source = debug.info(thread,1,'s')
		if source then
			for i,v in pairs(anticheats) do
				if source:sub(-v:len(),-1) == v then
					task.cancel(thread)
				end
			end
		end
	end
	for i,connection in pairs(getconnections(Players.LocalPlayer.CharacterAdded)) do
		pcall(function()
			local src = debug.getinfo(connection.Function,'s').source
			if src:sub(-22,-1) == 'AntiCheatHandlerClient' then
				connection:Disable()
			end
		end)
	end
	if Players.LocalPlayer.Character then
		for i,connection in pairs(getconnections(Players.LocalPlayer.CharacterRemoving)) do
			pcall(function()
				local src = debug.getinfo(connection.Function,'s').source
				if src:sub(-22,-1) == 'AntiCheatHandlerClient' then
					local maid = getupvalue(connection.Function,1)
					for i,v in pairs(maid._tasks) do
						if typeof(v) == 'table' then
							v:Destroy()
						end
					end
				end
			end)
		end
	end

end

]]

local Config = {
	Box               = false,
	BoxOutline        = false,
	BoxColor          = Color3.fromRGB(255,255,255),
	BoxOutlineColor   = Color3.fromRGB(255,255,255),
	HealthBar         = false,
	HealthBarSide     = "Left", -- Left,Bottom,Right
	Names             = false,
	NamesOutline      = false,
	NamesColor        = Color3.fromRGB(255,255,255),
	NamesOutlineColor = Color3.fromRGB(0,0,0),
	NamesFont         = 2, -- 0,1,2,3
	NamesSize         = 13,
	Tracers			  = false,
	TracersColor	  = Color3.fromRGB(255,255,255)
}

local cam = workspace.CurrentCamera

function CreateEsp(Player)
	local Box,BoxOutline,Name,HealthBar,HealthBarOutline,Tracers = Drawing.new("Square"),Drawing.new("Square"),Drawing.new("Text"),Drawing.new("Square"),Drawing.new("Square"),Drawing.new("Line")
	local Updater = game:GetService("RunService").RenderStepped:Connect(function()
		if Player.Character ~= nil and Player.Character:FindFirstChild("Humanoid") ~= nil and Player.Character:FindFirstChild("HumanoidRootPart") ~= nil and Player.Character.Humanoid.Health > 0 and Player.Character:FindFirstChild("Head") ~= nil then
			local Target2dPosition,IsVisible = workspace.CurrentCamera:WorldToViewportPoint(Player.Character.HumanoidRootPart.Position)
			local primaryPos = Player.Character.PrimaryPart.Position
			local lineVector, lineSeen = cam:WorldToViewportPoint(primaryPos)
			local scale_factor = 1 / (Target2dPosition.Z * math.tan(math.rad(workspace.CurrentCamera.FieldOfView * 0.5)) * 2) * 100
			local width, height = math.floor(40 * scale_factor), math.floor(60 * scale_factor)
			if Settings.Box then
				Box.Visible = IsVisible
				Box.Color = Config.BoxColor
				Box.Size = Vector2.new(width,height)
				Box.Position = Vector2.new(Target2dPosition.X - Box.Size.X / 2,Target2dPosition.Y - Box.Size.Y / 2)
				Box.Thickness = 1
				Box.ZIndex = 69
				if Config.BoxOutline then
					BoxOutline.Visible = IsVisible
					BoxOutline.Color = Settings.BoxOutlineColor
					BoxOutline.Size = Vector2.new(width,height)
					BoxOutline.Position = Vector2.new(Target2dPosition.X - Box.Size.X / 2,Target2dPosition.Y - Box.Size.Y / 2)
					BoxOutline.Thickness = 3
					BoxOutline.ZIndex = 1
				else
					BoxOutline.Visible = false
				end
			else
				Box.Visible = false
				BoxOutline.Visible = false
			end
			if Settings.Tracers then
				Tracers.Visible = IsVisible
				Tracers.Color = Config.TracersColor
				Tracers.From  = Vector2.new(cam.ViewportSize.X/2, cam.ViewportSize.Y)
				Tracers.To = Vector2.new(lineVector.X, lineVector.Y)
				Tracers.Size = Vector2.new(width,height)
				Tracers.Position = Vector2.new(Target2dPosition.X - Box.Size.X / 2,Target2dPosition.Y - Box.Size.Y / 2)
				Tracers.Thickness = 1
				Tracers.ZIndex = 69
			else
				Tracers.Visible = false
			end
			if Settings.Names then
				Name.Visible = IsVisible
				Name.Color = Config.NamesColor
				Name.Text = Player.Name.." ("..Player.DisplayName..").."..math.floor((workspace.CurrentCamera.CFrame.p - Player.Character.HumanoidRootPart.Position).magnitude).."m"
				Name.Center = true
				Name.Outline = Config.NamesOutline
				Name.OutlineColor = Config.NamesOutlineColor
				Name.Position = Vector2.new(Target2dPosition.X,Target2dPosition.Y - height * 0.5 + -15)
				Name.Font = Config.NamesFont
				Name.Size = Settings.NamesSize
			else
				Name.Visible = false
			end
			if Config.HealthBar then
				HealthBarOutline.Visible = IsVisible
				HealthBarOutline.Color = Color3.fromRGB(0,255,0)
				HealthBarOutline.Filled = true
				HealthBarOutline.ZIndex = 1

				HealthBar.Visible = IsVisible
				HealthBar.Color = Color3.fromRGB(255,0,0):lerp(Color3.fromRGB(0,255,0), Player.Character:FindFirstChild("Humanoid").Health/Player.Character:FindFirstChild("Humanoid").MaxHealth)
				HealthBar.Thickness = 1
				HealthBar.Filled = true
				HealthBar.ZIndex = 69
				if Config.HealthBarSide == "Left" then
					HealthBarOutline.Size = Vector2.new(2,height)
					HealthBarOutline.Position = Vector2.new(Target2dPosition.X - Box.Size.X / 2,Target2dPosition.Y - Box.Size.Y / 2) + Vector2.new(-3,0)

					HealthBar.Size = Vector2.new(1,-(HealthBarOutline.Size.Y - 2) * (Player.Character:FindFirstChild("Humanoid").Health/Player.Character:FindFirstChild("Humanoid").MaxHealth))
					HealthBar.Position = HealthBarOutline.Position + Vector2.new(1,-1 + HealthBarOutline.Size.Y)
				elseif Config.HealthBarSide == "Bottom" then
					HealthBarOutline.Size = Vector2.new(width,3)
					HealthBarOutline.Position = Vector2.new(Target2dPosition.X - Box.Size.X / 2,Target2dPosition.Y - Box.Size.Y / 2) + Vector2.new(0,height + 2)

					HealthBar.Size = Vector2.new((HealthBarOutline.Size.X - 2) * (Player.Character:FindFirstChild("Humanoid").Health/Player.Character:FindFirstChild("Humanoid").MaxHealth),1)
					HealthBar.Position = HealthBarOutline.Position + Vector2.new(1,-1 + HealthBarOutline.Size.Y)
				elseif Config.HealthBarSide == "Right" then
					HealthBarOutline.Size = Vector2.new(2,height)
					HealthBarOutline.Position = Vector2.new(Target2dPosition.X - Box.Size.X / 2,Target2dPosition.Y - Box.Size.Y / 2) + Vector2.new(width + 1,0)

					HealthBar.Size = Vector2.new(1,-(HealthBarOutline.Size.Y - 2) * (Player.Character:FindFirstChild("Humanoid").Health/Player.Character:FindFirstChild("Humanoid").MaxHealth))
					HealthBar.Position = HealthBarOutline.Position + Vector2.new(1,-1 + HealthBarOutline.Size.Y)
				end
			else
				HealthBar.Visible = false
				HealthBarOutline.Visible = false
			end
		else
			Box.Visible = false
			Tracers.Visible = false
			BoxOutline.Visible = false
			Name.Visible = false
			HealthBar.Visible = false
			HealthBarOutline.Visible = false
			if not Player then
				Tracers:Remove()
				Box:Remove()
				BoxOutline:Remove()
				Name:Remove()
				HealthBar:Remove()
				HealthBarOutline:Remove()
				Updater:Disconnect()
			end
		end
	end)
end

for _,v in pairs(game:GetService("Players"):GetPlayers()) do
	if v ~= game:GetService("Players").LocalPlayer then
		CreateEsp(v)
		v.CharacterAdded:Connect(CreateEsp(v))
	end
end

game:GetService("Players").PlayerAdded:Connect(function(v)
	if v ~= game:GetService("Players").LocalPlayer then
		CreateEsp(v)
		v.CharacterAdded:Connect(CreateEsp(v))
	end
end)

function teleport(cf)

	assert(typeof(cf) == "CFrame", "Invalid argument 'cf'. Expected CFrame.")

	local character = LocalPlayer.Character
	assert(character and character:FindFirstChild("HumanoidRootPart"), "Player character or HumanoidRootPart not found.")

	local dis = (character.HumanoidRootPart.Position - cf.Position).Magnitude
	local backpack = LocalPlayer.Backpack

	if dis >= 100 then
		character.HumanoidRootPart.CFrame = CFrame.new(0, -50, 0)
		task.wait(.5)
		local tools = backpack:GetChildren()
		assert(#tools > 0, "No tools found in the player's backpack.")
		character.Humanoid:EquipTool(tools[1]) -- less rectification here
		task.wait(.1)
		character.HumanoidRootPart.CFrame = cf
		character.Humanoid:UnequipTools()
	else
		character.HumanoidRootPart.CFrame = cf
	end
end

local function getClosest()
	local hrp = Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position or Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position
	local closestblackperson
	local closest_distance = math.huge
	for i,v in pairs(game.Players:GetPlayers()) do
		if v.Character ~= nil and v ~= Players.LocalPlayer and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v.Character:FindFirstChild("Humanoid").Health > 0 then
			local plr_pos = v.Character.HumanoidRootPart.Position
			local plr_distance = (hrp - plr_pos).Magnitude
			if plr_distance < closest_distance then
				closest_distance = plr_distance
				closestblackperson = v
			end
		end
	end
	return closestblackperson
end

local function getClosestToMouse()
	local player, nearestDistance = nil, math.huge
	for i,v in pairs(Players:GetPlayers()) do
		if v ~= Players.LocalPlayer and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health > 0 and v.Character:FindFirstChild("HumanoidRootPart") then
			local root, visible = workspace.CurrentCamera:WorldToViewportPoint(v.Character.HumanoidRootPart.Position)
			if visible then
				local distance = (Vector2.new(mouse.X, mouse.Y) - Vector2.new(root.X, root.Y)).Magnitude
				if distance < nearestDistance then
					nearestDistance = distance
					player = v
				end
			end
		end
	end
	return player
end

local function calculateArrowHitChance(v)
	local chance = math.floor(Random.new().NextNumber(Random.new(),0,1) * 100) / 100
	return chance <= math.floor(v) / 100
end

local function firehit(character)    
	local fakepos = character[Settings.hitpart].Position + Vector3.new(math.random(1,5),math.random(1,5),math.random(1,5))
	local args = {
		[1] = Players.LocalPlayer.Character:FindFirstChildOfClass("Tool"),
		[2] = character.Head,
		[3] = fakepos,
		[4] = character.Head.CFrame:ToObjectSpace(CFrame.new(fakepos)),
		[5] = math.random(0,1),
		[6] = tostring(arrowsshooted)
	}
	remotes["RangedHit"]:FireServer(unpack(args))
end

local Network = modules["Network"]

task.wait(0.5)
pcall(function()
	for i = 1,25 do
		remotes("StartFastRespawn")
		remotes("CompleteFastRespawn")
		wait()
	end
end)

function GetPlayer(Distance,SortTable)
	local Character = LocalPlayer.Character
	if not Character then return {} end
	local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
	if not HumanoidRootPart then return {} end
	local PlayerTable = {}
	for i,v in pairs(Players:GetPlayers()) do
		if (v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("Humanoid")) then
			local Mag = (HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude
			if Mag <= Distance then
				PlayerTable[v.Name] = v.Character.Humanoid.Health
			end
		end
	end
	if SortTable then
		table.sort(PlayerTable)
	end
	return PlayerTable
end

function GetWeaponMetadata(DisplayName)
	for i,v in pairs(getgc(true)) do
		if typeof(v) == "table" and rawget(v,"refundIfVaulted") then
			if rawget(v,"displayName") == DisplayName then
				return v
			end
		end
	end
end

function GetWeapon()
	local Weapon
	for i, v in pairs(LocalPlayer.Character:GetChildren()) do
		if v:IsA("Tool") then
			if v:FindFirstChild("Hitboxes") then
				Weapon = v
			end
		end
	end
	return Weapon
end

local DataHandler = modules["DataHandler"]

function IsParrying(Player)
	if DataHandler.getSessionDataRoduxStoreForPlayer(Player) then
		return DataHandler.getSessionDataRoduxStoreForPlayer(Player):getState().parry.isParrying
	end
	return nil
end

local Cooldowns = {}

local page = venyx:addPage("Parry Section", 5012544693)
local section1 = page:addSection("Auto Parry Section")
local antiparrysec = page:addSection("Anti-Parry Section")
local apmisc = page:addSection("Parry Miscellaneous Section")


local function AutoParryChance(v)
	local chance = math.floor(Random.new().NextNumber(Random.new(),0,1) * 100) / 100
	return chance <= math.floor(v) / 100
end

local function AntiParryChance(v)
	local chance = math.floor(Random.new().NextNumber(Random.new(),0,1) * 100) / 100
	return chance <= math.floor(v) / 100
end

section1:addToggle("Auto-Parry", Settings.autoparry, function(value)
	Settings.autoparry = value
end)


section1:addToggle("Auto Equip Weapon on Trigger", Settings.equiptool, function(value)
	Settings.equiptool = value
end)

antiparrysec:addToggle("Anti-Parry", Settings.antiparry , function(value)
	Settings.antiparry = value
end)

local antiparryRS

workspace.PlayerCharacters.DescendantAdded:Connect(function(e)
	pcall(function()
		if (e:IsA("Sound") and e.SoundId == "rbxassetid://211059855") then
			if e.Parent.Parent.Name ~= LocalPlayer.Name then
				local p = (e.Parent and e.Parent)
				if (LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")) then
					local distance = (LocalPlayer.Character.HumanoidRootPart.Position-p.Position).Magnitude
					if (distance <= Settings.antiparryrange and Settings.antiparry == true) then
						local Weapon
						for i, v in pairs(LocalPlayer.Character:GetChildren()) do
							if v:IsA("Tool") then
								if v:FindFirstChild("Hitboxes") ~= nil then  
									Weapon = v
								end
							end
						end
						if Weapon and AntiCD_Debounce == true then
							task.spawn(function()
								AntiCD_Debounce = false
								antiparryRS = RunService.Stepped:Connect(function()
									if (AntiCD_Debounce == false) then
										LocalPlayer.Character.Humanoid:UnequipTools()
										p:GetPropertyChangedSignal'Transparency':wait()
									else
										LocalPlayer.Character.Humanoid:EquipTool(Weapon)
										antiparryRS:Disconnect()
									end
								end)
								Notification:Notify(
									{Title = "Anti-Parry Triggered!", Description = "that person prob messed up, i hope you didn't messed up as well"},
									{OutlineColor = Color3.fromRGB(110, 255, 124),Time = 3, Type = "default"},
									{Image = "http://www.roblox.com/asset/?id=", ImageColor = Color3.fromRGB(0, 255, 60)}
								)
								task.wait(Settings.antiparrycooldown)
								AntiCD_Debounce = true
							end)
						end
					end
				end
			end
		end
	end)
end)

section1:addSlider("Auto-Parry Range", Settings.apdist, 1, 16, function(value)
	Settings.apdist = value
end)

	--[[]
	section1:addSlider("Auto-Parry Chance", 1, 1, 100, function(value)
	   autoparry_chance = value
	end)
	]]

local animationInfo = {}

function getInfo(id)
	local success, info = pcall(function()
		return game:GetService("MarketplaceService"):GetProductInfo(id)
	end)
	if success then
		return info
	end
	return {Name=''}
end

local AnimNames = {
	'Slash',
	'Swing',
	'Sword'
}

function block(player)
	keypress(0x46)
	task.wait()
	keyrelease(0x46)
end

function block2(player)
	Network:FireServer("Parry")
end

function equiptool(player)
	if not game.Workspace.PlayerCharacters[LocalPlayer.Name]:FindFirstChildOfClass("Tool") and not game.Players.LocalPlayer.PlayerGui.RoactUI:FindFirstChild("MainMenu") then
		if not IsParrying(player) then
			keypress(0x31)
			task.wait()
			keyrelease(0x31)
		end
	end
end

function playerAdded(v)
	local function charadded(char)
		local humanoid = char:WaitForChild("Humanoid", 5)
		if humanoid then
			humanoid.AnimationPlayed:Connect(function(track)
				local info = animationInfo[track.Animation.AnimationId]
				if not info then
					info = getInfo(tonumber(track.Animation.AnimationId:match("%d+")))
					animationInfo[track.Animation.AnimationId] = info
				end
				if (LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Head") and v.Character:FindFirstChild("Head")) then
					local magn = (v.Character.Head.Position - LocalPlayer.Character.Head.Position).Magnitude
					if magn < Settings.apdist then
						for _, animName in pairs(AnimNames) do
							if info.Name:match(animName) and AutoCD_Debounce == true and Settings.autoparry == true then
								AutoCD_Debounce = true
								if Settings.kpAP == true and Settings.remAP == false then
									if (Settings.equiptool == true and Settings.autoparry == true) then
										pcall(equiptool, v)
									end
									pcall(block, v)
								elseif Settings.kpAP == false and Settings.remAP == true then
									if (Settings.equiptool == true and Settings.autoparry == true) then
										pcall(equiptool, v)
									end
									pcall(block2, v)
								end
								task.wait(autoparrycooldown)
								AutoCD_Debounce = true
							end
						end
					end
				end
			end)
		end
	end

	if v.Character then
		charadded(v.Character)
	end
	v.CharacterAdded:Connect(charadded)
end

for i,v in pairs(game.Players:GetPlayers()) do
	if v ~= LocalPlayer then
		playerAdded(v)
	end
end

game.Players.PlayerAdded:Connect(playerAdded)

antiparrysec:addSlider("Anti-Parry Range", Settings.antiparryrange, 15, 26, function(value)
	Settings.antiparryrange = value
end)

	--[[
	antiparrysec:addSlider("Anti-Parry Chance", 1, 1, 100, function(value)
	   antiparry_chance = value
	end)
	]]

antiparrysec:addSlider("Anti-Parry Cooldown", Settings.antiparrycooldown, 0, 3, function(value)
	Settings.antiparrycooldown = value
end)

apmisc:addToggle("No Parry Cooldown", Settings.noparrycd, function(value)
	Settings.noparrycd = value
end)

apmisc:addToggle("No Parry Collision", Settings.noparrycollision, function(value)
	Settings.noparrycollision = value
end)

apmisc:addToggle("No Parry Slowdown", Settings.noparryslow, function(value)
	Settings.noparryslow = value
end)

RunService.Stepped:Connect(function()
	for i, v in pairs(LocalPlayer.Character:GetChildren()) do
		if v:IsA("MeshPart") and Settings.noparrycollision == true then
			v.CanCollide = false
		end
	end
end)

apmisc:addToggle("No Parry Stun", Settings.noparrystun, function(value)
	Settings.noparrystun = value
end)

section1:addSlider("Auto-Parry Cooldown", 0, 0, 5, function(value)
	autoparrycooldown = value
end)

local phname = "Auto-Parry Method"

if Settings.remAP == true and Settings.kpAP == true then
	phname = "Remote"
elseif Settings.kpAP == true and Settings.remAP == false then
	phname = "Keypress"
end

section1:addDropdown(phname, {"Remote", "Keypress"}, function(text)
	if text == "Remote" then
		Settings.remAP = true
		Settings.kpAP = false
	elseif text == "Keypress" then
		Settings.remAP = false
		Settings.kpAP = true 
	end
end)

local Stamina = modules["DefaultStaminaHandlerClient"].getDefaultStamina()

task.spawn(function()
	RunService.Stepped:Connect(function()
		if Settings.infstam == true then
			local Stamina = modules["DefaultStaminaHandlerClient"].getDefaultStamina()
			if Stamina and Settings.infstam == true then
				Stamina:setStamina(math.huge)
			end
		end
		if (LocalPlayer.Character:WaitForChild("Humanoid").Health <= 16) then
			if (Settings.instantrev == true) then
				modules["SelfReviveConstants"].SELF_REVIVE_DURATION = 0
				Network:FireServer("SelfReviveStart")
				Network:FireServer("SelfRevive")
			end
		end
		if Settings.nfd == true then
			DataHandler.getSessionDataRoduxStoreForPlayer(LocalPlayer):getState().fallDamageClient.isDisabled = true
		else
			DataHandler.getSessionDataRoduxStoreForPlayer(LocalPlayer):getState().fallDamageClient.isDisabled = false
		end
		if Settings.antidown == true then
			DataHandler.getSessionDataRoduxStoreForPlayer(LocalPlayer):getState().down.isDowned = false
		end
		if Settings.noparrystun == true then
			DataHandler.getSessionDataRoduxStoreForPlayer(LocalPlayer):getState().stunClient.isStunned = false
			DataHandler.getSessionDataRoduxStoreForPlayer(LocalPlayer):getState().parry.isParried = false
			modules["ParryConstants"].PARRIED_WALK_SPEED_MULTIPLIER = 1
			modules["BodyRotationConstants"].BODY_ROTATION_REPLICATION_RATE_IN_SECONDS = 0.25
		end
		if Settings.noparrycd == true then
			modules["ParryConstants"].PARRY_COOLDOWN_IN_SECONDS = 0
			modules["ParryConstants"].PARRY_COOLDOWN_IN_SECONDS_AFTER_SUCCESSFUL_PARRY = 0
		else
			modules["ParryConstants"].PARRY_COOLDOWN_IN_SECONDS = 3
			modules["ParryConstants"].PARRY_COOLDOWN_IN_SECONDS_AFTER_SUCCESSFUL_PARRY = 0.33
		end
		if Settings.noparryslow == true then
			modules["ParryConstants"].AFTER_PARRY_WALK_SPEED_MULTIPLIER = 1
		else
			modules["ParryConstants"].AFTER_PARRY_WALK_SPEED_MULTIPLIER = 0.25
		end
		if Settings.infiniteair == true then
			modules["AirConstants"].AIR_TO_ADD_PER_SECOND_WHILE_SWIMMING = 0
		end
		if Settings.instantthrow == true then
			modules["CarryConstants"].DROP_INPUT_DURATION_TO_THROW = 0
		else
			modules["CarryConstants"].DROP_INPUT_DURATION_TO_THROW = 0.25
		end
		if Settings.nocarryslow == true then
			modules["CarryConstants"].START_CARRYING_WALK_SPEED_MULTIPLIER = 1
		else
			modules["CarryConstants"].START_CARRYING_WALK_SPEED_MULTIPLIER = 0.0125
		end
		if Settings.nothrowslow == true then
			modules["CarryConstants"].DROP_THROWING_WALK_SPEED_MULTIPLIER = 1
		else
			modules["CarryConstants"].DROP_THROWING_WALK_SPEED_MULTIPLIER = 0.125
		end
		if Settings.nojumpcooldown == true then
			modules["JumpConstants"].JUMP_DELAY_ADD = 0
		else
			modules["JumpConstants"].JUMP_DELAY_ADD = 1
		end
		if Settings.nodashcd == true then
			modules["DashConstants"].DASH_COOLDOWN = 0
			DataHandler.getSessionDataRoduxStoreForPlayer(LocalPlayer):getState().dashClient.isDashing = false
		else
			modules["DashConstants"].DASH_COOLDOWN = 3
		end
		if Settings.walkspeedenabled == true then
			if (not UserInputService:IsKeyDown(Enum.KeyCode.LeftShift)) then
				Players.LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed = walkspeed
			else
				Players.LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed = walkspeed + 34
			end
		end
		if Settings.jumppowerenabled == true then
			Players.LocalPlayer.Character:WaitForChild("Humanoid").JumpPower = 130
		else
			Players.LocalPlayer.Character:WaitForChild("Humanoid").JumpPower = 50
		end
	end)
end)

function toggleFly(value,ragdoll) -- fly module source, fuck u swenje
	DataHandler.getSessionDataRoduxStoreForPlayer(game.Players.LocalPlayer):getState().fly.isFlying = value
	if (LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") and LocalPlayer.Character.Humanoid:FindFirstChild("RagdollRemoteEvent")) then
		LocalPlayer.Character.Humanoid.RagdollRemoteEvent:FireServer(ragdoll)
	end
	if value == true then
		getupvalue(modules["FlyHandlerClient"]._startModule,2)(game.Players.LocalPlayer.Character)
	else
		if (LocalPlayer.Character and LocalPlayer.Character:FindFirstChild('HumanoidRootPart') and LocalPlayer.Character.HumanoidRootPart:FindFirstChild("LinearVelocity")) then
			LocalPlayer.Character.HumanoidRootPart.LinearVelocity:Destroy()
		end
	end
end

task.spawn(function()
	RunService.Stepped:Connect(function()
		if (Settings.arwd == true and LocalPlayer.Character) then
			if LocalPlayer.Character.Humanoid.Health <= 15 then
				LocalPlayer.Character.Humanoid.Health = 0
			end
		end
	end)
end)

-- gameplay behavior page
local gpb = venyx:addPage("LocalPlayer", 5012544693)
local gpbsection = gpb:addSection("Gameplay Behavior")

gpbsection:addToggle("Infinite Stamina", Settings.infstam, function(value)
	Settings.infstam = value
end)

gpbsection:addToggle("Infinite Air", Settings.infiniteair, function(value)	
	Settings.infiniteair = value
end)

gpbsection:addToggle("No Dash Cooldown", Settings.nodashcd, function(value)
	Settings.nodashcd = value
end)

gpbsection:addToggle("No Jump Cooldown", Settings.nojumpcooldown, function(value)
	Settings.nojumpcooldown = value
end)

gpbsection:addToggle("No Ragdoll", Settings.noragdoll, function(value)
	Settings.noragdoll = value
end)

gpbsection:addToggle("Instant Self-Revive", Settings.instantrev, function(value)
	Settings.instantrev = value
end)

gpbsection:addToggle("Auto-Spawn", Settings.autospawn, function(value)
	Settings.autospawn = value
end)

gpbsection:addToggle("Fast Respawn", Settings.fastres, function(value)
	Settings.fastres = value
end)

gpbsection:addToggle("Noclip (Walk Through Walls)", Settings.noclipping, function(value)
	Settings.noclipping = value
end)

gpbsection:addToggle("Enable Fast Walkspeed", Settings.walkspeedenabled, function(value)
	Settings.walkspeedenabled = value
end)

gpbsection:addToggle("Enable High JumpPower", Settings.jumppowerenabled, function(value)
	Settings.jumppowerenabled = value
end)

gpbsection:addToggle("Anti-Down", Settings.antidown, function(value)
	Settings.antidown = value
end)

gpbsection:addToggle("No Fall Damage // No Ragdoll Fall", Settings.nfd, function(value)
	Settings.nfd = value
end)

gpbsection:addToggle("No Beartrap/Fire/Claymore Damage", Settings.nbt, function(value)
	Settings.nbt = value
end)

RunService.Stepped:Connect(function()
	if Settings.nbt == true then
		for i, v in pairs(workspace.EffectsJunk:GetChildren()) do
			if v.Name == "OpenBearTrap" or v.Name == "" or v.Name == "ParticlePart" then
				v:Destroy()
			end 
		end
		for i, v in pairs(workspace.EffectsJunk.PartCache.GasolinePool:GetChildren()) do
			if v.Name == "GasolinePoolHitboxPartVO" then
				v:Destroy()
			end 
		end
		for i, v in pairs(workspace.EffectsJunk:GetChildren()) do
			if v.Name == "Part" then
				if v:FindFirstChild("GotHitRE") then
					v:Destroy()
				end
			end 
		end
		for i, v in pairs(workspace.Map:GetChildren()) do
			if v.Name == "Handle" then
				v:Destroy()
			end 
		end
	end
end)

gpbsection:addToggle("Fast Player Revive", Settings.fastplrrev, function(value)
	Settings.fastplrrev = value
	if Settings.fastplrrev == true then
		modules["ReviveConstants"].REVIVE_DURATION = 1.8
	else
		modules["ReviveConstants"].REVIVE_DURATION = 2
	end
end)

gpbsection:addToggle("No Knockback", Settings.nkb, function(value)
	Settings.nkb = value
	if Settings.nkb == true then
		hookfunction(modules["KnockbackHandler"].knockbackCharacterPart, function(...)
			return task.wait(math.huge)
		end)
		hookfunction(modules["KnockbackHandler"].knockbackCharacterPartAngular, function(...)
			return task.wait(math.huge)
		end)
		hookfunction(modules["KnockbackHandler"].impulseCharacterPart, function(...)
			return task.wait(math.huge)
		end)
		hookfunction(modules["KnockbackHandler"].impulseCharacterPartAngular, function(...)
			return task.wait(math.huge)
		end)
	end
end)

gpbsection:addToggle("Always Reset when Downed", Settings.arwd, function(value)
	Settings.arwd = value
end)

gpbsection:addToggle("Velocity Fly", Settings.vfly, function(value)
	Settings.vfly = value
	toggleFly(Settings.vfly, false)
end)

gpbsection:addToggle("Ragdoll Fly", Settings.rfly, function(value)
	Settings.rfly = value
	toggleFly(Settings.rfly, Settings.rfly)
end)

gpbsection:addToggle("Player Strafe (w/Anti-Strafe)", Settings.strafe, function(value)
	Settings.strafe = value
end)

gpbsection:addSlider("Strafe Distance", Settings.straferange, 1, 40, function(value)
	Settings.straferange = value
end)

gpbsection:addToggle("Character Teleport", Settings.ctp, function(value)
	Settings.ctp = value
end)

if Settings.tpkeybind == nil then
	Settings.tpkeybind = "x"
end

mouse.KeyDown:connect(function(key)
	if key == Settings.tpkeybind and Settings.ctp == true then
		if mouse.Target then
			teleport(CFrame.new(mouse.Hit.x, mouse.Hit.y + 5, mouse.Hit.z))
		end
	end
end)

local killaurapage = venyx:addPage("Kill Aura Tab", 5012544693)
local KillAuraSec = killaurapage:addSection("Kill Aura Section")
local anykillaurasec = killaurapage:addSection("Stomp/Weapon Auras")

-- Whitelisting system
local Whitelist = {}

Players.PlayerAdded:Connect(function(Player)
	if Player:IsFriendsWith(LocalPlayer.UserId) then
		table.insert(Whitelist, Player.Name)
	end
end)

Players.PlayerRemoving:Connect(function(Player)
	if table.find(Whitelist,Player.Name) then
		table.remove(Whitelist,table.find(Whitelist,Player.Name))
	end
end)

function CheckWhitelist(Name)
	if table.find(Whitelist,Name) then
		return false
	end
	if (Settings.kawhitelist == true and Players:FindFirstChild(Name) and Players:FindFirstChild(Name):IsFriendsWith(LocalPlayer.UserId)) then
		return false
	end
	return true
end

if isfile('Lumware\\LumwareConfig.cfg') and Settings.killaura == true then
	task.wait(.1)
	Settings.killaura = true
	if Settings.killaura == false then
		Settings.killaura = true
	end
end

KillAuraSec:addToggle("Kill Aura", Settings.killaura, function(value)
	Settings.killaura = value
end)

task.spawn(function()
	while true do
		local weapon = GetWeapon() 
		if (weapon and Settings.killaura == true) then
			local wpcooldown
			local kaprior = Settings.kahealthenabled
			local closest = GetPlayer(Settings.killauradistance,kaprior == "Health" and true or false)
			local origin = getClosest().Character.HumanoidRootPart.CFrame
			wpcooldown = Cooldowns[weapon.Name]
			local closestPlayers = 0
			for i,v in pairs(closest) do
				closestPlayers = closestPlayers + 1
			end
			if closestPlayers >= 1 then
				Network:FireServer("MeleeSwing",weapon,math.random(1,4))
			end
			for i,v in pairs(closest) do
				if (Players:FindFirstChild(i) and Players[i].Character and weapon and Players[i].Character:FindFirstChild("Head")) then
					if Settings.kaparrycheck == true then
						if IsParrying(Players[i]) then continue end
					end
					if Settings.kawhitelist == true then
						if (Players[i]:IsFriendsWith(LocalPlayer.UserId)) then continue end
					end
	                       --[[
	                       if not (Players[i]:IsFriendsWith(LocalPlayer.UserId) and _G.katp == true) then
	                           if (Players[i]:IsFriendsWith(LocalPlayer.UserId) and _G.kawhitelist == true) then continue end
	                           task.wait(.1)
	                           LocalPlayer.Character.HumanoidRootPart.CFrame = origin * CFrame.new(0, 0, killauratpdistance)
	                       end
	                       ]]
					if not (Players[i]:IsFriendsWith(LocalPlayer.UserId) or Players[i]:IsFriendsWith(LocalPlayer.UserId) and Settings.kawhitelist == false) then
						Network:FireServer("MeleeDamage",weapon,Players[i].Character:FindFirstChild("Head"),weapon.Hitboxes:FindFirstChild('Hitbox'),Players[i].Character:FindFirstChild("HumanoidRootPart").Position,CFrame.new(),Vector3.new())
						Network:FireServer("MeleeDamage",weapon,Players[i].Character:FindFirstChild("Torso"),weapon.Hitboxes:FindFirstChild('Hitbox'),Players[i].Character:FindFirstChild("HumanoidRootPart").Position,CFrame.new(),Vector3.new())
					end
					if Settings.attackoneka then
						break
					end
				end
			end
			if Settings.kacooldownewapon == true then
				if wpcooldown then
					task.wait(wpcooldown)
				else
					task.wait(0.055)
				end
			else
				task.wait(0.055)
			end
		else
			task.wait()
		end
	end
end)

	--[[
	KillAuraSec:addToggle("Kill Aura TP", nil, function(value)
	   _G.katp = value
	end)
	]]

KillAuraSec:addToggle("Kill Aura Friend Whitelist", Settings.kawhitelist, function(value)
	Settings.kawhitelist = value
end)

KillAuraSec:addToggle("Kill Aura Weapon Based CD", Settings.kacooldownewapon, function(value)
	Settings.kacooldownewapon = value
end)

KillAuraSec:addToggle("Kill Aura Parry Check", Settings.kaparrycheck, function(value)
	Settings.kaparrycheck = value
end)

	--[[
	KillAuraSec:addSlider("Kill Aura TP Distance", 1, 1, 10, function(value)
	   killauratpdistance = value
	end)
	]]

KillAuraSec:addSlider("Kill Aura Distance", Settings.killauradistance, 1, 25, function(value)
	Settings.killauradistance = value
end)

local katypename = "Kill Aura Type"

if Settings.attackoneka == false and Settings.attackmultika == true then
	katypename = "Attack Multiple"
	Settings.attackmultika = true
	Settings.attackoneka = false
elseif Settings.attackoneka == true and Settings.attackmultika == false then
	katypename = "Attack One"
	Settings.attackmultika = false
	Settings.attackoneka = true
end

local drop1 = KillAuraSec:addDropdown(katypename, {"Attack One", "Attack Multiple"}, function(text)
	if text == "Attack One" then
		Settings.attackoneka = true
		Settings.attackmultika = false

		Notification:Notify(
			{Title = "⚠️ WARNING!", Description = "This feature has a high chance of getting kicked."},
			{OutlineColor = Color3.fromRGB(110, 255, 124),Time = 3, Type = "image"},
			{Image = "http://www.roblox.com/asset/?id=", ImageColor = Color3.fromRGB(0, 255, 60)}
		)

		Notification:Notify(
			{Title = "⚠️ REMINDER!", Description = "If you wish to use this, turn on Kill Aura Weapon Based Cooldown!"},
			{OutlineColor = Color3.fromRGB(110, 255, 124),Time = 3, Type = "image"},
			{Image = "http://www.roblox.com/asset/?id=", ImageColor = Color3.fromRGB(0, 255, 60)}
		)

		task.wait(1)

		Notification:Notify(
			{Title = "⚠️ WARNING!", Description = "It's recommended to use 'Attack Multiple' to avoid getting kicked."},
			{OutlineColor = Color3.fromRGB(110, 255, 124),Time = 3, Type = "image"},
			{Image = "http://www.roblox.com/asset/?id=", ImageColor = Color3.fromRGB(0, 255, 60)}
		)
	elseif text == "Attack Multiple" then
		Settings.attackoneka = false
		Settings.attackmultika = true
	end
end)

local kapriorname = "Kill Aura Priority"

if Settings.kahealthenabled == true then
	katypename = "Health"
	Settings.kahealthenabled = true
end

if Settings.kahealthenabled == false and Settings.None == true then
	katypename = "None"
elseif Settings.kahealthenabled == true and Settings.None == false then
	katypename = "Health"
	Settings.kahealthenabled = true
end

local drop2 = KillAuraSec:addDropdown(kapriorname, {"None", "Health"}, function(text)
	if text == "Health" then
		Settings.kahealthenabled = true
	end
end)

anykillaurasec:addToggle("Stomp Aura", Settings.stompaura, function(value)
	Settings.stompaura = value
end)

anykillaurasec:addToggle("Finish-Kill Aura", Settings.finish, function(value)
	Settings.finish = value
end)

anykillaurasec:addToggle("Glory-Kill Aura", Settings.glory, function(value)
	Settings.glory = value
end)

-- ranged page
local page3 = venyx:addPage("Ranged Tab", 5012544693)
local aimsection = page3:addSection("Range Mods")

-- esp page
local wowesp = venyx:addPage("Visuals Tab", 5012544693)
local espsec = wowesp:addSection("Player ESPs")


espsec:addToggle("ESP Box", Settings.Box, function(value)
	Settings.Box = value
end)

espsec:addColorPicker("ESP BoxOutline's Color",Color3.new(255, 255, 255), function(color3)
	Config.BoxColor = color3
end)

	--[[
	espsec:addToggle("ESP Box ColorPicker", nil, function(value)
		Config.Box = value
	end)

	espsec:addToggle("ESP Box Outlines", nil, function(value)
		Config.BoxOutline = value
	end)

	espsec:addToggle("ESP HealthBars", nil, function(value)
		Config.HealthBar = value
	end)

	espsec:addDropdown("ESP's HealthBar Position", {"Left" ,"Bottom", "Right"}, function(text)
		if text == "Left" then
			Config.HealthBarSide = "Left"
		elseif text == "Bottom" then
			Config.HealthBarSide = "Bottom"
		elseif text == "Right" then
			Config.HealthBarSide = "Right"
		end
	end)
	]]

espsec:addToggle("ESP Tracers", Settings.Tracers, function(value)
	Settings.Tracers = value
end)

espsec:addColorPicker("ESP Tracer's Color",Color3.fromRGB(255, 255, 255), function(color)
	Config.TracersColor = color
end)

espsec:addToggle("ESP Player Names", Settings.Names, function(value)
	Settings.Names = value
end)

espsec:addColorPicker("ESP Name's Color",Color3.fromRGB(255, 255, 255), function(color)
	Config.NamesColor = color
end)

espsec:addSlider("ESP Name Size", Settings.NamesSize, 1, 25, function(value)
	Settings.NamesSize = value
end)

-- carry page
local section3 = gpb:addSection("Carry Player Mods")

section3:addToggle("Instant Throw", Settings.instantthrow, function(value)
	Settings.instantthrow = value
end)

section3:addToggle("No Carry Slowdown", Settings.nocarryslow, function(value)
	Settings.nocarryslow = value
end)

section3:addToggle("No Slowdown Throw", Settings.nothrowslow, function(value)
	Settings.nothrowslow = value
end)

--configs
local cnfgPage = venyx:addPage("Configs", 5012544693)
local configsection = cnfgPage:addSection("Configurations Menu")

configsection:addButton("Save Settings", function()
	if not isfile('Lumware\\LumwareConfig.cfg') then
		bro:Play()
		SaveSettings()
		Notification:Notify(
			{Title = "Configuration Saved.", Description = "Configurations are successfully saved."},
			{OutlineColor = Color3.fromRGB(110, 255, 124),Time = 5, Type = "default"},
			{Image = "http://www.roblox.com/asset/?id=", ImageColor = Color3.fromRGB(255, 84, 84)}
		)
	else
		nobro:Play()
		Notification:Notify(
			{Title = "Configuration saved already!", Description = "Configuration has been already saved, this will do nothing.."},
			{OutlineColor = Color3.fromRGB(110, 255, 124),Time = 5, Type = "default"},
			{Image = "http://www.roblox.com/asset/?id=", ImageColor = Color3.fromRGB(255, 84, 84)}
		)
		task.wait(3)
		bro:Play()
		Notification:Notify(
			{Title = "Do you wish to rejoin?", Description = "If you're looking for this, then you have the answer."},
			{OutlineColor = Color3.fromRGB(110, 255, 124),Time = 15, Type = "option"},
			{Image = "http://www.roblox.com/asset/?id=6023426923", ImageColor = Color3.fromRGB(255, 84, 84), Callback = function(State) 

				if State == true then
					bro2:Play()
					Notification:Notify(
						{Title = "Rejoining...", DescriptionD = "Please wait for a little while, this won't take long while saving the configurations."},
						{OutlineColor = Color3.fromRGB(110, 255, 124),Time = 5, Type = "default"},
						{Image = "http://www.roblox.com/asset/?id=", ImageColor = Color3.fromRGB(0, 255, 60)}
					)
					task.wait(math.random(5,8))
					Rejoin()
				elseif State == false then
					Notification:Notify(
						{Title = "Staying in the server.", Description = "This might not be a good idea to think if the feature is even on or not, well idk."},
						{OutlineColor = Color3.fromRGB(110, 255, 124),Time = 8, Type = "default"},
						{Image = "http://www.roblox.com/asset/?id=", ImageColor = Color3.fromRGB(0, 255, 60)}
					)

				end

			end}
		)
	end
end)

configsection:addButton("Overwrite Current Saved Settings", function()
	if isfile('Lumware\\LumwareConfig.cfg') then
		bro:Play()
		SaveSettings()
		Notification:Notify(
			{Title = "Overwritten current config.", Description = "Configurations are successfully overwritten, idk if you're clumsy or you just did that on purpose."},
			{OutlineColor = Color3.fromRGB(110, 255, 124),Time = 5, Type = "default"},
			{Image = "http://www.roblox.com/asset/?id=", ImageColor = Color3.fromRGB(255, 84, 84)}
		)
	else
		nobro:Play()
		Notification:Notify(
			{Title = "No save file found!", Description = "There are no save file are found, save some config first HL."},
			{OutlineColor = Color3.fromRGB(110, 255, 124),Time = 5, Type = "default"},
			{Image = "http://www.roblox.com/asset/?id=", ImageColor = Color3.fromRGB(255, 84, 84)}
		)
	end
end)

configsection:addButton("Reset Settings", function()
	if isfile('Lumware\\LumwareConfig.cfg') then
		ResetSettings()
		bro:Play()
		Notification:Notify(
			{Title = "Successfully cleared configs.", Description = "Do you want to rejoin the server? This will take full effect after the rejoin, it is recommended to rejoin."},
			{OutlineColor = Color3.fromRGB(110, 255, 124),Time = 15, Type = "option"},
			{Image = "http://www.roblox.com/asset/?id=6023426923", ImageColor = Color3.fromRGB(255, 84, 84), Callback = function(State) 

				if State == true then
					bro2:Play()
					Notification:Notify(
						{Title = "Rejoining...", Description = "Please wait for a little while, this won't take long while saving the configurations."},
						{OutlineColor = Color3.fromRGB(110, 255, 124),Time = 5, Type = "default"},
						{Image = "http://www.roblox.com/asset/?id=", ImageColor = Color3.fromRGB(0, 255, 60)}
					)
					task.wait(math.random(5,8))
					Rejoin()
				elseif State == false then
					Notification:Notify(
						{Title = "Staying in the server.", Description = "This might not be a good idea to think if the feature is even on or not."},
						{OutlineColor = Color3.fromRGB(110, 255, 124),Time = 3, Type = "default"},
						{Image = "http://www.roblox.com/asset/?id=", ImageColor = Color3.fromRGB(0, 255, 60)}
					)

				end

			end}
		)
	else
		nobro:Play()
		Notification:Notify(
			{Title = "No save file found!", Description = "There are no save file are found, save some config first HL."},
			{OutlineColor = Color3.fromRGB(110, 255, 124),Time = 5, Type = "default"},
			{Image = "http://www.roblox.com/asset/?id=", ImageColor = Color3.fromRGB(255, 84, 84)}
		)
	end
end)

-- miscellaneous
local page5 = venyx:addPage("Miscellaneous", 5012544693)
local colors = page5:addSection("Theme Colors")
local miscfeatures = page5:addSection("Misc Features")

local counter = 0

miscfeatures:addButton("Rejoin Server", function()
	Rejoin()
end)

miscfeatures:addButton("Hitbox Expander", function()
	local wep = GetWeapon()
	local oldPos = {}
	if wep then
		bro2:Play()
		counter = counter + 1
		if counter == 1 then
			Notification:Notify(
				{Title = "Successfully Expanded.", Description = "It is now longer than my patience."},
				{OutlineColor = Color3.fromRGB(110, 255, 124),Time = 3, Type = "default"},
				{Image = "http://www.roblox.com/asset/?id=", ImageColor = Color3.fromRGB(0, 255, 60)}
			)
		elseif counter == 2 then
			Notification:Notify(
				{Title = "Successfully Expanded.", Description = "Ain't no way, it got longer"},
				{OutlineColor = Color3.fromRGB(110, 255, 124),Time = 3, Type = "default"},
				{Image = "http://www.roblox.com/asset/?id=", ImageColor = Color3.fromRGB(0, 255, 60)}
			)
		elseif counter == 3 then
			Notification:Notify(
				{Title = "Successfully Expanded?", Description = "What are you going to do with this? This is not a pole stick."},
				{OutlineColor = Color3.fromRGB(110, 255, 124),Time = 3, Type = "default"},
				{Image = "http://www.roblox.com/asset/?id=", ImageColor = Color3.fromRGB(0, 255, 60)}
			)
		elseif counter == 4 then
			Notification:Notify(
				{Title = "Successfully Expanded? Again?", Description = "You better not mention or blame this in close-ranged combat."},
				{OutlineColor = Color3.fromRGB(110, 255, 124),Time = 3, Type = "default"},
				{Image = "http://www.roblox.com/asset/?id=", ImageColor = Color3.fromRGB(0, 255, 60)}
			)
		elseif counter == 5 then
			Notification:Notify(
				{Title = "Successfully added 16 inches.", Description = "That'll do probably but mostly won't work, goodluck."},
				{OutlineColor = Color3.fromRGB(110, 255, 124),Time = 3, Type = "default"},
				{Image = "http://www.roblox.com/asset/?id=", ImageColor = Color3.fromRGB(0, 255, 60)}
			)
		elseif counter == 6 then
			Notification:Notify(
				{Title = "what the hell", Description = "Maybe stop?"},
				{OutlineColor = Color3.fromRGB(110, 255, 124),Time = 3, Type = "default"},
				{Image = "http://www.roblox.com/asset/?id=", ImageColor = Color3.fromRGB(0, 255, 60)}
			)
		elseif counter == 7 then
			Notification:Notify(
				{Title = "damn u must be persistent", Description = "ong ong ong fr"},
				{OutlineColor = Color3.fromRGB(110, 255, 124),Time = 3, Type = "default"},
				{Image = "http://www.roblox.com/asset/?id=", ImageColor = Color3.fromRGB(0, 255, 60)}
			)
		elseif counter == 8 then
			Notification:Notify(
				{Title = "wtf are u doing?", Description = "THIS WON'T EVEN HIT ANYBODYY BROOOOOOOOO"},
				{OutlineColor = Color3.fromRGB(110, 255, 124),Time = 3, Type = "default"},
				{Image = "http://www.roblox.com/asset/?id=", ImageColor = Color3.fromRGB(0, 255, 60)}
			)
		elseif counter == 9 then
			Notification:Notify(
				{Title = "hell naaaaaw", Description = "im done im done, im done"},
				{OutlineColor = Color3.fromRGB(110, 255, 124),Time = 3, Type = "default"},
				{Image = "http://www.roblox.com/asset/?id=", ImageColor = Color3.fromRGB(0, 255, 60)}
			)
			counter = 0
		end
		for i,v in pairs(Players.LocalPlayer.Character:GetChildren()) do
			if v:IsA("Tool") then
				for i2,v2 in pairs(v.Hitboxes.Hitbox:GetChildren()) do
					if v2:IsA("Attachment") and v2.Name == "DmgPoint" then
						table.insert(oldPos, v2.Position)
						v2.Visible = true
						v2.Position += Vector3.new(0, 3, 0)
					end
				end
			end
		end
	else
		nobro:Play()
		Notification:Notify(
			{Title = "HL, where's ur weapon?", Description = "how could this weapon's hitbox get expanded if ur weapon aren't even pulled out."},
			{OutlineColor = Color3.fromRGB(110, 255, 124),Time = 3, Type = "default"},
			{Image = "http://www.roblox.com/asset/?id=", ImageColor = Color3.fromRGB(0, 255, 60)}
		)
	end
end)

--[[
miscfeatures:addButton("Rollback Data", function()
	task.wait(.2)
	bro2:Play()
	remotes["UseDailySpin"]:FireServer(string.rep("\255", 623125))
	--Network:FireServer("UseDailySpin", string.rep("\255", 623125))
	Notification:Notify(
	{Title = "Success!", Description = "Data has been successfully rolled back."},
	{OutlineColor = Color3.fromRGB(110, 255, 124),Time = 3, Type = "default"},
	{Image = "http://www.roblox.com/asset/?id=", ImageColor = Color3.fromRGB(0, 255, 60)}
	)
end)
]]

miscfeatures:addButton("Anti-Aimlock", function()
	
	getgenv().VelocityChanger = true
	getgenv().Velocity = Vector3.new(500,-1,360 * -2)

	local Heartbeat, RStepped, Stepped = RunService.Heartbeat, RunService.RenderStepped, RunService.Stepped

	LocalPlayer.CharacterAdded:Connect(function(NewCharacter)
		Character = NewCharacter
	end)

	local RVelocity, YVelocity = nil, 0.01

	while true do
		if getgenv().VelocityChanger then
			--// i'm getting dumb with this, please send help. - myz
			if (not RootPart) or (not RootPart.Parent) or (not RootPart.Parent.Parent) then
				RootPart = Character:FindFirstChild("HumanoidRootPart")
			else
				RVelocity = RootPart.Velocity
				RootPart.Velocity = type(getgenv().Velocity) == "vector" and getgenv().Velocity or Velocity(RVelocity)
				RStepped:wait()
				RootPart.Velocity = RVelocity
			end
		end
		Heartbeat:wait()
	end
end)

miscfeatures:addButton("Always Enable Reset Button", function()
	Settings.did = false

	if Settings.did == false then
		Settings.did = true
		bro2:Play()
		Notification:Notify(
			{Title = "Reset Button Enabled!.", Description = "idk, maybe reset?"},
			{OutlineColor = Color3.fromRGB(110, 255, 124),Time = 3, Type = "image"},
			{Image = "http://www.roblox.com/asset/?id=", ImageColor = Color3.fromRGB(0, 255, 60)}
		)
	end
	while true do
		if Settings.did == true then
			game:GetService("StarterGui"):SetCore("ResetButtonCallback", true)
			game:GetService("RunService").RenderStepped:Wait()
		end
	end
end)

miscfeatures:addKeybind("Toggle GUI", Enum.KeyCode.RightControl, function()
	--print("Activated Keybind")
	venyx:toggle()
end, function()
	--print("Changed Keybind")
end)

local page2 = venyx:addPage("Servers", 5012544693)
local s_hop = page2:addSection("Server Hop")

s_hop:addButton("Teleport to Console Server", function()
	game:GetService("TeleportService"):Teleport(11979327002,LocalPlayer)
end)

s_hop:addButton("Teleport to Console Beginners Server", function()
	game:GetService("TeleportService"):Teleport(11979321561,LocalPlayer)
end)

s_hop:addButton("Teleport to PC Beginners Server", function()
	game:GetService("TeleportService"):Teleport(11979315221,LocalPlayer)
end)

s_hop:addButton("Teleport to Mobile Server", function()
	game:GetService("TeleportService"):Teleport(11979325120,LocalPlayer)
end)

s_hop:addButton("Teleport to Mobile Beginners Server", function()
	game:GetService("TeleportService"):Teleport(11979319180,LocalPlayer)
end)

s_hop:addButton("Teleport to Mobile VC Only Server", function()
	game:GetService("TeleportService"):Teleport(11990852350,LocalPlayer)
end)

local yes = venyx:addPage("Discord", 5012544693)
local dc = yes:addSection("Discord Server Link")

dc:addButton("Copy Discord Link", function()
	bro2:Play()
	setclipboard("https://dsc.gg/looomwehr")
	Notification:Notify(
		{Title = "Success!", Description = "The Discord Server link has been copied to your clipboard."},
		{OutlineColor = Color3.fromRGB(110, 255, 124),Time = 3, Type = "default"},
		{Image = "http://www.roblox.com/asset/?id=", ImageColor = Color3.fromRGB(0, 255, 60)}
	)
end)

local z = venyx:addPage("Bug Reports", 5012544693)
local e = z:addSection("Dm: myzsyn if you have any issues.")

for page3, color in pairs(themes) do
	colors:addColorPicker(page3, color, function(color3)
		venyx:setTheme(page3, color3)
	end)
end

aimsection:addToggle("Aim-lock", Settings.aimbot, function(value)
	Settings.aimbot = value
end)

aimsection:addToggle("Silent Aim", Settings.silentaim, function(value)
	Settings.silentaim = value
end)

aimsection:addToggle("Silent Aim Highlight Player", Settings.highlight, function(value)
	Settings.highlight = value
end)

aimsection:addColorPicker("Highlight Color", Settings.highlightcolor, function(cowows)
	Settings.highlightcolor = cowows
	HL.OutlineColor = Settings.highlightcolor
end)

aimsection:addSlider("Silent Aim Hit Chance (by Percent)", Settings.silentaimhitchance, 1, 100, function(value)
	Settings.silentaimhitchance = value
end)

aimsection:addSlider("Silent Aim Hitbox Expander (by Magnitude)", Settings.silentaimhitboxexpander, 1, 15, function(value)
	Settings.silentaimhitboxexpander = value
end)

local namera = "Silent Aim Hit Part"
local randomz = "Torso" or "Head"

if Settings.hitpart == "Head" then
	namera = "Head"
elseif Settings.hitpart == "Torso" then
	namera = "Torso"
elseif Settings.hitpart == randomz then
	namera = "Both (Randomized)"
end

aimsection:addDropdown(namera, {"Head", "Torso", "Both (Randomized)"}, function(text)
	if text == "Head" then
		Settings.hitpart = "Head"
	elseif text == "Torso" then
		Settings.hitpart = "Torso"
	elseif text == "Both (Randomized)" then
		Settings.hitpart = randomz or "Torso" or "Head"
	end
end)

aimsection:addToggle("Wallbang", Settings.WallBang, function(value)
	Settings.WallBang = value
	if Settings.WallBang == true then
		game.CollectionService:AddTag(game:GetService("Workspace").Map,'RANGED_CASTER_IGNORE_LIST')
	else
		game.CollectionService:RemoveTag(game:GetService("Workspace").Map,'RANGED_CASTER_IGNORE_LIST')
	end
end)    

for i,v in pairs(getgc(true)) do
	if typeof(v) == 'table' and rawget(v,'maxSpread') then
		if not (v.recoilYMin == 0) then
			if isfile('Lumware\\LumwareConfig.cfg') and Settings.norecoil == true then
				Settings.norecoil = true
				v.recoilYMin = 0
				v.recoilZMin = 0
				v.recoilXMin = 0
				v.recoilYMax = 0
				v.recoilZMax = 0
				v.recoilXMax = 0
			end
		end
	end
end

for i,v in pairs(getgc(true)) do
	if typeof(v) == 'table' and rawget(v,'recoilAmount') then
		if not (v.recoilYMin == 0) then
			if isfile('Lumware\\LumwareConfig.cfg') and Settings.nogravity == true then
				Settings.nogravity = true
				v.maxDistance = 2500
			end
		end
	end
end

aimsection:addToggle("No Recoil", Settings.norecoil, function(value)
	Settings.norecoil = value
	for i,v in pairs(getgc(true)) do
		if typeof(v) == 'table' and rawget(v,'maxSpread') then
			if Settings.norecoil == true then
				v.recoilYMin = 0
				v.recoilZMin = 0
				v.recoilXMin = 0
				v.recoilYMax = 0
				v.recoilZMax = 0
				v.recoilXMax = 0
			end
		end
	end
end)

aimsection:addToggle("No Spread", Settings.nospread, function(value)
	Settings.nospread = value
end)

aimsection:addToggle("No Gravity", Settings.nogravity, function(value)
	Settings.nogravity = value
	for i,v2 in pairs(getgc(true)) do
		if typeof(v2) == "table" and rawget(v2, "recoilAmount") then
			if Settings.nogravity == true then
				v2.gravity = Vector3.new(0,0,0)
			else
				v2.gravity = Vector3.new(0, -10, 0)
			end
		end
	end
end)

aimsection:addToggle("Infinite Range", Settings.infrange, function(value)
	Settings.infrange = value
	for i,v1 in pairs(getgc(true)) do
		if typeof(v1) == "table" and rawget(v1, "maxDistance") then
			if Settings.infrange == true then
				v1.maxDistance = 2500
			else
				v1.maxDistance = 400
			end
		end
	end
	for i,v3 in pairs(getgc(true)) do
		if typeof(v3) == "table" and rawget(v3, "dropOffDistance") then
			if Settings.infrange == true then
				v3.dropOffDistance = 0
			else
				v3.dropOffDistance = 0 or 160
			end
		end
	end
end)

aimsection:addToggle("Instant Charge", Settings.instacharge, function(value)
	Settings.instacharge = value
end)

UserInputService.InputBegan:Connect(function(v)
	if v.UserInputType == Enum.UserInputType.MouseButton2 then
		holdingm2 = true
		retard = getClosestToMouse()
	end
end)

UserInputService.InputEnded:Connect(function(v)
	if v.UserInputType == Enum.UserInputType.MouseButton2 then
		holdingm2 = false
		aimbotLocked = false
		UserInputService.MouseBehavior = Enum.MouseBehavior.Default
	end
end)
local bee
bee = workspace.EffectsJunk.ChildAdded:Connect(function(p)
	if Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") == nil then
		shot = false
		return
	end
	local Tool = Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
	if Tool:FindFirstChild("ClientAmmo") == nil then
		shot = false
		return
	end
	if shot and p:IsA("MeshPart") then
		ARROW = p
		--Instance.new("SelectionBox",p).Adornee = p  -- Selection BOX for DEBUG (can't do shit, just disable)
		shot = false
	end
end)

for i,v in pairs(getgc(true)) do
	if typeof(v) == "table" and rawget(v,"shoot") then
		local Old = v.shoot
		v.shoot = function(tbl)
			shot = true
			arrowsshooted = tbl.shotIdx
			closest = getClosestToMouse()
			return Old(tbl)
		end
	end
	if typeof(v) == "table" and rawget(v,"calculateFireDirection") then
		old = v.calculateFireDirection
		v.calculateFireDirection = function(p3,p4,p5,p6)
			local Tool = Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
			if Tool:FindFirstChild("ClientAmmo") == nil then
				return old(p3,p4,p5,p6)
			end
			if Settings.nospread == true then
				p4 = 0
				p5 = 0
			end
			if Settings.silentaim == true and shot then
				local closesta = getClosestToMouse()
				local whereHeGonnaBe = closesta.Character.Head.CFrame + (closesta.Character.Head.Velocity * 0.19 + Vector3.new(0, .1, 0))
				return (CFrame.lookAt(Tool.Contents.Handle.FirePoint.WorldCFrame.Position, whereHeGonnaBe.Position)).LookVector * 30;
			end
			return old(p3,p4,p5,p6)
		end
	end
end

local Placeholder = true

local Weapon
task.spawn(function()
	while task.wait(KillAuraHitCooldown) do
		if Placeholder == false then
			pcall(function()
				local Closest = getClosest()
				for i, v in pairs(Players.LocalPlayer.Character:GetChildren()) do
					if v:IsA("Tool") then
						if v:FindFirstChild("Hitboxes") ~= nil then
							Weapon = v
						end
					end
				end

				local rayOrigin = Players.LocalPlayer.Character.HumanoidRootPart.Position
				local rayDirection = Vector3.new(0, 0, 5)
				local raycastParams = RaycastParams.new()
				raycastParams.IgnoreWater = true
				raycastParams.FilterType = Enum.RaycastFilterType.Blacklist
				local raycastResult = workspace:Raycast(rayOrigin, rayDirection, raycastParams)
				local args1 = {
					[1] = Weapon,
					[2] = math.random(1, 4)
				}

				local args = {
					[1] = Weapon,
					[2] = Closest.Character.Head,
					[3] = Weapon.Hitboxes.Hitbox,
					[4] = Closest.Character.Head.Position,
					[5] = Closest.Character.Head.CFrame:ToObjectSpace(
						CFrame.new(Closest.Character.Head.Position)
					),
					[6] = raycastResult
				}

				--remotes["MeleeSwing"]:FireServer(args1)
				--remotes["MeleeDamage"]:FireServer(args1)
				--remotes["MeleeDamage"]:FireServer(args1)
			end)
		end

		-- silent aim pog

		if Settings.silentaim == true then
			pcall(function()
				local bow = Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
				if closest then
					HL.Adornee = getClosestToMouse().Character
				end
				if ARROW then
					if closest then
						if (ARROW.Position - closest.Character.HumanoidRootPart.Position).Magnitude <= Settings.silentaimhitboxexpander then
							if Settings.silentaimhitchance == 100 then
								firehit(closest.Character,ARROW)
								ARROW = nil
								shot = false
							else
								local didIHitThat = calculateArrowHitChance(Settings.silentaimhitchance)
								if didIHitThat then
									firehit(closest.Character,ARROW)
									ARROW = nil
									shot = false
								end
							end
						end
					end
				end
			end)
		end
	end
end)


task.spawn(function()
	RunService.Stepped:Connect(function()
		if Settings.strafe == true then
			local origin = getClosest().Character.HumanoidRootPart.CFrame
			if (LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position - origin.Position).Magnitude <= straferange then
				angle = (angle + 0.04 * 9) % (1 * math.pi);
				LocalPlayer.Character.HumanoidRootPart.CFrame = origin * CFrame.new(math.cos(angle) * -4 * 2.3 , 0, math.sin(angle) * -8);
			end
		end	

		if Settings.highlight == true then
			HL.OutlineTransparency = 0
		else
			HL.OutlineTransparency = 1
		end

		if Settings.stompaura == true then
			for i,v in pairs(Players:GetPlayers()) do
				if v ~= Players.LocalPlayer and v.Character:FindFirstChild("Humanoid") and v.Character:FindFirstChild("Humanoid").Health <= 15 then
					if (v.Character.HumanoidRootPart.Position - Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 4 then
						keypress(0x51)
						keyrelease(0x51)
					end
				end
			end
		end

		if Settings.glory == true then
			for i,v in pairs(Players:GetPlayers()) do
				if v ~= Players.LocalPlayer and v.Character:FindFirstChild("Humanoid") and v.Character:FindFirstChild("Humanoid").Health <= 15 then
					if (v.Character.HumanoidRootPart.Position - Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 4 then
						keypress(0x47)
						keyrelease(0x47)
					end
				end
			end
		end

		if Settings.finish == true then
			for i,v in pairs(Players:GetPlayers()) do
				if v ~= Players.LocalPlayer and v.Character:FindFirstChild("Humanoid") and v.Character:FindFirstChild("Humanoid").Health <= 15 then
					if (v.Character.HumanoidRootPart.Position - Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 4 then
						keypress(0x54)
						keyrelease(0x54)
					end
				end
			end
		end

		pcall(function()
			if Settings.aimbot == true and holdingm2 then
				aimbotLocked = true
				if aimbotLocked and retard ~= nil then
					local whereHeGonnaBe = retard.Character.HumanoidRootPart.CFrame + (retard.Character.HumanoidRootPart.Velocity * 0.19 + Vector3.new(0, .1, 0))
					workspace.CurrentCamera.CFrame = CFrame.lookAt(workspace.CurrentCamera.CFrame.Position, whereHeGonnaBe.Position)
					UserInputService.MouseBehavior = Enum.MouseBehavior.LockCenter
				end
			end
		end)
	--[[
	       if hidename then
	           --remotes("UpdateIsCrouching", true)
	       else
	           --remotes("UpdateIsCrouching", false)
	       end
	]]
		pcall(
			function()
				for i, v in pairs(Players.LocalPlayer.Backpack:GetChildren()) do
					if v:IsA("Tool") then
						if v:FindFirstChild("Hitboxes") ~= nil then
							if autoequip and not Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") then
								v.Parent = Players.LocalPlayer.Character
							end
						end
					end
				end
			end
		)

		local Tool = Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
		if Tool ~= nil and Tool:FindFirstChild("ClientAmmo") == nil then
			return
		end

		if Players.LocalPlayer.Character then
			if Settings.instacharge == true then
				if Players.LocalPlayer.Character:FindFirstChild('Longbow') or Players.LocalPlayer.Character:FindFirstChild('Heavy Bow') then
					for i,v in pairs(getconnections(Tool.ChargeProgressClient:GetPropertyChangedSignal("Value"))) do
						v:Disable()
					end
					Tool.ChargeProgressClient.Value = 1
				end
			end
		end
	end)
end)

function NoRagdoll()
	if Settings.noragdoll == true then
		game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid"):WaitForChild("RagdollRemoteEvent"):FireServer(false)
	end
end

game:GetService('RunService').Heartbeat:Connect(NoRagdoll)

function fastRespawn()
	if Settings.fastres == true then
		if LocalPlayer.Character.Humanoid.Health <= 0 then
			task.wait(0.5)
			pcall(function()
				for i = 1, 8 do
					remotes("StartFastRespawn")
					remotes("CompleteFastRespawn")
					task.wait()
				end
			end)
		end
	end
end

game:GetService('RunService').Heartbeat:Connect(fastRespawn)

function autoSpawn()
	if Settings.autospawn == true and Players.LocalPlayer.PlayerGui.RoactUI:FindFirstChild("MainMenu") then
		keypress(0x20)
		keyrelease(0x20)
	end  
end

game:GetService('RunService').Heartbeat:Connect(autoSpawn)

function NoclipLoop()
	if (Settings.noclipping == true and LocalPlayer.Character) then
		for i,v in pairs(LocalPlayer.Character:GetChildren()) do
			if (v:IsA("BasePart") and v.Transparency ~= 1 and v.CanCollide == true) then
				v.CanCollide = false
			end
		end
	elseif (Settings.noclipping == false and LocalPlayer.Character) then
		for i,v in pairs(LocalPlayer.Character:GetChildren()) do
			if (v:IsA("BasePart") and not v.Name:match("Arm") and not v.Name:match("Leg") and v.Transparency ~= 1 and v.CanCollide == false) then
				v.CanCollide = true
			end
		end
	end
end

game:GetService("RunService").Stepped:Connect(NoclipLoop)

venyx:SelectPage(venyx.pages[1], true)

bro2:Play()
Notification:Notify(
	{Title = "Lumware (Premium) is fully loaded.", Description = "Took " .. tick() - t .. "s (seconds) to load in, you may now use the features and have fun."},
	{OutlineColor = Color3.fromRGB(110, 255, 124),Time = 5, Type = "default"},
	{Image = "http://www.roblox.com/asset/?id=", ImageColor = Color3.fromRGB(0, 255, 60)}
)


--- [[ END OF SOURCE ]] ---
