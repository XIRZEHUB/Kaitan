repeat wait() until game:IsLoaded()
repeat wait() until game:GetService("Players")
repeat wait() until game:GetService("Players").LocalPlayer
repeat wait() until game:GetService("Players").LocalPlayer.PlayerGui
repeat wait() until game:GetService("ReplicatedStorage").Effect.Container

_G.Main = {
    ["Start"] = true;
    ["Skip Level Farm"] = true;
    ["Bypass TP"] = true;
    ["Rejoin"] = true;
    ["Bring Fruit"] = true;
	["Auto Factory"] = true;
    ["Store Fruit"] = true;
	--["Eat Fruit Can Awake"] = true,
    ["Delay"] = 0.175;
    ["Random Fruit"] = true,
    ["Use Code"] = true,
    ["Fast Tween"] = true,
	["Check AFK"] = true,
	["AFK Time AMount"] = 600,
	["Lock Fruit"] = 1000000
}

_G.Race = {
	["Auto Evo V3"] = true
}

_G.Melee = {
    ["Super Human"] = true,
    ["Sharkman Karate"] = true,
    ["Death Step"] = true,
    ["Dragon Talon"] = true,
    ["Electric Claw"] = true,
    ["God Human"] = true
}

_G.Ram = {
    ["LimitLevel"] = 2450,
    ["Legendary Fruit"] = false,
    ["Inventory Log Des/Sheet"] = {"Valkyrie Helm","Mirror Fractal","Tushita","Yama","Dark Dagger","Hallow Scythe","Cursed Dual Katana"},
	["Enable"] = false,
	["Log Mode"] = "Normal"
}

_G.Mat = {
	["Dark Fragment"] = true,
	["Mirror Factal"] = true
}

_G.Fruit = {
	["Select Fruit"] = {"Ice-Ice","Flame-Flame","Dark-Dark"},  --[["Bomb-Bomb","Spike-Spike","Chop-Chop","Spring-Spring","Kilo-Kilo","Spin-Spin","Bird: Falcon","Smoke-Smoke","Flame-Flame","Ice-Ice","Sand-Sand","Dark-Dark","Revive-Revive","Diamond-Diamond","Light-Light","Love-Love","Rubber-Rubber","Barrier-Barrier","Magma-Magma","Door-Door","Quake-Quake","Human-Human: Buddha","String-String","Bird-Bird: Phoenix","Rumble-Rumble","Paw-Paw","Gravity-Gravity","Dough-Dough","Venom-Venom","Shadow-Shadow","Control-Control","Soul-Soul","Dragon-Dragon"]]
	["Buy Fruit"] = true
}

_G.HUD = {
    ["Black Screen"] = false,
	["Team"] = "Pirates",
    ["Boos FPS"] = false,
    ["Lock FPS"] = true,
    ["FPS AMount"] = 160,
    ["Close Ui"] = true
}

_G.Sword = {
    ['Saber'] = true,
    ['Pole v1'] = true,
    ['Midnight Blade'] = true,
    ['Shisui'] = true,
    ['Saddi'] = true,
    ['Wando'] = true,
    ['Yama'] = true,
    ['Koko'] = false,
    ['Rengoku'] = true,
    ['Canvander'] = true,
    ['Buddy Sword'] = true,
    ['Twin Hooks'] = true,
    ['SpikeyTrident'] = true,
    ['Hallow Scryte'] = true,
    ['Dark Dagger'] = true,
    ['Tushita'] = true,
    ['True Triple Katana'] = true,
    ['Cursed Dual Katana'] = true
}

_G.Gun = {
    ['Kabucha'] = true,
    ['Acidum Rifle'] = true,
    ['Soul Guitar'] = true,
    ['Serpent Bow'] = true
}

_G.Mastery = {
	["Melee"] = true,
	["Fruit"] = true,
	["Sword"] = true,
	["Setting Rarity"] = {"Mytical","Legendary"} -- "All","Mytical","Legendary","Rare","Uncommon","Common"
}
 
_G.WebHook = {
	["Link"] = "",-- link Here
	["DeLay Send"] = 600, -- 10m
	["Enable"] = false,
	["Ping Everyone"] = true
}




join = game.Players.localPlayer.Neutral == false
if (_G.HUD["Team"] == "Pirates" or _G.HUD["Team"] == "Marines" or _G.HUD["Team"] ~= "") and not join then
	repeat wait()
		pcall(function()
			join = game.Players.localPlayer.Neutral == false
			if _G.HUD["Team"] == "Pirates" then
				for i,v in pairs({"MouseButton1Click", "MouseButton1Down", "Activated"}) do
					for i,v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton[v])) do
						v.Function()
					end
				end
			elseif _G.HUD["Team"] == "Marines" then
				for i,v in pairs({"MouseButton1Click", "MouseButton1Down", "Activated"}) do
					for i,v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Marines.Frame.ViewportFrame.TextButton[v])) do
						v.Function()
					end
				end
			else
				for i,v in pairs({"MouseButton1Click", "MouseButton1Down", "Activated"}) do
					for i,v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton[v])) do
						v.Function()
					end
				end
			end
		end)
	until join == true and game.Players.LocalPlayer.Team ~= nil and game:IsLoaded() 
end


game:GetService("Players").LocalPlayer.Idled:connect(function()
	game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
	wait(1)
	game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

spawn(function()
	wait(5)
	_G.Check = true
end)

_G.set = {
	["Swordcompleat"] = false,
	["Fruitcompleat"] = false,
	["Meleecompleat"] = false
}

getgenv().Load = function()
    print("Loaded!")
	if readfile and writefile and isfile and isfolder then
		if not isfolder("Twst Kaitan Scripts") then
			makefolder("Twst Kaitan Scripts")
		end
		if not isfolder("Twst Kaitan Scripts/Blox Fruits/") then
			makefolder("Twst Kaitan Scripts/Blox Fruits/")
		end
		if not isfile("Twst Kaitan Scripts/Blox Fruits/US_" .. game.Players.LocalPlayer.Name .. ".json") then
			writefile("Twst Kaitan Scripts/Blox Fruits/US_" .. game.Players.LocalPlayer.Name .. ".json", game:GetService("HttpService"):JSONEncode(_G.set))
		else
			local Decode = game:GetService("HttpService"):JSONDecode(readfile("Twst Kaitan Scripts/Blox Fruits/US_" .. game.Players.LocalPlayer.Name .. ".json"))
			for i,v in pairs(Decode) do
				_G.set[i] = v
			end
		end
	else
		return warn("Status : Undetected Executor")
	end
end

getgenv().SaveSetting = function()
    print("Save!")
	if readfile and writefile and isfile and isfolder then
		if not isfile("Twst Kaitan Scripts/Blox Fruits/US_" .. game.Players.LocalPlayer.Name .. ".json") then
			getgenv().Load()
		else
			local Decode = game:GetService("HttpService"):JSONDecode(readfile("Twst Kaitan Scripts/Blox Fruits/US_" .. game.Players.LocalPlayer.Name .. ".json"))
			local Array = {}
			for i,v in pairs(_G.set) do
				Array[i] = v
			end
			writefile("Twst Kaitan Scripts/Blox Fruits/US_" .. game.Players.LocalPlayer.Name .. ".json", game:GetService("HttpService"):JSONEncode(Array))
		end
	else
		return warn("Status : Undetected Executor")
	end
end

getgenv().Load()

spawn(function()
    while true do wait()
        getgenv().rejoin = game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(Kick)
            if not _G.TP_Ser and _G.Main["Rejoin"] then
                if Kick.Name == 'ErrorPrompt' and Kick:FindFirstChild('MessageArea') and Kick.MessageArea:FindFirstChild("ErrorFrame") then
					wait(5)
                    local ts = game:GetService("TeleportService")
                    local p = game:GetService("Players").LocalPlayer
                    ts:Teleport(game.PlaceId)
                    wait(50)
                end
            end
        end)
    end
end)

if not LPH_OBFUSCATED then
    LPH_JIT_MAX = (function(...) return ... end)
    LPH_NO_VIRTUALIZE = (function(...) return ... end)
    LPH_NO_UPVALUES = (function(...) return ... end)
end
	LPH_JIT_MAX(function()
		task.spawn(function() -- Bring Mob Function
			while wait() do
				if StartSoulGuitarMagnt then 
					pcall(function() 
						for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
							if v.Name == "Living Zombie [Lv. 2000]" then 
								v.HumanoidRootPart.CFrame = CFrame.new(-10138.3974609375, 138.6524658203125, 5902.89208984375)
								v.Head.CanCollide = false
								v.Humanoid.Sit = false
								v.HumanoidRootPart.CanCollide = false
								v.Humanoid.JumpPower = 0
								v.Humanoid.WalkSpeed = 0
								if v.Humanoid:FindFirstChild('Animator') then
									v.Humanoid:FindFirstChild('Animator'):Destroy() 
								end
								sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
							end
						end    
					end)
				end
			end
		end)
	end)()


local function GetIsLand(...)
    local RealtargetPos = {...}
    local targetPos = RealtargetPos[1]
    local RealTarget
    if type(targetPos) == "vector" then
        RealTarget = targetPos
    elseif type(targetPos) == "userdata" then
        RealTarget = targetPos.Position
    elseif type(targetPos) == "number" then
        RealTarget = CFrame.new(unpack(RealtargetPos))
        RealTarget = RealTarget.p
    end

    local ReturnValue
    local CheckInOut = math.huge;
    if game.Players.LocalPlayer.Team then
        for i,v in pairs(game.Workspace._WorldOrigin.PlayerSpawns:FindFirstChild(tostring(game.Players.LocalPlayer.Team)):GetChildren()) do 
            local ReMagnitude = (RealTarget - v:GetModelCFrame().p).Magnitude;
            if ReMagnitude < CheckInOut then
                CheckInOut = ReMagnitude;
                ReturnValue = v.Name
            end
        end
        if ReturnValue then
            return ReturnValue
        end 
    end
end


local function TPs(...)
	local RealtargetPos = {...}
	local targetPos = RealtargetPos[1]
	local RealTarget
	if type(targetPos) == "vector" then
		RealTarget = CFrame.new(targetPos)
	elseif type(targetPos) == "userdata" then
		RealTarget = targetPos
	elseif type(targetPos) == "number" then
		RealTarget = CFrame.new(unpack(RealtargetPos))
	end

	if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Health == 0 then if tween then tween:Cancel() end repeat wait() until game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Health > 0; wait(0.2) end

	local tweenfunc = {}
	local Distance = (RealTarget.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).Magnitude
	if Distance <= 500 then
		Speed = 300
	else
		Speed = 350
	end
	local tween_s = game:service"TweenService"
	local info = TweenInfo.new((RealTarget.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).Magnitude/Speed, Enum.EasingStyle.Linear)
	local tweenw, err = pcall(function()
		tween = tween_s:Create(game.Players.LocalPlayer.Character["HumanoidRootPart"], info, {CFrame = RealTarget})
		tween:Play()
	end)

	function tweenfunc:Stop()
		tween:Cancel()
	end 

	function tweenfunc:Wait()
		tween.Completed:Wait()
	end 

	return tweenfunc
end

function TP(...)
    local RealtargetPos = {...}
    local targetPos = RealtargetPos[1]
    local RealTarget
    if type(targetPos) == "vector" then
        RealTarget = CFrame.new(targetPos)
    elseif type(targetPos) == "userdata" then
        RealTarget = targetPos
    elseif type(targetPos) == "number" then
        RealTarget = CFrame.new(unpack(RealtargetPos))
    end

    if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Health == 0 then if tween then tween:Cancel() end repeat wait() until game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Health > 0; wait(0.2) end

    local tweenfunc = {}
    local Distance = (RealTarget.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).Magnitude
	if Distance < 50 then
		Speed = 1000
	elseif Distance < 100 then
		Speed = 800
	elseif Distance < 250 then
		Speed = 700
	elseif Distance < 300 then
		Speed = 500
	elseif Distance < 1000 then
		Speed = 375
	elseif Distance >= 1000 then
		Speed = 350
	end
    
    if Distance > 3000 and not AutoRaids and not Auto_Quest_Yama_2 and not Auto_Quest_Tushita_1 and not Auto_Quest_Tushita_3 and not havse and not Che and not RaidSumfruit and not QuestGod and not hfi and not gotp3 and not (game.Players.LocalPlayer.Backpack:FindFirstChild("Special Microchip") or game.Players.LocalPlayer.Character:FindFirstChild("Special Microchip") or game.Players.LocalPlayer.Backpack:FindFirstChild("God's Chalice") or game.Players.LocalPlayer.Character:FindFirstChild("God's Chalice") or game.Players.LocalPlayer.Backpack:FindFirstChild("Hallow Essence") or game.Players.LocalPlayer.Character:FindFirstChild("Hallow Essence") or game.Players.LocalPlayer.Character:FindFirstChild("Sweet Chalice") or game.Players.LocalPlayer.Backpack:FindFirstChild("Sweet Chalice") or game.Workspace:FindFirstChild("Enemies"):FindFirstChild("Dough King [Lv. 2300] [Raid Boss]") or game:GetService("ReplicatedStorage"):FindFirstChild("Dough King [Lv. 2300] [Raid Boss]") or game.Players.LocalPlayer.Backpack:FindFirstChild("Holy Torch") or game.Players.LocalPlayer.Character:FindFirstChild("Holy Torch") or game.Players.LocalPlayer.Character:FindFirstChild("Red Key") or game.Players.LocalPlayer.Backpack:FindFirstChild("Red Key")) and not (Ms == "Fishman Commando [Lv. 400]" or Ms == "Fishman Warrior [Lv. 375]") then
		pcall(function()
			tween:Cancel()
			fkwarp = false
			if game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").Health > 0 then
				if fkwarp == false then
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = RealTarget
				end
				fkwarp = true
			end
			wait(0.01999999)
			game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid"):ChangeState(15)
			wait(0.001)
			repeat wait() until game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").Health > 0
			wait(0.000001)
			return
		end)
    end

    local tween_s = game:service"TweenService"
    local info = TweenInfo.new((RealTarget.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).Magnitude/Speed, Enum.EasingStyle.Linear)
    local tweenw, err = pcall(function()
        tween = tween_s:Create(game.Players.LocalPlayer.Character["HumanoidRootPart"], info, {CFrame = RealTarget})
        tween:Play()
    end)

    function tweenfunc:Stop()
        tween:Cancel()
    end 

    function tweenfunc:Wait()
        tween.Completed:Wait()
    end 

	if _G.Stop_Tween then
		tween:Cancel()
	end

    return tweenfunc
end

function TPB(Name,CFgo)
	local tween_s = game:service"TweenService"
	local info = TweenInfo.new((game:GetService("Workspace").Boats:FindFirstChild(Name).VehicleSeat.CFrame.Position - CFgo.Position).Magnitude/300, Enum.EasingStyle.Linear)
	tween = tween_s:Create(game:GetService("Workspace").Boats:FindFirstChild(Name).VehicleSeat, info, {CFrame = CFgo})
	tween:Play()

	local tweenfunc = {}

	function tweenfunc:Stop()
		tween:Cancel()
	end

	return tweenfunc
end

function TPF(Name)
	local CF = {}
	for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].EnemySpawns:GetChildren())do
		if v.Name == Name then
			table.insert(CF,v.CFrame)
			print(v.CFrame)
			local Distance = (v.CFrame.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).Magnitude
			--pcall(function()
				repeat wait()
					TP(v.CFrame * CFrame.new(0,30,0))
				until (v.CFrame.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).Magnitude < 5 or game:GetService("Workspace").Enemies:FindFirstChild(Ms)
			--end)
		end
	end 
	return CF
end

function TPP(CFgo)
	if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Health <= 0 or not game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid") then tween:Cancel() repeat wait() until game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid") and game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").Health > 0 wait(7) return end
	local tween_s = game:service"TweenService"
	local info = TweenInfo.new((game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart.Position - CFgo.Position).Magnitude/375, Enum.EasingStyle.Linear)
	tween = tween_s:Create(game.Players.LocalPlayer.Character["HumanoidRootPart"], info, {CFrame = CFgo})
	tween:Play()

	local tweenfunc = {}

	function tweenfunc:Stop()
		tween:Cancel()
	end

	return tweenfunc
end

function Com(com,...)
	local Remote = game:GetService('ReplicatedStorage').Remotes:FindFirstChild("Comm"..com)
	if Remote:IsA("RemoteEvent") then
		Remote:FireServer(...)
	elseif Remote:IsA("RemoteFunction") then
		Remote:InvokeServer(...)
	end
end

function CheckMasteryWeapon(NameWe,MasNum)
	if game.Players.LocalPlayer.Backpack:FindFirstChild(NameWe) then
		if tonumber(game.Players.LocalPlayer.Backpack:FindFirstChild(NameWe).Level.Value) < tonumber(MasNum) then
			return "true DownTo"
		elseif tonumber(game.Players.LocalPlayer.Backpack:FindFirstChild(NameWe).Level.Value) >= tonumber(MasNum) then
			return "true UpTo"
		end
	end
	if game.Players.LocalPlayer.Character:FindFirstChild(NameWe) then
		if tonumber(game.Players.LocalPlayer.Character:FindFirstChild(NameWe).Level.Value) < tonumber(MasNum) then
			return "true DownTo"
		elseif tonumber(game.Players.LocalPlayer.Character:FindFirstChild(NameWe).Level.Value) >= tonumber(MasNum) then
			return "true UpTo"
		end
	end
	return "else"
end

local function CheckSeabeast()
    for i,v in pairs(game.Workspace.SeaBeasts:GetChildren()) do
        if v:FindFirstChild("HumanoidRootPart") then
            return v
        end
    end
    return false
end

local function myboat(NameBoat)
    for i,v in pairs(game:GetService("Workspace").Boats:GetChildren()) do 
        if #game:GetService("Workspace").Boats:GetChildren() > 0 then
            if v:FindFirstChild("Owner") then
                if tostring(v.Owner.Value) == game.Players.LocalPlayer.Name then
                    return v.Plank.CFrame * CFrame.new(0.1,-0.5,0)
                end
            end
        end
    end
    return false
end

ExpensiveFruit = {}
Have1m = false
task.spawn(function()
	pcall(function()
		while wait() do
			for i,v in pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventoryFruits")) do
				if v.Price >= 1000000 and not table.find(ExpensiveFruit, v) then
					table.insert(ExpensiveFruit, v)
					Have1m = true
				end
			end
			table.sort(ExpensiveFruit, function(a, b)
				return a.Price < b.Price
			end)
		end
	end)
end)

task.spawn(function()
	while true do task.wait(5)
		table.clear(ExpensiveFruit)
	end
end)

function GetDistance(P)
	local Distance = (P.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
	return Distance
end

function Dis(P)
	local Distance = (P.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
	return Distance
end

FruitCanAwaketable = {}
for i,v in pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetFruits")) do
	if v.Data["Awakening"] and not table.find(FruitCanAwaketable, v) then
		table.insert(FruitCanAwaketable, v)
	end
end
table.sort(FruitCanAwaketable, function(a, b)
	return a.Price > b.Price
end)
FruitCanAwake = {}
for i,v in pairs(FruitCanAwaketable) do
    if not table.find(FruitCanAwake, v.Name) then
        table.insert(FruitCanAwake, v.Name)
    end
end

function UseLessFruit()
	uselessfruit = {}
	for i,v in pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventoryFruits")) do
		if v.Price < _G.Main["Lock Fruit"] then
			table.insert(uselessfruit, v.Name)
		end
	end
	return uselessfruit
end

Old_World = false
New_World = false
Three_World = false
local placeId = game.PlaceId
if placeId == 2753915549 then
    Old_World = true
elseif placeId == 4442272183 then
    New_World = true
elseif placeId == 7449423635 then
	Three_World = true
end

function GetMaterial(matname)
	for i,v in pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventory")) do
		if type(v) == "table" then
			if v.Type == "Material" then
				if v.Name == matname then
					return v.Count
				end
			end
		end
	end
	return 0
end

local function CheckMaterial(v1)
	if Old_World then 
		if (v1=="Magma Ore") then 
			MaterialMob={"Military Soldier [Lv. 300]","Military Spy [Lv. 325]"};
			CFrameMon=CFrame.new( -5815,84,8820);
		elseif ((v1=="Leather") or (v1=="Scrap Metal")) then 
			MaterialMob={"Brute [Lv. 45]"};
			CFrameMon=CFrame.new( -1145,15,4350);
		elseif (v1=="Angel Wings") then 
			MaterialMob={"God's Guard [Lv. 450]"};
			CFrameMon=CFrame.new( -4698,845, -1912);
		elseif (v1=="Fish Tail") then 
			MaterialMob={"Fishman Warrior [Lv. 375]","Fishman Commando [Lv. 400]"};
			CFrameMon=CFrame.new(61346.1640625, 51.34999084472656, 1467.873291015625);
		end 
	end 
	if New_World then 
		if (v1=="Magma Ore") then 
			MaterialMob={"Magma Ninja [Lv. 1175]"};
			CFrameMon=CFrame.new( -5428,78, -5959);
		elseif (v1=="Scrap Metal") then
			MaterialMob={"Swan Pirate [Lv. 775]"};
			CFrameMon=CFrame.new(878,122,1235);
		elseif (v1=="Radioactive Material") then 
			MaterialMob={"Factory Staff [Lv. 800]"};
			CFrameMon=CFrame.new(295,73, -56);
		elseif (v1=="Vampire Fang") then 
			MaterialMob={"Vampire [Lv. 975]"};
			CFrameMon=CFrame.new( -6033,7, -1317);
		elseif (v1=="Mystic Droplet") then 
			MaterialMob={"Water Fighter [Lv. 1450]","Sea Soldier [Lv. 1425]"};
			CFrameMon=CFrame.new( -3385,239, -10542);
		end 
	end 
	if Three_World then 
		if (v1=="Mini Tusk") then 
			MaterialMob={"Mythological Pirate [Lv. 1850]"};
			CFrameMon=CFrame.new( -13545,470, -6917);
		elseif (v1=="Fish Tail") then 
			MaterialMob={"Fishman Raider [Lv. 1775]","Fishman Captain [Lv. 1800]"};
			CFrameMon=CFrame.new( -10993,332, -8940);
		elseif (v1=="Scrap Metal") then 
			MaterialMob={"Jungle Pirate [Lv. 1900]"};
			CFrameMon=CFrame.new( -12107,332, -10549);
		elseif (v1=="Dragon Scale") then 
			MaterialMob={"Dragon Crew Archer [Lv. 1600]","Dragon Crew Warrior [Lv. 1575]"};
			CFrameMon=CFrame.new(6594,383,139);
		elseif (v1=="Conjured Cocoa") then 
			MaterialMob={"Cocoa Warrior [Lv. 2300]","Chocolate Bar Battler [Lv. 2325]","Sweet Thief [Lv. 2350]","Candy Rebel [Lv. 2375]"};
			CFrameMon=CFrame.new(620.6344604492188,78.93644714355469, -12581.369140625);
		elseif (v1=="Demonic Wisp") then MaterialMob={"Demonic Soul [Lv. 2025]"};
			CFrameMon=CFrame.new( -9507,172,6158);
		elseif (v1=="Gunpowder") then MaterialMob={"Pistol Billionaire [Lv. 1525]"};
			CFrameMon=CFrame.new( -469,74,5904);
		end 
	end 
end

function CheckLevel()
	local Lv = game:GetService("Players").LocalPlayer.Data.Level.Value
	if Old_World and not Auto_Raid then
		if Lv >= 1 and Lv <= 9 or SelectMonster == "Bandit [Lv. 5]" then -- Bandit
			Ms = "Bandit [Lv. 5]"
			NameQuest = "BanditQuest1"
			QuestLv = 1
			NameMon = "Bandit"
			CFrameQ = CFrame.new(1059.37195, 15.4495068, 1550.4231, 0.939700544, -0, -0.341998369, 0, 1, -0, 0.341998369, 0, 0.939700544)
			CFrameMon = CFrame.new(1353.44885, 3.40935516, 1376.92029, 0.776053488, -6.97791975e-08, 0.630666852, 6.99138596e-08, 1, 2.4612488e-08, -0.630666852, 2.49917598e-08, 0.776053488)
		elseif Lv >= 10 and Lv <= 14 or SelectMonster == "Monkey [Lv. 14]" then -- Monkey
			 
			Ms = "Monkey [Lv. 14]"
			NameQuest = "JungleQuest"
			QuestLv = 1
			NameMon = "Monkey"
			CFrameQ = CFrame.new(-1598.08911, 35.5501175, 153.377838, 0, 0, 1, 0, 1, -0, -1, 0, 0)
			CFrameMon = CFrame.new(-1402.74609, 98.5633316, 90.6417007, 0.836947978, 0, 0.547282517, -0, 1, -0, -0.547282517, 0, 0.836947978)
			
		elseif Lv >= 15 and Lv <= 19 or SelectMonster == "Gorilla [Lv. 20]" then -- Gorilla
			Ms = "Gorilla [Lv. 20]"
			NameQuest = "JungleQuest"
			QuestLv = 2
			NameMon = "Gorilla"
			CFrameQ = CFrame.new(-1598.08911, 35.5501175, 153.377838, 0, 0, 1, 0, 1, -0, -1, 0, 0)
			CFrameMon = CFrame.new(-1267.89001, 66.2034225, -531.818115, -0.813996196, -5.25169774e-08, -0.580869019, -5.58769671e-08, 1, -1.21082593e-08, 0.580869019, 2.26011476e-08, -0.813996196)
			SelectMonster = "Monkey [Lv. 14]"
		elseif Lv >= 300 and Lv <= 324 or SelectMonster == "Military Soldier [Lv. 300]" then -- Military Soldier
			 
			Ms = "Military Soldier [Lv. 300]"
			NameQuest = "MagmaQuest"
			QuestLv = 1
			NameMon = "Military Soldier"
			CFrameQ = CFrame.new(-5316.55859, 12.2370615, 8517.2998, 0.588437557, -1.37880001e-08, -0.808542669, -2.10116209e-08, 1, -3.23446478e-08, 0.808542669, 3.60215964e-08, 0.588437557)
			CFrameMon = CFrame.new(-5363.01123, 41.5056877, 8548.47266, -0.578253984, -3.29503091e-10, 0.815856814, 9.11209668e-08, 1, 6.498761e-08, -0.815856814, 1.11920997e-07, -0.578253984)
			
		elseif Lv >= 325 and Lv <= 374 or SelectMonster == "Military Spy [Lv. 325]" then -- Military Spy
			 
			Ms = "Military Spy [Lv. 325]"
			NameQuest = "MagmaQuest"
			QuestLv = 2
			NameMon = "Military Spy"
			CFrameQ = CFrame.new(-5316.55859, 12.2370615, 8517.2998, 0.588437557, -1.37880001e-08, -0.808542669, -2.10116209e-08, 1, -3.23446478e-08, 0.808542669, 3.60215964e-08, 0.588437557)
			CFrameMon = CFrame.new(-5787.99023, 120.864456, 8762.25293, -0.188358366, -1.84706277e-08, 0.982100308, -1.23782129e-07, 1, -4.93306951e-09, -0.982100308, -1.22495649e-07, -0.188358366)
			SelectMonster = "Military Soldier [Lv. 300]"
		elseif Lv >= 375 and Lv <= 399 or SelectMonster == "Fishman Warrior [Lv. 375]" then -- Fishman Warrior	 
			Ms = "Fishman Warrior [Lv. 375]"
			NameQuest = "FishmanQuest"
			QuestLv = 1
			NameMon = "Fishman Warrior"
			CFrameQ = CFrame.new(61122.5625, 18.4716396, 1568.16504, 0.893533468, 3.95251609e-09, 0.448996574, -2.34327455e-08, 1, 3.78297464e-08, -0.448996574, -4.43233645e-08, 0.893533468)
			CFrameMon = CFrame.new(60946.6094, 48.6735229, 1525.91687, -0.0817126185, 8.90751153e-08, 0.996655822, 2.00889794e-08, 1, -8.77269599e-08, -0.996655822, 1.28533992e-08, -0.0817126185)
			if _G.Main["Start"] and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
				_G.Stop_Tween = true
				TP(CFrameQ)
				wait(.5)
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
				wait(.5)
				_G.Stop_Tween = nil
			end
		elseif Lv >= 400 and Lv <= 449 or SelectMonster == "Fishman Commando [Lv. 400]" then -- Fishman Commando
			 
			Ms = "Fishman Commando [Lv. 400]"
			NameQuest = "FishmanQuest"
			QuestLv = 2
			NameMon = "Fishman Commando"
			CFrameQ = CFrame.new(61122.5625, 18.4716396, 1568.16504)
			CFrameMon = CFrame.new(61877.8516, 75.4723358, 1400.76831, -0.828722656, -2.44484943e-09, -0.559659481, -6.34942552e-08, 1, 8.96514436e-08, 0.559659481, 1.09831348e-07, -0.828722656)
			if _G.Main["Start"] and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
				_G.Stop_Tween = true
				TP(CFrameQ)
				wait(.5)
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
				wait(.5)
				_G.Stop_Tween = nil
			end
			SelectMonster = "Fishman Warrior [Lv. 375]"
		elseif Lv >= 450 and Lv <= 474 or SelectMonster == "God's Guard [Lv. 450]" then 
			Ms = "God's Guard [Lv. 450]"
			NameQuest = "SkyExp1Quest"
			QuestLv = 1
			NameMon = "God's Guards"
			CFrameQ = CFrame.new(-4721.71436, 845.277161, -1954.20105)
			CFrameMon = CFrame.new(-4716.95703, 853.089722, -1933.925427)
			if _G.Main["Start"] and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
				_G.Stop_Tween = true
				TP(CFrameQ)
				wait(.5)
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-4607.82275, 872.54248, -1667.55688))
				wait(.5)
				_G.Stop_Tween = nil
			end
		elseif Lv >= 475 and Lv <= 524 or SelectMonster == "Shanda [Lv. 475]" then
			Ms = "Shanda [Lv. 475]"
			NameQuest = "SkyExp1Quest"
			QuestLv = 2
			NameMon = "Shandas"
			CFrameQ = CFrame.new(-7859.09814, 5544.19043, -381.476196, -0.422592998, 0, 0.906319618, 0, 1, 0, -0.906319618, 0, -0.422592998)
			CFrameMon = CFrame.new(-7681.72314453125, 5566.8828125, -497.67218017578125)
			if _G.Main["Start"] and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
				_G.Stop_Tween = true
				TP(CFrameQ)
				wait(.5)
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
				wait(.5)
				_G.Stop_Tween = nil
			end
		elseif Lv >= 525 and Lv <= 549 or SelectMonster == "Royal Squad [Lv. 525]" then -- Royal Squad
			Ms = "Royal Squad [Lv. 525]"
			NameQuest = "SkyExp2Quest"
			QuestLv = 1
			NameMon = "Royal Squad"
			CFrameQ = CFrame.new(-7906.81592, 5634.6626, -1411.99194, 0, 0, -1, 0, 1, 0, 1, 0, 0)
			CFrameMon = CFrame.new(-7648.55517578125, 5606.876953125, -1471.151611328125)
			if _G.Main["Start"] and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
				_G.Stop_Tween = true
				TP(CFrameQ)
				wait(.5)
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
				wait(.5)
				_G.Stop_Tween = nil
			end
			--SelectMonster = "Shanda [Lv. 475]"
		elseif Lv >= 550 and Lv <= 624 or SelectMonster == "Royal Soldier [Lv. 550]" then -- Royal Soldier 
			Ms = "Royal Soldier [Lv. 550]"
			NameQuest = "SkyExp2Quest"
			QuestLv = 2
			NameMon = "Royal Soldier"
			CFrameQ = CFrame.new(-7906.81592, 5634.6626, -1411.99194, 0, 0, -1, 0, 1, 0, 1, 0, 0)
			CFrameMon = CFrame.new(-7837.31152, 5649.65186, -1791.08582, -0.716008604, 0.0104285581, -0.698013008, 5.02521061e-06, 0.99988848, 0.0149335321, 0.69809103, 0.0106890313, -0.715928733)
			if _G.Main["Start"] and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
				_G.Stop_Tween = true
				TP(CFrameQ)
				wait(.5)
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
				wait(.5)
				_G.Stop_Tween = nil
			end
			SelectMonster = "Royal Squad [Lv. 525]"
		elseif Lv >= 625 and Lv <= 649 or SelectMonster == "Galley Pirate [Lv. 625]" then -- Galley Pirate
			Ms = "Galley Pirate [Lv. 625]"
			NameQuest = "FountainQuest"
			QuestLv = 1
			NameMon = "Galley Pirate"
			CFrameQ = CFrame.new(5259.81982, 37.3500175, 4050.0293, 0.087131381, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, 0.087131381)
			CFrameMon = CFrame.new(5569.80518, 38.5269432, 3849.01196, 0.896460414, 3.98027495e-08, 0.443124533, -1.34262139e-08, 1, -6.26611296e-08, -0.443124533, 5.02237434e-08, 0.896460414)
		elseif Lv >= 650 or SelectMonster == "Galley Captain [Lv. 650]" then -- Galley Captain
			Ms = "Galley Captain [Lv. 650]"
			NameQuest = "FountainQuest"
			QuestLv = 2
			NameMon = "Galley Captain"
			CFrameQ = CFrame.new(5259.81982, 37.3500175, 4050.0293, 0.087131381, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, 0.087131381)
			CFrameMon = CFrame.new(5782.90186, 94.5326462, 4716.78174, 0.361808896, -1.24757526e-06, -0.932252586, 2.16989656e-06, 1, -4.96097414e-07, 0.932252586, -1.84339774e-06, 0.361808896)
			SelectMonster = "Galley Pirate [Lv. 625]"
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
		end
	end
	if New_World then
		if Lv == 700 or Lv <= 724 or SelectMonster == "Raider [Lv. 700]" then -- Raider [Lv. 700]
			Ms = "Raider [Lv. 700]"
			NameQuest = "Area1Quest"
			QuestLv = 1
			NameMon = "Raider"
			CFrameQ = CFrame.new(-429.543518, 71.7699966, 1836.18188, -0.22495985, 0, -0.974368095, 0, 1, 0, 0.974368095, 0, -0.22495985)
			CFrameMon = CFrame.new(-737.026123, 10.1748352, 2392.57959, 0.272128761, 0, -0.962260842, -0, 1, -0, 0.962260842, 0, 0.272128761)
		elseif Lv == 725 or Lv <= 774 or SelectMonster == "Mercenary [Lv. 725]" then -- Mercenary [Lv. 725]
			Ms = "Mercenary [Lv. 725]"
			NameQuest = "Area1Quest"
			QuestLv = 2
			NameMon = "Mercenary"
			CFrameQ = CFrame.new(-429.543518, 71.7699966, 1836.18188, -0.22495985, 0, -0.974368095, 0, 1, 0, 0.974368095, 0, -0.22495985)
			CFrameMon = CFrame.new(-1022.21271, 72.9855194, 1891.39148, -0.990782857, 0, -0.135460541, 0, 1, 0, 0.135460541, 0, -0.990782857)
			SelectMonster = "Raider [Lv. 700]"
		elseif Lv == 775 or Lv <= 799 or SelectMonster == "Swan Pirate [Lv. 775]" then -- Swan Pirate [Lv. 775]
			Ms = "Swan Pirate [Lv. 775]"
			NameQuest = "Area2Quest"
			QuestLv = 1
			NameMon = "Swan Pirate"
			CFrameQ = CFrame.new(638.43811, 71.769989, 918.282898, 0.139203906, 0, 0.99026376, 0, 1, 0, -0.99026376, 0, 0.139203906)
			CFrameMon = CFrame.new(976.467651, 111.174057, 1229.1084, 0.00852567982, -4.73897828e-08, -0.999963999, 1.12251888e-08, 1, -4.7295778e-08, 0.999963999, -1.08215579e-08, 0.00852567982)
		elseif Lv == 800 or Lv <= 874 or SelectMonster == "Factory Staff [Lv. 800]" then -- Factory Staff [Lv. 800]
			Ms = "Factory Staff [Lv. 800]"
			NameQuest = "Area2Quest"
			QuestLv = 2
			NameMon = "Factory Staff"
			CFrameQ = CFrame.new(638.43811, 71.769989, 918.282898, 0.139203906, 0, 0.99026376, 0, 1, 0, -0.99026376, 0, 0.139203906)
			CFrameMon = CFrame.new(336.74585, 73.1620483, -224.129272, 0.993632793, 3.40154607e-08, 0.112668738, -3.87658332e-08, 1, 3.99718729e-08, -0.112668738, -4.40850592e-08, 0.993632793)
			SelectMonster = "Swan Pirate [Lv. 775]"
		elseif Lv == 875 or Lv <= 899 or SelectMonster == "Marine Lieutenant [Lv. 875]" then -- Marine Lieutenant [Lv. 875]
			Ms = "Marine Lieutenant [Lv. 875]"
			NameQuest = "MarineQuest3"
			QuestLv = 1
			NameMon = "Marine Lieutenant"
			CFrameQ = CFrame.new(-2440.79639, 71.7140732, -3216.06812, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
			CFrameMon = CFrame.new(-2842.69922, 72.9919434, -2901.90479, -0.762281299, 0, -0.64724648, 0, 1.00000012, 0, 0.64724648, 0, -0.762281299)
		elseif Lv == 900 or Lv <= 949 or SelectMonster == "Marine Captain [Lv. 900]" then -- Marine Captain [Lv. 900]
			Ms = "Marine Captain [Lv. 900]"
			NameQuest = "MarineQuest3"
			QuestLv = 2
			NameMon = "Marine Captain"
			CFrameQ = CFrame.new(-2440.79639, 71.7140732, -3216.06812, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
			CFrameMon = CFrame.new(-1814.70313, 72.9919434, -3208.86621, -0.900422215, 7.93464423e-08, -0.435017526, 3.68856199e-08, 1, 1.06050372e-07, 0.435017526, 7.94441988e-08, -0.900422215)
			SelectMonster = "Marine Lieutenant [Lv. 875]"
		elseif Lv == 950 or Lv <= 974 or SelectMonster == "Zombie [Lv. 950]" then -- Zombie [Lv. 950]
			Ms = "Zombie [Lv. 950]"
			NameQuest = "ZombieQuest"
			QuestLv = 1
			NameMon = "Zombie"
			CFrameQ = CFrame.new(-5497.06152, 47.5923004, -795.237061, -0.29242146, 0, -0.95628953, 0, 1, 0, 0.95628953, 0, -0.29242146)
			CFrameMon = CFrame.new(-5649.23438, 126.0578, -737.773743, 0.355238914, -8.10359282e-08, 0.934775114, 1.65461245e-08, 1, 8.04023372e-08, -0.934775114, -1.3095117e-08, 0.355238914)
		elseif Lv == 975 or Lv <= 999 or SelectMonster == "Vampire [Lv. 975]" then -- Vampire [Lv. 975]
			Ms = "Vampire [Lv. 975]"
			NameQuest = "ZombieQuest"
			QuestLv = 2
			NameMon = "Vampire"
			CFrameQ = CFrame.new(-5497.06152, 47.5923004, -795.237061, -0.29242146, 0, -0.95628953, 0, 1, 0, 0.95628953, 0, -0.29242146)
			CFrameMon = CFrame.new(-6030.32031, 0.4377408, -1313.5564, -0.856965423, 3.9138893e-08, -0.515373945, -1.12178942e-08, 1, 9.45958547e-08, 0.515373945, 8.68467822e-08, -0.856965423)
			SelectMonster = "Zombie [Lv. 950]"
		elseif Lv == 1000 or Lv <= 1049 or SelectMonster == "Snow Trooper [Lv. 1000]" then -- Snow Trooper [Lv. 1000] **
			Ms = "Snow Trooper [Lv. 1000]"
			NameQuest = "SnowMountainQuest"
			QuestLv = 1
			NameMon = "Snow Trooper"
			CFrameQ = CFrame.new(609.858826, 400.119904, -5372.25928, -0.374604106, 0, 0.92718488, 0, 1, 0, -0.92718488, 0, -0.374604106)
			CFrameMon = CFrame.new(621.003418, 391.361053, -5335.43604, 0.481644779, 0, 0.876366913, 0, 1, 0, -0.876366913, 0, 0.481644779)
		elseif Lv == 1050 or Lv <= 1099 or SelectMonster == "Winter Warrior [Lv. 1050]" then -- Winter Warrior [Lv. 1050]
			Ms = "Winter Warrior [Lv. 1050]"
			NameQuest = "SnowMountainQuest"
			QuestLv = 2
			NameMon = "Winter Warrior"
			CFrameQ = CFrame.new(609.858826, 400.119904, -5372.25928, -0.374604106, 0, 0.92718488, 0, 1, 0, -0.92718488, 0, -0.374604106)
			CFrameMon = CFrame.new(1295.62683, 429.447784, -5087.04492, -0.698032081, -8.28980049e-08, -0.71606636, -1.98835952e-08, 1, -9.63858184e-08, 0.71606636, -5.30424877e-08, -0.698032081)
			SelectMonster = "Snow Trooper [Lv. 1000]"
		elseif Lv == 1100 or Lv <= 1124 or SelectMonster == "Lab Subordinate [Lv. 1100]" then -- Lab Subordinate [Lv. 1100]
			Ms = "Lab Subordinate [Lv. 1100]"
			NameQuest = "IceSideQuest"
			QuestLv = 1
			NameMon = "Lab Subordinate"
			CFrameQ = CFrame.new(-6064.06885, 15.2422857, -4902.97852, 0.453972578, -0, -0.891015649, 0, 1, -0, 0.891015649, 0, 0.453972578)
			CFrameMon = CFrame.new(-5769.2041, 37.9288292, -4468.38721, -0.569419742, -2.49055017e-08, 0.822046936, -6.96206541e-08, 1, -1.79282633e-08, -0.822046936, -6.74401548e-08, -0.569419742)
		elseif Lv == 1125 or Lv <= 1174 or SelectMonster == "Horned Warrior [Lv. 1125]" then -- Horned Warrior [Lv. 1125]
			Ms = "Horned Warrior [Lv. 1125]"
			NameQuest = "IceSideQuest"
			QuestLv = 2
			NameMon = "Horned Warrior"
			CFrameQ = CFrame.new(-6064.06885, 15.2422857, -4902.97852, 0.453972578, -0, -0.891015649, 0, 1, -0, 0.891015649, 0, 0.453972578)
			CFrameMon = CFrame.new(-6401.27979, 15.9775667, -5948.24316, 0.388303697, 0, -0.921531856, 0, 1, 0, 0.921531856, 0, 0.388303697)
			SelectMonster = "Lab Subordinate [Lv. 1100]"
		elseif Lv == 1175 or Lv <= 1199 or SelectMonster == "Magma Ninja [Lv. 1175]" then -- Magma Ninja [Lv. 1175]
			Ms = "Magma Ninja [Lv. 1175]"
			NameQuest = "FireSideQuest"
			QuestLv = 1
			NameMon = "Magma Ninja"
			CFrameQ = CFrame.new(-5428.03174, 15.0622921, -5299.43457, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)
			CFrameMon = CFrame.new(-5439.61084, 78.4169006, -5958.6543, -0.926726341, -6.08364858e-10, -0.375737041, -3.3772396e-10, 1, -7.86154031e-10, 0.375737041, -6.01654226e-10, -0.926726341)
		elseif Lv == 1200 or Lv <= 1249 or SelectMonster == "Lava Pirate [Lv. 1200]" then 
			Ms = "Lava Pirate [Lv. 1200]"
			NameQuest = "FireSideQuest"
			QuestLv = 2
			NameMon = "Lava Pirate"
			CFrameQ = CFrame.new(-5431.09473, 15.9868021, -5296.53223, 0.831796765, 1.15322464e-07, -0.555080295, -1.10814341e-07, 1, 4.17010995e-08, 0.555080295, 2.68240168e-08, 0.831796765)
			CFrameMon = CFrame.new(-5169.71729, 34.1234779, -4669.73633, -0.196780294, 0, 0.98044765, 0, 1.00000012, -0, -0.98044765, 0, -0.196780294)
			SelectMonster = "Magma Ninja [Lv. 1175]"
		elseif Lv == 1250 or Lv <= 1274 or SelectMonster == "Ship Deckhand [Lv. 1250]" then 
			Ms = "Ship Deckhand [Lv. 1250]"
			NameQuest = "ShipQuest1"
			QuestLv = 1
			NameMon = "Ship Deckhand"
			CFrameQ = CFrame.new(1037.80127, 125.092171, 32911.6016, -0.244533166, -0, -0.969640911, -0, 1.00000012, -0, 0.96964103, 0, -0.244533136)
			CFrameMon = CFrame.new(1163.80872, 138.288452, 33058.4258, -0.998580813, 5.49076979e-08, -0.0532564968, 5.57436763e-08, 1, -1.42118655e-08, 0.0532564968, -1.71604082e-08, -0.998580813)
			if Auto_Farm and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
			end
		elseif Lv == 1275 or Lv <= 1299 or SelectMonster == "Ship Engineer [Lv. 1275]" then 
			Ms = "Ship Engineer [Lv. 1275]"
			NameQuest = "ShipQuest1"
			QuestLv = 2
			NameMon = "Ship Engineer"
			CFrameQ = CFrame.new(1037.80127, 125.092171, 32911.6016, -0.244533166, -0, -0.969640911, -0, 1.00000012, -0, 0.96964103, 0, -0.244533136)
			CFrameMon = CFrame.new(921.30249023438, 125.400390625, 32937.34375)
			if Auto_Farm and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
			end
			SelectMonster = "Ship Deckhand [Lv. 1250]"
		elseif Lv == 1300 or Lv <= 1324 or SelectMonster == "Ship Steward [Lv. 1300]" then 
			Ms = "Ship Steward [Lv. 1300]"
			NameQuest = "ShipQuest2"
			QuestLv = 1
			NameMon = "Ship Steward"
			CFrameQ = CFrame.new(968.80957, 125.092171, 33244.125, -0.869560242, 1.51905191e-08, -0.493826836, 1.44108379e-08, 1, 5.38534195e-09, 0.493826836, -2.43357912e-09, -0.869560242)
			CFrameMon = CFrame.new(917.96057128906, 136.89932250977, 33343.4140625)
			if Auto_Farm and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
			end
		elseif Lv == 1325 or Lv <= 1349 or SelectMonster == "Ship Officer [Lv. 1325]" then 
			Ms = "Ship Officer [Lv. 1325]"
			NameQuest = "ShipQuest2"
			QuestLv = 2
			NameMon = "Ship Officer"
			CFrameQ = CFrame.new(968.80957, 125.092171, 33244.125, -0.869560242, 1.51905191e-08, -0.493826836, 1.44108379e-08, 1, 5.38534195e-09, 0.493826836, -2.43357912e-09, -0.869560242)
			CFrameMon = CFrame.new(944.44964599609, 181.40081787109, 33278.9453125)
			if Auto_Farm and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
			end
			SelectMonster = "Ship Steward [Lv. 1300]"
		elseif Lv == 1350 or Lv <= 1374 or SelectMonster == "Arctic Warrior [Lv. 1350]" then 
			Ms = "Arctic Warrior [Lv. 1350]"
			NameQuest = "FrostQuest"
			QuestLv = 1
			NameMon = "Arctic Warrior"
			CFrameQ = CFrame.new(5667.6582, 26.7997818, -6486.08984, -0.933587909, 0, -0.358349502, 0, 1, 0, 0.358349502, 0, -0.933587909)
			CFrameMon = CFrame.new(5878.23486, 81.3886948, -6136.35596, -0.451037169, 2.3908234e-07, 0.892505825, -1.08168464e-07, 1, -3.22542007e-07, -0.892505825, -2.4201924e-07, -0.451037169)
			if Auto_Farm and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422))
			end
		elseif Lv == 1375 or Lv <= 1424 or SelectMonster == "Snow Lurker [Lv. 1375]" then -- Snow Lurker [Lv. 1375]
			Ms = "Snow Lurker [Lv. 1375]"
			NameQuest = "FrostQuest"
			QuestLv = 2
			NameMon = "Snow Lurker"
			CFrameQ = CFrame.new(5667.6582, 26.7997818, -6486.08984, -0.933587909, 0, -0.358349502, 0, 1, 0, 0.358349502, 0, -0.933587909)
			CFrameMon = CFrame.new(5513.36865, 60.546711, -6809.94971, -0.958693981, -1.65617333e-08, 0.284439981, -4.07668654e-09, 1, 4.44854642e-08, -0.284439981, 4.14883701e-08, -0.958693981)
			if Auto_Farm and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422))
			end
			SelectMonster = "Arctic Warrior [Lv. 1350]"
		elseif Lv == 1425 or Lv <= 1449 or SelectMonster == "Sea Soldier [Lv. 1425]" then -- Sea Soldier [Lv. 1425]
			Ms = "Sea Soldier [Lv. 1425]"
			NameQuest = "ForgottenQuest"
			QuestLv = 1
			NameMon = "Sea Soldier"
			CFrameQ = CFrame.new(-3054.44458, 235.544281, -10142.8193, 0.990270376, -0, -0.13915664, 0, 1, -0, 0.13915664, 0, 0.990270376)
			CFrameMon = CFrame.new(-3028.441650390625, 29.540367126464844, -9769.0615234375)
		elseif Lv >= 1450 or SelectMonster == "Water Fighter [Lv. 1450]" then -- Water Fighter [Lv. 1450]
			Ms = "Water Fighter [Lv. 1450]"
			NameQuest = "ForgottenQuest"
			QuestLv = 2
			NameMon = "Water Fighter"
			CFrameQ = CFrame.new(-3054.44458, 235.544281, -10142.8193, 0.990270376, -0, -0.13915664, 0, 1, -0, 0.13915664, 0, 0.990270376)
			CFrameMon = CFrame.new(-3273.9021, 295.388245, -10612.5547, -0.171454117, 1.56274425e-08, 0.98519212, -2.4293584e-08, 1, -2.00901713e-08, -0.98519212, -2.73783893e-08, -0.171454117)
			SelectMonster = "Sea Soldier [Lv. 1425]"
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
		end
	end
	if Three_World and not Auto_Raid then
		if Lv >= 1500 and Lv <= 1524 or SelectMonster == "Pirate Millionaire [Lv. 1500]" then -- Pirate Millionaire [Lv. 1500]
			Ms = "Pirate Millionaire [Lv. 1500]"
			NameQuest = "PiratePortQuest"
			QuestLv = 1
			NameMon = "Pirate Millionaire"
			CFrameQ = CFrame.new(-290.074677, 42.9034653, 5581.58984, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
			CFrameMon = CFrame.new(81.164993286133, 43.755737304688, 5724.7021484375)
		elseif Lv >= 1525 and Lv <= 1574 or SelectMonster == "Pistol Billionaire [Lv. 1525]" then -- Pistol Billionaire [Lv. 1525]
			Ms = "Pistol Billionaire [Lv. 1525]"
			NameQuest = "PiratePortQuest"
			QuestLv = 2
			NameMon = "Pistol Billionaire"
			CFrameQ = CFrame.new(-290.074677, 42.9034653, 5581.58984, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
			CFrameMon = CFrame.new(81.164993286133, 43.755737304688, 5724.7021484375)
			SelectMonster = "Pirate Millionaire [Lv. 1500]"
		elseif Lv >= 1575 and Lv <= 1599 or SelectMonster == "Dragon Crew Warrior [Lv. 1575]" then -- Dragon Crew Warrior [Lv. 1575]
			Ms = "Dragon Crew Warrior [Lv. 1575]"
			NameQuest = "AmazonQuest"
			QuestLv = 1
			NameMon = "Dragon Crew Warrior"
			CFrameQ = CFrame.new(5832.83594, 51.6806107, -1101.51563, 0.898790359, -0, -0.438378751, 0, 1, -0, 0.438378751, 0, 0.898790359)
			CFrameMon = CFrame.new(6241.9951171875, 51.522083282471, -1243.9771728516)
		elseif Lv >= 1600 and Lv <= 1624 or SelectMonster == "Dragon Crew Archer [Lv. 1600]" then -- Dragon Crew Archer [Lv. 1600]
			Ms = "Dragon Crew Archer [Lv. 1600]"
			NameQuest = "AmazonQuest"
			QuestLv = 2
			NameMon = "Dragon Crew Archer"
			CFrameQ = CFrame.new(5832.83594, 51.6806107, -1101.51563, 0.898790359, -0, -0.438378751, 0, 1, -0, 0.438378751, 0, 0.898790359)
			CFrameMon = CFrame.new(6488.9155273438, 383.38375854492, -110.66246032715)
			SelectMonster = "Dragon Crew Warrior [Lv. 1575]"
		elseif Lv >= 1625 and Lv <= 1649 or SelectMonster == "Female Islander [Lv. 1625]" then -- Female Islander [Lv. 1625]
			Ms = "Female Islander [Lv. 1625]"
			NameQuest = "AmazonQuest2"
			QuestLv = 1
			NameMon = "Female Islander"
			CFrameQ = CFrame.new(5448.86133, 601.516174, 751.130676, 0, 0, 1, 0, 1, -0, -1, 0, 0)
			CFrameMon = CFrame.new(4770.4990234375, 758.95520019531, 1069.8680419922)
		elseif Lv >= 1650 and Lv <= 1699 or SelectMonster == "Giant Islander [Lv. 1650]" then -- Giant Islander [Lv. 1650]
			Ms = "Giant Islander [Lv. 1650]"
			NameQuest = "AmazonQuest2"
			QuestLv = 2
			NameMon = "Giant Islander"
			CFrameQ = CFrame.new(5448.86133, 601.516174, 751.130676, 0, 0, 1, 0, 1, -0, -1, 0, 0)
			CFrameMon = CFrame.new(4530.3540039063, 656.75695800781, -131.60952758789)
			SelectMonster = "Female Islander [Lv. 1625]"
		elseif Lv >= 1700 and Lv <= 1724 or SelectMonster == "Marine Commodore [Lv. 1700]" then -- Marine Commodore [Lv. 1700]
			Ms = "Marine Commodore [Lv. 1700]"
			NameQuest = "MarineTreeIsland"
			QuestLv = 1
			NameMon = "Marine Commodore"
			CFrameQ = CFrame.new(2180.54126, 27.8156815, -6741.5498, -0.965929747, 0, 0.258804798, 0, 1, 0, -0.258804798, 0, -0.965929747)
			CFrameMon = CFrame.new(2490.0844726563, 190.4232635498, -7160.0502929688)
		elseif Lv >= 1725 and Lv <= 1774 or SelectMonster == "Marine Rear Admiral [Lv. 1725]" then -- Marine Rear Admiral [Lv. 1725]
			Ms = "Marine Rear Admiral [Lv. 1725]"
			NameQuest = "MarineTreeIsland"
			QuestLv = 2
			NameMon = "Marine Rear Admiral"
			CFrameQ = CFrame.new(2180.54126, 27.8156815, -6741.5498, -0.965929747, 0, 0.258804798, 0, 1, 0, -0.258804798, 0, -0.965929747)
			CFrameMon = CFrame.new(3951.3903808594, 229.11549377441, -6912.81640625)
			SelectMonster = "Marine Commodore [Lv. 1700]"
		elseif Lv >= 1775 and Lv <= 1799 or SelectMonster == "Fishman Raider [Lv. 1775]" then -- Fishman Raider [Lv. 1775]
			Ms = "Fishman Raider [Lv. 1775]"
			NameQuest = "DeepForestIsland3"
			QuestLv = 1
			NameMon = "Fishman Raider"
			CFrameQ = CFrame.new(-10581.6563, 330.872955, -8761.18652, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)
			CFrameMon = CFrame.new(-10322.400390625, 390.94473266602, -8580.0908203125)
		elseif Lv >= 1800 and Lv <= 1824 or SelectMonster == "Fishman Captain [Lv. 1800]" then -- Fishman Captain [Lv. 1800]
			Ms = "Fishman Captain [Lv. 1800]"
			NameQuest = "DeepForestIsland3"
			QuestLv = 2
			NameMon = "Fishman Captain"
			CFrameQ = CFrame.new(-10581.6563, 330.872955, -8761.18652, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)
			CFrameMon = CFrame.new(-11194.541992188, 442.02795410156, -8608.806640625)
			SelectMonster = "Fishman Raider [Lv. 1775]"
		elseif Lv >= 1825 and Lv <= 1849 or SelectMonster == "Forest Pirate [Lv. 1825]" then -- Forest Pirate [Lv. 1825]
			Ms = "Forest Pirate [Lv. 1825]"
			NameQuest = "DeepForestIsland"
			QuestLv = 1
			NameMon = "Forest Pirate"
			CFrameQ = CFrame.new(-13234.04, 331.488495, -7625.40137, 0.707134247, -0, -0.707079291, 0, 1, -0, 0.707079291, 0, 0.707134247)
			CFrameMon = CFrame.new(-13225.809570313, 428.19387817383, -7753.1245117188)
		elseif Lv >= 1850 and Lv <= 1899 or SelectMonster == "Mythological Pirate [Lv. 1850]" then -- Mythological Pirate [Lv. 1850]
			Ms = "Mythological Pirate [Lv. 1850]"
			NameQuest = "DeepForestIsland"
			QuestLv = 2
			NameMon = "Mythological Pirate"
			CFrameQ = CFrame.new(-13234.04, 331.488495, -7625.40137, 0.707134247, -0, -0.707079291, 0, 1, -0, 0.707079291, 0, 0.707134247)
			CFrameMon = CFrame.new(-13869.172851563, 564.95251464844, -7084.4135742188)
			SelectMonster = "Forest Pirate [Lv. 1825]"
		elseif Lv >= 1900 and Lv <= 1924 or SelectMonster == "Jungle Pirate [Lv. 1900]" then -- Jungle Pirate [Lv. 1900]
			Ms = "Jungle Pirate [Lv. 1900]"
			NameQuest = "DeepForestIsland2"
			QuestLv = 1
			NameMon = "Jungle Pirate"
			CFrameQ = CFrame.new(-12680.3818, 389.971039, -9902.01953, -0.0871315002, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, -0.0871315002)
			CFrameMon = CFrame.new(-11982.221679688, 376.32522583008, -10451.415039063)
		elseif Lv >= 1925 and Lv <= 1974 or SelectMonster == "Musketeer Pirate [Lv. 1925]" then -- Musketeer Pirate [Lv. 1925]
			Ms = "Musketeer Pirate [Lv. 1925]"
			NameQuest = "DeepForestIsland2"
			QuestLv = 2
			NameMon = "Musketeer Pirate"
			CFrameQ = CFrame.new(-12680.3818, 389.971039, -9902.01953, -0.0871315002, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, -0.0871315002)
			CFrameMon = CFrame.new(-13282.3046875, 496.23684692383, -9565.150390625)
			SelectMonster = "Jungle Pirate [Lv. 1900]"
		elseif Lv >= 1975 and Lv <= 1999 or SelectMonster == "Reborn Skeleton [Lv. 1975]" then
			Ms = "Reborn Skeleton [Lv. 1975]"
			NameQuest = "HauntedQuest1"
			QuestLv = 1
			NameMon = "Reborn Skeleton"
			CFrameQ = CFrame.new(-9480.8271484375, 142.13066101074, 5566.0712890625)
			CFrameMon = CFrame.new(-8817.880859375, 191.16761779785, 6298.6557617188)
		elseif Lv >= 2000 and Lv <= 2024 or SelectMonster == "Living Zombie [Lv. 2000]" then
			Ms = "Living Zombie [Lv. 2000]"
			NameQuest = "HauntedQuest1"
			QuestLv = 2
			NameMon = "Living Zombie"
			CFrameQ = CFrame.new(-9480.8271484375, 142.13066101074, 5566.0712890625)
			CFrameMon = CFrame.new(-10125.234375, 183.94705200195, 6242.013671875)
			SelectMonster = "Reborn Skeleton [Lv. 1975]"
		elseif Lv >= 2025 and Lv <= 2049  or  SelectMonster == "Demonic Soul [Lv. 2025]" then
			Ms = "Demonic Soul [Lv. 2025]"
			NameQuest = "HauntedQuest2"
			QuestLv = 1
			NameMon = "Demonic"
			CFrameQ = CFrame.new(-9516.9931640625, 178.00651550293, 6078.4653320313)
			CFrameMon = CFrame.new(-9712.03125, 204.69589233398, 6193.322265625)
			SelectMonster = "Living Zombie [Lv. 2000]"
		elseif Lv >= 2050 and Lv <= 2074 or SelectMonster == "Posessed Mummy [Lv. 2050]" then
			Ms = "Posessed Mummy [Lv. 2050]"
			NameQuest = "HauntedQuest2"
			QuestLv = 2
			NameMon = "Posessed Mummy"
			CFrameQ = CFrame.new(-9516.9931640625, 178.00651550293, 6078.4653320313)
			CFrameMon = CFrame.new(-9545.7763671875, 69.619895935059, 6339.5615234375)    
			SelectMonster = "Demonic Soul [Lv. 2025]"
		elseif Lv >= 2075 and Lv <= 2099 or SelectMonster == "Peanut Scout [Lv. 2075]" then
			Ms = "Peanut Scout [Lv. 2075]"
			NameQuest = "NutsIslandQuest"
			QuestLv = 1
			NameMon = "Peanut Scout"
			CFrameQ = CFrame.new(-2104.17163, 38.1299706, -10194.418, 0.758814394, -1.38604395e-09, 0.651306927, 2.85280208e-08, 1, -3.1108879e-08, -0.651306927, 4.21863646e-08, 0.758814394)
			CFrameMon = CFrame.new(-2098.07544, 192.611862, -10248.8867, 0.983392298, -9.57031787e-08, 0.181492642, 8.7276355e-08, 1, 5.44169616e-08, -0.181492642, -3.76732068e-08, 0.983392298)
		elseif Lv >= 2100 and Lv <= 2124 or SelectMonster == "Peanut President [Lv. 2100]" then
			Ms = "Peanut President [Lv. 2100]"
			NameQuest = "NutsIslandQuest"
			QuestLv = 2
			NameMon = "Peanut President"
			CFrameQ = CFrame.new(-2104.17163, 38.1299706, -10194.418, 0.758814394, -1.38604395e-09, 0.651306927, 2.85280208e-08, 1, -3.1108879e-08, -0.651306927, 4.21863646e-08, 0.758814394)
			CFrameMon = CFrame.new(-1876.95959, 192.610947, -10542.2939, 0.0553516336, -2.83836812e-08, 0.998466909, -6.89634405e-10, 1, 2.84654931e-08, -0.998466909, -2.26418861e-09, 0.0553516336)
			SelectMonster = "Peanut Scout [Lv. 2075]"
		elseif Lv >= 2125 and Lv <= 2149 or SelectMonster == "Ice Cream Chef [Lv. 2125]" then
			Ms = "Ice Cream Chef [Lv. 2125]"
			NameQuest = "IceCreamIslandQuest"
			QuestLv = 1
			NameMon = "Ice Cream Chef"
			CFrameQ = CFrame.new(-820.404358, 65.8453293, -10965.5654, 0.822534859, 5.24448502e-08, -0.568714678, -2.08336317e-08, 1, 6.20846663e-08, 0.568714678, -3.92184099e-08, 0.822534859)
			CFrameMon = CFrame.new(-821.614075, 208.39537, -10990.7617, -0.870096624, 3.18909272e-08, 0.492881238, -1.8357893e-08, 1, -9.71107568e-08, -0.492881238, -9.35439957e-08, -0.870096624)
		elseif Lv >= 2150 and Lv <= 2199 or SelectMonster == "Ice Cream Commander [Lv. 2150]" then 
			Ms = "Ice Cream Commander [Lv. 2150]"
			NameQuest = "IceCreamIslandQuest"
			QuestLv = 2
			NameMon = "Ice Cream Commander"
			CFrameQ = CFrame.new(-819.376526, 67.4634171, -10967.2832)
			CFrameMon = CFrame.new(-610.11669921875, 208.26904296875, -11253.686523438)
			SelectMonster = "Ice Cream Chef [Lv. 2125]"
		elseif Lv >= 2200 and Lv <= 2224 or SelectMonster == "Cookie Crafter [Lv. 2200]" then 
			Ms = "Cookie Crafter [Lv. 2200]"
			NameQuest = "CakeQuest1"
			QuestLv = 1
			NameMon = "Cookie Crafter"
			CFrameQ = CFrame.new(-2020.6068115234375, 37.82400894165039, -12027.80859375)
			CFrameMon = CFrame.new(-2286.684326171875, 146.5656280517578, -12226.8818359375)
		elseif Lv >= 2225 and Lv <= 2249 or SelectMonster == "Cake Guard [Lv. 2225]" then 
			Ms = "Cake Guard [Lv. 2225]"
			NameQuest = "CakeQuest1"
			QuestLv = 2
			NameMon = "Cake Guard"
			CFrameQ = CFrame.new(-2020.6068115234375, 37.82400894165039, -12027.80859375)
			CFrameMon = CFrame.new(-1817.9747314453125, 209.5632781982422, -12288.9228515625)
			SelectMonster = "Cookie Crafter [Lv. 2200]"
		elseif Lv >= 2250 and Lv <= 2274 or SelectMonster == "Baking Staff [Lv. 2250]" then 
			Ms = "Baking Staff [Lv. 2250]"
			NameQuest = "CakeQuest2"
			QuestLv = 1
			NameMon = "Baking Staff"
			CFrameQ = CFrame.new(-1928.31763, 37.7296638, -12840.626)
			CFrameMon = CFrame.new(-1818.347900390625, 93.41275787353516, -12887.66015625)
			--SelectMonster = "Cake Guard [Lv. 2225]"
		elseif Lv >= 2275 and Lv <= 2299 or SelectMonster == "Head Baker [Lv. 2275]" then 
			Ms = "Head Baker [Lv. 2275]"
			NameQuest = "CakeQuest2"
			QuestLv = 2
			NameMon = "Head Baker"
			CFrameQ = CFrame.new(-1928.31763, 37.7296638, -12840.626)
			CFrameMon = CFrame.new(-2302.75806, 105.851219, -12928.1738, -0.436930418, 3.63066199e-08, -0.899495304, -6.58884005e-08, 1, 7.23686568e-08, 0.899495304, 9.0886374e-08, -0.436930418)
			SelectMonster = "Baking Staff [Lv. 2250]"
		elseif Lv >= 2300 and Lv <= 2324 or SelectMonster == "Cocoa Warrior [Lv. 2300]" then 
			Ms = "Cocoa Warrior [Lv. 2300]"
			NameQuest = "ChocQuest1"
			QuestLv = 1
			NameMon = "Cocoa Warrior"
			CFrameQ = CFrame.new(231.607498, 24.7600384, -12198.8262, 0.998603284, -6.89139341e-08, -0.0528342389, 7.20464115e-08, 1, 5.73841312e-08, 0.0528342389, -6.1110498e-08, 0.998603284)
			CFrameMon = CFrame.new(44.8907547, 53.4631424, -12308.167, -0.695348501, -4.32111094e-08, 0.718672693, -1.05426594e-07, 1, -4.18787494e-08, -0.718672693, -1.0488754e-07, -0.695348501)
		elseif Lv >= 2325 and Lv <= 2349 or SelectMonster == "Chocolate Bar Battler [Lv. 2325]" then 
			Ms = "Chocolate Bar Battler [Lv. 2325]"
			NameQuest = "ChocQuest1"
			QuestLv = 2
			NameMon = "Chocolate Bar Battler"
			CFrameQ = CFrame.new(231.607498, 24.7600384, -12198.8262, 0.998603284, -6.89139341e-08, -0.0528342389, 7.20464115e-08, 1, 5.73841312e-08, 0.0528342389, -6.1110498e-08, 0.998603284)
			CFrameMon = CFrame.new(717.393555, 70.0507431, -12599.917, 0.64754194, -3.87490608e-08, 0.762029827, -3.6116095e-08, 1, 8.15397811e-08, -0.762029827, -8.03219677e-08, 0.64754194)
			SelectMonster = "Cocoa Warrior [Lv. 2300]"
		elseif Lv >= 2350 and Lv <= 2374 or SelectMonster == "Sweet Thief [Lv. 2350]" then 
			Ms = "Sweet Thief [Lv. 2350]"
			NameQuest = "ChocQuest2"
			QuestLv = 1
			NameMon = "Sweet Thief"
			CFrameQ = CFrame.new(150.015152, 24.8196201, -12775.3916, -0.513929904, -9.5491286e-09, -0.857832193, 1.2668723e-08, 1, -1.87215683e-08, 0.857832193, -2.04892121e-08, -0.513929904)
			CFrameMon = CFrame.new(2.84610295, 82.2038116, -12553.6885, 0.720501184, 1.15794183e-08, -0.693453729, 1.00857711e-09, 1, 1.77460997e-08, 0.693453729, -1.34854874e-08, 0.720501184)
		elseif Lv >= 2375 and Lv <= 2399 or SelectMonster == "Candy Rebel [Lv. 2375]" then 
			Ms = "Candy Rebel [Lv. 2375]"
			NameQuest = "ChocQuest2"
			QuestLv = 2
			NameMon = "Candy Rebel"
			CFrameQ = CFrame.new(150.015152, 24.8196201, -12775.3916, -0.513929904, -9.5491286e-09, -0.857832193, 1.2668723e-08, 1, -1.87215683e-08, 0.857832193, -2.04892121e-08, -0.513929904)
			CFrameMon = CFrame.new(127.958076, 77.2476959, -12883.584, 0.769614816, -6.44218734e-10, 0.638508439, 1.49726986e-08, 1, -1.70381345e-08, -0.638508439, 2.26729959e-08, 0.769614816)
			SelectMonster = "Sweet Thief [Lv. 2350]"
		elseif Lv >= 2400 and Lv <= 2424 or SelectMonster == "Candy Pirate [Lv. 2400]" then 
            Ms = "Candy Pirate [Lv. 2400]"
            NameQuest = "CandyQuest1"
            QuestLv = 1
            NameMon = "Candy Pirate"
            CFrameQ = CFrame.new(-1147.95142, 16.1072559, -14445.3105, -0.0240679532, 4.06167295e-08, 0.999710321, 7.46657349e-08, 1, -3.8830926e-08, -0.999710321, 7.3709522e-08, -0.0240679532)
            CFrameMon = CFrame.new(-1423.03235, 113.437248, -14594.1602, 0.0492029786, 2.03225614e-08, -0.998788774, -2.60848516e-08, 1, 1.90621972e-08, 0.998788774, 2.51153409e-08, 0.0492029786)
        elseif Lv >= 2425 or SelectMonster == "Snow Demon [Lv. 2425]" then 
            Ms = "Snow Demon [Lv. 2425]"
            NameQuest = "CandyQuest1"
            QuestLv = 2
            NameMon = "Snow Demon"
            CFrameQ = CFrame.new(-1147.95142, 16.1072559, -14445.3105, -0.0240679532, 4.06167295e-08, 0.999710321, 7.46657349e-08, 1, -3.8830926e-08, -0.999710321, 7.3709522e-08, -0.0240679532)
            CFrameMon = CFrame.new(-883.241455, 40.9553833, -14538.4951, -0.28144443, -1.18274158e-07, 0.959577501, 1.83865634e-08, 1, 1.28649276e-07, -0.959577501, 5.38509575e-08, -0.28144443)
            SelectMonster = "Candy Pirate [Lv. 2400]"
		end
	end
end

function GetWeaponInventory(Weaponname)
	for i,v in pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventory")) do
		if type(v) == "table" then
			if v.Type == "Sword" then
				if v.Name == Weaponname then
					return true
				end
			end
		end
	end
	return false
end

function EquipWeaponSword()
	pcall(function()
		for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
			if v.ToolTip == "Sword" and v:IsA('Tool') then
				local ToolHumanoid = game.Players.LocalPlayer.Backpack:FindFirstChild(v.Name) 
				game.Players.LocalPlayer.Character.Humanoid:EquipTool(ToolHumanoid) 
			end
		end
	end)
end

function EquipWeapon(ToolSe)
	if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) then
		local tool = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
		wait(.4)
		game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
	end
end

function EquipWeaponMelee()
	pcall(function()
		for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
			if v.ToolTip == "Melee" and v:IsA('Tool') then
				local ToolHumanoid = game.Players.LocalPlayer.Backpack:FindFirstChild(v.Name) 
				game.Players.LocalPlayer.Character.Humanoid:EquipTool(ToolHumanoid) 
			end
		end
	end)
end

function EquipWeaponGun()
	pcall(function()
		for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
			if v.ToolTip == "Gun" and v:IsA('Tool') then
				local ToolHumanoid = game.Players.LocalPlayer.Backpack:FindFirstChild(v.Name) 
				game.Players.LocalPlayer.Character.Humanoid:EquipTool(ToolHumanoid) 
			end
		end
	end)
end


function EquipWeaponFruit()
	pcall(function()
		for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
			if v.ToolTip == "Blox Fruit" and v:IsA('Tool') then
				local ToolHumanoid = game.Players.LocalPlayer.Backpack:FindFirstChild(v.Name) 
				game.Players.LocalPlayer.Character.Humanoid:EquipTool(ToolHumanoid) 
			end
		end
	end)
end

function InMyNetWork(object)
	if isnetworkowner then
		return isnetworkowner(object)
	else
		if (object.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 300 then 
			return true
		end
		return false
	end
end

local function CustomFindFirstChild(tablename)
	for i,v in pairs(tablename) do
		if game:GetService("Workspace").Enemies:FindFirstChild(v) then
			return true
		end
	end
	return false
end

spawn(function()
	if game.Players.LocalPlayer.Character:FindFirstChild("Stun") then
		game.Players.LocalPlayer.Character.Stun.Changed:connect(function()
			pcall(function()
				if game.Players.LocalPlayer.Character:FindFirstChild("Stun") then
					game.Players.LocalPlayer.Character.Stun.Value = 0
				end
			end)
		end)
	end
end)

function BTP(Position)
	game.Players.LocalPlayer.Character.Head:Destroy()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Position
	wait(1)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Position
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
end

local Camera = require(game.ReplicatedStorage.Util.CameraShaker)
Camera:Stop()

		local plr = game.Players.LocalPlayer
		local CbFw = getupvalues(require(plr.PlayerScripts.CombatFramework))
		local CbFw2 = CbFw[2]

		function GetCurrentBlade() 
			local p13 = CbFw2.activeController
			local ret = p13.blades[1]
			if not ret then return end
			while ret.Parent~=game.Players.LocalPlayer.Character do ret=ret.Parent end
			return ret
		end
    
		task.spawn(function()
			local CombatFrameworkOld = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework)
			local CombatFrameworkR = getupvalues(CombatFrameworkOld)[2]
			local CameraShakerR = require(game.ReplicatedStorage.Util.CameraShaker)
		
			function maxincrement()
				return #CombatFrameworkR.activeController.anims.basic
			end
		
			spawn(function()
				local old
				old = hookmetamethod(game, "__namecall",function(self,...)
					local method = getnamecallmethod() local args = {...}
					if method:lower() == "fireserver" then
						if args[1] == "hit" then
							args[3] = maxincrement()
							return old(self,unpack(args))
						end 
					end
				return old(self,...)
				end) 
			end)
		end)
		

		spawn(function()
			while wait() do
				pcall(function()
					if FastAttackSpeed then
						repeat task.wait(_G.Main["Delay"] / 2.5)
							local AC = CbFw2.activeController
							for i = 1, 1 do 
								local bladehit = require(game.ReplicatedStorage.CombatFramework.RigLib).getBladeHits(
									plr.Character,
									{plr.Character.HumanoidRootPart},
									60
								)
								local cac = {}
								local hash = {}
								for k, v in pairs(bladehit) do
									if v.Parent:FindFirstChild("HumanoidRootPart") and not hash[v.Parent] then
										table.insert(cac, v.Parent.HumanoidRootPart)
										hash[v.Parent] = true
									end
								end
								bladehit = cac
								if #bladehit > 0 then
									local u8 = debug.getupvalue(AC.attack, 5)
									local u9 = debug.getupvalue(AC.attack, 6)
									local u7 = debug.getupvalue(AC.attack, 4)
									local u10 = debug.getupvalue(AC.attack, 7)
									local u12 = (u8 * 798405 + u7 * 727595) % u9
									local u13 = u7 * 798405
									(function()
										u12 = (u12 * u9 + u13) % 1099511627776
										u8 = math.floor(u12 / u9)
										u7 = u12 - u8 * u9
									end)()
									u10 = u10 + 1
									debug.setupvalue(AC.attack, 5, u8)
									debug.setupvalue(AC.attack, 6, u9)
									debug.setupvalue(AC.attack, 4, u7)
									debug.setupvalue(AC.attack, 7, u10)
									pcall(function()
										if plr.Character:FindFirstChildOfClass("Tool") and AC.blades and AC.blades[1] then
											AC.animator.anims.basic[1]:Play(0.01,0.01,0.01)
											game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("weaponChange",tostring(GetCurrentBlade()))
											game.ReplicatedStorage.Remotes.Validator:FireServer(math.floor(u12 / 1099511627776 * 16777215), u10)
											game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit", bladehit, i, "")
										end
									end)
								end
							end
						until not FastAttackSpeed
					end
				end)
			end
		end)


local CombatFramework = require(game:GetService("Players").LocalPlayer.PlayerScripts:WaitForChild("CombatFramework"))
local CombatFrameworkR = getupvalues(CombatFramework)[2]
local RigController = require(game:GetService("Players")["LocalPlayer"].PlayerScripts.CombatFramework.RigController)
local RigControllerR = getupvalues(RigController)[2]
local realbhit = require(game.ReplicatedStorage.CombatFramework.RigLib)
local cooldownfastattack = tick()

function AttackNoCD(Num)
    if Num == 1 then
        local AC = CbFw2.activeController
        for i = 1,1 do tick()
            local bladehit = require(game.ReplicatedStorage.CombatFramework.RigLib).getBladeHits(
                plr.Character,
                {plr.Character.HumanoidRootPart},
                60
            )
            local cac = {}
            local hash = {}
            for k, v in pairs(bladehit) do
                if v.Parent:FindFirstChild("HumanoidRootPart") and not hash[v.Parent] then
                    table.insert(cac, v.Parent.HumanoidRootPart)
                    hash[v.Parent] = true
                end
            end
            bladehit = cac
            if #bladehit > 0 then
                local u8 = debug.getupvalue(AC.attack, 5)
                local u9 = debug.getupvalue(AC.attack, 6)
                local u7 = debug.getupvalue(AC.attack, 4)
                local u10 = debug.getupvalue(AC.attack, 7)
                local u12 = (u8 * 798405 + u7 * 727595) % u9
                local u13 = u7 * 798405
                (function()
                    u12 = (u12 * u9 + u13) % 1099511627776
                    u8 = math.floor(u12 / u9)
                    u7 = u12 - u8 * u9
                end)()
                u10 = u10 + 1
                debug.setupvalue(AC.attack, 5, u8)
                debug.setupvalue(AC.attack, 6, u9)
                debug.setupvalue(AC.attack, 4, u7)
                debug.setupvalue(AC.attack, 7, u10)
                pcall(function()
                    if plr.Character:FindFirstChildOfClass("Tool") and AC.blades and AC.blades[1] then
                        AC.animator.anims.basic[1]:Play(0.01,0.01,0.01)
                        game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("weaponChange",tostring(GetCurrentBlade()))
                        game.ReplicatedStorage.Remotes.Validator:FireServer(math.floor(u12 / 1099511627776 * 16777215), u10)
                        game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit", bladehit, 2, "")
                    end
                end)
            end
        end
    elseif Num == 0 then
        local AC = CbFw2.activeController
        for i = 1,1 do tick()
            local bladehit = require(game.ReplicatedStorage.CombatFramework.RigLib).getBladeHits(
                plr.Character,
                {plr.Character.HumanoidRootPart},
                60
            )
            local cac = {}
            local hash = {}
            for k, v in pairs(bladehit) do
                if v.Parent:FindFirstChild("HumanoidRootPart") and not hash[v.Parent] then
                    table.insert(cac, v.Parent.HumanoidRootPart)
                    hash[v.Parent] = true
                end
            end
            bladehit = cac
            if #bladehit > 0 then
                if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 150 then
                    game:service('VirtualInputManager'):SendKeyEvent(true, "V", false, game)
                    game:service('VirtualInputManager'):SendKeyEvent(false, "V", false, game)
                end
                pcall(function()
                    if plr.Character:FindFirstChildOfClass("Tool") and AC.blades and AC.blades[1] then
                        for i,CombatFrameworkR in pairs(CbFw) do
                            pcall(function()
                                if i == 2 then
                                    local AC = CbFw2.activeController
                                    local CSR = require(game.ReplicatedStorage.Util.CameraShaker)
                                    CSR:Stop()
                                    CombatFrameworkR.activeController.attacking = false
                                    CombatFrameworkR.activeController.blocking = false
                                    CombatFrameworkR.activeController.focusStart = 1655503339.0980349
                                    CombatFrameworkR.activeController.increment = 4
                                    CombatFrameworkR.activeController.hitboxMagnitude = 55
                                    CombatFrameworkR.activeController.timeToNextBlock = tick()
                                    CombatFrameworkR.activeController.timeToNextAttack = tick()
                                    game:GetService("VirtualUser"):CaptureController()
                                    game:GetService("VirtualUser"):ClickButton1(Vector2.new(1300,760), game:GetService("Workspace").Camera.CFrame)
                                    AC.animator.anims.basic[1]:Play(0.01,0.01,0.01)
                                end
                            end)
                        end
                    end
                end)
            end
        end
    end
end

task.spawn(function()
    while wait(0) do 
        pcall(function()
			if FastAttacSlow then
				repeat wait(0.175)
					if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
					end
					if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") and Fast_Delay then
						AttackNoCD(0)
					end
					if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") and Fast_Delay then
						AttackNoCD(0)
					end
				until not FastAttacSlow
			else
				if ac.hitboxMagnitude ~= 55 then
					ac.hitboxMagnitude = 55
				end
				ac:attack()
			end
        end)
    end
end)

task.spawn(function()
    while wait() do
        pcall(function()
			if FastAttacSlow then
				repeat wait(0.175)
					if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
					end
					if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") and Fast_Delay then
						AttackNoCD(1)
					end
					Fast_Delay = true
					if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") and Fast_Delay then
						AttackNoCD(1)
					end
				until not FastAttacSlow
			else
				if ac.hitboxMagnitude ~= 55 then
					ac.hitboxMagnitude = 55
				end
				ac:attack()
			end
        end)
    end
end)

task.spawn(function()
	while true do wait()
		if setscriptable then
			setscriptable(game.Players.LocalPlayer, "SimulationRadius", true)
		end
		if sethiddenproperty then
			sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
		end
	end
end)

task.spawn(function()
	while task.wait() do
		pcall(function()
			if StartMagnet then
				for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
					if not string.find(v.Name,"Boss") and (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 350 then
						if InMyNetWork(v.HumanoidRootPart) then
							v.HumanoidRootPart.CFrame = PosMon
							v.Humanoid.JumpPower = 0
							v.Humanoid.WalkSpeed = 0
							v.HumanoidRootPart.Size = Vector3.new(60,60,60)
							v.HumanoidRootPart.Transparency = 1
							v.HumanoidRootPart.CanCollide = false
							v.Head.CanCollide = false
							if v.Humanoid:FindFirstChild("Animator") then
								v.Humanoid.Animator:Destroy()
							end
							v.Humanoid:ChangeState(11)
							v.Humanoid:ChangeState(14)
						end
					end
				end
			end
		end)
	end
end)



local Remote_GetFruits = game.ReplicatedStorage:FindFirstChild("Remotes").CommF_:InvokeServer("GetFruits");
local getInventoryFruit = game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("getInventoryFruits")
local getInventoryWeapon = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventoryWeapons")

task.spawn(function()
	game:GetService("RunService").Stepped:Connect(function()
		pcall(function()
			--[World 1] or 
			if _G.Main["Start"] or _G.Main["Skip Level Farm"] or AutoRaids or RaidSumfruit or Bring or Auto_Quest_Yama_1 or Auto_Quest_Yama_2 or Auto_Quest_Yama_3 or Auto_Quest_Tushita_2 or Auto_Quest_Tushita_3 then
				if syn then
					setfflag("HumanoidParallelRemoveNoPhysics", "False")
					setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")
					game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
					if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit == true then
						game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid"):ChangeState(15)
					end
				else
					if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
						if not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyVelocity1") then
							if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit == true then
								game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid"):ChangeState(15)
							end
							local BodyVelocity = Instance.new("BodyVelocity")
							BodyVelocity.Name = "BodyVelocity1"
							BodyVelocity.Parent =  game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
							BodyVelocity.MaxForce = Vector3.new(10000, 10000, 10000)
							BodyVelocity.Velocity = Vector3.new(0, 0, 0)
						end
					end
					for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
						if v:IsA("BasePart") then
							v.CanCollide = false    
						end
					end
				end
			else
				if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyVelocity1") then
					game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyVelocity1"):Destroy();
				end
			end
		end)
	end)
end)




function GetDistance(P)
	local Distance = (P.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
	return Distance
end

function GetFightingStyle(Style)
	ReturnText = ""
	for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
		if v:IsA("Tool") then
			if v.ToolTip == Style then
				ReturnText = v.Name
			end
		end
	end
	for i ,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
		if v:IsA("Tool") then
			if v.ToolTip == Style then
				ReturnText = v.Name
			end
		end
	end
	if ReturnText ~= "" then
		return ReturnText
	else
		return "Not Have"
	end
end


function CheckMas(skil)
	if game:GetService("Players").LocalPlayer.Character:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value) then
		MasteryDevilFruit = require(game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Data.DevilFruit.Value].Data)
		DevilFruitMastery = game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Data.DevilFruit.Value].Level.Value
		if DevilFruitMastery < MasteryDevilFruit.Lvl[skil] then
			return "true DownTo"
		elseif DevilFruitMastery >= MasteryDevilFruit.Lvl[skil] then
			return "true UpTo"
		end
	end
	if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value) then
		MasteryDevilFruit = require(game:GetService("Players").LocalPlayer.Backpack[game.Players.LocalPlayer.Data.DevilFruit.Value].Data)
		DevilFruitMastery = game:GetService("Players").LocalPlayer.Backpack[game.Players.LocalPlayer.Data.DevilFruit.Value].Level.Value
		if DevilFruitMastery < MasteryDevilFruit.Lvl[skil] then
			return "true DownTo"
		elseif DevilFruitMastery >= MasteryDevilFruit.Lvl[skil] then
			return "true UpTo"
		end
	end
	return "else"
end
	



require(game.ReplicatedStorage.Util.CameraShaker):Stop()

xShadowFastAttackx = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework)

xShadowx = debug.getupvalues(xShadowFastAttackx)[2]

spawn(function()
    game:GetService("RunService").RenderStepped:Connect(function()
        if _G.FastAttackNormalSpeed then
            if typeof(xShadowx) == "table" then
                pcall(function()
                    xShadowx.activeController.timeToNextAttack = (math.huge^math.huge^math.huge)
                    xShadowx.activeController.timeToNextAttack = 0
                    xShadowx.activeController.hitboxMagnitude = 200
                    xShadowx.activeController.active = false
                    xShadowx.activeController.timeToNextBlock = 0
                    xShadowx.activeController.focusStart = 0
                    xShadowx.activeController.increment = 4
                    xShadowx.activeController.blocking = false
                    xShadowx.activeController.attacking = false
                    xShadowx.activeController.humanoid.AutoRotate = 50
                    game:GetService'VirtualUser':CaptureController()
					game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                end)
            end
        end
    end)
end)


local SeraphFrame = debug.getupvalues(require(game:GetService("Players").LocalPlayer.PlayerScripts:WaitForChild("CombatFramework")))[2]
local VirtualUser = game:GetService('VirtualUser')
local RigControllerR = debug.getupvalues(require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework.RigController))[2]
local Client = game:GetService("Players").LocalPlayer
local DMG = require(Client.PlayerScripts.CombatFramework.Particle.Damage)

function SeraphFuckWeapon() 
	local p13 = SeraphFrame.activeController
	local wea = p13.blades[1]
	if not wea then return end
	while wea.Parent~=game.Players.LocalPlayer.Character do wea=wea.Parent end
	return wea
end

function getHits(Size)
	local Hits = {}
	local Enemies = workspace.Enemies:GetChildren()
	local Characters = workspace.Characters:GetChildren()
	for i=1,#Enemies do local v = Enemies[i]
		local Human = v:FindFirstChildOfClass("Humanoid")
		if Human and Human.RootPart and Human.Health > 0 and game.Players.LocalPlayer:DistanceFromCharacter(Human.RootPart.Position) < Size+55 then
			table.insert(Hits,Human.RootPart)
		end
	end
	for i=1,#Characters do local v = Characters[i]
		if v ~= game.Players.LocalPlayer.Character then
			local Human = v:FindFirstChildOfClass("Humanoid")
			if Human and Human.RootPart and Human.Health > 0 and game.Players.LocalPlayer:DistanceFromCharacter(Human.RootPart.Position) < Size+55 then
				table.insert(Hits,Human.RootPart)
			end
		end
	end
	return Hits
end

task.spawn(
	function()
	while wait(0) do
		if  _G.FastAttackNormalSpeed then
			if SeraphFrame.activeController then
				if v.Humanoid.Health > 0 then
				  SeraphFrame.activeController.attacking = false
					SeraphFrame.activeController.timeToNextBlock = 0
				   SeraphFrame.activeController.humanoid.AutoRotate = true
				   SeraphFrame.activeController.increment = 3
				   SeraphFrame.activeController.blocking = false
				   SeraphFrame.activeController.hitboxMagnitude = 150
					SeraphFrame.activeController.timeToNextAttack = 0
					SeraphFrame.activeController.focusStart = 0
					SeraphFrame.activeController.humanoid.AutoRotate = true
					SeraphFrame.activeController.increment = 1 + 1 / 1
				 end
			end
		end
	end
end)

function Boost()
	spawn(function()
	game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("weaponChange",tostring(SeraphFuckWeapon()))
	end)
end

function Unboost()
	spawn(function()
		game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("unequipWeapon",tostring(SeraphFuckWeapon()))
	end)
end

local cdnormal = 9e9
local Animation = Instance.new("Animation")
local CooldownFastAttack = 0
Attack = function()
	local ac = SeraphFrame.activeController
	if ac and ac.equipped then
		task.spawn(
			function()
			if tick() - cdnormal > 9e9 then
				ac:attack()
				cdnormal = tick()
			else
				 Animation.AnimationId = ac.anims.basic[2]
				ac.humanoid:LoadAnimation(Animation):Play(100, 99) --à¸—à¹ˆà¸²à¹„à¸¡à¹ˆà¸—à¸³à¸‡à¸²à¸™à¹à¸à¹‰à¹€à¸›à¹‡à¸™ (1,1)
				game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit", getHits(120), 2, "")
			end
		end)
	end
end

b = tick()
spawn(function()
	while wait(0) do
		if  _G.FastAttackNormalSpeed then
			if b - tick() > 0.75 then
				wait(.2)
				b = tick()
			end
			pcall(function()
				for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
					if v.Humanoid.Health > 0 then
						if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 40 then
							Attack()
							wait(0)
							Boost()
						end
					end
				end
			end)
		end
	end
end)

k = tick()
spawn(function()
	while wait(0) do
		if  _G.FastAttackNormalSpeed then
			if k - tick() > 0.75 then
				wait(0)
				k = tick()
			end
			pcall(function()
				for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
					if v.Humanoid.Health > 0 then
						if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 40 then
						wait(0)
						Unboost()
						end
					end
				end
			end)
		end
	end
end)


spawn(function()
	while wait() do
		pcall(function()
			if FastAttackSpeed then
				repeat task.wait(9e9/9e9/9e9)
					if typeof(xShadowx) == "table" then
						pcall(function()
							xShadowx.activeController.timeToNextAttack = -9e9 ---(math.huge^math.huge^math.huge)
							xShadowx.activeController.timeToNextAttack = 0
							xShadowx.activeController.hitboxMagnitude = 200
							xShadowx.activeController.active = false
							xShadowx.activeController.timeToNextBlock = 0
							xShadowx.activeController.focusStart = 0
							xShadowx.activeController.increment = 4
							xShadowx.activeController.blocking = false
							xShadowx.activeController.attacking = false
							xShadowx.activeController.humanoid.AutoRotate = 50
							game:GetService'VirtualUser':CaptureController()
							game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
						end)
					end
					if SeraphFrame.activeController then
						if v.Humanoid.Health > 0 then
							  SeraphFrame.activeController.attacking = false
							SeraphFrame.activeController.timeToNextBlock = 0
							   SeraphFrame.activeController.humanoid.AutoRotate = true
							   SeraphFrame.activeController.increment = 3
							  SeraphFrame.activeController.blocking = false
							  SeraphFrame.activeController.hitboxMagnitude = 150
							SeraphFrame.activeController.timeToNextAttack = -9e9
							SeraphFrame.activeController.focusStart = 0
							SeraphFrame.activeController.humanoid.AutoRotate = true
							SeraphFrame.activeController.increment = 1 + 1 / 1
						end
					end
					local cdnormal = 9e9
					local Animation = Instance.new("Animation")
					local CooldownFastAttack = 0
					Attack = function()
						local ac = SeraphFrame.activeController
						if ac and ac.equipped then
							task.spawn(
								function()
								if tick() - cdnormal > 9e9 then
									ac:attack()
									cdnormal = tick()
								else
									Animation.AnimationId = ac.anims.basic[2]
									ac.humanoid:LoadAnimation(Animation):Play(100, 99) --à¸—à¹ˆà¸²à¹„à¸¡à¹ˆà¸—à¸³à¸‡à¸²à¸™à¹à¸à¹‰à¹€à¸›à¹‡à¸™ (1,1)
									game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit", getHits(120), 2, "")
								end
							end)
						end
					end
					b = tick()
					k = tick()
					if b - tick() > 0.75 then
						wait(.2)
						b = tick()
					end
					pcall(function()
						for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
							if v.Humanoid.Health > 0 then
								if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 40 then
									Attack()
									wait(0)
									Boost()
								end
							end
						end
					end)
					if k - tick() > 0.75 then
						wait(0)
						k = tick()
					end
					pcall(function()
						for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
							if v.Humanoid.Health > 0 then
								if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 40 then
								wait(0)
								Unboost()
								end
							end
						end
					end)
				until not FastAttackSpeed
			end
		end)
	end
end)



local Client = game.Players.LocalPlayer
local STOP = require(Client.PlayerScripts.CombatFramework.Particle)
local STOPRL = require(game:GetService("ReplicatedStorage").CombatFramework.RigLib)
task.spawn(function()
	pcall(function()
		if not shared.orl then
			shared.orl = STOPRL.wrapAttackAnimationAsync
		end
			if not shared.cpc then
				shared.cpc = STOP.play 
			end
		spawn(function()
		require(game.ReplicatedStorage.Util.CameraShaker):Stop()
	  require(game.ReplicatedStorage.Util.CameraShaker):Stop()
			game:GetService("RunService").Stepped:Connect(function()
				STOPRL.wrapAttackAnimationAsync = function(a,b,c,d,func)
					local Hits = STOPRL.getBladeHits(b,c,d)
					if Hits then
						if  _G.FastAttackNormalSpeed then
							STOP.play = function() end
							a:Play(20.1,15.1,10.1)
							func(Hits)
							STOP.play = shared.cpc
							wait(a.length * .0)
							a:Stop()
						else
							func(Hits)
							STOP.play = shared.cpc
							wait(a.length * .0)
							a:Stop()
						end
					end
				end
			end)
		end)
	end)
 end)

 _G.Mud = {
	Superhuman = {
		BlackLeg = false,
		Electro = false,
		Fishman = false,
		DragonClaw = false,
		Superhuman = false
	},
	Sharkman = {
		Fishman = false,
		SharkmanKarate = false
	},
	DeathStep = {
		BlackLeg = false,
		DeathStep = false
	},
	ElectricClaw = {
		Electro = false,
		ElectricClaw = false
	},
	DragonTalon = {
		DragonClaw = false,
		DragonTalon = false
	},
	GodHuman = {
		Superhuman = false,
		Sharkman = false,
		DeathStep = false,
		ElectricClaw = false,
		DragonTalon = false,
		Godhuman = false
	},
}
--[[ Pepsi's UI Library
Better and updated web-based docs are planned in distant future.
Library v0.36 [
    CreateWindow: Function (
        (table | nil) Options [
            (string | nil) Name = "Window Name"
            (JSON | nil) DefaultTheme/Theme = "[...]"
            (boolean | nil) Themeable/DefaultTheme/Theme = true or false | Options [
                (string | number | nil) Image = "rbxassetid://7483871523" | 7483871523
                (boolean | nil) Credit = true or false // You're removing my credits? Kinda hurts.
                (string | table | nil) Info = "Extra info displayed in designer" | Lines ["line 1", "line 2", "line 3", "and so on..."]
				(string | number | table | nil) Background/Backdrop/Grahpic = "rbxassetid://13337" | 13337 | Options [
					(string | number | nil) 1/Asset = "rbxassetid://13337" | 13337
					(number | nil) 2/Transparency = 0.5 | 50 // Both examples will make the backdrop half visible
					(boolean | number | nil) 3/Visible = true or false | 1 or 0 // 1: true, 0: false
				]
            ]
        ]
    ) -> Window [
        CreateTab: Function (
            (table | nil) Options [
                (string | nil) Name = "Tab Name"
                (string | number | nil) Image = "rbxassetid://133337" | 133337
            ]
        ) -> Tab [
            CreateSection: Function (
                (table) Options [
                    (string | nil) Name = "Section Name"
                    (string | nil) Side = "Left" or "Right"
                ]
            ) -> Section [
                AddLabel: Function (
                    (table) Options [
                        (string | nil) Text/Value/Name = "Label Text"
                        (string | nil) Flag = "FlagName"
                        (any) UnloadValue = UnloadValue
                        (function | nil) UnloadFunc = Function
                    ]
                ) -> Label [
                    Options: Table
                    Name: String
                    Type: String
                    Default: String
                    Parent: Section
                    Instance: Instance
                    Set: Function (NewText) -> NewText
					RawSet: Function (NewText) -> NewText // Same function as Set. For backwards compatibility.
                    Reset: Function -> DefaultText
                    Get: Function -> CurrentText
					Update: Function -> CurrentText // Same function as Get, exists for compat.
                ]
                AddToggle: Function (
                    (table) Options [
                        (string) Name = "Toggle Name"
                        (boolean | nil) Value/Enabled = true or false
                        (function | nil) Callback = Function (NewValue, OldValue)
                        (string | nil) Flag = "FlagName"
                        (table | nil) Location = Table
                        (string | nil) LocationFlag = "LocationFlag"
                        (any) UnloadValue = UnloadValue
                        (function | nil) UnloadFunc = Function
                        (boolean | nil) Locked = true or false
                        (table | boolean | EnumItem | nil) Keybind/Key/KeyBind = Keybind [
                            (string | nil) Flag = "ToggleKeybindFlag"
                            (EnumItem | nil) Value = Enum.KeyCode.F
                            (function | nil) Callback = Function (NewValue, OldValue)
                            (function | nil) Pressed = Function
                            (string | nil) Mode = "Dynamic" or "Hold" or "Toggle"
                            (number | nil) DynamicTime = 0.65
                            (table | nil) Location = Table
                            (string | nil) LocationFlag = "LocationFlag"
                            (table | nil) KeyNames = Table
                        ]
                        (function | nil) Condition = Function (NewValue, LastValue) // Will only allow the toggle state to be changed, if this function returns true
						(boolean | nil) AllowDuplicateCalls = true or false // Allow the callback to be fired with same value set()
                    ]
                ) -> ToggleInfo [
                    Options: Table
                    Type: String
                    Name: String
                    Default: Boolean
                    Parent: Section
                    Instance: Instance
                    SetLocked: Function (LockedState) -> LockState
                    Unlock: function
                    Lock: Function
                    Update: Function -> CurrentValue
                    Set: Function (NewValue) -> NewValue
                    RawSet: Function (NewValue, Condition) -> NewValue // Sets the flag without firing the callback
                    Reset: Function -> DefaultText
                    Get: Function -> CurrentValue
                    SetCondition: Function (NewCondition) -> NewCondition
                ]
                AddTextbox: Function (
                    (table) Options [
                        (string) Name = "Textbox Name"
                        (string | number) Value = "String" or 1337
                        (function | nil) Callback = Function (NewValue, OldValue)
                        (string | nil) Flag = "FlagName"
                        (table | nil) Location = Table
                        (string | nil) LocationFlag = "LocationFlag"
                        (any) UnloadValue = UnloadValue
                        (function | nil) UnloadFunc = Function
                        (string | nil) Placeholder = "Text to display by default"
                        (string | nil) Type = "number"
                        (number | nil) Min = 0
                        (number | nil) Max = 100
                        (number | nil) Decimals/Precision/Precise = 2
                        (boolean | nil) Hex = true or false
                        (boolean | nil) Binary = true or false
                        (number | nil) Base = 10
                        (boolean | nil) Rich/RichText/RichTextBox = true or false
                        (boolean | nil) Lines/MultiLine = true or false
                        (boolean | nil) Scaled/TextScaled = true or false
                        (EnumItem | nil) Font/TextFont = Enum.Font.Code
                        (function | nil) PreFormat = Function (Value)
                        (function | nil) PostFormat = Function (Value)
                        (table | nil) CustomProperties = Properties [
                        	TextTruncate = Enum.TextTruncate.None
                        ]
						(boolean | nil) AllowDuplicateCalls = true or false // Allow the callback to be fired with same value set()
                    ]
                ) -> Textbox [
                    Options: Table
                    Name: String
                    Type: String
                    Default: String/Number
                    Parent: Section
                    Instance: Textbox
                    Update: Function -> CurrentValue
                    Set: Function (NewValue) -> NewValue
					RawSet: Function (NewValue) -> NewValue // Sets the flag without firing the callback
                    Reset: Function -> DefaultText
                    Get: Function -> CurrentValue
                ]
                AddSlider: Function (
                    (table) Options [
                        (string) Name = "Slider Name"
                        (number | nil) Value = 0
                        (function | nil) Callback = Function (Value, OldValue)
                        (string | nil) Flag = "FlagName"
                        (table | nil) Location = Table
                        (string | nil) LocationFlag = "LocationFlag"
                        (any) UnloadValue = UnloadValue
                        (function | nil) UnloadFunc = Function
                        (number) Min = 0
                        (number) Max = 100
                        (number | nil) Decimals/Precision/Precise = 2
                        (string | function | nil) Format = "Value %s" | Function (Value, LastValue)
                        (boolean | nil) IllegalInput = true or false // Allow textbox to break min & max limits
                        (boolean | table | nil) Textbox/InputBox/CustomInput = true | Options [
                            (boolean | nil) Hex = true or false
                            (boolean | nil) Binary = true or false
                            (number | nil) Base = 10
                            (function | nil) PreFormat = Function (Value)
                            (function | nil) PostFormat = Function (Value)
                            (boolean | nil) IllegalInput = true or false // Allow textbox to break min & max limits
                        ]
						(boolean | nil) AllowDuplicateCalls = true or false // Allow the callback to be fired with same value set()
                    ]
                ) -> Slider [
                    Options: Table
                    Name: String
                    Type: String
                    Default: Number
                    Parent: Section
                    Instance: Instance
                    Update: Function (FromValue) -> CurrentValue
                    Set: Function (NewValue) -> NewValue
                	RawSet: Function (NewValue) -> NewValue // Changes value without firing callback
                    Reset: Function -> DefaultText
                    Get: Function -> CurrentValue
                    SetConstraints: Function (NewMin, NewMax)
                    SetMin: Function (NewMin)
                    SetMax: Function (NewMax)
                ]
                AddButton: Function (
                    (table) Options [
                        (string) Name = "Button Name"
                        (function | nil) Callback = Function (NumPresses)
						(boolean | nil) Locked = true or false
						(function | nil) Condition = Function (NumPresses) // Will only allow the button to be pressed, if this function returns true
                    ]
                    (table | nil) Options ...
                ) -> Buttons [
                    Options: Table
                    Name: String
                    Type: String
                    Parent: Section
                    Instance: Instance
                    Update: Function -> ButtonName
                    Press: Function (...)
                    SetLocked: Function (LockedState) -> LockState
                    Unlock: function
                    Lock: Function
					SetCondition: Function(NewCondition) -> NewCondition
					RawPress: Function (...) // Does not update press count
                    Get: Function -> Callback, NumPresses
					SetText: Function (NewText) -> NewText
					SetCallback: Function (NewCallback) -> NewCallback
                ]
                AddKeybind: Function (
                    (table) Options [
                        (string) Name = "Keybind Name"
                        (EnumItem | nil) Value = Enum.KeyCode.F
                        (function | nil) Callback = Function (NewValue, OldValue)
                        (string | nil) Flag = "FlagName"
                        (table | nil) Location = Table
                        (string | nil) LocationFlag = "LocationFlag"
                        (any) UnloadValue = UnloadValue
                        (function | nil) UnloadFunc = Function
                        (function | nil) Pressed = Function (InputObject, GameProcessed)
                        (table | nil) KeyNames = Table
						(boolean | nil) AllowDuplicateCalls = true or false // Allow the callback to be fired with same value set()
                    ]
                ) -> Keybind [
                    Options: Table
                    Name: String
                    Type: String
                    Parent: Section
                    Instance: Instance
                    Update: Function
                    Set: Function (NewValue) -> NewValue
                    Reset: Function -> DefaultText
                    Get: Function -> CurrentValue
                ]
                AddDropdown: Function (
                    (table) Options [
                        (string) Name = "Dropdown Name"
                        (any) Value = Value
                        (function | nil) Callback = Function (NewValue, LastValue)
                        (string | nil) Flag = "FlagName"
                        (table | nil) Location = Table
                        (string | nil) LocationFlag = "LocationFlag"
                        (any) UnloadValue = UnloadValue
                        (function | nil) UnloadFunc = Function
                        (table | Instance | Enum | function) List = Table | workspace | Enum.Font | Function () -> New List
                        (string | function | table | nil) Filter = "StringToMatch" | Function (ValueToCheck) | Table [
                            (boolean | nil) [0] = InverseBool
                            (any) [1] ... = "StringToMatch" | Enum.Font.Code/ValuesToMatch
                        ]
                        (string | function | table | nil) Method = "GetDescendants" | workspace.GetDescendants | Parameters [
                        	(string | function) [1/Method] = "GetFriendsOnline" | Player.GetFriendsOnline
                        	(any) [1/2/Args/Arguments] ... = 50
                        ]
                        (string | nil) BlankValue/NoValueString/Nothing = "No Selection"
                        (boolean | function | nil) Sort = true or false | Function
                        (boolean | string | nil) Multi/Multiple/MultiSelect = true or false | "Text to display"
                        (function | nil) ItemAdded/AddedCallback = Function (Item, AllItems)
                        (function | nil) ItemRemoved/RemovedCallback = Function (Item, AllItems)
                        (function | nil) ItemChanged/ChangedCallback = Function (Item, SelectedState, Items)
                        (function | nil) ItemsCleared/ClearedCallback = Function (Items, PreviousItems)
						(EnumItem/Keycode | nil) ScrollUpButton = Enum.KeyCode.Up // Default is Enum.KeyCode.Up
						(EnumItem/Keycode | nil) ScrollDownButton = Enum.KeyCode.Down // Default is Enum.KeyCode.Down
						(number | nil) ScrollButtonRate / ScrollRate = 5 // How fast the scroller goes by pressing the scroll buttons
						(bool | nil) DisablePrecisionScrolling = true or false // Dissallows use of keys to control pan
						(boolean | nil) AllowDuplicateCalls = true or false // Allow the callback to be fired with same value set()
                    ]
                ) -> Dropdown [
                    Options: Table
                    Name: String
                    Type: String
                    Default: Value
                    Parent: Section
                    Instance: Instance
                    Update: Function
                    Set: Function (NewValue) -> NewValue
					RawSet: Function (NewValue) -> NewValue // Sets value without firing callback
                    Reset: Function -> DefaultValue
                    Get: Function -> CurrentValue
                    UpdateList: Function (
                    	(table | Instance | Enum | function) List = Table | workspace | Enum.Font | Function () -> New List
                    	(boolean | nil) ValidateValues = true or false | nil // When set to true, will call Validate() on it
                    ) -> NewList
                    Validate: Function (
                    	(any | nil) InvalidValue = "Optional value to be set, if the list's current value is no longer in list"
                    ) -> IsValidBool
                ]
                AddSearchBox: Function (
                    (table) Options [
                        (string) Name = "SearchBox Name"
                        (any) Value = Value
                        (function | nil) Callback = Function (NewValue, LastValue)
                        (string | nil) Flag = "FlagName"
                        (table | nil) Location = Table
                        (string | nil) LocationFlag = "LocationFlag"
                        (any) UnloadValue = UnloadValue
                        (function | nil) UnloadFunc = Function
                        (table | Instance | Enum | function) List = Table | workspace | Enum.Font | Function () -> New List
                        (string | function | table | nil) Filter = "StringToMatch" | Function (ValueToCheck) | Table [
                            (boolean | nil) [0] = InverseBool
                            (string | any | nil) [1] ... = "StringToMatch" | Enum.Font.Code
                        ]
                        (string | function | table | nil) Method = "GetDescendants" | workspace.GetDescendants | Parameters [
                        	(string | function) [1/Method] = "GetFriendsOnline" | Player.GetFriendsOnline
                        	(any) [1/2/Args/Arguments] ... = 50
                        ]
                        (boolean | function | nil) Sort = true or false | Function
                        (string | nil) BlankValue/NoValueString/Nothing = "No Selection"
                        (boolean | string | nil) Multi/Multiple/MultiSelect = true or false | "Text to display"
                        (function | nil) ItemAdded/AddedCallback = Function (Item, AllItems)
                        (function | nil) ItemRemoved/RemovedCallback = Function (Item, AllItems)
                        (function | nil) ItemChanged/ChangedCallback = Function (Item, SelectedState, Items)
                        (function | nil) ItemsCleared/ClearedCallback = Function (Items, PreviousItems)
						(EnumItem/Keycode | nil) ScrollUpButton = Enum.KeyCode.Up // Default is Enum.KeyCode.Up
						(EnumItem/Keycode | nil) ScrollDownButton = Enum.KeyCode.Down // Default is Enum.KeyCode.Down
						(number | nil) ScrollButtonRate / ScrollRate = 5 // How fast the scroller goes by pressing the scroll buttons
						(bool | nil) DisablePrecisionScrolling = true or false // Dissallows use of keys to control pan
						(boolean | nil) RegEx = true or false // Enables use of %d and %w, etc (False by default)
						(boolean | nil) AllowDuplicateCalls = true or false // Allow the callback to be fired with same value set()
                    ]
                ) -> SearchBox [
                    Options: Table
                    Name: String
                    Type: String
                    Default: Value
                    Parent: Section
                    Instance: Instance
                    Update: Function
                    Set: Function (NewValue) -> NewValue
					RawSet: Function (NewValue) -> NewValue // Sets value without firing callback
                    Reset: Function -> DefaultValue
                    Get: Function -> CurrentValue
                    UpdateList: Function (
                    	(table | Instance | Enum | function) List = Table | workspace | Enum.Font | Function () -> New List
                    	(boolean | nil) ValidateValues = true or false | nil // When set to true, will call Validate() on it
                    ) -> NewList
                    Validate: Function (
                    	(any | nil) InvalidValue = "Optional value to be set, if the list's current value is no longer in list"
                    ) -> IsValidBool
                ]
                AddColorpicker: Function (
                    (table) Options [
                        (string) Name = "Colorpicker Name"
                        (string | Color3 | nil) Value = "rainbow" or "random" | Color3.new()
                        (function | nil) Callback = Function (NewValue, LastValue)
                        (string | nil) Flag = "FlagName"
                        (table | nil) Location = Table
                        (string | nil) LocationFlag = "LocationFlag"
                        (any) UnloadValue = UnloadValue
                        (function | nil) UnloadFunc = Function
                        (boolean | nil) Rainbow = true or false
                        (boolean | nil) Random = true or false
						(boolean | nil) AllowDuplicateCalls = true or false // Allow the callback to be fired with same value set()
                    ]
                ) -> Colorpicker [
                    Options: Table
                    Name: String
                    Type: String
                    Default: Color3
                    Parent: Section
                    Instance: Instance
                    Update: Function
                    Set: Function (NewValue) -> NewValue
					RawSet: Function (NewValue) -> NewValue // Sets value without firing callback
                    Reset: Function -> DefaultColor
                    Get: Function -> CurrentValue
                    SetRainbow: Function (
                        (boolean | nil) RainbowMode = true or false
                    )
                ]
                AddPersistence: Function (
                    (table) Options [
                        (string) Name = "Persistence Name"
                        (string | nil) Value = "FileName"
                        (function | nil) Callback = Function (NewValue, LastValue)
                        (string | nil) Flag = "FlagName"
                        (table | nil) Location = Table
                        (string | nil) LocationFlag = "LocationFlag"
                        (any) UnloadValue = UnloadValue
                        (function | nil) UnloadFunc = Function
                        (string | nil) Workspace = "FolderName"
                        (boolean | string | number | table | nil) Persistive/Flags = true | "all" | 1 (Window) or 2 (Tab) or 3 (Section) | FlagNames [...]
                        (string | nil) Suffix = "Mods"
                        (function | nil) LoadCallback = Function (FilePath, FileName) // 'PreLoad'
                        (function | nil) SaveCallback = Function (FilePath, FileName)
                        (function | nil) PostLoadCallback = Function (FilePath, FileName)
                        (function | nil) PostSaveCallback = Function (FilePath, FileName)
						(EnumItem/Keycode | nil) ScrollUpButton = Enum.KeyCode.Up // Default is Enum.KeyCode.Up
						(EnumItem/Keycode | nil) ScrollDownButton = Enum.KeyCode.Down // Default is Enum.KeyCode.Down
						(number | nil) ScrollButtonRate / ScrollRate = 5 // How fast the scroller goes by pressing the scroll buttons
						(bool | nil) DisablePrecisionScrolling = true or false // Dissallows use of keys to control pan
						(boolean | nil) AllowDuplicateCalls = true or false // Allow the callback to be fired with same value set()
                    ]
                ) -> Persistence [
                    Options: Table
                    Name: String
                    Type: String
                    Default: Value
                    Parent: Section
                    Instance: Instance
                    Update: Function
                    Set: Function (NewValue) -> NewValue
					RawSet: Function (NewValue) -> NewValue // Sets value without firing callback
                    Reset: Function -> DefaultFile
                    Get: Function -> CurrentValue
					SaveFile: Function (FileName) // Mimics the Save Button with optional file input
					LoadFile: Function (FileName) // Mimics the Load Button with optional file input
					LoadJSON: Function (JSON) // Mimics the Load Button with specific json
					LoadFileRaw: Function (FileName) // Mimics the Load Button with optional file input using Obj:RawSet
					LoadJSONRaw: Function (JSON) // Mimics the Load Button with specific json using Obj:RawSet
					GetJSON: Function (Func) // Gets the json, and passes it as the first argument of Func. Set to true to use setclipboard
                ]
            ]
            Flags: Table
        ]
        CreateDesigner: Function (
            (table) Options [
				(string | number | table | nil) Background/Backdrop/Grahpic = "rbxassetid://13337" | 13337 | Options [
					(string | number | nil) 1/Asset = "rbxassetid://13337" | 13337
					(number | nil) 2/Transparency = 0.5 | 50 // Both examples will make the backdrop half visible
					(boolean | number | nil) 3/Visible = true or false | 1 or 0 // 1: true, 0: false
				]
                (string | number | nil) Image = "rbxassetid://7483871523" | 7483871523
                (string | table | nil) Info = "Extra info displayed in designer" | Lines ["line 1", "line 2", "line 3", "and so on..."]
                (boolean | nil) Credit = true
            ]
        ) -> Designer [
            Options: Table
            Parent: Window
            Name: String
            Type: String
            Instance: Instance,
            SetBackground: Function (
            	(string | boolean | number | nil) AssetString = "rbxassetid://7483871523" | true or false (as Visible arg) | 7483871523 or transparency (0-100 or 0-1) | nil (Toggle visibility)
            	(number | boolean | nil) Transparency = 0.7 or 70 | true or false (as Visible arg)
            	(number | boolean | nil) Visible = true/1 or false/0 | nil (Dont change)
            )
        ]
        MoveTabSlider: Function (
            (Instance) tabObject = tabVar
        )
        GoHome: Function
        Flags: Table
    ]
    Designer: Designer
    LP: LocalPlayer
    Players: game.Players
    Mouse: LP:GetMouse()
    Unload: Function
	ResetAll: Function // Resets all elements to their default value
	SaveFile: Function (FileName) // Only if designer is present; this would save all non-deisgner elements
	LoadFile: Function (FileName)
	LoadJSON: Function (JSON)
	LoadFileRaw: Function (FileName)
	LoadJSONRaw: Function (JSON)
	GetJSON: Function (Func)
	signals: Table // All :connection()'s go in that table, and are disconnected upon unloading the gui. Feel free to add yours here, too
    (function | nil) UnloadCallback = Function
	(EnumItem/Keycode | nil) scrollupbutton = Enum.KeyCode.Up // Default is Enum.KeyCode.Up
	(EnumItem/Keycode | nil) scrolldownbutton = Enum.KeyCode.Down // Default is Enum.KeyCode.Down
    Subs: Shared Functions [
		updatecolors: Function // Re-Applys all colors from designer
		Wait: Function (Time) // Only waits & returns true if the library has not been unloaded
		removeSpaces: Function (String)
		Color3ToHex: Function (Color3)
		Color3FromHex: Function (String/Hex)
		textToSize: Function (String)
		Instance_new: Function (Class, Parent) // Automatically protects instances with syn.protect_gui, and adds the instance to library.objects (all objects destroyed when unloading)
    ]
]
]]
local library = {
	Version = "0.36",
	WorkspaceName = "Pepsi Lib",
	flags = {},
	signals = {},
	objects = {},
	elements = {},
	globals = {},
	subs = {},
	colored = {},
	configuration = {
		hideKeybind = Enum.KeyCode.RightControl,
		smoothDragging = false,
		easingStyle = Enum.EasingStyle.Quart,
		easingDirection = Enum.EasingDirection.Out
	},
	colors = {
		main = Color3.fromRGB(51, 153, 255),
		background = Color3.fromRGB(0, 0, 0),
		outerBorder = Color3.fromRGB(0, 0, 0),
		innerBorder = Color3.fromRGB(60, 100 ,138),
		topGradient = Color3.fromRGB(0, 0, 0),
		bottomGradient = Color3.fromRGB(0, 0, 0),
		sectionBackground = Color3.fromRGB(0, 0, 0),
		section = Color3.fromRGB(176, 175, 176),
		otherElementText = Color3.fromRGB(129, 127, 129),
		elementText = Color3.fromRGB(176, 175, 176),
		elementBorder = Color3.fromRGB(20, 20, 20),
		selectedOption = Color3.fromRGB(176, 175, 176),
		unselectedOption = Color3.fromRGB(40, 40, 40),
		hoveredOptionTop = Color3.fromRGB(65, 65, 65),
		unhoveredOptionTop = Color3.fromRGB(50, 50, 50),
		hoveredOptionBottom = Color3.fromRGB(45, 45, 45),
		unhoveredOptionBottom = Color3.fromRGB(35, 35, 35),
		tabText = Color3.fromRGB(185, 185, 185)
	},
	gui_parent = (function()
		local x, c = pcall(function()
			return game:GetService("CoreGui")
		end)
		if x and c then
			return c
		end
		x, c = pcall(function()
			return (game:IsLoaded() or (game.Loaded:Wait() or 1)) and game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
		end)
		if x and c then
			return c
		end
		x, c = pcall(function()
			return game:GetService("StarterGui")
		end)
		if x and c then
			return c
		end
		return error("Seriously bad engine. Can't find a place to store the GUI. Robust code can't help this much incompetence.")
	end)(),
	colorpicker = false,
	colorpickerconflicts = {},
	rainbowflags = {},
	rainbows = 0,
	rainbowsg = 0
}
library.Subs = library.subs
local library_flags = library.flags
library.Flags = library_flags
local destroyrainbows, destroyrainbowsg = nil
function darkenColor(clr, intensity)
	if not intensity or (intensity == 1) then
		return clr
	end
	if clr and ((typeof(clr) == "Color3") or (type(clr) == "table")) then
		return Color3.new(clr.R / intensity, clr.G / intensity, clr.B / intensity)
	end
end
library.subs.darkenColor = darkenColor
local __runscript = true
local function wait_check(...)
	if __runscript then
		return wait(...)
	else
		wait()
		return false
	end
end
library.subs.Wait, library.subs.wait, library.Wait = wait_check, wait_check, wait_check
function library.IsGuiValid()
	return __runscript
end
local lasthidebing = 0
local temp = game:FindService("MarketplaceService") or game:GetService("MarketplaceService")
local Marketplace = (temp and (cloneref and cloneref(temp))) or temp
local resolvevararg, temp = nil
do
	local lwr = string.lower
	function library.defaultSort(a, b)
		return lwr(tostring(b)) > lwr(tostring(a))
	end
end
do
	local varargresolve = {
		Window = {"Name", "Theme"},
		Tab = {"Name", "Image"},
		Section = {"Name", "Side"},
		Label = {"Text", "Flag", "UnloadValue", "UnloadFunc"},
		Toggle = {"Name", "Value", "Callback", "Flag", "Location", "LocationFlag", "UnloadValue", "UnloadFunc", "Locked", "Keybind", "Condition", "AllowDuplicateCalls"},
		Textbox = {"Name", "Value", "Callback", "Flag", "Location", "LocationFlag", "UnloadValue", "UnloadFunc", "Placeholder", "Type", "Min", "Max", "Decimals", "Hex", "Binary", "Base", "RichTextBox", "MultiLine", "TextScaled", "TextFont", "PreFormat", "PostFormat", "CustomProperties", "AllowDuplicateCalls"},
		Slider = {"Name", "Value", "Callback", "Flag", "Location", "LocationFlag", "UnloadValue", "UnloadFunc", "Min", "Max", "Decimals", "Format", "IllegalInput", "Textbox", "AllowDuplicateCalls"},
		Button = {"Name", "Callback", "Locked", "Condition"},
		Keybind = {"Name", "Value", "Callback", "Flag", "Location", "LocationFlag", "UnloadValue", "UnloadFunc", "Pressed", "KeyNames", "AllowDuplicateCalls"},
		Dropdown = {"Name", "Value", "Callback", "Flag", "Location", "LocationFlag", "UnloadValue", "UnloadFunc", "List", "Filter", "Method", "Nothing", "Sort", "MultiSelect", "ItemAdded", "ItemRemoved", "ItemChanged", "ItemsCleared", "ScrollUpButton", "ScrollDownButton", "ScrollButtonRate", "DisablePrecisionScrolling", "AllowDuplicateCalls"},
		SearchBox = {"Name", "Value", "Callback", "Flag", "Location", "LocationFlag", "UnloadValue", "UnloadFunc", "List", "Filter", "Method", "Nothing", "Sort", "MultiSelect", "ItemAdded", "ItemRemoved", "ItemChanged", "ItemsCleared", "ScrollUpButton", "ScrollDownButton", "ScrollButtonRate", "DisablePrecisionScrolling", "RegEx", "AllowDuplicateCalls"},
		Colorpicker = {"Name", "Value", "Callback", "Flag", "Location", "LocationFlag", "UnloadValue", "UnloadFunc", "Rainbow", "Random", "AllowDuplicateCalls"},
		Persistence = {"Name", "Value", "Callback", "Flag", "Location", "LocationFlag", "UnloadValue", "UnloadFunc", "Workspace", "Persistive", "Suffix", "LoadCallback", "SaveCallback", "PostLoadCallback", "PostSaveCallback", "ScrollUpButton", "ScrollDownButton", "ScrollButtonRate", "DisablePrecisionScrolling", "AllowDuplicateCalls"},
		Designer = {"Backdrop", "Image", "Info", "Credit"}
	}
	function resolvevararg(objtype, ...)
		local data = varargresolve[objtype]
		local t = {}
		if data then
			for index, value in next, {...} do
				t[data[index]] = value
			end
		end
		return t
	end
end
local resolvercache = {}
library.resolvercache = resolvercache
local function resolveid(image, flag)
	if image then
		if type(image) == "string" then
			if (#image > 14 and string.sub(image, 1, 13) == "rbxassetid://") or (#image > 12 and string.sub(image, 1, 11) == "rbxasset://") or (#image > 12 and string.sub(image, 1, 11) ~= "rbxthumb://") then
				if flag then
					local thing = library.elements[flag] or library.designerelements[flag]
					if thing and thing.Set then
						task.spawn(thing.Set, thing, image)
					end
				end
				return image
			end
		end
		local orig = image
		if resolvercache[orig] then
			if flag then
				local thing = library.elements[flag] or library.designerelements[flag]
				if thing and thing.Set then
					task.spawn(thing.Set, thing, resolvercache[orig])
				end
			end
			return resolvercache[orig]
		end
		image = tonumber(image) or image
		local succezz = pcall(function()
			local typ = type(image)
			if typ == "string" then
				if getsynasset then
					if #image > 11 and (string.sub(image, 1, 11) == "synasset://") then
						return getsynasset(string.sub(image, 12))
					elseif (#image > 14) and (string.sub(image, 1, 14) == "synasseturl://") then
						local x, e = pcall(function()
							local codename, fixes = string.gsub(image, ".", function(c)
								if c:lower() == c:upper() and not tonumber(c) then
									return ""
								end
							end)
							codename = string.sub(codename, 1, 24) .. tostring(fixes)
							local fold = isfolder("./Pepsi Lib")
							if fold then
							else
								makefolder("./Pepsi Lib")
							end
							fold = isfolder("./Pepsi Lib/Themes")
							if fold then
							else
								makefolder("./Pepsi Lib/Themes")
							end
							fold = isfolder("./Pepsi Lib/Themes/SynapseAssetsCache")
							if fold then
							else
								makefolder("./Pepsi Lib Themes/SynapseAssetsCache")
							end
							if not fold or not isfile("./Pepsi Lib/Themes/SynapseAssetsCache/" .. codename .. ".dat") then
								local res = game:HttpGet(string.sub(image, 15))
								if res ~= nil then
									writefile("./Pepsi Lib/Themes/SynapseAssetsCache/" .. codename .. ".dat", res)
								end
							end
							return getsynasset(readfile("./Pepsi Lib/Themes/SynapseAssetsCache/" .. codename .. ".dat"))
						end)
						if x and e ~= nil then
							return e
						end
					end
				end
				if (#image < 11) or ((string.sub(image, 1, 13) ~= "rbxassetid://") and (string.sub(image, 1, 11) ~= "rbxasset://") and string.sub(image, 1, 11) ~= "rbxthumb://") then
					image = tonumber(image:gsub("%D", ""), 10) or image
					typ = type(image)
				end
			end
			if (typ == "number") and (image > 0) then
				pcall(function()
					local nfo = Marketplace and Marketplace:GetProductInfo(image)
					image = tostring(image)
					if nfo and nfo.AssetTypeId == 1 then
						image = "rbxassetid://" .. image
					elseif nfo.AssetTypeId == 13 then
						local decal = game:GetObjects("rbxassetid://" .. image)[1]
						image = "rbxassetid://" .. ((decal and decal.Texture) or "0"):match("%d+$")
						decal = (decal and decal:Destroy() and nil) or nil
					end
				end)
			else
				image = nil
			end
		end)
		if succezz and image then
			if orig then
				resolvercache[orig] = image
			end
			resolvercache[image] = image
			if flag then
				local thing = library.elements[flag] or library.designerelements[flag]
				if thing and thing.Set then
					task.spawn(thing.Set, thing, image)
				end
			end
		end
	end
	return image
end
library.subs.ResolveID = resolveid
library.resolvercache = resolvercache
local colored, colors = library.colored, library.colors
local tweenService = game:GetService("TweenService")
local updatecolors, MainScreenGui = nil
do
	local MayGC = 0
	spawn(function()
		local IsDescendantOf = game.IsDescendantOf
		local RemoveTable = table.remove
		while wait_check() do
			while shared.NO_LIB_GC do
				wait(20)
				if wait_check() then
				else
					return
				end
			end
			wait(10)
			local Breathe = 30
			for DataIndex = #colored, 1, -1 do
				if MayGC > 0 then
					break
				end
				Breathe -= 1
				if Breathe <= 0 then
					Breathe = 30
					if wait_check() then
						if MayGC > 0 then
							break
						end
					else
						return
					end
				end
				if MayGC > 0 then
					break
				end
				local data = colored[DataIndex]
				data = data and data[1]
				if data and (typeof(data) == "Instance") and IsDescendantOf(data, MainScreenGui) then
				elseif MayGC <= 0 then
					RemoveTable(colored, DataIndex)
				else
					break
				end
			end
			local sigs = library.signals
			local len = sigs and #sigs
			if len then
				local Dyn = math.round(len / 10)
				Dyn = ((Dyn < 1) and 1) or Dyn
				for DataIndex = len, 1, -1 do
					Breathe -= 1
					if Breathe <= 0 then
						Breathe = Dyn
						if wait_check() then
						else
							return
						end
					end
					local data = sigs[DataIndex]
					if data and (typeof(data) == "RBXScriptConnection") and data.Connected then
					else
						RemoveTable(sigs, DataIndex)
					end
				end
			end
		end
	end)
	local function colortwee(data, tweenit)
		local cclr = colors[data[3]]
		local darkness = data[4]
		tweenService:Create(data[1], TweenInfo.new(tweenit, library.configuration.easingStyle, library.configuration.easingDirection), {
			[data[2]] = (darkness and darkness ~= 1 and darkenColor(cclr, darkness)) or cclr
		}):Play()
	end
	local function colordarktwee(data)
		local cclr = colors[data[3]]
		local darkness = data[4]
		data[1][data[2]] = (darkness and darkness ~= 1 and darkenColor(cclr, darkness)) or cclr
	end
	function updatecolors(tweenit)
		MayGC += 1
		if library.objects and (#library.objects > 0 or next(library.objects)) then
			for _, data in next, colored do
				local x, e
				if tweenit then
					x, e = pcall(colortwee, data, tweenit)
				end
				if x then
				else
					local x, e = pcall(colordarktwee, data)
					if e and not x then
						warn(debug.traceback(e))
					end
				end
			end
			pcall(function()
				if library.Backdrop then
					library.Backdrop.Visible = library_flags["__Designer.Background.UseBackgroundImage"] and true
					library.Backdrop.Image = resolveid(library_flags["__Designer.Background.ImageAssetID"], "__Designer.Background.ImageAssetID") or ""
					library.Backdrop.ImageColor3 = library_flags["__Designer.Background.ImageColor"] or Color3.new(1, 1, 1)
					library.Backdrop.ImageTransparency = (library_flags["__Designer.Background.ImageTransparency"] or 95) / 100
				end
			end)
		end
		MayGC -= 1
	end
end
local function updatecolorsnotween()
	updatecolors()
end
library.subs.updatecolors = updatecolors
library.colors = setmetatable({}, {
	__index = colors,
	__newindex = function(_, k, v)
		if colors[k] ~= v then
			colors[k] = v
			spawn(updatecolorsnotween)
		end
	end
})
local elements = library.elements
shared.libraries = shared.libraries or {}
local colorpickerconflicts = library.colorpickerconflicts
local keyHandler = {
	notAllowedKeys = {
		[Enum.KeyCode.Return] = true,
		[Enum.KeyCode.Space] = true,
		[Enum.KeyCode.Tab] = true,
		[Enum.KeyCode.Unknown] = true,
		[Enum.KeyCode.Backspace] = true
	},
	notAllowedMouseInputs = {
		[Enum.UserInputType.MouseMovement] = true,
		[Enum.UserInputType.MouseWheel] = true,
		[Enum.UserInputType.MouseButton1] = true,
		[Enum.UserInputType.MouseButton2] = true,
		[Enum.UserInputType.MouseButton3] = true
	},
	allowedKeys = {
		[Enum.KeyCode.LeftShift] = "LShift",
		[Enum.KeyCode.RightShift] = "RShift",
		[Enum.KeyCode.LeftControl] = "LCtrl",
		[Enum.KeyCode.RightControl] = "RCtrl",
		[Enum.KeyCode.LeftAlt] = "LAlt",
		[Enum.KeyCode.RightAlt] = "RAlt",
		[Enum.KeyCode.CapsLock] = "CAPS",
		[Enum.KeyCode.One] = "1",
		[Enum.KeyCode.Two] = "2",
		[Enum.KeyCode.Three] = "3",
		[Enum.KeyCode.Four] = "4",
		[Enum.KeyCode.Five] = "5",
		[Enum.KeyCode.Six] = "6",
		[Enum.KeyCode.Seven] = "7",
		[Enum.KeyCode.Eight] = "8",
		[Enum.KeyCode.Nine] = "9",
		[Enum.KeyCode.Zero] = "0",
		[Enum.KeyCode.KeypadOne] = "Num-1",
		[Enum.KeyCode.KeypadTwo] = "Num-2",
		[Enum.KeyCode.KeypadThree] = "Num-3",
		[Enum.KeyCode.KeypadFour] = "Num-4",
		[Enum.KeyCode.KeypadFive] = "Num-5",
		[Enum.KeyCode.KeypadSix] = "Num-6",
		[Enum.KeyCode.KeypadSeven] = "Num-7",
		[Enum.KeyCode.KeypadEight] = "Num-8",
		[Enum.KeyCode.KeypadNine] = "Num-9",
		[Enum.KeyCode.KeypadZero] = "Num-0",
		[Enum.KeyCode.Minus] = "-",
		[Enum.KeyCode.Equals] = "=",
		[Enum.KeyCode.Tilde] = "~",
		[Enum.KeyCode.LeftBracket] = "[",
		[Enum.KeyCode.RightBracket] = "]",
		[Enum.KeyCode.RightParenthesis] = ")",
		[Enum.KeyCode.LeftParenthesis] = "(",
		[Enum.KeyCode.Semicolon] = ";",
		[Enum.KeyCode.Quote] = "'",
		[Enum.KeyCode.BackSlash] = "\\",
		[Enum.KeyCode.Comma] = ",",
		[Enum.KeyCode.Period] = ".",
		[Enum.KeyCode.Slash] = "/",
		[Enum.KeyCode.Asterisk] = "*",
		[Enum.KeyCode.Plus] = "+",
		[Enum.KeyCode.Period] = ".",
		[Enum.KeyCode.Backquote] = "`"
	}
}
local SeverAllConnections = nil
function SeverAllConnections(t, cache)
	cache = cache or {}
	for k, v in next, t do
		t[k] = nil
		if v ~= nil then
			if cache[v] then
				continue
			end
			local te = v and typeof(v)
			if te then
				if te == "RBXScriptConnection" then
					v:Disconnect()
				elseif te == "Instance" then
					v:Destroy()
				elseif te == "table" then
					cache[v] = true
					SeverAllConnections(v, cache)
				end
			end
		end
	end
end
library.Subs.SeverAllConnections = SeverAllConnections
local function hardunload(library)
	if library.UnloadCallback and (type(library.UnloadCallback) == "function") then
		local x, e = pcall(library.UnloadCallback)
		if not x and e then
			task.spawn(error, e, 2)
		end
	end
	for cflag, data in next, elements do
		if data.Type ~= "Persistence" then
			if data.Set and data.Options.UnloadValue ~= nil then
				data.Set(data.Options.UnloadValue)
			end
			if data.Options.UnloadFunc then
				local y, u = pcall(data.Options.UnloadFunc)
				if not y and u then
					warn(debug.traceback("Error unloading '" .. tostring(cflag) .. "'\n" .. u))
				end
			end
		end
	end
	local hardcache = {}
	SeverAllConnections(library.signals, hardcache)
	SeverAllConnections(library.objects, hardcache)
	hardcache = (table.clear(hardcache) and nil) or nil
	library.signals = nil
	library.objects = nil
end
library.Subs.UnloadArg = hardunload
local function unloadall()
	if shared.libraries then
		local b = 50
		while #shared.libraries > 0 do
			b = b - 1
			if b < 0 then
				b = 50
				wait(warn("Looped 50 times while unloading....?"))
			end
			local v = shared.libraries[1]
			if v and v.unload and (type(v.unload) == "function") then
				if not pcall(v.unload) then
					pcall(hardunload, v)
					for k in next, v do
						v[k] = nil
					end
				end
				if shared.libraries then
					pcall(function()
						table.remove(shared.libraries, 1)
					end)
				else
					return pcall(hardunload, library)
				end
			end
		end
	end
	shared.libraries = nil
end
shared.unloadall = unloadall
library.unloadall = unloadall
shared.libraries[1 + #shared.libraries] = library
function library.unload()
	__runscript = nil
	hardunload(library)
	if shared.libraries then
		for k, v in next, shared.libraries or {} do
			if v == library then
				for k in next, table.remove(shared.libraries or {}, k) do
					v[k] = nil
				end
				break
			end
		end
		if shared.libraries and (#shared.libraries == 0) then
			shared.libraries = nil
		end
	end
	warn("Unloaded")
end
library.Unload = library.unload
local Instance_new = (syn and syn.protect_gui and function(...)
	local x = {Instance.new(...)}
	if x[1] then
		library.objects[1 + #library.objects] = x[1]
		pcall(syn.protect_gui, x[1])
	end
	return unpack(x)
end) or function(...)
	local x = {Instance.new(...)}
	if x[1] then
		library.objects[1 + #library.objects] = x[1]
	end
	return unpack(x)
end
library.subs.Instance_new = Instance_new
local playersservice = game:GetService("Players")
local function getresolver(listt, filter, method, _)
	local huo, args = type(filter), {}
	local hou = typeof(listt)
	return ((hou == "function") and function(...)
		return listt(...)
	end) or ((hou == "table") and function()
		return listt
	end) or function()
		local hardtype = nil
		local g = listt
		for _ = 1, 5 do
			hardtype = typeof(g)
			if hardtype == "function" then
				local x, e = pcall(listt)
				if x and e then
					g = e
				end
				hardtype = typeof(g)
			end
			if hardtype == "Instance" then
				local lastg = g
				if method == nil and listt == playersservice then
					g = listt:GetPlayers()
				end
				if method then
					local metype = type(method)
					if metype == "table" then
						method = method.Method or method[1]
						args = method.Args or method.Arguments or unpack(method, (method.Method ~= nil and 1) or 2)
						metype = type(method)
					end
					local y, u = nil, nil
					if metype == "function" then
						y, u = pcall(method, listt, unpack(args))
					elseif metype == "string" then
						local y, u = pcall(function()
							return listt[method](listt, unpack(args))
						end)
					else
						warn("Idk how to handle method type of", metype, debug.traceback(""))
					end
					if u then
						if y then
							g = u
						else
							warn("Error trying method", method, "on", listt, debug.traceback(u))
						end
					end
				end
				if g == lastg then
					g = listt:GetChildren()
				end
			end
			if hardtype == "Enum" then
				g = listt:GetEnumItems()
			end
			hardtype = typeof(g)
			if hardtype == "table" then
				break
			end
		end
		hardtype = typeof(g)
		if hardtype ~= "table" then
			warn("Could not resolve " .. hou .. " type to a list.")
			return {}
		end
		if filter then
			if huo == "function" then
				local accept = {}
				for _, v in next, g do
					local x, e = pcall(filter, v)
					if x and e then
						accept[1 + #accept] = (e == true and v) or e
					end
				end
				g = accept
			elseif huo == "string" then
				local accept = {}
				for _, v in next, g do
					if tostring(v):lower():find(huo) then
						accept[1 + #accept] = v
					end
				end
				g = accept
			elseif huo == "table" then
				local accept = {}
				if type(filter[1]) == "string" then
					for _, v in next, g do
						if tostring(v):lower():find(huo) then
							accept[1 + #accept] = v
						elseif filter[0] then
							accept[1 + #accept] = v
						end
					end
				else
					for _, v in next, g do
						if not table.find(filter, v) and not table.find(filter, tostring(v)) then
							accept[1 + #accept] = v
						elseif not filter[0] then
							accept[1 + #accept] = v
						end
					end
				end
				g = accept
			end
		end
		return g
	end
end
library.subs.GetResolver = getresolver
local function resetall()
	destroyrainbowsg = true
	pcall(function()
		for k, v in next, elements do
			if v and k and v.Set and (v.Default ~= nil) and (library_flags[k] ~= v.Default) and (string.sub(k, 1, 11) ~= "__Designer.") then
				v:Set(v.Default)
			end
		end
	end)
end
library.ResetAll = resetall
local textService = game:GetService("TextService")
local userInputService = game:GetService("UserInputService")
local runService = game:GetService("RunService")
local LP = playersservice.LocalPlayer
library.LP = LP
library.Players = playersservice
library.UserInputService = userInputService
library.RunService = runService
local mouse = LP and LP:GetMouse()
if not mouse and PluginManager and runService:IsStudio() then
	shared.library_plugin = shared.library_plugin or print("Creating Studio Test-Plugin...") or PluginManager():CreatePlugin()
	mouse = shared.library_plugin:GetMouse()
	library.plugin = shared.library_plugin
end
library.Mouse = mouse
local textToSize = nil
do
	local textService = game:GetService("TextService")
	local bigv2 = Vector2.one * math.huge
	function textToSize(object)
		return textService:GetTextSize(object.Text, object.TextSize, object.Font, bigv2)
	end
end
library.subs.textToSize = textToSize
local function removeSpaces(str)
	if str then
		local newStr = str:gsub(" ", "")
		return newStr
	end
end
library.subs.removeSpaces = removeSpaces
local function Color3FromHex(hex)
	hex = hex:gsub("#", ""):upper():gsub("0X", "")
	return Color3.fromRGB(tonumber(hex:sub(1, 2), 16), tonumber(hex:sub(3, 4), 16), tonumber(hex:sub(5, 6), 16))
end
library.subs.Color3FromHex = Color3FromHex
local floor = math.floor
local function Color3ToHex(color)
	local r, g, b = string.format("%X", floor(color.R * 255)), string.format("%X", floor(color.G * 255)), string.format("%X", floor(color.B * 255))
	if #r < 2 then
		r = "0" .. r
	end
	if #g < 2 then
		g = "0" .. g
	end
	if #b < 2 then
		b = "0" .. b
	end
	return string.format("%s%s%s", r, g, b)
end
if Color3.ToHex and not shared.overridecolortohex then
	local x, e = pcall(Color3.ToHex, Color3.new())
	if x and type(e) == "string" and #e == 6 then
		Color3ToHex = Color3.ToHex
	end
end
library.subs.Color3ToHex = Color3ToHex
local isDraggingSomething = false
local function makeDraggable(topBarObject, object)
	local dragging = nil
	local dragInput = nil
	local dragStart = nil
	local startPosition = nil
	library.signals[1 + #library.signals] = topBarObject.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPosition = object.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	library.signals[1 + #library.signals] = topBarObject.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	library.signals[1 + #library.signals] = userInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			local delta = input.Position - dragStart
			if not isDraggingSomething and library.configuration.smoothDragging then
				tweenService:Create(object, TweenInfo.new(0.25, library.configuration.easingStyle, library.configuration.easingDirection), {
					Position = UDim2.new(startPosition.X.Scale, startPosition.X.Offset + delta.X, startPosition.Y.Scale, startPosition.Y.Offset + delta.Y)
				}):Play()
			elseif not isDraggingSomething and not library.configuration.smoothDragging then
				object.Position = UDim2.new(startPosition.X.Scale, startPosition.X.Offset + delta.X, startPosition.Y.Scale, startPosition.Y.Offset + delta.Y)
			end
		end
	end)
end
library.subs.makeDraggable = makeDraggable
local JSONEncode, JSONDecode = nil, nil
do
	local temp_http = game:FindService("HttpService") or game:GetService("HttpService")
	local httpservice = temp_http
	if cloneref and (type(cloneref) == "function") then
		httpservice, temp_http = cloneref(httpservice), nil
	end
	library.Http = httpservice
	local JSONEncodeFunc = httpservice.JSONEncode
	function JSONEncode(...)
		return pcall(JSONEncodeFunc, httpservice, ...)
	end
	library.JSONEncode = JSONEncode
	local JSONDecodeFunc = httpservice.JSONDecode
	function JSONDecode(...)
		return pcall(JSONDecodeFunc, httpservice, ...)
	end
	library.JSONDecode = JSONDecode
end
local convertfilename
do
	local string_gsub = string.gsub
	function convertfilename(str, default, replace)
		replace = replace or "_"
		local corrections = 0
		local predname = string_gsub(str, "%W", function(c)
			local byt = c:byte()
			if ((byt == 0) or (byt == 32) or (byt == 33) or (byt == 59) or (byt == 61) or ((byt >= 35) and (byt <= 41)) or ((byt >= 43) and (byt <= 57)) or ((byt >= 64) and (byt <= 123)) or ((byt >= 125) and (byt <= 127))) then
			else
				corrections = 1 + corrections
				return replace
			end
		end)
		return (default and corrections == #predname and tostring(default)) or predname
	end
	library.subs.ConvertFilename = convertfilename
end
do
	do
		local function NewOption(TextStr, Order, Parent)
			local Option = Instance_new("Frame")
			local BBorder = Instance_new("Frame")
			local Inner_2 = Instance_new("Frame")
			local Border_2 = Instance_new("Frame")
			local Text = Instance_new("TextLabel")
			local Button = Instance_new("TextButton")
			Option.AnchorPoint = Vector2.new(0, 0.5)
			Option.BackgroundColor3 = library.colors.background
			colored[1 + #colored] = {Option, "BackgroundColor3", "background"}
			Option.BorderColor3 = Color3.fromRGB(27, 27, 27)
			Option.LayoutOrder = Order or #Parent:GetChildren()
			Option.Name = "Option"
			Option.Position = UDim2.new(0, 5, 0.5, 0)
			Option.Size = UDim2.new(0, 35, 0, 25)
			BBorder.AnchorPoint = Vector2.new(0.5, 0.5)
			BBorder.BackgroundColor3 = library.colors.background
			colored[1 + #colored] = {BBorder, "BackgroundColor3", "background"}
			BBorder.BorderColor3 = Color3.fromRGB(50, 43, 50)
			BBorder.BorderMode = Enum.BorderMode.Inset
			BBorder.Name = "BBorder"
			BBorder.Parent = Option
			BBorder.Position = UDim2.new(0.5, 0, 0.5, 0)
			BBorder.Size = UDim2.new(1, 0, 1, 0)
			Inner_2.AnchorPoint = Vector2.new(0.5, 0.5)
			Inner_2.BackgroundColor3 = library.colors.background
			colored[1 + #colored] = {Inner_2, "BackgroundColor3", "background"}
			Inner_2.BorderColor3 = Color3.fromRGB(27, 27, 27)
			Inner_2.Name = "Inner"
			Inner_2.Parent = Option
			Inner_2.Position = UDim2.new(0.5, 0, 0.5, 0)
			Inner_2.Size = UDim2.new(1, -6, 1, -6)
			Border_2.AnchorPoint = Vector2.new(0.5, 0.5)
			Border_2.BackgroundColor3 = library.colors.background
			colored[1 + #colored] = {Border_2, "BackgroundColor3", "background"}
			Border_2.BorderColor3 = Color3.fromRGB(50, 43, 50)
			Border_2.BorderMode = Enum.BorderMode.Inset
			Border_2.Name = "Border"
			Border_2.Parent = Inner_2
			Border_2.Position = UDim2.new(0.5, 0, 0.5, 0)
			Border_2.Size = UDim2.new(1, 0, 1, 0)
			Text.AnchorPoint = Vector2.new(0.5, 0.5)
			Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Text.BackgroundTransparency = 1
			Text.Font = Enum.Font.Code
			Text.FontSize = Enum.FontSize.Size14
			Text.Name = "Text"
			Text.Parent = Border_2
			Text.Position = UDim2.new(0.5, 0, 0.5, 0)
			Text.Size = UDim2.new(1, 0, 1, 0)
			Text.TextColor3 = library.colors.elementText
			colored[1 + #colored] = {Text, "TextColor3", "elementText"}
			Text.TextSize = 14
			Text.TextStrokeTransparency = 0.75
			Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Button.BackgroundTransparency = 1
			Button.BorderSizePixel = 0
			Button.Font = Enum.Font.SourceSans
			Button.FontSize = Enum.FontSize.Size14
			Button.Name = "Button"
			Button.Parent = Option
			Button.Size = UDim2.new(1, 0, 1, 0)
			Button.Text = ""
			Button.TextColor3 = Color3.fromRGB(0, 0, 0)
			Button.TextSize = 14
			Button.TextTransparency = 1
			Text.Text = TextStr
			local siz = textToSize(Text)
			Option.Size = UDim2.new(0, math.max(siz.X, 28) + 12, 0, 25)
			Option.Parent = Parent
			return Option, Button, Text
		end
		local function AddOption(OptionData, Key, OptionCount, Parent, Close, PromptEvent, KeepOpen)
			local Enabled = OptionData.Enabled
			if OptionData.Disabled then
				Enabled = false
			else
				Enabled = Enabled or (Enabled == nil)
			end
			local OptionText = OptionData.Text or OptionData.String or OptionData.Message or OptionData.Value or OptionData.Name or Key
			local Callback = OptionData.Callback or OptionData.OnPressed or OptionData.Function or nil
			local Order = tonumber(OptionData.Slot or OptionData.Order or OptionData.LayoutOrder or OptionData.Index or OptionCount)
			local OptionIns, OptionButton, OptionTxt = NewOption(tostring(OptionText), Order, Parent)
			local OptionObj = {
				Text = OptionText,
				Callback = Callback,
				ButtonObject = OptionIns,
				Pressed = OptionButton.MouseButton1Click,
				PressedRight = OptionButton.MouseButton2Click,
				Activated = OptionButton.Activated,
				TextButton = OptionButton,
				Order = Order,
				Enabled = Enabled
			}
			function OptionObj.Remove()
				do
					local Btn = OptionObj.ButtonObject
					if Btn then
						Btn:Destroy()
					end
				end
				for k in next, OptionObj do
					rawset(OptionObj, k, nil)
				end
				return true
			end
			local Proxy = nil
			local function Clicked(f)
				return function(...)
					if f then
						task.spawn(f, ...)
					end
					PromptEvent:Fire(Key, OptionButton.Text, ...)
					if KeepOpen then
					else
						Close()
					end
				end
			end
			function OptionObj.Press(...)
				OptionObj.Update()
				Proxy = Proxy or Clicked(Callback)
				Proxy(...)
			end
			function OptionObj.Lock()
				OptionObj.Enabled = false
				OptionObj.Update()
			end
			function OptionObj.Unlock()
				OptionObj.Enabled = true
				OptionObj.Update()
			end
			function OptionObj.SetLocked(self, state)
				if type(self) == "boolean" then
					state = self
				end
				OptionObj.Enabled = state
				OptionObj.Update()
			end
			function OptionObj.SetCondition(self, Condition)
				if type(self) ~= "table" then
					Condition = self
				end
				OptionObj.Condition = Condition
				OptionObj.Update()
			end
			function OptionObj.Update()
				do
					local OptionText = OptionObj.Text or OptionData.Text or OptionData.String or OptionData.Message or OptionData.Value or OptionData.Name or OptionButton.Text or Key
					OptionButton.Text = tostring(OptionText)
				end
				OptionIns.LayoutOrder = tonumber(OptionObj.Order or OptionData.Slot or OptionData.Order or OptionData.LayoutOrder or OptionData.Index or OptionIns.LayoutOrder or OptionCount)
				do
					local Enabled = OptionData.Enabled
					local Cond = OptionObj.Condition
					if Cond then
						local x, e = pcall(Cond, OptionObj)
						if x then
							Enabled = e and true
						else
							warn(debug.traceback(string.format("Error in prompt-option %s's Condition function: %s", OptionButton.Text, e), 2))
						end
					else
						if OptionData.Disabled then
							Enabled = false
						else
							Enabled = (Enabled and true) or (Enabled == nil)
						end
					end
					local Proxy = nil
					do
						local nCallback = (Enabled and (OptionData.Callback or OptionData.OnPressed or OptionData.Function)) or nil
						if not Proxy or Callback ~= nCallback then
							Callback = nCallback
							Proxy = Clicked(Callback)
							OptionObj.PressedConnection = (OptionObj.PressedConnection and OptionObj.PressedConnection:Disconnect() and nil) or (Callback and OptionObj.Pressed:Connect(Proxy)) or nil
						end
						local PC = OptionObj.PressedConnection
						if Enabled then
							if PC then
								if Callback then
								else
									OptionObj.PressedConnection = (PC:Disconnect() and nil) or nil
								end
							elseif Callback then
								Proxy = Proxy or Clicked(Callback)
								OptionObj.PressedConnection = OptionObj.Pressed:Connect(Proxy)
							end
						elseif PC then
							OptionObj.PressedConnection = (PC:Disconnect() and nil) or nil
						end
					end
					OptionObj.Enabled = Enabled
					OptionTxt.TextTransparency = (Enabled and 0) or 0.5
				end
				return OptionObj
			end
			OptionObj.Update()
			return OptionObj
		end
		local function SortByLayoutOrder(a, b)
			return a.Order < b.Order
		end
		local DefaultSelections = {
			Ok = true
		}
		function library.Prompt(self, PromptData, ...)
			if rawequal(self, library) then
			else
				PromptData, self = self, library
			end
			local PromptEvent = Instance_new("BindableEvent")
			local PromptObj = {
				OnSelect = PromptEvent.Event,
				Active = true,
				SelectedEvent = PromptEvent
			}
			local ChoicePopup = Instance_new("Frame")
			local Buttons = Instance_new("ScrollingFrame")
			local Title = Instance_new("TextLabel")
			local Description = Instance_new("TextLabel")
			local DoClose = PromptData.CloseButton
			DoClose = (DoClose == nil) or (DoClose == true) or DoClose or nil
			local Close = DoClose and Instance_new("ImageButton")
			do
				local Border = Instance_new("Frame")
				local Inner = Instance_new("Frame")
				local InnerBorder = Instance_new("Frame")
				local Bar = Instance_new("Frame")
				local Splitter = Instance_new("Frame")
				local ButtonBar = Instance_new("Frame")
				local UIListLayout = Instance_new("UIListLayout")
				ChoicePopup.AnchorPoint = Vector2.new(0.5, 0.5)
				ChoicePopup.BackgroundColor3 = library.colors.background
				colored[1 + #colored] = {ChoicePopup, "BackgroundColor3", "background"}
				ChoicePopup.BorderColor3 = library.colors.outerBorder
				colored[1 + #colored] = {ChoicePopup, "BorderColor3", "outerBorder"}
				ChoicePopup.Name = "ChoicePopup"
				ChoicePopup.Position = UDim2.new(0.5, 0, 0.5, 0)
				ChoicePopup.Size = UDim2.new(0, 325, 0, 100)
				Border.AnchorPoint = Vector2.new(0.5, 0.5)
				Border.BackgroundColor3 = library.colors.background
				colored[1 + #colored] = {Border, "BackgroundColor3", "background"}
				Border.BorderColor3 = library.colors.innerBorder
				colored[1 + #colored] = {Border, "BorderColor3", "innerBorder"}
				Border.BorderMode = Enum.BorderMode.Inset
				Border.Name = "Border"
				Border.Parent = ChoicePopup
				Border.Position = UDim2.new(0.5, 0, 0.5, 0)
				Border.Size = UDim2.new(1, 0, 1, 0)
				Inner.AnchorPoint = Vector2.new(0.5, 0.5)
				Inner.BackgroundColor3 = library.colors.background
				colored[1 + #colored] = {Inner, "BackgroundColor3", "background"}
				Inner.BorderColor3 = library.colors.outerBorder
				colored[1 + #colored] = {Inner, "BorderColor3", "outerBorder"}
				Inner.Name = "Inner"
				Inner.Parent = ChoicePopup
				Inner.Position = UDim2.new(0.5, 0, 0.5, 0)
				Inner.Size = UDim2.new(1, -8, 1, -8)
				InnerBorder.AnchorPoint = Vector2.new(0.5, 0.5)
				InnerBorder.BackgroundColor3 = library.colors.background
				colored[1 + #colored] = {InnerBorder, "BackgroundColor3", "background"}
				InnerBorder.BorderColor3 = library.colors.innerBorder
				colored[1 + #colored] = {InnerBorder, "BorderColor3", "innerBorder"}
				InnerBorder.BorderMode = Enum.BorderMode.Inset
				InnerBorder.Name = "InnerBorder"
				InnerBorder.Parent = Inner
				InnerBorder.Position = UDim2.new(0.5, 0, 0.5, 0)
				InnerBorder.Size = UDim2.new(1, 0, 1, 0)
				Bar.BackgroundColor3 = library.colors.main
				colored[1 + #colored] = {Bar, "BackgroundColor3", "main"}
				Bar.BorderSizePixel = 0
				Bar.Name = "Bar"
				Bar.Parent = InnerBorder
				Bar.Size = UDim2.new(1, 0, 0, 3)
				Splitter.AnchorPoint = Vector2.new(0, 1)
				Splitter.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
				Splitter.BorderSizePixel = 0
				Splitter.Name = "Splitter"
				Splitter.Parent = InnerBorder
				Splitter.Position = UDim2.new(0, 0, 1, -35)
				Splitter.Size = UDim2.new(1, 0, 0, 1)
				Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Title.BackgroundTransparency = 1
				Title.Font = Enum.Font.Code
				Title.FontSize = Enum.FontSize.Size18
				Title.Parent = InnerBorder
				Title.Position = UDim2.new(0, 6, 0, 4)
				Title.Size = UDim2.new(0, 300, 0, 25)
				Title.TextColor3 = library.colors.elementText
				colored[1 + #colored] = {Title, "TextColor3", "elementText"}
				Title.TextSize = 15
				Title.TextStrokeTransparency = 0.95
				Title.TextXAlignment = Enum.TextXAlignment.Left
				Description.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Description.BackgroundTransparency = 1
				Description.Font = Enum.Font.Code
				Description.FontSize = Enum.FontSize.Size14
				Description.Name = "Description"
				Description.Parent = InnerBorder
				Description.Position = UDim2.new(0, 6, 0, 25)
				Description.Size = UDim2.new(0, 300, 0, 25)
				Description.TextColor3 = library.colors.elementText
				colored[1 + #colored] = {Description, "TextColor3", "elementText"}
				Description.TextSize = 14
				Description.TextStrokeTransparency = 0.95
				Description.TextTruncate = Enum.TextTruncate.AtEnd
				Description.TextWrap = true
				Description.TextWrapped = true
				Description.TextXAlignment = Enum.TextXAlignment.Left
				if Close then
					Close.AnchorPoint = Vector2.new(1)
					Close.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Close.BackgroundTransparency = 1
					Close.Image = "http://www.roblox.com/asset/?id=9064270627"
					Close.ImageColor3 = library.colors.section
					colored[1 + #colored] = {Close, "ImageColor3", "section"}
					Close.Name = "Close"
					Close.Parent = InnerBorder
					Close.Position = UDim2.new(1, -9, 0, 11)
					Close.ScaleType = Enum.ScaleType.Fit
					Close.Size = UDim2.new(0, 10, 0, 10)
				end
				ButtonBar.AnchorPoint = Vector2.new(0, 1)
				ButtonBar.BackgroundColor3 = library.colors.sectionBackground
				colored[1 + #colored] = {ButtonBar, "BackgroundColor3", "sectionBackground"}
				ButtonBar.BorderSizePixel = 0
				ButtonBar.Name = "ButtonBar"
				ButtonBar.Parent = InnerBorder
				ButtonBar.Position = UDim2.new(0, 0, 1, 0)
				ButtonBar.Size = UDim2.new(1, 0, 0, 35)
				Buttons.AutomaticCanvasSize = Enum.AutomaticSize.X
				Buttons.BackgroundColor3 = library.colors.sectionBackground
				colored[1 + #colored] = {Buttons, "BackgroundColor3", "sectionBackground"}
				Buttons.BorderColor3 = library.colors.background
				colored[1 + #colored] = {Buttons, "BorderColor3", "background"}
				Buttons.BorderSizePixel = 0
				Buttons.BottomImage = ""
				Buttons.CanvasSize = UDim2.new(0, 0, 0, 0)
				Buttons.MidImage = ""
				Buttons.Name = "Buttons"
				Buttons.Parent = ButtonBar
				Buttons.Position = UDim2.new(0, 6, 0, 0)
				Buttons.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
				Buttons.ScrollBarImageTransparency = 1
				Buttons.ScrollBarThickness = 0
				Buttons.ScrollingDirection = Enum.ScrollingDirection.X
				Buttons.Selectable = false
				Buttons.Size = UDim2.new(1, -12, 1, 0)
				Buttons.TopImage = ""
				UIListLayout.FillDirection = Enum.FillDirection.Horizontal
				UIListLayout.Padding = UDim.new(0, 10)
				UIListLayout.Parent = Buttons
				UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
				UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
			end
			PromptObj.FrameInstance = ChoicePopup
			PromptObj.Closed = ChoicePopup.Destroying
			local function ClosePrompt(method)
				PromptObj.Active = (ChoicePopup and ChoicePopup:Destroy() and nil) or (PromptEvent:Fire("Close", method and (method == "timeout_")) and nil) or nil
			end
			PromptObj.Close = ClosePrompt
			if Close then
				Close.MouseButton1Click:Connect(((DoClose ~= true) and DoClose) or ClosePrompt)
			end
			do
				local NameTxt = PromptData.Name
				Title.Text = ((NameTxt ~= nil) and tostring(NameTxt)) or "Untitled Prompt"
			end
			do
				local DescriptionTxt = PromptData.Description
				if DescriptionTxt == nil then
					DescriptionTxt = PromptData.Text
					if DescriptionTxt == nil then
						DescriptionTxt = PromptData.String
						if DescriptionTxt == nil then
							DescriptionTxt = PromptData.Message
							if DescriptionTxt == nil then
								DescriptionTxt = PromptData.Value
							end
						end
					end
				end
				Description.Text = ((DescriptionTxt ~= nil) and tostring(DescriptionTxt)) or ""
			end
			do
				local Selections = PromptData.Options or PromptData.Buttons or PromptData.Choices
				if Selections then
					if type(Selections) ~= "table" then
						Selections = {
							OK = Selections
						}
					end
				else
					Selections = DefaultSelections
				end
				local OptionCount = 0
				local ButtonsProxy = {}
				PromptObj.Buttons = ButtonsProxy
				function PromptObj.ReOrder(self, SortFunc)
					if self ~= ButtonsProxy then
						SortFunc, self = self, nil
					end
					if SortFunc and (type(SortFunc) ~= "function") then
						SortFunc = SortByLayoutOrder
					end
					local BtnOrder = {}
					for _, Data in next, ButtonsProxy do
						BtnOrder[1 + #BtnOrder] = Data
					end
					table.sort(BtnOrder, SortFunc or SortByLayoutOrder)
					for Order, Data in next, BtnOrder do
						Data.Order = Order or Data.Order
						local UpdateFunc = Data.Update
						if UpdateFunc then
							spawn(UpdateFunc)
						else
							local Frame = Data.ButtonObject
							if Frame then
								Frame.LayoutOrder = Order
							end
						end
					end
					return ButtonsProxy
				end
				function PromptObj.PressAll(self, ...)
					local isSelf = nil
					if self and rawequal(self, PromptObj) then
						isSelf = true
					end
					for _, Data in next, ButtonsProxy do
						local f = Data.Callback
						if f then
							if isSelf then
								f(...)
							else
								f(self, ...)
							end
						end
					end
				end
				local KeepOpen = PromptData.KeepOpen
				for Key, OptionData in next, Selections do
					OptionCount += 1
					do
						local typ = OptionData and type(OptionData)
						if typ ~= "table" then
							OptionData = {
								Name = ((typ == "string") and (type(Key) == "number") and OptionData) or Key,
								Callback = ((typ == "function") and OptionData) or ClosePrompt
							}
						end
					end
					ButtonsProxy[Key] = AddOption(OptionData, Key, OptionCount, Buttons, ClosePrompt, PromptEvent, KeepOpen)
				end
			end
			do
				local to = PromptData.Timeout
				to = to and tonumber(to)
				if to then
					task.delay(to, ClosePrompt, "timeout_")
				end
			end
			ChoicePopup.Parent = MainScreenGui
			makeDraggable(ChoicePopup, ChoicePopup)
			return PromptObj, ChoicePopup
		end
	end
	do
		local Popups = Instance.new("Frame")
		local UIListLayout = Instance.new("UIListLayout")
		library.NotifyLayout = UIListLayout
		Popups.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Popups.BackgroundTransparency = 1
		Popups.Name = "Popups"
		Popups.Position = UDim2.new(0, 10, 0, 10)
		Popups.Size = UDim2.new(1, -20, 1, -20)
		UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
		UIListLayout.Padding = UDim.new(0, 5)
		UIListLayout.Parent = Popups
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
		Popups.Parent = MainScreenGui
		library.NotificationsFrame = Popups
		local Inverse = true
		local os_clock = os.clock
		local Notifications = {}
		library.Notifications = Notifications
		spawn(function()
			local v1, vtop, htop = Enum.FillDirection.Vertical, Enum.VerticalAlignment.Top, Enum.HorizontalAlignment.Center
			while wait_check() do
				local Len = #Notifications
				while wait_check() and (Len <= 0) do
					Len = #Notifications
					if wait_check(0.25) then
					else
						return
					end
				end
				Inverse = ((UIListLayout.FillDirection == v1) and (UIListLayout.VerticalAlignment ~= vtop)) or (UIListLayout.HorizontalAlignment ~= htop)
				local BreathingRoom, now = 10, os_clock()
				local Order = 0
				for Index = Len, 1, -1 do
					BreathingRoom -= 1
					if BreathingRoom <= 0 then
						if wait_check() then
							BreathingRoom, now = 10, os_clock()
						else
							return
						end
					end
					local Noti = Notifications[Index]
					local Obj = Noti and Noti.Object
					if Obj and Noti.Active and (Noti.Paused or ((now - Noti.Expires) < Noti.Duration)) then
						if Noti.TextLabel.Text ~= Noti.Text then
							Noti:SetText(Noti.Text)
						end
						if Obj.Visible then
							Order += 1
							Obj.LayoutOrder = Order * ((Inverse and -1) or 1)
						end
						continue
					end
					Noti.Object = ((Noti.Object and Noti.Object:Destroy()) and nil) or (Noti.Destroy() and nil) or (table.remove(Notifications, Index) and nil) or nil
				end
			end
		end)
		function library.Notify(self, NotificationData, ...)
			if rawequal(self, library) then
			else
				NotificationData, self = self, library
			end
			local now = os_clock()
			local dur = NotificationData.Time or 6
			local TextStr = NotificationData.Text or NotificationData.String or NotificationData.Value or NotificationData.Message or NotificationData.Msg
			TextStr = ((TextStr == nil) and "No text given") or tostring(TextStr)
			local NotificationObj = {
				InitTime = now,
				Active = true,
				Forced = false,
				Duration = dur,
				Expires = now + dur,
				Paused = (NotificationData.Paused and true) or false,
				Text = TextStr,
				Arguments = NotificationData
			}
			NotificationObj.Forced = NotificationObj.Paused
			local Notification = Instance.new("Frame")
			NotificationObj.Object = Notification
			local Border = Instance.new("Frame")
			local Inner = Instance.new("Frame")
			local Border_2 = Instance.new("Frame")
			local Text = Instance.new("TextLabel")
			NotificationObj.TextLabel = Text
			local Bar = Instance.new("Frame")
			local Close = Instance.new("ImageButton")
			Notification.AnchorPoint = Vector2.one
			Notification.BackgroundColor3 = library.colors.background
			colored[1 + #colored] = {Notification, "BackgroundColor3", "background"}
			Notification.BorderColor3 = library.colors.outerBorder
			colored[1 + #colored] = {Notification, "BorderColor3", "outerBorder"}
			Notification.Name = "Notification"
			Notification.Position = UDim2.new(1, -10, 1, -10)
			Notification.Size = UDim2.new(0, 5e4, 0, 32)
			Border.AnchorPoint = Vector2.new(0.5, 0.5)
			Border.BackgroundColor3 = library.colors.background
			colored[1 + #colored] = {Border, "BackgroundColor3", "background"}
			Border.BorderColor3 = library.colors.innerBorder
			colored[1 + #colored] = {Border, "BorderColor3", "innerBorder"}
			Border.BorderMode = Enum.BorderMode.Inset
			Border.Name = "Border"
			Border.Parent = Notification
			Border.Position = UDim2.new(0.5, 0, 0.5, 0)
			Border.Size = UDim2.new(1, 0, 1, 0)
			Inner.AnchorPoint = Vector2.one / 2
			Inner.BackgroundColor3 = library.colors.background
			colored[1 + #colored] = {Inner, "BackgroundColor3", "background"}
			Inner.BorderColor3 = library.colors.outerBorder
			colored[1 + #colored] = {Inner, "BorderColor3", "outerBorder"}
			Inner.Name = "Inner"
			Inner.Parent = Notification
			Inner.Position = UDim2.new(0.5, 0, 0.5, 0)
			Inner.Size = UDim2.new(1, -8, 1, -8)
			Border_2.AnchorPoint = Vector2.one / 2
			Border_2.BackgroundColor3 = library.colors.background
			colored[1 + #colored] = {Border_2, "BackgroundColor3", "background"}
			Border_2.BorderColor3 = library.colors.innerBorder
			colored[1 + #colored] = {Border_2, "BorderColor3", "innerBorder"}
			Border_2.BorderMode = Enum.BorderMode.Inset
			Border_2.Name = "Border"
			Border_2.Parent = Inner
			Border_2.Position = UDim2.new(0.5, 0, 0.5, 0)
			Border_2.Size = UDim2.new(1, 0, 1, 0)
			Text.AnchorPoint = Vector2.new(0, 0.5)
			Text.BackgroundTransparency = 1
			Text.Font = Enum.Font.Code
			Text.FontSize = Enum.FontSize.Size14
			Text.Name = "Text"
			Text.Parent = Border_2
			Text.Position = UDim2.new(0, 8, 0.5, 0)
			Text.Size = UDim2.new(1, -8, 1, -7)
			Text.Text = TextStr
			Text.TextColor3 = library.colors.elementText
			colored[1 + #colored] = {Text, "TextColor3", "elementText"}
			Text.TextScaled = true
			Text.TextSize = 14
			Text.TextStrokeTransparency = 0.75
			Text.TextWrap = true
			Text.TextWrapped = true
			Text.TextXAlignment = Enum.TextXAlignment.Left
			Bar.BackgroundColor3 = library.colors.main
			colored[1 + #colored] = {Bar, "BackgroundColor3", "main"}
			Bar.BorderSizePixel = 0
			Bar.Name = "Bar"
			Bar.Parent = Border_2
			Bar.Size = UDim2.new(0, 3, 1, 0)
			Close.AnchorPoint = Vector2.new(1, 0.5)
			Close.BackgroundTransparency = 1
			Close.Image = "rbxassetid://5492252477"
			Close.ImageColor3 = library.colors.elementText
			colored[1 + #colored] = {Close, "ImageColor3", "elementText"}
			Close.Name = "Close"
			Close.Parent = Border_2
			Close.Position = UDim2.new(1, -6, 0.5, 0)
			Close.ScaleType = Enum.ScaleType.Fit
			Close.Size = UDim2.new(0, 10, 0, 10)
			Notification.Size = UDim2.new(0, 64 + textToSize(Text).X, 0, 32)
			Notification.Parent = Popups
			Notification.LayoutOrder = #Notification.Parent:GetChildren() * ((Inverse and 1) or -1)
			if Popups.Parent then
			else
				Popups.Parent = MainScreenGui
			end
			NotificationObj.OnClose = Close.Activated
			NotificationObj.InputBegan = Notification.InputBegan
			NotificationObj.Destroying = Notification.Destroying
			NotificationObj.MouseEnter = Notification.MouseEnter
			NotificationObj.MouseLeave = Notification.MouseLeave
			function NotificationObj.SetText(self, Str)
				if rawequal(self, NotificationObj) then
				else
					Str = self
				end
				Str = ((Str == nil) and "No text given") or tostring(Str)
				Text.Text, NotificationObj.Text = Str, Str
				Notification.Size = UDim2.new(0, 44 + Text.TextBounds.X, 0, 32)
				return Str, Text
			end
			local function Pause(self, Set, NoForce)
				if rawequal(self, NotificationObj) then
				else
					Set, NoForce = self, Set
				end
				local IsPaused = NotificationObj.Paused
				if Set == nil then
					Set = not IsPaused
				else
					Set = Set or false
				end
				if Set or (IsPaused == Set) then
				else
					NotificationObj.Expires = math.max(NotificationObj.Expires, os_clock() + math.clamp(NotificationObj.Duration / 2.5, 1, 3))
				end
				NotificationObj.Paused = Set
				if NoForce then
				else
					NotificationObj.Forced = Set
				end
				return Set
			end
			NotificationObj.SetPaused = Pause
			function NotificationObj.AddTime(self, Extension)
				if rawequal(self, NotificationObj) then
				else
					Extension = self
				end
				NotificationObj.Expires += Extension
			end
			function NotificationObj.Hide(self, SetPause)
				if Notification and NotificationObj.Active then
					if rawequal(self, NotificationObj) then
					else
						SetPause = self
					end
					if SetPause then
						Pause(true)
					end
					Notification.Visible = false
				end
			end
			function NotificationObj.Show(self, SetPause)
				if Notification and NotificationObj.Active then
					if rawequal(self, NotificationObj) then
					else
						SetPause = self
					end
					if SetPause then
						Pause(false)
					end
					Notification.Visible = true
				end
			end
			function NotificationObj.SetVisible(self, Visible, SetPause)
				if Notification and NotificationObj.Active then
					if rawequal(self, NotificationObj) then
					else
						Visible, SetPause = self, Visible
					end
					if Visible == nil then
						Notification.Visible = not Notification.Visible
					else
						Notification.Visible = (Visible and true) or false
					end
					if SetPause then
						Pause(Notification.Visible)
					end
				end
			end
			Notification.MouseEnter:Connect(function()
				if NotificationObj.Forced then
					return
				end
				Pause(true, true)
			end)
			Notification.MouseLeave:Connect(function()
				if NotificationObj.Forced then
					return
				end
				Pause(false, true)
			end)
			local function Destroy()
				if Notification then
					Notification:Destroy()
				end
				NotificationObj.Active = false
				NotificationObj.Object = nil
			end
			NotificationObj.Destroy = Destroy
			Close.Activated:Connect(Destroy)
			Notifications[1 + #Notifications] = NotificationObj
			return NotificationObj, Notification, Text
		end
	end
end
function library:CreateWindow(options, ...)
	options = (options and type(options) == "string" and resolvevararg("Window", options, ...)) or options
	local homepage = nil
	local windowoptions = options
	local windowName = options.Name or "Unnamed Window"
	options.Name = windowName
	if windowName and #windowName > 0 and library.WorkspaceName == "Pepsi Lib" then
		library.WorkspaceName = convertfilename(windowName, "Pepsi Lib")
	end
	local pepsiLibrary = Instance_new("ScreenGui")
	library.MainScreenGui, MainScreenGui = pepsiLibrary, pepsiLibrary
	local main = Instance_new("Frame")
	local mainBorder = Instance_new("Frame")
	local tabSlider = Instance_new("Frame")
	local innerMain = Instance_new("Frame")
	local innerMainBorder = Instance_new("Frame")
	local innerBackdrop = Instance_new("ImageLabel")
	local innerMainHolder = Instance_new("Frame")
	local tabsHolder = Instance_new("ImageLabel")
	local tabHolderList = Instance_new("UIListLayout")
	local tabHolderPadding = Instance_new("UIPadding")
	local headline = Instance_new("TextLabel")
	local splitter = Instance_new("TextLabel")
	local submenuOpen = nil
	library.globals["__Window" .. options.Name] = {
		submenuOpen = submenuOpen
	}
	pepsiLibrary.Name = "     "
	pepsiLibrary.Parent = library.gui_parent
	pepsiLibrary.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	pepsiLibrary.DisplayOrder = 10
	pepsiLibrary.ResetOnSpawn = false
	main.Name = "main"
	main.Parent = pepsiLibrary
	main.AnchorPoint = Vector2.new(0.5, 0.5)
	main.BackgroundColor3 = library.colors.background
	colored[1 + #colored] = {main, "BackgroundColor3", "background"}
	main.BorderColor3 = library.colors.outerBorder
	colored[1 + #colored] = {main, "BorderColor3", "outerBorder"}
	main.Position = UDim2.fromScale(0.5, 0.5)
	main.Size = UDim2.fromOffset(500, 545)
	makeDraggable(main, main)
	mainBorder.Name = "mainBorder"
	mainBorder.Parent = main
	mainBorder.AnchorPoint = Vector2.new(0.5, 0.5)
	mainBorder.BackgroundColor3 = library.colors.background
	colored[1 + #colored] = {mainBorder, "BackgroundColor3", "background"}
	mainBorder.BorderColor3 = library.colors.innerBorder
	colored[1 + #colored] = {mainBorder, "BorderColor3", "innerBorder"}
	mainBorder.BorderMode = Enum.BorderMode.Inset
	mainBorder.Position = UDim2.fromScale(0.5, 0.5)
	mainBorder.Size = UDim2.fromScale(1, 1)
	innerMain.Name = "innerMain"
	innerMain.Parent = main
	innerMain.AnchorPoint = Vector2.new(0.5, 0.5)
	innerMain.BackgroundColor3 = library.colors.background
	colored[1 + #colored] = {innerMain, "BackgroundColor3", "background"}
	innerMain.BorderColor3 = library.colors.outerBorder
	colored[1 + #colored] = {innerMain, "BorderColor3", "outerBorder"}
	innerMain.Position = UDim2.fromScale(0.5, 0.5)
	innerMain.Size = UDim2.new(1, -14, 1, -14)
	innerMainBorder.Name = "innerMainBorder"
	innerMainBorder.Parent = innerMain
	innerMainBorder.AnchorPoint = Vector2.new(0.5, 0.5)
	innerMainBorder.BackgroundColor3 = library.colors.background
	colored[1 + #colored] = {innerMainBorder, "BackgroundColor3", "background"}
	innerMainBorder.BorderColor3 = library.colors.innerBorder
	colored[1 + #colored] = {innerMainBorder, "BorderColor3", "innerBorder"}
	innerMainBorder.BorderMode = Enum.BorderMode.Inset
	innerMainBorder.Position = UDim2.fromScale(0.5, 0.5)
	innerMainBorder.Size = UDim2.fromScale(1, 1)
	innerMainHolder.Name = "innerMainHolder"
	innerMainHolder.Parent = innerMain
	innerMainHolder.BackgroundColor3 = Color3.new(1, 1, 1)
	innerMainHolder.BackgroundTransparency = 1
	innerMainHolder.Position = UDim2:fromOffset(25)
	innerMainHolder.Size = UDim2.new(1, 0, 1, -25)
	innerBackdrop.Name = "innerBackdrop"
	innerBackdrop.Parent = innerMainHolder
	innerBackdrop.BackgroundColor3 = Color3.new(1, 1, 1)
	innerBackdrop.BackgroundTransparency = 1
	innerBackdrop.Size = UDim2.fromScale(1, 1)
	innerBackdrop.ZIndex = -1
	innerBackdrop.Visible = library_flags["__Designer.Background.UseBackgroundImage"] and true
	innerBackdrop.ImageColor3 = library_flags["__Designer.Background.ImageColor"] or Color3.new(1, 1, 1)
	innerBackdrop.ImageTransparency = (library_flags["__Designer.Background.ImageTransparency"] or 95) / 100
	innerBackdrop.Image = resolveid(library_flags["__Designer.Background.ImageAssetID"], "__Designer.Background.ImageAssetID") or ""
	library.Backdrop = innerBackdrop
	tabsHolder.Name = "tabsHolder"
	tabsHolder.Parent = innerMain
	tabsHolder.BackgroundColor3 = library.colors.topGradient
	colored[1 + #colored] = {tabsHolder, "BackgroundColor3", "topGradient"}
	tabsHolder.BorderSizePixel = 0
	tabsHolder.Position = UDim2.fromOffset(1, 1)
	tabsHolder.Size = UDim2.new(1, -2, 0, 23)
	tabsHolder.Image = "rbxassetid://2454009026"
	tabsHolder.ImageColor3 = library.colors.bottomGradient
	colored[1 + #colored] = {tabsHolder, "ImageColor3", "bottomGradient"}
	tabHolderList.Name = "tabHolderList"
	tabHolderList.Parent = tabsHolder
	tabHolderList.FillDirection = Enum.FillDirection.Horizontal
	tabHolderList.SortOrder = Enum.SortOrder.LayoutOrder
	tabHolderList.VerticalAlignment = Enum.VerticalAlignment.Center
	tabHolderList.Padding = UDim:new(3)
	tabHolderPadding.Name = "tabHolderPadding"
	tabHolderPadding.Parent = tabsHolder
	tabHolderPadding.PaddingLeft = UDim:new(7)
	headline.Name = "headline"
	headline.Parent = tabsHolder
	headline.BackgroundColor3 = Color3.new(1, 1, 1)
	headline.BackgroundTransparency = 1
	headline.LayoutOrder = 1
	headline.Font = Enum.Font.Code
	headline.Text = (windowName and tostring(windowName)) or "???"
	headline.TextColor3 = library.colors.main
	colored[1 + #colored] = {headline, "TextColor3", "main"}
	headline.TextSize = 14
	headline.TextStrokeColor3 = library.colors.outerBorder
	colored[1 + #colored] = {headline, "TextStrokeColor3", "outerBorder"}
	headline.TextStrokeTransparency = 0.75
	headline.Size = UDim2:new(textToSize(headline).X + 4, 1)
	splitter.Name = "splitter"
	splitter.Parent = tabsHolder
	splitter.BackgroundColor3 = Color3.new(1, 1, 1)
	splitter.BackgroundTransparency = 1
	splitter.LayoutOrder = 2
	splitter.Size = UDim2:new(6, 1)
	splitter.Font = Enum.Font.Code
	splitter.Text = "|"
	splitter.TextColor3 = library.colors.tabText
	colored[1 + #colored] = {splitter, "TextColor3", "tabText"}
	splitter.TextSize = 14
	splitter.TextStrokeColor3 = library.colors.tabText
	colored[1 + #colored] = {splitter, "TextStrokeColor3", "tabText"}
	splitter.TextStrokeTransparency = 0.75
	tabSlider.Name = "tabSlider"
	tabSlider.Parent = main
	tabSlider.BackgroundColor3 = library.colors.main
	colored[1 + #colored] = {tabSlider, "BackgroundColor3", "main"}
	tabSlider.BorderSizePixel = 0
	tabSlider.Position = UDim2.fromOffset(100, 30)
	tabSlider.Size = UDim2:fromOffset(1)
	tabSlider.Visible = false
	local IgnoreCoreInputs = nil
	do
		local os_clock = os.clock
		library.signals[1 + #library.signals] = userInputService.InputBegan:Connect(function(keyCode)
			if IgnoreCoreInputs or userInputService:GetFocusedTextBox() then
				return
			elseif keyCode.KeyCode == library.configuration.hideKeybind then
				if not lasthidebing or ((os_clock() - lasthidebing) > 12) then
					main.Visible = not main.Visible
				end
				lasthidebing = nil
			end
		end)
	end
	local windowFunctions = {
		tabCount = 0,
		selected = {},
		Flags = elements
	}
	library.globals["__Window" .. windowName].windowFunctions = windowFunctions
	function windowFunctions:Show(x)
		main.Visible = (x == nil) or (x == true) or (x == 1)
		return main.Visible
	end
	function windowFunctions:Hide(x)
		main.Visible = (x == false) or (x == 0)
		return main.Visible
	end
	function windowFunctions:Visibility(x)
		if x == nil then
			main.Visible = not main.Visible
		else
			main.Visible = x and true
		end
		return main.Visible
	end
	function windowFunctions:MoveTabSlider(tabObject)
		spawn(function()
			tabSlider.Visible = true
			tweenService:Create(tabSlider, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
				Size = UDim2.fromOffset(tabObject.AbsoluteSize.X, 1),
				Position = UDim2.fromOffset(tabObject.AbsolutePosition.X, tabObject.AbsolutePosition.Y + tabObject.AbsoluteSize.Y) - UDim2.fromOffset(main.AbsolutePosition.X, main.AbsolutePosition.Y)
			}):Play()
		end)
	end
	windowFunctions.LastTab = nil
	function windowFunctions:CreateTab(options, ...)
		options = (options and (type(options) == "string") and resolvevararg("Tab", options, ...)) or options or {
			Name = "Pepsi Style: Elite Lego Hax"
		}
		local image = options.Image
		if image then
			image = resolveid(image)
		end
		local tabName = options.Name or "Unnamed Tab"
		options.Name = tabName
		windowFunctions.tabCount = windowFunctions.tabCount + 1
		local newTab = Instance_new((image and "ImageButton") or "TextButton")
		local newTabHolder = Instance_new("Frame")
		library.globals["__Window" .. windowName].newTabHolder = newTabHolder
		local left = Instance_new("ScrollingFrame")
		local leftList = Instance_new("UIListLayout")
		local leftPadding = Instance_new("UIPadding")
		local right = Instance_new("ScrollingFrame")
		local rightList = Instance_new("UIListLayout")
		local rightPadding = Instance_new("UIPadding")
		newTab.Name = removeSpaces((tabName and tostring(tabName):lower() or "???") .. "Tab")
		newTab.Parent = tabsHolder
		newTab.BackgroundTransparency = 1
		newTab.LayoutOrder = (options.LastTab and 99999) or tonumber(options.TabOrder or options.LayoutOrder) or (2 + windowFunctions.tabCount)
		local colored_newTab_TextColor3 = nil
		if image then
			newTab.Image = image
			newTab.ImageColor3 = options.ImageColor or options.Color or Color3.new(1, 1, 1)
			newTab.Size = UDim2:new(tabsHolder.AbsoluteSize.Y, 1)
		else
			colored_newTab_TextColor3 = {newTab, "TextColor3", "tabText"}
			colored[1 + #colored] = colored_newTab_TextColor3
			newTab.Font = Enum.Font.Code
			newTab.Text = (tabName and tostring(tabName)) or "???"
			if windowFunctions.tabCount ~= 1 then
				colored_newTab_TextColor3[4] = 1.35
				newTab.TextColor3 = darkenColor(library.colors.tabText, 1.35)
			else
				newTab.TextColor3 = library.colors.tabText
			end
			newTab.TextSize = 14
			newTab.TextStrokeColor3 = Color3.fromRGB(42, 42, 42)
			newTab.TextStrokeTransparency = 0.75
			newTab.Size = UDim2:new(textToSize(newTab).X + 4, 1)
		end
		local function goto()
			if not library.colorpicker and not submenuOpen and (windowFunctions.selected.button ~= newTab) and newTab.Parent and newTabHolder.Parent then
				pcall(function()
					for _, e in next, library.elements do
						if e and (type(e) == "table") then
							if e.Update then
								pcall(e.Update)
							end
							if e.UpdateAll then
								pcall(e.UpdateAll)
							end
						end
					end
				end)
				if windowFunctions.LastTab then
					windowFunctions.LastTab[4] = 1.35
				end
				windowFunctions:MoveTabSlider(newTab)
				if windowFunctions.selected.button.ClassName == "TextButton" then
					tweenService:Create(windowFunctions.selected.button, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
						TextColor3 = darkenColor(library.colors.tabText, 1.35)
					}):Play()
				end
				if colored_newTab_TextColor3 then
					colored_newTab_TextColor3[4] = nil
				end
				windowFunctions.selected.holder.Visible = false
				windowFunctions.selected.button = newTab
				windowFunctions.selected.holder = newTabHolder
				if windowFunctions.selected.button.ClassName == "TextButton" then
					tweenService:Create(windowFunctions.selected.button, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
						TextColor3 = library.colors.tabText
					}):Play()
				end
				windowFunctions.selected.holder.Visible = true
				windowFunctions.LastTab = colored_newTab_TextColor3
			end
		end
		if not homepage and newTab.LayoutOrder <= 4 then
			homepage = goto
		end
		library.signals[1 + #library.signals] = newTab.MouseButton1Click:Connect(goto)
		if windowFunctions.tabCount == 1 then
			tabSlider.Size = UDim2.fromOffset(newTab.AbsoluteSize.X, 1)
			tabSlider.Position = UDim2.fromOffset(newTab.AbsolutePosition.X, newTab.AbsolutePosition.Y + newTab.AbsoluteSize.Y) - UDim2.fromOffset(main.AbsolutePosition.X, main.AbsolutePosition.Y)
			tabSlider.Visible = true
			windowFunctions.selected.holder = newTabHolder
			windowFunctions.selected.button = newTab
		end
		newTabHolder.Name = removeSpaces((tabName and tabName:lower()) or "???") .. "TabHolder"
		newTabHolder.Parent = innerMainHolder
		newTabHolder.BackgroundColor3 = Color3.new(1, 1, 1)
		newTabHolder.BackgroundTransparency = 1
		newTabHolder.Size = UDim2.fromScale(1, 1)
		newTabHolder.Visible = windowFunctions.tabCount == 1
		left.Name = "left"
		left.Parent = newTabHolder
		left.BackgroundColor3 = Color3.new(1, 1, 1)
		left.BackgroundTransparency = 1
		left.Size = UDim2.fromScale(0.5, 1)
		left.CanvasSize = UDim2.new()
		left.ScrollBarThickness = 0
		leftList.Name = "leftList"
		leftList.Parent = left
		leftList.HorizontalAlignment = Enum.HorizontalAlignment.Center
		leftList.SortOrder = Enum.SortOrder.LayoutOrder
		leftList.Padding = UDim:new(14)
		leftPadding.Name = "leftPadding"
		leftPadding.Parent = left
		leftPadding.PaddingTop = UDim:new(12)
		right.Name = "right"
		right.Parent = newTabHolder
		right.BackgroundColor3 = Color3.new(1, 1, 1)
		right.BackgroundTransparency = 1
		right.Size = UDim2.fromScale(0.5, 1)
		right.CanvasSize = UDim2.new()
		right.ScrollBarThickness = 0
		right.Position = UDim2.new(0.5)
		rightList.Name = "rightList"
		rightList.Parent = right
		rightList.HorizontalAlignment = Enum.HorizontalAlignment.Center
		rightList.SortOrder = Enum.SortOrder.LayoutOrder
		rightList.Padding = UDim:new(14)
		rightPadding.Name = "rightPadding"
		rightPadding.Parent = right
		rightPadding.PaddingTop = UDim:new(12)
		local tabFunctions = {
			Flags = {},
			Remove = function()
				local relod = nil
				if newTab then
					newTab.Parent = nil
					relod = true
				end
				if newTabHolder then
					newTabHolder.Parent = nil
					relod = true
				end
				if relod then
					windowFunctions:UpdateAll()
				end
			end,
			Select = goto
		}
		function tabFunctions:CreateSection(options, ...)
			options = (options and type(options) == "string" and resolvevararg("Tab", options, ...)) or options
			local sectionName, holderSide = options.Name or "Unnamed Section", options.Side
			options.Name = sectionName
			local newSection = Instance_new("Frame")
			local newSectionBorder = Instance_new("Frame")
			local insideBorderHider = Instance_new("Frame")
			local outsideBorderHider = Instance_new("Frame")
			local sectionHolder = Instance_new("Frame")
			local sectionList = Instance_new("UIListLayout")
			local sectionPadding = Instance_new("UIPadding")
			local sectionHeadline = Instance_new("TextLabel")
			colorpickerconflicts[1 + #colorpickerconflicts] = insideBorderHider
			colorpickerconflicts[1 + #colorpickerconflicts] = outsideBorderHider
			colorpickerconflicts[1 + #colorpickerconflicts] = sectionHeadline
			newSection.Name = removeSpaces((sectionName and sectionName:lower() or "???") .. "Section")
			newSection.Parent = (holderSide and (((holderSide:lower() == "left") and left) or right)) or left
			newSection.BackgroundColor3 = library.colors.sectionBackground
			colored[1 + #colored] = {newSection, "BackgroundColor3", "sectionBackground"}
			newSection.BorderColor3 = library.colors.outerBorder
			colored[1 + #colored] = {newSection, "BorderColor3", "outerBorder"}
			newSection.Size = UDim2.new(1, -20)
			newSection.Visible = false
			newSectionBorder.Name = "newSectionBorder"
			newSectionBorder.Parent = newSection
			newSectionBorder.BackgroundColor3 = library.colors.sectionBackground
			colored[1 + #colored] = {newSectionBorder, "BackgroundColor3", "sectionBackground"}
			newSectionBorder.BorderColor3 = library.colors.innerBorder
			colored[1 + #colored] = {newSectionBorder, "BorderColor3", "innerBorder"}
			newSectionBorder.BorderMode = Enum.BorderMode.Inset
			newSectionBorder.Size = UDim2.fromScale(1, 1)
			sectionHolder.Name = "sectionHolder"
			sectionHolder.Parent = newSection
			sectionHolder.BackgroundColor3 = Color3.new(1, 1, 1)
			sectionHolder.BackgroundTransparency = 1
			sectionHolder.Size = UDim2.fromScale(1, 1)
			sectionList.Name = "sectionList"
			sectionList.Parent = sectionHolder
			sectionList.HorizontalAlignment = Enum.HorizontalAlignment.Center
			sectionList.SortOrder = Enum.SortOrder.LayoutOrder
			sectionList.Padding = UDim:new(1)
			sectionPadding.Name = "sectionPadding"
			sectionPadding.Parent = sectionHolder
			sectionPadding.PaddingTop = UDim:new(9)
			sectionHeadline.Name = "sectionHeadline"
			sectionHeadline.Parent = newSection
			sectionHeadline.BackgroundColor3 = Color3.new(1, 1, 1)
			sectionHeadline.BackgroundTransparency = 1
			sectionHeadline.Position = UDim2.fromOffset(18, -8)
			sectionHeadline.ZIndex = 2
			sectionHeadline.Font = Enum.Font.Code
			sectionHeadline.LineHeight = 1.15
			sectionHeadline.Text = (sectionName and sectionName or "???")
			sectionHeadline.TextColor3 = library.colors.section
			colored[1 + #colored] = {sectionHeadline, "TextColor3", "section"}
			sectionHeadline.TextSize = 14
			sectionHeadline.Size = UDim2.fromOffset(textToSize(sectionHeadline).X + 4, 12)
			insideBorderHider.Name = "insideBorderHider"
			insideBorderHider.Parent = newSection
			insideBorderHider.BackgroundColor3 = library.colors.sectionBackground
			colored[1 + #colored] = {insideBorderHider, "BackgroundColor3", "sectionBackground"}
			insideBorderHider.BorderSizePixel = 0
			insideBorderHider.Position = UDim2.fromOffset(15)
			insideBorderHider.Size = UDim2.fromOffset(sectionHeadline.AbsoluteSize.X + 3, 1)
			outsideBorderHider.Name = "outsideBorderHider"
			outsideBorderHider.Parent = newSection
			outsideBorderHider.BackgroundColor3 = library.colors.background
			colored[1 + #colored] = {outsideBorderHider, "BackgroundColor3", "background"}
			outsideBorderHider.BorderSizePixel = 0
			outsideBorderHider.Position = UDim2.fromOffset(15, -1)
			outsideBorderHider.Size = UDim2.fromOffset(sectionHeadline.AbsoluteSize.X + 3, 1)
			local sectionFunctions = {
				Flags = {},
				Remove = function()
					if newSection then
						newSection.Parent = nil
						windowFunctions:UpdateAll()
					end
				end
			}
			function sectionFunctions:Update(extra)
				local currentHolder = newSection.Parent
				if not newSection.Visible then
					newSection.Visible = true
				end
				newSection.Size = UDim2.new(1, -20, 0, (15 + sectionList.AbsoluteContentSize.Y))
				if currentHolder then
					currentHolder.CanvasSize = UDim2:fromOffset(currentHolder:FindFirstChildOfClass("UIListLayout").AbsoluteContentSize.Y + 22 + (tonumber(extra) or 0))
				end
			end
			function sectionFunctions:UpdateAll(...)
				for _, obj in next, sectionFunctions.Flags do
					if obj then
						if obj.Update then
							pcall(obj.Update)
						end
						if obj.UpdateAll then
							pcall(obj.UpdateAll)
						end
					end
				end
				sectionFunctions:Update(...)
			end
			function sectionFunctions:AddToggle(options, ...)
				options = (options and type(options) == "string" and resolvevararg("Tab", options, ...)) or options
				local toggleName, alreadyEnabled, callback, flagName = assert(options.Name, "Missing Name for new toggle."), options.Value or options.Enabled, options.Callback, options.Flag or (function()
					library.unnamedtoggles = 1 + (library.unnamedtoggles or 0)
					return "Toggle" .. tostring(library.unnamedtoggles)
				end)()
				if elements[flagName] ~= nil then
					warn(debug.traceback("Warning! Re-used flag '" .. flagName .. "'", 3))
				end
				local newToggle = Instance_new("Frame")
				local toggle = Instance_new("ImageLabel")
				local toggleInner = Instance_new("ImageLabel")
				local toggleButton = Instance_new("TextButton")
				local toggleHeadline = Instance_new("TextLabel")
				local keybindPositioner = Instance_new("Frame")
				local keybindList = Instance_new("UIListLayout")
				local keybindButton = Instance_new("TextButton")
				local lockedup = options.Locked
				newToggle.Name = removeSpaces((toggleName and toggleName:lower() or "???") .. "Toggle")
				newToggle.Parent = sectionHolder
				newToggle.BackgroundColor3 = Color3.new(1, 1, 1)
				newToggle.BackgroundTransparency = 1
				newToggle.Size = UDim2.new(1, 0, 0, 19)
				toggle.Name = "toggle"
				toggle.Parent = newToggle
				toggle.Active = true
				toggle.BackgroundColor3 = library.colors.topGradient
				local colored_toggle_BackgroundColor3 = {toggle, "BackgroundColor3", "topGradient"}
				colored[1 + #colored] = colored_toggle_BackgroundColor3
				toggle.BorderColor3 = library.colors.elementBorder
				colored[1 + #colored] = {toggle, "BorderColor3", "elementBorder"}
				toggle.Position = UDim2.fromScale(0.0308237672, 0.165842205)
				toggle.Selectable = true
				toggle.Size = UDim2.fromOffset(12, 12)
				toggle.Image = "rbxassetid://2454009026"
				toggle.ImageColor3 = library.colors.bottomGradient
				local colored_toggle_ImageColor3 = {toggle, "ImageColor3", "bottomGradient"}
				colored[1 + #colored] = colored_toggle_ImageColor3
				toggleInner.Name = "toggleInner"
				toggleInner.Parent = toggle
				toggleInner.Active = true
				toggleInner.AnchorPoint = Vector2.new(0.5, 0.5)
				toggleInner.BackgroundColor3 = library.colors.topGradient
				local colored_toggleInner_BackgroundColor3 = {toggleInner, "BackgroundColor3", "topGradient"}
				colored[1 + #colored] = colored_toggleInner_BackgroundColor3
				toggleInner.BorderColor3 = library.colors.elementBorder
				colored[1 + #colored] = {toggleInner, "BorderColor3", "elementBorder"}
				toggleInner.Position = UDim2.fromScale(0.5, 0.5)
				toggleInner.Selectable = true
				toggleInner.Size = UDim2.new(1, -4, 1, -4)
				toggleInner.Image = "rbxassetid://2454009026"
				toggleInner.ImageColor3 = library.colors.bottomGradient
				local colored_toggleInner_ImageColor3 = {toggleInner, "ImageColor3", "bottomGradient"}
				colored[1 + #colored] = colored_toggleInner_ImageColor3
				toggleButton.Name = "toggleButton"
				toggleButton.Parent = newToggle
				toggleButton.BackgroundColor3 = Color3.new(1, 1, 1)
				toggleButton.BackgroundTransparency = 1
				toggleButton.Size = UDim2.fromScale(1, 1)
				toggleButton.ZIndex = 5
				toggleButton.Font = Enum.Font.SourceSans
				toggleButton.Text = ""
				toggleButton.TextColor3 = Color3.new()
				toggleButton.TextSize = 14
				toggleButton.TextTransparency = 1
				toggleHeadline.Name = "toggleHeadline"
				toggleHeadline.Parent = newToggle
				toggleHeadline.BackgroundColor3 = Color3.new(1, 1, 1)
				toggleHeadline.BackgroundTransparency = 1
				toggleHeadline.Position = UDim2.fromScale(0.123, 0.165842161)
				toggleHeadline.Size = UDim2.fromOffset(170, 11)
				toggleHeadline.Font = Enum.Font.Code
				toggleHeadline.Text = toggleName or "???"
				toggleHeadline.TextColor3 = library.colors.elementText
				local colored_toggleHeadline_TextColor3 = {toggleHeadline, "TextColor3", "elementText", (lockedup and 0.5) or nil}
				colored[1 + #colored] = colored_toggleHeadline_TextColor3
				toggleHeadline.TextSize = 14
				toggleHeadline.TextXAlignment = Enum.TextXAlignment.Left
				local last_v = nil
				local function Set(t, newStatus)
					if nil == newStatus and t ~= nil then
						newStatus = t
					end
					last_v = library_flags[flagName]
					if options.Condition ~= nil then
						if type(options.Condition) == "function" then
							local v, e = pcall(options.Condition, newStatus, last_v)
							if e then
								if not v then
									warn(debug.traceback(string.format("Error in toggle %s's Condition function: %s", flagName, e), 2))
								end
							else
								return last_v
							end
						end
					end
					if newStatus ~= nil and type(newStatus) == "boolean" then
						library_flags[flagName] = newStatus
						if options.Location then
							options.Location[options.LocationFlag or flagName] = newStatus
						end
						if callback and (last_v ~= newStatus or options.AllowDuplicateCalls) then
							colored_toggleInner_BackgroundColor3[3] = (newStatus and "main") or "topGradient"
							colored_toggleInner_BackgroundColor3[4] = (newStatus and 1.5) or nil
							colored_toggleInner_ImageColor3[3] = (newStatus and "main") or "bottomGradient"
							colored_toggleInner_ImageColor3[4] = (newStatus and 2.5) or nil
							tweenService:Create(toggleInner, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
								BackgroundColor3 = (newStatus and darkenColor(library.colors.main, 1.5)) or library.colors.topGradient,
								ImageColor3 = (newStatus and darkenColor(library.colors.main, 2.5)) or library.colors.bottomGradient
							}):Play()
							task.spawn(callback, newStatus, last_v)
						end
					end
					return newStatus
				end
				options.Keybind = options.Keybind or options.Key or options.KeyBind
				local haskbflag, kbUpdate, kbData = nil, nil, nil
				if options.Keybind then
					local options = options.Keybind
					local htyp = typeof(options)
					if htyp == "EnumItem" then
						options = {
							Value = options
						}
					elseif htyp ~= "table" then
						options = {}
					end
					local presetKeybind, callback, kbpresscallback, kbflag = options.Value or options.Key, options.Callback, options.Pressed, options.Flag or (function()
						if flagName then
							return flagName .. "_ToggleKeybind"
						end
						library.unnamedkeybinds = 1 + (library.unnamedkeybinds or 0)
						return "Keybind" .. tostring(library.unnamedkeybinds)
					end)()
					if elements[kbflag] ~= nil or kbflag == flagName then
						warn(debug.traceback("Warning! Re-used flag '" .. kbflag .. "'", 3))
					end
					haskbflag = kbflag
					library.keyHandler = keyHandler
					local keyHandler = options.KeyNames or keyHandler
					local bindedKey = presetKeybind
					local justBinded = false
					local keyName = keyHandler.allowedKeys[bindedKey] or (bindedKey and (bindedKey.Name or tostring(bindedKey):gsub("Enum.KeyCode.", ""))) or "NONE"
					local newKeybind = newToggle
					keybindPositioner.Name = "keybindPositioner"
					keybindPositioner.Parent = newKeybind
					keybindPositioner.BackgroundColor3 = Color3.new(1, 1, 1)
					keybindPositioner.BackgroundTransparency = 1
					keybindPositioner.Position = UDim2.new(0.00448430516)
					keybindPositioner.Size = UDim2.fromOffset(214, 19)
					keybindPositioner.ZIndex = 1 + toggleButton.ZIndex
					keybindList.Name = "keybindList"
					keybindList.Parent = keybindPositioner
					keybindList.FillDirection = Enum.FillDirection.Horizontal
					keybindList.HorizontalAlignment = Enum.HorizontalAlignment.Right
					keybindList.SortOrder = Enum.SortOrder.LayoutOrder
					keybindList.VerticalAlignment = Enum.VerticalAlignment.Center
					keybindButton.Name = "keybindButton"
					keybindButton.Parent = keybindPositioner
					keybindButton.Active = false
					keybindButton.BackgroundColor3 = Color3.new(1, 1, 1)
					keybindButton.BackgroundTransparency = 1
					keybindButton.Position = UDim2.fromScale(0.598130822, 0.184210524)
					keybindButton.Selectable = false
					keybindButton.Size = UDim2.fromOffset(46, 12)
					keybindButton.Font = Enum.Font.Code
					keybindButton.Text = keyName or (presetKeybind and tostring(presetKeybind):gsub("Enum.KeyCode.", "")) or "[NONE]"
					keybindButton.TextColor3 = library.colors.otherElementText
					local colored_keybindButton_TextColor3 = {keybindButton, "TextColor3", "otherElementText"}
					colored[1 + #colored] = colored_keybindButton_TextColor3
					keybindButton.TextSize = 14
					keybindButton.TextXAlignment = Enum.TextXAlignment.Right
					keybindButton.Size = UDim2.fromOffset(textToSize(keybindButton).X + 4, 12)
					local klast_v = bindedKey or presetKeybind
					local function newkey()
						if lockedup then
							return
						end
						local old_texts = keybindButton.Text
						colored_keybindButton_TextColor3[3] = "main"
						colored_keybindButton_TextColor3[4] = nil
						tweenService:Create(keybindButton, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
							TextColor3 = library.colors.main
						}):Play()
						if klast_v then
							keybindButton.Text = "(Was " .. (klast_v and tostring(klast_v):gsub("Enum.KeyCode.", "") or "[NONE]") .. ") [...]"
						else
							keybindButton.Text = "[...]"
						end
						local receivingKey = nil
						receivingKey = userInputService.InputBegan:Connect(function(key)
							if lockedup then
								return receivingKey:Disconnect()
							end
							klast_v = library_flags[kbflag]
							if not keyHandler.notAllowedKeys[key.KeyCode] then
								if key.KeyCode ~= Enum.KeyCode.Unknown then
									bindedKey = (key.KeyCode ~= Enum.KeyCode.Escape and key.KeyCode) or library_flags[kbflag]
									library_flags[kbflag] = bindedKey
									if options.Location then
										options.Location[options.LocationFlag or kbflag] = bindedKey
									end
									if bindedKey then
										keyName = keyHandler.allowedKeys[bindedKey] or (bindedKey and (bindedKey.Name or tostring(bindedKey):gsub("Enum.KeyCode.", ""))) or "NONE"
										keybindButton.Text = "[" .. (keyName or (bindedKey and bindedKey.Name) or "NONE") .. "]"
										keybindButton.Size = UDim2.fromOffset(textToSize(keybindButton).X + 4, 12)
										justBinded = true
										colored_keybindButton_TextColor3[3] = "otherElementText"
										colored_keybindButton_TextColor3[4] = nil
										tweenService:Create(keybindButton, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
											TextColor3 = library.colors.otherElementText
										}):Play()
										receivingKey:Disconnect()
									end
									if callback and klast_v ~= bindedKey then
										task.spawn(callback, bindedKey, klast_v)
									end
									return
								elseif key.KeyCode == Enum.KeyCode.Unknown and not keyHandler.notAllowedMouseInputs[key.UserInputType] then
									bindedKey = key.UserInputType
									library_flags[kbflag] = bindedKey
									if options.Location then
										options.Location[options.LocationFlag or kbflag] = bindedKey
									end
									keyName = keyHandler.allowedKeys[bindedKey]
									keybindButton.Text = "[" .. (keyName or (bindedKey and bindedKey.Name) or tostring(bindedKey.KeyCode):gsub("Enum.KeyCode.", "")) .. "]"
									keybindButton.Size = UDim2.fromOffset(textToSize(keybindButton).X + 4, 12)
									justBinded = true
									colored_keybindButton_TextColor3[3] = "otherElementText"
									colored_keybindButton_TextColor3[4] = nil
									tweenService:Create(keybindButton, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
										TextColor3 = library.colors.otherElementText
									}):Play()
									receivingKey:Disconnect()
									if callback and klast_v ~= bindedKey then
										task.spawn(callback, bindedKey, klast_v)
									end
									return
								end
							end
							if key.KeyCode == Enum.KeyCode.Backspace or Enum.KeyCode.Escape == key.KeyCode then
								old_texts, bindedKey = "[NONE]", nil
							end
							keybindButton.Text = old_texts
							colored_keybindButton_TextColor3[3] = "otherElementText"
							colored_keybindButton_TextColor3[4] = nil
							tweenService:Create(keybindButton, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
								TextColor3 = library.colors.otherElementText
							}):Play()
							receivingKey:Disconnect()
							if callback and klast_v ~= bindedKey then
								task.spawn(callback, bindedKey, klast_v)
							end
						end)
						library.signals[1 + #library.signals] = receivingKey
					end
					library.signals[1 + #library.signals] = keybindButton.MouseButton1Click:Connect(newkey)
					if kbpresscallback and not justBinded then
						library.signals[1 + #library.signals] = userInputService.InputBegan:Connect(function(key, chatting)
							chatting = chatting or (userInputService:GetFocusedTextBox() and true)
							if not chatting and not justBinded then
								if not keyHandler.notAllowedKeys[key.KeyCode] and not keyHandler.notAllowedMouseInputs[key.UserInputType] then
									if bindedKey == key.UserInputType or not justBinded and bindedKey == key.KeyCode then
										if kbpresscallback then
											task.spawn(kbpresscallback, key, chatting)
										end
									end
									justBinded = false
								end
							end
						end)
					end
					options.Mode = (options.Mode and string.lower(tostring(options.Mode))) or "dynamic"
					local modes = {
						dynamic = 1,
						hold = 1,
						toggle = 1
					}
					library.signals[1 + #library.signals] = userInputService.InputBegan:Connect(function(input, chatting)
						if justBinded then
							wait(0.1)
							justBinded = false
							return
						elseif lockedup then
							return
						end
						chatting = chatting or userInputService:GetFocusedTextBox()
						if not chatting then
							local key = library_flags[kbflag]
							local mode = options.Mode
							if not modes[mode] then
								mode = "dynamic"
								options.Mode = mode
							end
							if key == input.KeyCode or key == input.UserInputType then
								if mode == "dynamic" or mode == "both" or mode == "hold" then
									if mode == "dynamic" and library_flags[flagName] then
										return Set(false)
									end
									Set(true)
									local now = os.clock()
									local waittil = nil
									if mode == "dynamic" then
										waittil = Instance.new("BindableEvent")
									end
									local xconnection = nil
									xconnection = userInputService.InputEnded:Connect(function(input, chatting)
										chatting = chatting or userInputService:GetFocusedTextBox()
										if not chatting and (key == input.KeyCode or key == input.UserInputType) then
											xconnection = (xconnection and xconnection:Disconnect() and nil) or nil
											if mode == "hold" or os.clock() - now > math.clamp(tonumber(options.DynamicTime) or 0.65, 0.05, 20) then
												Set(false)
											end
										end
									end)
									library.signals[1 + #library.signals] = xconnection
								else
									Set(not library_flags[flagName])
								end
							end
						end
					end)
					local function kbset(t, key)
						if nil == key and t ~= nil then
							key = t
						end
						if key == "nil" or key == "NONE" or key == "none" then
							key = nil
						end
						last_v = library_flags[kbflag]
						bindedKey = key
						library_flags[kbflag] = key
						if options.Location then
							options.Location[options.LocationFlag or kbflag] = key
						end
						keyName = (key == nil and "NONE") or keyHandler.allowedKeys[key]
						keybindButton.Text = "[" .. (keyName or key.Name or tostring(key):gsub("Enum.KeyCode.", "")) .. "]"
						keybindButton.Size = UDim2.fromOffset(textToSize(keybindButton).X + 4, 12)
						justBinded = true
						colored_keybindButton_TextColor3[3] = "otherElementText"
						colored_keybindButton_TextColor3[4] = nil
						tweenService:Create(keybindButton, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
							TextColor3 = library.colors.otherElementText
						}):Play()
						if callback and (last_v ~= key or options.AllowDuplicateCalls) then
							task.spawn(callback, key, last_v)
						end
						return key
					end
					if presetKeybind ~= nil then
						kbset(presetKeybind)
					else
						library_flags[kbflag] = bindedKey
						if options.Location then
							options.Location[options.LocationFlag or kbflag] = bindedKey
						end
					end
					local default = library_flags[kbflag]
					local function UpdateKb()
						callback, kbpresscallback = options.Callback, options.Pressed
						local key = library_flags[kbflag]
						bindedKey = key
						keyName = keyHandler.allowedKeys[bindedKey] or (bindedKey and (bindedKey.Name or tostring(bindedKey):gsub("Enum.KeyCode.", ""))) or "NONE"
						keybindButton.Text = "[" .. (keyName or (key and key.Name) or tostring(key):gsub("Enum.KeyCode.", "")) .. "]"
						keybindButton.Size = UDim2.fromOffset(textToSize(keybindButton).X + 4, 12)
						colored_keybindButton_TextColor3[3] = "otherElementText"
						colored_keybindButton_TextColor3[4] = (lockedup and 2.5) or nil
						tweenService:Create(keybindButton, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
							TextColor3 = (lockedup and darkenColor(library.colors.otherElementText, colored_keybindButton_TextColor3[4])) or library.colors.otherElementText
						}):Play()
						return key
					end
					kbUpdate = UpdateKb
					local objectdata = {
						Options = options,
						Name = kbflag,
						Flag = kbflag,
						Type = "Keybind",
						Default = default,
						Parent = sectionFunctions,
						Instance = keybindButton,
						Get = function()
							return library_flags[kbflag]
						end,
						Set = kbset,
						RawSet = function(t, key)
							if t ~= nil and key == nil then
								key = t
							end
							library_flags[kbflag] = key
							UpdateKb()
							return key
						end,
						Update = UpdateKb,
						Reset = function()
							return kbset(nil, default)
						end
					}
					kbData = objectdata
					tabFunctions.Flags[kbflag], sectionFunctions.Flags[kbflag], elements[kbflag] = objectdata, objectdata, objectdata
				end
				sectionFunctions:Update()
				library.signals[1 + #library.signals] = toggleButton.MouseButton1Click:Connect(function()
					if not library.colorpicker and not submenuOpen and not lockedup then
						local newval = not library_flags[flagName]
						if options.Condition ~= nil then
							if type(options.Condition) == "function" then
								local v, e = pcall(options.Condition, newval, not newval)
								if e then
									if not v then
										warn(debug.traceback(string.format("Error in toggle %s's Condition function: %s", flagName, e), 2))
									end
								else
									return last_v
								end
							end
						end
						library_flags[flagName] = newval
						if options.Location then
							options.Location[options.LocationFlag or flagName] = newval
						end
						colored_toggleInner_BackgroundColor3[3] = (newval and "main") or "topGradient"
						colored_toggleInner_BackgroundColor3[4] = (newval and 1.5) or nil
						colored_toggleInner_ImageColor3[3] = (newval and "main") or "bottomGradient"
						colored_toggleInner_ImageColor3[4] = (newval and 2.5) or nil
						tweenService:Create(toggleInner, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
							BackgroundColor3 = (newval and darkenColor(library.colors.main, 1.5)) or library.colors.topGradient,
							ImageColor3 = (newval and darkenColor(library.colors.main, 2.5)) or library.colors.bottomGradient
						}):Play()
						if callback then
							task.spawn(callback, newval)
						end
					end
				end)
				library.signals[1 + #library.signals] = newToggle.MouseEnter:Connect(function()
					colored_toggle_BackgroundColor3[3] = "main"
					colored_toggle_BackgroundColor3[4] = 1.5
					colored_toggle_ImageColor3[3] = "main"
					colored_toggle_ImageColor3[4] = 2.5
					tweenService:Create(toggle, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
						BackgroundColor3 = darkenColor(library.colors.main, 1.5),
						ImageColor3 = darkenColor(library.colors.main, 2.5)
					}):Play()
				end)
				library.signals[1 + #library.signals] = newToggle.MouseLeave:Connect(function()
					colored_toggle_BackgroundColor3[3] = "topGradient"
					colored_toggle_BackgroundColor3[4] = nil
					colored_toggle_ImageColor3[3] = "bottomGradient"
					colored_toggle_ImageColor3[4] = nil
					tweenService:Create(toggle, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
						BackgroundColor3 = library.colors.topGradient,
						ImageColor3 = library.colors.bottomGradient
					}):Play()
				end)
				if library_flags[flagName] then
					colored_toggleInner_BackgroundColor3[3] = "main"
					colored_toggleInner_BackgroundColor3[4] = 1.5
					colored_toggleInner_ImageColor3[3] = "main"
					colored_toggleInner_ImageColor3[4] = 2.5
					tweenService:Create(toggleInner, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
						BackgroundColor3 = darkenColor(library.colors.main, 1.5),
						ImageColor3 = darkenColor(library.colors.main, 2.5)
					}):Play()
				end
				local function Update()
					toggleName, callback = options.Name or toggleName, options.Callback
					local boolstatus = library_flags[flagName]
					colored_toggleInner_BackgroundColor3[3] = (boolstatus and "main") or "topGradient"
					colored_toggleInner_BackgroundColor3[4] = (boolstatus and 1.5) or nil
					colored_toggleInner_ImageColor3[3] = (boolstatus and "main") or "bottomGradient"
					colored_toggleInner_ImageColor3[4] = (boolstatus and 2.5) or nil
					if lockedup then
						colored_toggleInner_BackgroundColor3[4] = 1 + (colored_toggleInner_BackgroundColor3[4] or 1)
						colored_toggleInner_ImageColor3[4] = 1 + (colored_toggleInner_ImageColor3[4] or 1)
					end
					tweenService:Create(toggleInner, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
						BackgroundColor3 = (boolstatus and darkenColor(library.colors.main, colored_toggleInner_BackgroundColor3[4])) or library.colors.topGradient,
						ImageColor3 = (boolstatus and darkenColor(library.colors.main, colored_toggleInner_ImageColor3[4])) or library.colors.bottomGradient
					}):Play()
					colored_toggleHeadline_TextColor3[4] = (lockedup and 2.5) or nil
					tweenService:Create(toggleHeadline, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
						TextColor3 = (lockedup and darkenColor(library.colors.elementText, colored_toggleHeadline_TextColor3[4])) or library.colors.elementText
					}):Play()
					toggleHeadline.Text = toggleName or "???"
					return boolstatus
				end
				if alreadyEnabled ~= nil then
					Set(alreadyEnabled)
				else
					library_flags[flagName] = alreadyEnabled and true
					if options.Location then
						options.Location[options.LocationFlag or flagName] = alreadyEnabled and true
					end
				end
				local default = library_flags[flagName] and true
				Update()
				if kbUpdate then
					kbUpdate()
				end
				local objectdata = {
					Options = options,
					Type = "Toggle",
					Name = flagName,
					Flag = flagName,
					Default = default,
					Parent = sectionFunctions,
					Instance = toggleButton,
					Set = Set,
					Remove = function()
						if newToggle then
							newToggle.Parent = nil
							sectionFunctions:Update()
						end
					end,
					RawSet = function(t, newStatus, condition)
						if t ~= nil and type(t) ~= "table" then
							newStatus, condition = t, newStatus
						end
						last_v = library_flags[flagName]
						if (condition ~= false) and (condition ~= 0) then
							local overridecondition = condition and (type(condition) == "function") and condition
							if overridecondition or (options.Condition ~= nil) then
								if type(overridecondition or options.Condition) == "function" then
									local v, e = pcall(overridecondition or options.Condition, newStatus, last_v)
									if e then
										if not v then
											warn(debug.traceback(string.format("Error in toggle (RawSet) %s's Condition function: %s", flagName, e), 2))
										end
									else
										return last_v
									end
								end
							end
						end
						library_flags[flagName] = newStatus
						if options.Location then
							options.Location[options.LocationFlag or flagName] = newStatus
						end
						Update()
						return newStatus
					end,
					KeybindData = kbData,
					Get = function()
						return library_flags[flagName]
					end,
					Update = Update,
					Reset = function()
						return Set(nil, default)
					end,
					SetLocked = function(t, state)
						if type(t) ~= "table" then
							state = t
						end
						local last_v = lockedup
						if state == nil then
							lockedup = not lockedup
						else
							lockedup = state
						end
						if lockedup ~= last_v then
							colored_toggleHeadline_TextColor3[4] = (lockedup and 2.5) or nil
							Update()
							if kbUpdate then
								kbUpdate()
							end
						end
						return lockedup
					end,
					Lock = function()
						if not lockedup then
							lockedup = true
							colored_toggleHeadline_TextColor3[4] = 2.5
							Update()
							if kbUpdate then
								kbUpdate()
							end
						end
						return lockedup
					end,
					Unlock = function()
						if lockedup then
							lockedup = false
							colored_toggleHeadline_TextColor3[4] = nil
							Update()
							if kbUpdate then
								kbUpdate()
							end
						end
						return lockedup
					end,
					SetCondition = function(t, condition)
						if type(t) ~= "table" and condition == nil then
							condition = t
						end
						options.Condition = condition
						return condition
					end
				}
				if kbData then
					kbData.ToggleData = objectdata
				end
				tabFunctions.Flags[flagName], sectionFunctions.Flags[flagName], elements[flagName] = objectdata, objectdata, objectdata
				return objectdata
			end
			sectionFunctions.CreateToggle = sectionFunctions.AddToggle
			sectionFunctions.NewToggle = sectionFunctions.AddToggle
			sectionFunctions.Toggle = sectionFunctions.AddToggle
			sectionFunctions.Tog = sectionFunctions.AddToggle
			function sectionFunctions:AddButton(...)
				local args = nil
				if ... and not select(2, ...) and type(...) == "table" and #... > 0 and type((...)[1]) == "table" and (...)[1].Name then
					args = ...
				else
					args = {...}
				end
				local buttons, offset = {}, 0
				local frames = {}
				local fram = nil
				for _, options in next, args do
					options = (options and options[1] and type(options[1]) == "string" and resolvevararg("Button", unpack(options))) or options
					local buttonName, callback = assert(options.Name, "Missing Name for new button."), options.Callback or (warn("AddButton missing callback. Name:", options.Name or "No Name", debug.traceback("")) and nil) or function()
					end
					local lockedup = options.Locked
					local realButton = Instance_new("TextButton")
					realButton.Name = "realButton"
					realButton.BackgroundColor3 = Color3.new(1, 1, 1)
					realButton.BackgroundTransparency = 1
					realButton.Size = UDim2.fromScale(1, 1)
					realButton.ZIndex = 5
					realButton.Font = Enum.Font.Code
					realButton.Text = (buttonName and tostring(buttonName)) or "???"
					realButton.TextColor3 = library.colors.elementText
					local colored_realButton_TextColor3 = {realButton, "TextColor3", "elementText"}
					colored[1 + #colored] = colored_realButton_TextColor3
					realButton.TextSize = 14
					local textsize = textToSize(realButton).X + 14
					if newSection.Parent and (newSection.Parent.AbsoluteSize.X < (offset + textsize + 8)) then
						offset, fram = 0, nil
					end
					local newButton = fram or Instance_new("Frame")
					fram = newButton
					local framButtons = frames[fram] or {}
					frames[fram] = framButtons
					local button = Instance_new("ImageLabel")
					newButton.Name = removeSpaces((buttonName and buttonName:lower() or "???") .. "Holder")
					newButton.Parent = sectionHolder
					newButton.BackgroundColor3 = Color3.new(1, 1, 1)
					newButton.BackgroundTransparency = 1
					newButton.Size = UDim2.new(1, 0, 0, 24)
					button.Name = "button"
					button.Parent = newButton
					button.Active = true
					button.BackgroundColor3 = library.colors.topGradient
					local colored_button_BackgroundColor3 = {button, "BackgroundColor3", "topGradient"}
					colored[1 + #colored] = colored_button_BackgroundColor3
					button.BorderColor3 = library.colors.elementBorder
					colored[1 + #colored] = {button, "BorderColor3", "elementBorder"}
					button.Position = UDim2.new(0.031, offset, 0.166)
					button.Selectable = true
					button.Size = UDim2.fromOffset(28, 18)
					button.Image = "rbxassetid://2454009026"
					button.ImageColor3 = library.colors.bottomGradient
					local colored_button_ImageColor3 = {button, "ImageColor3", "bottomGradient"}
					colored[1 + #colored] = colored_button_ImageColor3
					local buttonInner = Instance_new("ImageLabel")
					buttonInner.Name = "buttonInner"
					buttonInner.Parent = button
					buttonInner.Active = true
					buttonInner.AnchorPoint = Vector2.new(0.5, 0.5)
					buttonInner.BackgroundColor3 = library.colors.topGradient
					local colored_buttonInner_BackgroundColor3 = {buttonInner, "BackgroundColor3", "topGradient"}
					colored[1 + #colored] = colored_buttonInner_BackgroundColor3
					buttonInner.BorderColor3 = library.colors.elementBorder
					colored[1 + #colored] = {buttonInner, "BorderColor3", "elementBorder"}
					buttonInner.Position = UDim2.fromScale(0.5, 0.5)
					buttonInner.Selectable = true
					buttonInner.Size = UDim2.new(1, -4, 1, -4)
					buttonInner.Image = "rbxassetid://2454009026"
					buttonInner.ImageColor3 = library.colors.bottomGradient
					local colored_buttonInner_ImageColor3 = {buttonInner, "ImageColor3", "bottomGradient"}
					colored[1 + #colored] = colored_buttonInner_ImageColor3
					button.Size = UDim2.fromOffset(textsize, 18)
					realButton.Parent = button
					offset = offset + textsize + 6
					sectionFunctions:Update()
					local presses = 0
					library.signals[1 + #library.signals] = realButton.MouseButton1Click:Connect(function()
						if lockedup then
							return
						end
						if options.Condition ~= nil and type(options.Condition) == "function" then
							local v, e = pcall(options.Condition, presses)
							if e then
								if not v then
									warn(debug.traceback(string.format("Error in button %s's Condition function: %s", buttonName, e), 2))
								end
							else
								return
							end
						end
						if not library.colorpicker and not submenuOpen then
							presses = 1 + presses
							task.spawn(callback, presses)
						end
					end)
					local imin = nil
					library.signals[1 + #library.signals] = button.MouseEnter:Connect(function()
						imin = 1
						colored_button_BackgroundColor3[3] = "main"
						colored_button_BackgroundColor3[4] = 1.5
						colored_button_ImageColor3[3] = "main"
						colored_button_ImageColor3[4] = 2.5
						tweenService:Create(button, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
							BackgroundColor3 = darkenColor(library.colors.main, 1.5),
							ImageColor3 = darkenColor(library.colors.main, 2.5)
						}):Play()
					end)
					library.signals[1 + #library.signals] = button.MouseLeave:Connect(function()
						imin = nil
						colored_button_BackgroundColor3[3] = "topGradient"
						colored_button_BackgroundColor3[4] = nil
						colored_button_ImageColor3[3] = "bottomGradient"
						colored_button_ImageColor3[4] = nil
						tweenService:Create(button, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
							BackgroundColor3 = library.colors.topGradient,
							ImageColor3 = library.colors.bottomGradient
						}):Play()
					end)
					local function Update(Recursive)
						buttonName, callback = options.Name or buttonName, options.Callback or (warn(debug.traceback("AddButton missing callback. Name:" .. (options.Name or buttonName or "No Name"), 2)) and nil) or function()
						end
						colored_button_BackgroundColor3[3] = (imin and "main") or "topGradient"
						colored_button_BackgroundColor3[4] = (imin and 1.5) or nil
						colored_button_ImageColor3[3] = (imin and "main") or "bottomGradient"
						colored_button_ImageColor3[4] = (imin and 2.5) or nil
						colored_buttonInner_BackgroundColor3[4] = nil
						colored_buttonInner_ImageColor3[4] = nil
						colored_realButton_TextColor3[4] = nil
						if lockedup then
							colored_button_BackgroundColor3[4] = 1.25
							colored_button_ImageColor3[4] = 1.25
							colored_buttonInner_BackgroundColor3[4] = 1.25
							colored_buttonInner_ImageColor3[4] = 1.25
							colored_realButton_TextColor3[4] = 1.75
						end
						tweenService:Create(button, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
							BackgroundColor3 = (imin and darkenColor(library.colors.main, colored_button_BackgroundColor3[4])) or darkenColor(library.colors.topGradient, colored_button_BackgroundColor3[4]),
							ImageColor3 = (imin and darkenColor(library.colors.main, colored_button_ImageColor3[4])) or darkenColor(library.colors.bottomGradient, colored_button_ImageColor3[4])
						}):Play()
						tweenService:Create(buttonInner, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
							BackgroundColor3 = darkenColor(library.colors.topGradient, colored_buttonInner_BackgroundColor3[4]),
							ImageColor3 = darkenColor(library.colors.bottomGradient, colored_buttonInner_ImageColor3[4])
						}):Play()
						tweenService:Create(realButton, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
							TextColor3 = darkenColor(library.colors.elementText, colored_realButton_TextColor3[4])
						}):Play()
						realButton.Text = (buttonName and tostring(buttonName)) or "???"
						local newtextsize = textToSize(realButton).X + 14
						if textsize ~= newtextsize then
							textsize = newtextsize
							button.Size = UDim2.fromOffset(textsize, 18)
							if Recursive ~= "Recursive" then
								if buttons and buttons.UpdateAll then
									buttons.UpdateAll()
								end
							end
						end
						return presses, textsize
					end
					Update()
					local objectdata = {
						Options = options,
						Name = buttonName,
						Flag = buttonName,
						Type = "Button",
						Parent = sectionFunctions,
						Instance = realButton,
						Frame = fram or newButton,
						ButtonFrame = button,
						Remove = function()
							if button then
								button.Parent = nil
								buttons.UpdateAll()
								sectionFunctions.UpdateAll()
							end
						end,
						Press = function(...)
							if lockedup then
								return presses
							end
							if options.Condition ~= nil and type(options.Condition) == "function" then
								local v, e = pcall(options.Condition, presses)
								if e then
									if v then
									else
										warn(debug.traceback(string.format("Error in button %s's Condition function: %s", buttonName, e), 2))
									end
								else
									return presses
								end
							end
							local args = {...}
							local a1 = args[1]
							if a1 and type(a1) == "table" then
								table.remove(args, 1)
							end
							presses = 1 + presses
							task.spawn(callback, presses, ...)
							return presses
						end,
						RawPress = function(...)
							local args = {...}
							local a1 = args[1]
							if a1 and type(a1) == "table" then
								table.remove(args, 1)
							end
							task.spawn(callback, presses, ...)
							return presses
						end,
						Get = function()
							return callback, presses
						end,
						SetLocked = function(t, state)
							if type(t) ~= "table" then
								state = t
							end
							local last_v = lockedup
							if state == nil then
								lockedup = not lockedup
							else
								lockedup = state
							end
							if lockedup ~= last_v then
								Update()
							end
							return lockedup
						end,
						Lock = function()
							if not lockedup then
								lockedup = true
								Update()
							end
							return lockedup
						end,
						Unlock = function()
							if lockedup then
								lockedup = false
								Update()
							end
							return lockedup
						end,
						SetCondition = function(t, condition)
							if type(t) ~= "table" and condition == nil then
								condition = t
							end
							options.Condition = condition
							return condition
						end,
						Update = Update,
						SetText = function(t, str)
							if type(t) ~= "table" and str == nil then
								str = t
							end
							buttonName = str
							options.Name = str
							realButton.Text = (buttonName and tostring(buttonName)) or "???"
							return str
						end,
						SetCallback = function(t, call)
							if type(t) ~= "table" and call == nil then
								call = t
							end
							options.Callback = call
							callback = call
							return call
						end
					}
					tabFunctions.Flags[buttonName], sectionFunctions.Flags[buttonName], elements[buttonName] = objectdata, objectdata, objectdata
					buttons[1 + #buttons] = objectdata
					framButtons[1 + #framButtons] = objectdata
				end
				function buttons.PressAll()
					for _, v in next, buttons do
						v.Press()
					end
				end
				function buttons.UpdateAll()
					for fram, Fram in next, frames do
						if Fram and fram then
							local offset = 0
							for _, v in next, Fram do
								if v and v.Instance and fram:IsAncestorOf(v.Instance) then
									local _, textsize = v.Update("Recursive")
									textsize = tonumber(textsize) or (textToSize(v.Instance).X + 14)
									v.ButtonFrame.Position = UDim2.new(0.031, offset, 0.166)
									offset = offset + textsize + 6
								end
							end
						end
					end
				end
				buttons.Update = buttons.UpdateAll
				function buttons.RemoveAll()
					for _, v in next, buttons do
						v.Remove()
					end
				end
				function buttons.Remove()
					for fram in next, frames do
						if fram then
							fram.Parent = nil
						end
					end
				end
				if #buttons == 1 then
					for k, v in next, buttons[1] do
						if buttons[k] == nil then
							buttons[k] = v
						end
					end
				end
				return buttons
			end
			sectionFunctions.CreateButton = sectionFunctions.AddButton
			sectionFunctions.NewButton = sectionFunctions.AddButton
			sectionFunctions.Button = sectionFunctions.AddButton
			function sectionFunctions:AddTextbox(options, ...)
				options = (options and type(options) == "string" and resolvevararg("Textbox", options, ...)) or options
				local textboxName, presetValue, placeholder, callback, flagName = assert(options.Name, "Missing Name for new textbox."), options.Value, options.Placeholder, options.Callback, options.Flag or (function()
					library.unnamedtextboxes = 1 + (library.unnamedtextboxes or 0)
					return "Textbox" .. tostring(library.unnamedtextboxes)
				end)()
				if elements[flagName] ~= nil then
					warn(debug.traceback("Warning! Re-used flag '" .. flagName .. "'", 3))
				end
				local requiredtype = options.Type
				local newTextbox = Instance_new("Frame")
				local textbox = Instance_new("ImageLabel")
				local textboxInner = Instance_new("ImageLabel")
				local realTextbox = Instance_new("TextBox")
				local textboxHeadline = Instance_new("TextLabel")
				newTextbox.Name = removeSpaces((textboxName and textboxName:lower()) or "???") .. "Holder"
				newTextbox.Parent = sectionHolder
				newTextbox.BackgroundColor3 = Color3.new(1, 1, 1)
				newTextbox.BackgroundTransparency = 1
				newTextbox.Size = UDim2.new(1, 0, 0, 42)
				textbox.Name = "textbox"
				textbox.Parent = newTextbox
				textbox.Active = true
				textbox.BackgroundColor3 = library.colors.topGradient
				local colored_textbox_BackgroundColor3 = {textbox, "BackgroundColor3", "topGradient"}
				colored[1 + #colored] = colored_textbox_BackgroundColor3
				textbox.BorderColor3 = library.colors.elementBorder
				colored[1 + #colored] = {textbox, "BorderColor3", "elementBorder"}
				textbox.Position = UDim2.fromScale(0.031, 0.48)
				textbox.Selectable = true
				textbox.Size = UDim2.fromOffset(206, 18)
				textbox.Image = "rbxassetid://2454009026"
				textbox.ImageColor3 = library.colors.bottomGradient
				local colored_textbox_ImageColor3 = {textbox, "ImageColor3", "bottomGradient"}
				colored[1 + #colored] = colored_textbox_ImageColor3
				textboxInner.Name = "textboxInner"
				textboxInner.Parent = textbox
				textboxInner.Active = true
				textboxInner.AnchorPoint = Vector2.new(0.5, 0.5)
				textboxInner.BackgroundColor3 = library.colors.topGradient
				colored[1 + #colored] = {textboxInner, "BackgroundColor3", "topGradient"}
				textboxInner.BorderColor3 = library.colors.elementBorder
				colored[1 + #colored] = {textboxInner, "BorderColor3", "elementBorder"}
				textboxInner.Position = UDim2.fromScale(0.5, 0.5)
				textboxInner.Selectable = true
				textboxInner.Size = UDim2.new(1, -4, 1, -4)
				textboxInner.Image = "rbxassetid://2454009026"
				textboxInner.ImageColor3 = library.colors.bottomGradient
				colored[1 + #colored] = {textboxInner, "ImageColor3", "bottomGradient"}
				realTextbox.Name = "realTextbox"
				if options.Rich or options.RichText or options.RichTextBox then
					realTextbox.RichText = true
				end
				if options.MultiLine or options.Lines then
					realTextbox.MultiLine = true
				end
				if options.Font or options.TextFont then
					realTextbox.Font = options.Font
				end
				if options.TextScaled or options.Scaled then
					realTextbox.TextScaled = true
				end
				realTextbox.BackgroundColor3 = Color3.new(1, 1, 1)
				realTextbox.BackgroundTransparency = 1
				realTextbox.Position = UDim2.new(0.0295485705)
				realTextbox.Size = UDim2.fromScale(0.97, 1)
				realTextbox.ZIndex = 5
				realTextbox.Font = Enum.Font.Code
				realTextbox.LineHeight = 1.15
				realTextbox.Text = tostring(presetValue)
				realTextbox.TextColor3 = library.colors.otherElementText
				colored[1 + #colored] = {realTextbox, "TextColor3", "otherElementText"}
				realTextbox.TextSize = 14
				if options.ClearTextOnFocus or options.ClearText then
					realTextbox.ClearTextOnFocus = true
				else
					realTextbox.ClearTextOnFocus = false
				end
				realTextbox.PlaceholderText = (placeholder ~= nil and tostring(placeholder)) or (presetValue ~= nil and tostring(presetValue)) or ""
				realTextbox.TextXAlignment = Enum.TextXAlignment.Left
				if options.CustomProperties and type(options.CustomProperties) == "table" then
					for k, v in next, options.CustomProperties do
						local oof, e = pcall(function()
							realTextbox[k] = v
						end)
						if not oof and e then
							warn("Error setting Textbox", flagName, "|", e, debug.traceback(""))
						end
					end
				end
				realTextbox.Parent = textbox
				textboxHeadline.Name = "textboxHeadline"
				textboxHeadline.Parent = newTextbox
				textboxHeadline.Active = true
				textboxHeadline.BackgroundColor3 = Color3.new(1, 1, 1)
				textboxHeadline.BackgroundTransparency = 1
				textboxHeadline.Position = UDim2.new(0.031)
				textboxHeadline.Selectable = true
				textboxHeadline.Size = UDim2.fromOffset(206, 20)
				textboxHeadline.ZIndex = 5
				textboxHeadline.Font = Enum.Font.Code
				textboxHeadline.LineHeight = 1.15
				textboxHeadline.Text = (textboxName and tostring(textboxName)) or "???"
				textboxHeadline.TextColor3 = library.colors.elementText
				colored[1 + #colored] = {textboxHeadline, "TextColor3", "elementText"}
				textboxHeadline.TextSize = 14
				textboxHeadline.TextXAlignment = Enum.TextXAlignment.Left
				sectionFunctions:Update()
				local last_v = presetValue
				local function resolvevalue(val)
					if options.PreFormat then
						local typ = type(options.PreFormat)
						if typ == "function" then
							local x, e = pcall(options.PreFormat, val)
							if not x and e then
								warn("Error in Pre-Format (Textbox " .. flagName .. "):", e)
							else
								val = e
							end
						end
					end
					if requiredtype == "number" then
						if not options.Hex and not options.Binary and not options.Base then
							val = tonumber(val) or tonumber(val:gsub("%D", ""), 10) or 0
						else
							val = tonumber(val, (options.Hex and 16) or (options.Binary and 2) or options.Base or 10) or 0
						end
						if options.Max or options.Min then
							val = math.clamp(val, options.Min or -math.huge, options.Max or math.huge)
						end
						local decimalprecision = tonumber(options.Decimals or options.Precision or options.Precise)
						if decimalprecision then
							val = tonumber(string.format("%0." .. tostring(decimalprecision) .. "f", val))
						end
					end
					if options.PostFormat then
						local typ = type(options.PostFormat)
						if typ == "function" then
							local x, e = pcall(options.PostFormat, val)
							if not x and e then
								warn("Error in Post-Format (Textbox " .. flagName .. "):", e)
							else
								val = e
							end
						end
					end
					return (val and tonumber(val)) or val
				end
				library.signals[1 + #library.signals] = realTextbox.FocusLost:Connect(function()
					last_v = library_flags[flagName]
					local val = resolvevalue(realTextbox.Text)
					library_flags[flagName] = val
					if options.Location then
						options.Location[options.LocationFlag or flagName] = val
					end
					if callback and last_v ~= val then
						task.spawn(callback, tostring(val), last_v, realTextbox)
					end
				end)
				library.signals[1 + #library.signals] = newTextbox.MouseEnter:Connect(function()
					colored_textbox_BackgroundColor3[3] = "main"
					colored_textbox_BackgroundColor3[4] = 1.5
					colored_textbox_ImageColor3[3] = "main"
					colored_textbox_ImageColor3[4] = 2.5
					tweenService:Create(textbox, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
						BackgroundColor3 = darkenColor(library.colors.main, 1.5),
						ImageColor3 = darkenColor(library.colors.main, 2.5)
					}):Play()
				end)
				library.signals[1 + #library.signals] = newTextbox.MouseLeave:Connect(function()
					colored_textbox_BackgroundColor3[3] = "topGradient"
					colored_textbox_BackgroundColor3[4] = nil
					colored_textbox_ImageColor3[3] = "bottomGradient"
					colored_textbox_ImageColor3[4] = nil
					tweenService:Create(textbox, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
						BackgroundColor3 = library.colors.topGradient,
						ImageColor3 = library.colors.bottomGradient
					}):Play()
				end)
				local function set(t, str)
					if nil == str and t ~= nil then
						str = t
					end
					last_v = library_flags[flagName]
					library_flags[flagName] = str
					if options.Location then
						options.Location[options.LocationFlag or flagName] = str
					end
					local sstr = (str ~= nil and tostring(str)) or "Empty Text"
					if realTextbox.Text ~= sstr then
						realTextbox.Text = sstr
					end
					if callback and (last_v ~= str or options.AllowDuplicateCalls) then
						task.spawn(callback, str, last_v, realTextbox)
					end
					return str
				end
				if presetValue ~= nil then
					set(presetValue)
				else
					library_flags[flagName] = presetValue
					if options.Location then
						options.Location[options.LocationFlag or flagName] = presetValue
					end
				end
				local default = library_flags[flagName]
				local function update()
					textboxName, placeholder, callback = options.Name or textboxName, options.Placeholder or placeholder, options.Callback
					local str = library_flags[flagName]
					str = (str ~= nil and tostring(str)) or "Empty Text"
					if realTextbox.Text ~= str then
						realTextbox.Text = str
					end
					textboxHeadline.Text = (textboxName and tostring(textboxName)) or "???"
					return str
				end
				local objectdata = {
					Options = options,
					Name = flagName,
					Flag = flagName,
					Type = "Textbox",
					Default = default,
					Parent = sectionFunctions,
					Instance = realTextbox,
					Get = function()
						return library_flags[flagName]
					end,
					Set = set,
					Update = update,
					Remove = function()
						if newTextbox then
							newTextbox.Parent = nil
							sectionFunctions:Update()
						end
					end,
					RawSet = function(t, str)
						if t ~= nil and str == nil then
							str = t
						end
						last_v = library_flags[flagName]
						library_flags[flagName] = str
						if options.Location then
							options.Location[options.LocationFlag or flagName] = str
						end
						update()
						return str
					end,
					Reset = function()
						return set(nil, default)
					end
				}
				tabFunctions.Flags[flagName], sectionFunctions.Flags[flagName], elements[flagName] = objectdata, objectdata, objectdata
				return objectdata
			end
			sectionFunctions.AddTextBox = sectionFunctions.AddTextbox
			sectionFunctions.NewTextBox = sectionFunctions.AddTextbox
			sectionFunctions.CreateTextBox = sectionFunctions.AddTextbox
			sectionFunctions.TextBox = sectionFunctions.AddTextbox
			sectionFunctions.NewTextbox = sectionFunctions.AddTextbox
			sectionFunctions.CreateTextbox = sectionFunctions.AddTextbox
			sectionFunctions.Textbox = sectionFunctions.AddTextbox
			sectionFunctions.Box = sectionFunctions.AddTextbox
			function sectionFunctions:AddKeybind(options, ...)
				options = (options and type(options) == "string" and resolvevararg("Keybind", options, ...)) or options
				local keybindName, presetKeybind, callback, presscallback, flag = assert(options.Name, "Missing Name for new keybind."), options.Value, options.Callback, options.Pressed, options.Flag or (function()
					library.unnamedkeybinds = 1 + (library.unnamedkeybinds or 0)
					return "Keybind" .. tostring(library.unnamedkeybinds)
				end)()
				local IsCore = (options.CoreBinding and true) or nil
				if elements[flag] ~= nil then
					warn(debug.traceback("Warning! Re-used flag '" .. flag .. "'", 3))
				end
				library.keyHandler = keyHandler
				local keyHandler = options.KeyNames or keyHandler
				local newKeybind = Instance_new("Frame")
				local keybindHeadline = Instance_new("TextLabel")
				local keybindPositioner = Instance_new("Frame")
				local keybindList = Instance_new("UIListLayout")
				local keybindButton = Instance_new("TextButton")
				local bindedKey = presetKeybind
				local justBinded = false
				local keyName = (presetKeybind and tostring(presetKeybind):gsub("Enum.KeyCode.", "") or "")
				newKeybind.Name = "newKeybind"
				newKeybind.Parent = sectionHolder
				newKeybind.BackgroundColor3 = Color3.new(1, 1, 1)
				newKeybind.BackgroundTransparency = 1
				newKeybind.Size = UDim2.new(1, 0, 0, 19)
				keybindHeadline.Name = "keybindHeadline"
				keybindHeadline.Parent = newKeybind
				keybindHeadline.BackgroundColor3 = Color3.new(1, 1, 1)
				keybindHeadline.BackgroundTransparency = 1
				keybindHeadline.Position = UDim2.fromScale(0.031, 0.165842161)
				keybindHeadline.Size = UDim2.fromOffset(215, 12)
				keybindHeadline.Font = Enum.Font.Code
				keybindHeadline.Text = (keybindName and tostring(keybindName)) or "???"
				keybindHeadline.TextColor3 = library.colors.elementText
				colored[1 + #colored] = {keybindHeadline, "TextColor3", "elementText"}
				keybindHeadline.TextSize = 14
				keybindHeadline.TextXAlignment = Enum.TextXAlignment.Left
				keybindPositioner.Name = "keybindPositioner"
				keybindPositioner.Parent = newKeybind
				keybindPositioner.BackgroundColor3 = Color3.new(1, 1, 1)
				keybindPositioner.BackgroundTransparency = 1
				keybindPositioner.Position = UDim2.new(0.00448430516)
				keybindPositioner.Size = UDim2.fromOffset(214, 19)
				keybindList.Name = "keybindList"
				keybindList.Parent = keybindPositioner
				keybindList.FillDirection = Enum.FillDirection.Horizontal
				keybindList.HorizontalAlignment = Enum.HorizontalAlignment.Right
				keybindList.SortOrder = Enum.SortOrder.LayoutOrder
				keybindList.VerticalAlignment = Enum.VerticalAlignment.Center
				keybindButton.Name = "keybindButton"
				keybindButton.Parent = keybindPositioner
				keybindButton.Active = false
				keybindButton.BackgroundColor3 = Color3.new(1, 1, 1)
				keybindButton.BackgroundTransparency = 1
				keybindButton.Position = UDim2.fromScale(0.598130822, 0.184210524)
				keybindButton.Selectable = false
				keybindButton.Size = UDim2.fromOffset(46, 12)
				keybindButton.Font = Enum.Font.Code
				keybindButton.Text = (presetKeybind and tostring(presetKeybind):gsub("Enum.KeyCode.", "") or "[NONE]")
				keybindButton.TextColor3 = library.colors.otherElementText
				local colored_keybindButton_TextColor3 = {keybindButton, "TextColor3", "otherElementText"}
				colored[1 + #colored] = colored_keybindButton_TextColor3
				keybindButton.TextSize = 14
				keybindButton.TextXAlignment = Enum.TextXAlignment.Right
				keybindButton.Size = UDim2.fromOffset(textToSize(keybindButton).X + 4, 12)
				sectionFunctions:Update()
				local last_v = bindedKey or presetKeybind
				local function newkey()
					local IgnoreKey = nil
					if IsCore then
						IgnoreKey = tick()
						IgnoreCoreInputs = IgnoreKey
					end
					local old_texts = keybindButton.Text
					colored_keybindButton_TextColor3[3] = "main"
					colored_keybindButton_TextColor3[4] = nil
					tweenService:Create(keybindButton, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
						TextColor3 = library.colors.main
					}):Play()
					if last_v then
						keybindButton.Text = "(Was " .. (last_v and tostring(last_v):gsub("Enum.KeyCode.", "") or "[NONE]") .. ") [...]"
					else
						keybindButton.Text = "[...]"
					end
					local receivingKey = nil
					receivingKey = userInputService.InputBegan:Connect(function(key)
						last_v = library_flags[flag]
						if not keyHandler.notAllowedKeys[key.KeyCode] then
							if key.KeyCode ~= Enum.KeyCode.Unknown then
								bindedKey = (key.KeyCode ~= Enum.KeyCode.Escape and key.KeyCode) or library_flags[flag]
								library_flags[flag] = bindedKey
								if options.Location then
									options.Location[options.LocationFlag or flag] = bindedKey
								end
								if bindedKey then
									keyName = keyHandler.allowedKeys[bindedKey]
									keybindButton.Text = "[" .. (keyName or bindedKey.Name or tostring(key.KeyCode):gsub("Enum.KeyCode.", "")) .. "]"
									keybindButton.Size = UDim2.fromOffset(textToSize(keybindButton).X + 4, 12)
									justBinded = true
									colored_keybindButton_TextColor3[3] = "otherElementText"
									colored_keybindButton_TextColor3[4] = nil
									tweenService:Create(keybindButton, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
										TextColor3 = library.colors.otherElementText
									}):Play()
									receivingKey:Disconnect()
								end
								if callback and last_v ~= bindedKey then
									task.spawn(callback, bindedKey, last_v)
								end
								if IsCore then
									delay(0.1, function()
										if IgnoreCoreInputs and (IgnoreCoreInputs == IgnoreKey) then
											IgnoreCoreInputs = nil
										end
									end)
								end
								return
							elseif key.KeyCode == Enum.KeyCode.Unknown and not keyHandler.notAllowedMouseInputs[key.UserInputType] then
								bindedKey = key.UserInputType
								library_flags[flag] = bindedKey
								if options.Location then
									options.Location[options.LocationFlag or flag] = bindedKey
								end
								keyName = keyHandler.allowedKeys[bindedKey]
								keybindButton.Text = "[" .. (keyName or bindedKey.Name or tostring(key.KeyCode):gsub("Enum.KeyCode.", "")) .. "]"
								keybindButton.Size = UDim2.fromOffset(textToSize(keybindButton).X + 4, 12)
								justBinded = true
								colored_keybindButton_TextColor3[3] = "otherElementText"
								colored_keybindButton_TextColor3[4] = nil
								tweenService:Create(keybindButton, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
									TextColor3 = library.colors.otherElementText
								}):Play()
								receivingKey:Disconnect()
								if callback and last_v ~= bindedKey then
									task.spawn(callback, bindedKey, last_v)
								end
								if IsCore then
									delay(0.1, function()
										if IgnoreCoreInputs and (IgnoreCoreInputs == IgnoreKey) then
											IgnoreCoreInputs = nil
										end
									end)
								end
								return
							end
						end
						if key.KeyCode == Enum.KeyCode.Backspace or Enum.KeyCode.Escape == key.KeyCode then
							old_texts, bindedKey = "[NONE]", nil
						end
						keybindButton.Text = old_texts
						colored_keybindButton_TextColor3[3] = "otherElementText"
						colored_keybindButton_TextColor3[4] = nil
						tweenService:Create(keybindButton, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
							TextColor3 = library.colors.otherElementText
						}):Play()
						receivingKey:Disconnect()
						if callback and last_v ~= bindedKey then
							task.spawn(callback, bindedKey, last_v)
						end
					end)
					library.signals[1 + #library.signals] = receivingKey
				end
				library.signals[1 + #library.signals] = keybindButton.MouseButton1Click:Connect(newkey)
				library.signals[1 + #library.signals] = newKeybind.InputEnded:Connect(function(input)
					if not library.colorpicker and not submenuOpen and input.UserInputType == Enum.UserInputType.MouseButton1 then
						newkey()
					end
				end)
				if presscallback then
					library.signals[1 + #library.signals] = userInputService.InputBegan:Connect(function(key, chatting)
						if not keyHandler.notAllowedKeys[key.KeyCode] and not keyHandler.notAllowedMouseInputs[key.UserInputType] then
							if not justBinded and bindedKey == key.UserInputType or not justBinded and bindedKey == key.KeyCode and not chatting then
								if presscallback then
									task.spawn(presscallback, key, chatting)
								end
							end
							if justBinded then
								justBinded = false
							end
						end
					end)
				end
				local function set(t, key)
					if (nil == key) and (t ~= nil) then
						key = t
					end
					if (key == "nil") or (key == "NONE") or (key == "none") then
						key = nil
					end
					last_v = library_flags[flag]
					bindedKey = key
					library_flags[flag] = key
					if options.Location then
						options.Location[options.LocationFlag or flag] = key
					end
					keyName = (key == nil and "NONE") or keyHandler.allowedKeys[key]
					keybindButton.Text = "[" .. (keyName or key.Name or tostring(key):gsub("Enum.KeyCode.", "")) .. "]"
					keybindButton.Size = UDim2.fromOffset(textToSize(keybindButton).X + 4, 12)
					justBinded = true
					colored_keybindButton_TextColor3[3] = "otherElementText"
					colored_keybindButton_TextColor3[4] = nil
					tweenService:Create(keybindButton, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
						TextColor3 = library.colors.otherElementText
					}):Play()
					if callback and ((last_v ~= key) or options.AllowDuplicateCalls) then
						task.spawn(callback, key, last_v)
					end
					return key
				end
				if presetKeybind ~= nil then
					set(presetKeybind)
				else
					library_flags[flag] = bindedKey
					if options.Location then
						options.Location[options.LocationFlag or flag] = bindedKey
					end
				end
				local default = library_flags[flag]
				local function update()
					keybindName, callback, presscallback = options.Name or keybindName, options.Callback, options.Pressed
					local key = library_flags[flag]
					keyName = (key == nil and "NONE") or keyHandler.allowedKeys[key]
					keybindButton.Text = "[" .. (keyName or key.Name or tostring(key):gsub("Enum.KeyCode.", "")) .. "]"
					keybindButton.Size = UDim2.fromOffset(textToSize(keybindButton).X + 4, 12)
					colored_keybindButton_TextColor3[3] = "otherElementText"
					colored_keybindButton_TextColor3[4] = nil
					tweenService:Create(keybindButton, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
						TextColor3 = library.colors.otherElementText
					}):Play()
					keybindHeadline.Text = (keybindName and tostring(keybindName)) or "???"
					return key
				end
				local objectdata = {
					Options = options,
					Name = flag,
					Flag = flag,
					Type = "Keybind",
					Default = default,
					Parent = sectionFunctions,
					Instance = keybindButton,
					Get = function()
						return library_flags[flag]
					end,
					Set = set,
					Remove = function()
						if newKeybind then
							newKeybind.Parent = nil
							sectionFunctions:Update()
						end
					end,
					RawSet = function(t, key)
						if nil == key and t ~= nil then
							key = t
						end
						if key == "nil" or key == "NONE" or key == "none" then
							key = nil
						end
						last_v = library_flags[flag]
						bindedKey = key
						library_flags[flag] = key
						if options.Location then
							options.Location[options.LocationFlag or flag] = key
						end
						justBinded = true
						return key
					end,
					Update = update,
					Reset = function()
						return set(nil, default)
					end
				}
				tabFunctions.Flags[flag], sectionFunctions.Flags[flag], elements[flag] = objectdata, objectdata, objectdata
				return objectdata
			end
			sectionFunctions.NewKeybind = sectionFunctions.AddKeybind
			sectionFunctions.CreateKeybind = sectionFunctions.AddKeybind
			sectionFunctions.Keybind = sectionFunctions.AddKeybind
			sectionFunctions.Bind = sectionFunctions.AddKeybind
			function sectionFunctions:AddLabel(options, ...)
				options = (options and type(options) == "string" and resolvevararg("Label", options, ...)) or options
				local labelName, flag = options.Text or options.Value or options.Name, options.Flag or (function()
					library.unnamedlabels = 1 + (library.unnamedlabels or 0)
					return "Label" .. tostring(library.unnamedlabels)
				end)()
				if elements[flag] ~= nil then
					warn(debug.traceback("Warning! Re-used flag '" .. flag .. "'", 3))
				end
				local newLabel = Instance_new("Frame")
				local labelHeadline = Instance_new("TextLabel")
				local labelPositioner = Instance_new("Frame")
				local labelButton = Instance_new("TextButton")
				newLabel.Name = "newLabel"
				newLabel.Parent = sectionHolder
				newLabel.BackgroundColor3 = Color3.new(1, 1, 1)
				newLabel.BackgroundTransparency = 1
				newLabel.Size = UDim2.new(1, 0, 0, 19)
				labelHeadline.Name = "labelHeadline"
				labelHeadline.Parent = newLabel
				labelHeadline.BackgroundColor3 = Color3.new(1, 1, 1)
				labelHeadline.BackgroundTransparency = 1
				labelHeadline.Position = UDim2.fromScale(0.031, 0.165842161)
				labelHeadline.Size = UDim2.fromOffset(215, 12)
				labelHeadline.Font = Enum.Font.Code
				labelHeadline.Text = (labelName and tostring(labelName)) or "Empty Text"
				labelHeadline.TextColor3 = library.colors.elementText
				colored[1 + #colored] = {labelHeadline, "TextColor3", "elementText"}
				labelHeadline.TextSize = 14
				labelHeadline.TextXAlignment = Enum.TextXAlignment.Left
				labelPositioner.Name = "labelPositioner"
				labelPositioner.Parent = newLabel
				labelPositioner.BackgroundColor3 = Color3.new(1, 1, 1)
				labelPositioner.BackgroundTransparency = 1
				labelPositioner.Position = UDim2.new(0.00448430516)
				labelPositioner.Size = UDim2.fromOffset(214, 19)
				sectionFunctions:Update()
				local function set(t, str)
					if nil == str and t ~= nil then
						str = t
					end
					labelHeadline.Text = (nil ~= str and tostring(str)) or "Empty Text"
					return str
				end
				local default = labelHeadline.Text
				local objectdata = {
					Options = options,
					Name = flag,
					Flag = flag,
					Type = "Label",
					Default = default,
					Parent = sectionFunctions,
					Instance = labelHeadline,
					Get = function()
						return labelHeadline.Text, labelHeadline
					end,
					Set = set,
					SetText = set,
					Remove = function()
						if newLabel then
							newLabel.Parent = nil
							sectionFunctions:Update()
						end
					end,
					RawSet = set,
					Update = function()
						return labelHeadline.Text
					end,
					Reset = function()
						return set(nil, default)
					end
				}
				tabFunctions.Flags[flag], sectionFunctions.Flags[flag], elements[flag] = objectdata, objectdata, objectdata
				return objectdata
			end
			sectionFunctions.NewLabel = sectionFunctions.AddLabel
			sectionFunctions.CreateLabel = sectionFunctions.AddLabel
			sectionFunctions.Label = sectionFunctions.AddLabel
			sectionFunctions.Text = sectionFunctions.AddLabel
			function sectionFunctions:AddSlider(options, ...)
				options = (options and type(options) == "string" and resolvevararg("Slider", options, ...)) or options
				local sliderName, maxValue, minValue, presetValue, callback, flagName = assert(options.Name, "Missing Name for new slider."), assert(options.Max, "Missing Max for new slider."), assert(options.Min, "Missing Min for new slider."), options.Value, options.Callback, options.Flag or (function()
					library.unnamedsliders = 1 + (library.unnamedsliders or 0)
					return "Slider" .. tostring(library.unnamedsliders)
				end)()
				if elements[flagName] ~= nil then
					warn(debug.traceback("Warning! Re-used flag '" .. flagName .. "'", 3))
				end
				local decimalprecision = tonumber(options.Decimals or options.Precision or options.Precise)
				if not decimalprecision and options.Max - options.Min <= 1 then
					decimalprecision = 1
				end
				if decimalprecision then
					decimalprecision = math.clamp(decimalprecision, 0, 99)
					if decimalprecision <= 0 then
						decimalprecision = nil
					end
					decimalprecision = tostring(decimalprecision)
				end
				local formattyp = options.Format and type(options.Format)
				local function resolvedisplay(val, was)
					local str = nil
					if decimalprecision then
						str = string.format("%0." .. decimalprecision .. "f", val)
					end
					str = str or tostring(val)
					if formattyp == "string" then
						return string.format(options.Format, val)
					elseif formattyp == "function" then
						local oof, g = pcall(options.Format, val, was)
						if not oof or not g then
							warn("Your format function for", sliderName, "Slider:", flagName, "has returned nothing. It should return a string to display.", debug.traceback(""))
							return "Format Function Errored"
						end
						return tostring(g)
					end
					return (sliderName or "???") .. ": " .. str
				end
				local usetextbox = options.Textbox or options.InputBox or options.CustomInput
				local newSlider = Instance_new("Frame")
				local slider = Instance_new("ImageLabel")
				local sliderInner = Instance_new("ImageLabel")
				local sliderColored = Instance_new("ImageLabel")
				local sliderHeadline = Instance_new("TextLabel")
				local startingValue = presetValue or minValue
				local sliderDragging = false
				newSlider.Name = "newSlider"
				newSlider.Parent = sectionHolder
				newSlider.BackgroundColor3 = Color3.new(1, 1, 1)
				newSlider.BackgroundTransparency = 1
				newSlider.Size = UDim2.new(1, 0, 0, 42)
				slider.Name = "slider"
				slider.Parent = newSlider
				slider.Active = true
				slider.BackgroundColor3 = library.colors.topGradient
				local colored_slider_BackgroundColor3 = {slider, "BackgroundColor3", "topGradient"}
				colored[1 + #colored] = colored_slider_BackgroundColor3
				slider.BorderColor3 = library.colors.elementBorder
				colored[1 + #colored] = {slider, "BorderColor3", "elementBorder"}
				slider.Position = UDim2.fromScale(0.031, 0.48)
				slider.Selectable = true
				slider.Size = (usetextbox and UDim2.fromOffset(156, 18)) or UDim2.fromOffset(206, 18)
				slider.Image = "rbxassetid://2454009026"
				slider.ImageColor3 = library.colors.bottomGradient
				local colored_slider_ImageColor3 = {slider, "ImageColor3", "bottomGradient"}
				colored[1 + #colored] = colored_slider_ImageColor3
				sliderInner.Name = "sliderInner"
				sliderInner.Parent = slider
				sliderInner.Active = true
				sliderInner.AnchorPoint = Vector2.new(0.5, 0.5)
				sliderInner.BackgroundColor3 = library.colors.topGradient
				colored[1 + #colored] = {sliderInner, "BackgroundColor3", "topGradient"}
				sliderInner.BorderColor3 = library.colors.elementBorder
				colored[1 + #colored] = {sliderInner, "BorderColor3", "elementBorder"}
				sliderInner.Position = UDim2.fromScale(0.5, 0.5)
				sliderInner.Selectable = true
				sliderInner.Size = UDim2.new(1, -4, 1, -4)
				sliderInner.Image = "rbxassetid://2454009026"
				sliderInner.ImageColor3 = library.colors.bottomGradient
				colored[1 + #colored] = {sliderInner, "ImageColor3", "bottomGradient"}
				sliderColored.Name = "sliderColored"
				sliderColored.Parent = sliderInner
				sliderColored.Active = true
				sliderColored.BackgroundColor3 = darkenColor(library.colors.main, 1.5)
				colored[1 + #colored] = {sliderColored, "BackgroundColor3", "main", 1.5}
				sliderColored.BorderSizePixel = 0
				sliderColored.Selectable = true
				sliderColored.Size = UDim2.fromScale(((startingValue or minValue) - minValue) / (maxValue - minValue), 1)
				sliderColored.Image = "rbxassetid://2454009026"
				sliderColored.ImageColor3 = darkenColor(library.colors.main, 2.5)
				colored[1 + #colored] = {sliderColored, "ImageColor3", "main", 2.5}
				sliderHeadline.Name = "sliderHeadline"
				sliderHeadline.Parent = newSlider
				sliderHeadline.Active = true
				sliderHeadline.BackgroundColor3 = Color3.new(1, 1, 1)
				sliderHeadline.BackgroundTransparency = 1
				sliderHeadline.Position = UDim2.new(0.031)
				sliderHeadline.Selectable = true
				sliderHeadline.Size = UDim2.fromOffset(206, 20)
				sliderHeadline.ZIndex = 5
				sliderHeadline.Font = Enum.Font.Code
				sliderHeadline.LineHeight = 1.15
				sliderHeadline.Text = resolvedisplay(startingValue)
				sliderHeadline.TextColor3 = library.colors.elementText
				colored[1 + #colored] = {sliderHeadline, "TextColor3", "elementText"}
				sliderHeadline.TextSize = 14
				sliderHeadline.TextXAlignment = Enum.TextXAlignment.Left
				local realTextbox = nil
				local function Set(t, newValue)
					if nil == newValue and t ~= nil then
						newValue = t
					end
					minValue, maxValue = options.Min, options.Max
					if newValue and (options.IllegalInput or ((not minValue or newValue >= minValue) and (not maxValue or newValue <= maxValue))) then
						local last_val = library_flags[flagName]
						library_flags[flagName] = newValue
						if options.Location then
							options.Location[options.LocationFlag or flagName] = newValue
						end
						do
							local newValue = (options.IllegalInput and math.clamp(newValue, minValue or -math.huge, maxValue or math.huge)) or newValue
							tweenService:Create(sliderColored, TweenInfo.new(0.25, library.configuration.easingStyle, library.configuration.easingDirection), {
								Size = UDim2.fromScale(((newValue or minValue) - minValue) / (maxValue - minValue), 1)
							}):Play()
						end
						sliderHeadline.Text = resolvedisplay(newValue, last_val)
						if usetextbox and realTextbox then
							realTextbox.Text = tostring(newValue)
						end
						if callback and (last_val ~= newValue or options.AllowDuplicateCalls) then
							task.spawn(callback, newValue, last_val)
						end
					end
					return newValue
				end
				if presetValue ~= nil then
					Set(presetValue)
				else
					library_flags[flagName] = startingValue
					if options.Location then
						options.Location[options.LocationFlag or flagName] = startingValue
					end
				end
				if usetextbox then
					if type(usetextbox) ~= "table" then
						usetextbox = options
					end
					local textbox = Instance_new("ImageLabel")
					local textboxInner = Instance_new("ImageLabel")
					realTextbox = Instance_new("TextBox")
					textbox.Name = "textbox"
					textbox.Parent = newSlider
					textbox.Active = true
					textbox.BackgroundColor3 = library.colors.topGradient
					local colored_textbox_BackgroundColor3 = {textbox, "BackgroundColor3", "topGradient"}
					colored[1 + #colored] = colored_textbox_BackgroundColor3
					textbox.BorderColor3 = library.colors.elementBorder
					colored[1 + #colored] = {textbox, "BorderColor3", "elementBorder"}
					textbox.Position = UDim2.new(1, -54, 0.48)
					textbox.Selectable = true
					textbox.Size = UDim2.fromOffset(43, 18)
					textbox.Image = "rbxassetid://2454009026"
					textbox.ImageColor3 = library.colors.bottomGradient
					local colored_textbox_ImageColor3 = {textbox, "ImageColor3", "bottomGradient"}
					colored[1 + #colored] = colored_textbox_ImageColor3
					textboxInner.Name = "textboxInner"
					textboxInner.Parent = textbox
					textboxInner.Active = true
					textboxInner.AnchorPoint = Vector2.new(0.5, 0.5)
					textboxInner.BackgroundColor3 = library.colors.topGradient
					colored[1 + #colored] = {textboxInner, "BackgroundColor3", "topGradient"}
					textboxInner.BorderColor3 = library.colors.elementBorder
					colored[1 + #colored] = {textboxInner, "BorderColor3", "elementBorder"}
					textboxInner.Position = UDim2.fromScale(0.5, 0.5)
					textboxInner.Selectable = true
					textboxInner.Size = UDim2.new(1, -4, 1, -4)
					textboxInner.Image = "rbxassetid://2454009026"
					textboxInner.ImageColor3 = library.colors.bottomGradient
					colored[1 + #colored] = {textboxInner, "ImageColor3", "bottomGradient"}
					realTextbox.Name = "realTextbox"
					realTextbox.Parent = textbox
					realTextbox.BackgroundColor3 = Color3.new(1, 1, 1)
					realTextbox.BackgroundTransparency = 1
					realTextbox.Position = UDim2.new(0.0295485705)
					realTextbox.Size = UDim2.fromScale(0.97, 1)
					realTextbox.ZIndex = 5
					realTextbox.ClearTextOnFocus = false
					realTextbox.Font = Enum.Font.Code
					realTextbox.LineHeight = 1.15
					realTextbox.Text = tostring(presetValue)
					realTextbox.TextColor3 = library.colors.otherElementText
					colored[1 + #colored] = {realTextbox, "TextColor3", "otherElementText"}
					realTextbox.TextSize = 14
					realTextbox.PlaceholderText = (presetValue ~= nil and tostring(presetValue)) or ""
					library.signals[1 + #library.signals] = realTextbox.FocusLost:Connect(function()
						local val = realTextbox.Text
						if usetextbox.PreFormat then
							local typ = type(usetextbox.PreFormat)
							if typ == "function" then
								local x, e = pcall(usetextbox.PreFormat, val)
								if not x and e then
									warn("Error in Pre-Format (Textbox " .. flagName .. "):", e)
								else
									val = e
								end
							end
						end
						val = (not usetextbox.Hex and not usetextbox.Binary and not usetextbox.Base and (tonumber(val) or tonumber(val:gsub("%D", ""), 10) or 0)) or tonumber(val, (usetextbox.Hex and 16) or (usetextbox.Binary and 2) or usetextbox.Base or 10) or 0
						if not options.IllegalInput and (options.Max or options.Min) then
							val = math.clamp(val, options.Min or -math.huge, options.Max or math.huge)
						end
						local decimalprecision = tonumber(options.Decimals or options.Precision or options.Precise)
						if decimalprecision then
							val = tonumber(string.format("%0." .. tostring(decimalprecision) .. "f", val))
						end
						if usetextbox.PostFormat then
							local typ = type(usetextbox.PostFormat)
							if typ == "function" then
								local x, e = pcall(usetextbox.PostFormat, val)
								if not x and e then
									warn("Error in Post-Format (Textbox " .. flagName .. "):", e)
								else
									val = e
								end
							end
						end
						Set((val and tonumber(val)) or presetValue or 0)
					end)
					library.signals[1 + #library.signals] = textbox.MouseEnter:Connect(function()
						colored_textbox_BackgroundColor3[3] = "main"
						colored_textbox_BackgroundColor3[4] = 1.5
						colored_textbox_ImageColor3[3] = "main"
						colored_textbox_ImageColor3[4] = 2.5
						tweenService:Create(textbox, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
							BackgroundColor3 = darkenColor(library.colors.main, 1.5),
							ImageColor3 = darkenColor(library.colors.main, 2.5)
						}):Play()
					end)
					library.signals[1 + #library.signals] = textbox.MouseLeave:Connect(function()
						colored_textbox_BackgroundColor3[3] = "topGradient"
						colored_textbox_BackgroundColor3[4] = nil
						colored_textbox_ImageColor3[3] = "bottomGradient"
						colored_textbox_ImageColor3[4] = nil
						tweenService:Create(textbox, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
							BackgroundColor3 = library.colors.topGradient,
							ImageColor3 = library.colors.bottomGradient
						}):Play()
					end)
				end
				sectionFunctions:Update()
				library.signals[1 + #library.signals] = slider.MouseEnter:Connect(function()
					colored_slider_BackgroundColor3[3] = "main"
					colored_slider_BackgroundColor3[4] = 1.5
					colored_slider_ImageColor3[3] = "main"
					colored_slider_ImageColor3[4] = 2.5
					tweenService:Create(slider, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
						BackgroundColor3 = darkenColor(library.colors.main, 1.5),
						ImageColor3 = darkenColor(library.colors.main, 2.5)
					}):Play()
				end)
				library.signals[1 + #library.signals] = slider.MouseLeave:Connect(function()
					colored_slider_BackgroundColor3[3] = "topGradient"
					colored_slider_BackgroundColor3[4] = nil
					colored_slider_ImageColor3[3] = "bottomGradient"
					colored_slider_ImageColor3[4] = nil
					tweenService:Create(slider, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
						BackgroundColor3 = library.colors.topGradient,
						ImageColor3 = library.colors.bottomGradient
					}):Play()
				end)
				local function sliding(input, sb, sc)
					local last_val = library_flags[flagName]
					local pos = UDim2.fromScale(math.clamp((input.Position.X - sb.AbsolutePosition.X) / sb.AbsoluteSize.X, 0, 1), 1)
					tweenService:Create(sc, TweenInfo.new(0.25, library.configuration.easingStyle, library.configuration.easingDirection), {
						Size = pos
					}):Play()
					local sliderValue = nil
					if decimalprecision then
						sliderValue = tonumber(string.format("%0." .. decimalprecision .. "f", ((pos.X.Scale * maxValue) / maxValue) * (maxValue - minValue) + minValue))
					end
					sliderValue = sliderValue or tonumber(string.format("%0.2f", (floor(((pos.X.Scale * maxValue) / maxValue) * (maxValue - minValue) + minValue))))
					library_flags[flagName] = sliderValue
					if options.Location then
						options.Location[options.LocationFlag or flagName] = sliderValue
					end
					sliderHeadline.Text = resolvedisplay(sliderValue, last_val)
					if usetextbox and realTextbox then
						realTextbox.Text = tostring(sliderValue)
					end
					if callback and last_val ~= sliderValue then
						task.spawn(callback, sliderValue, last_val)
					end
					last_val = sliderValue
				end
				library.signals[1 + #library.signals] = newSlider.InputBegan:Connect(function(input)
					if not library.colorpicker and input.UserInputType == Enum.UserInputType.MouseButton1 then
						sliderDragging = true
						isDraggingSomething = true
					end
				end)
				library.signals[1 + #library.signals] = newSlider.InputEnded:Connect(function(input)
					if not library.colorpicker and input.UserInputType == Enum.UserInputType.MouseButton1 then
						sliderDragging = false
						isDraggingSomething = false
					end
				end)
				library.signals[1 + #library.signals] = newSlider.InputBegan:Connect(function(input)
					if not library.colorpicker and not isDraggingSomething and input.UserInputType == Enum.UserInputType.MouseButton1 then
						isDraggingSomething = true
						sliding(input, sliderInner, sliderColored)
					end
				end)
				library.signals[1 + #library.signals] = userInputService.InputChanged:Connect(function(input)
					if not library.colorpicker and sliderDragging and input.UserInputType == Enum.UserInputType.MouseMovement then
						sliding(input, sliderInner, sliderColored)
					end
				end)
				local default = library_flags[flagName]
				local function Update(t, last_val)
					if last_val == nil and t ~= nil and type(t) ~= "table" then
						last_val = t
					end
					sliderName, maxValue, minValue, callback = options.Name or sliderName, options.Max or maxValue, options.Min or minValue, options.Callback
					local newValue = library_flags[flagName]
					do
						local newValue = math.clamp(newValue, options.Min or -math.huge, options.Max or math.huge)
						tweenService:Create(sliderColored, TweenInfo.new(0.25, library.configuration.easingStyle, library.configuration.easingDirection), {
							Size = UDim2.fromScale(((newValue or minValue) - minValue) / (maxValue - minValue), 1)
						}):Play()
					end
					sliderHeadline.Text = resolvedisplay(newValue, last_val)
					if usetextbox and realTextbox then
						realTextbox.Text = tostring(newValue)
					end
					return newValue
				end
				local objectdata = {
					Options = options,
					Name = flagName,
					Flag = flagName,
					Type = "Slider",
					Default = default,
					Parent = sectionFunctions,
					Instance = sliderHeadline,
					Set = Set,
					Get = function()
						return library_flags[flagName]
					end,
					SetConstraints = function(t, min, max)
						if t and type(t) ~= "table" then
							min, max = t, min
						end
						if min then
							options.Min = min
						end
						if max then
							options.Max = max
						end
						Update()
					end,
					SetMin = function(t, min)
						if min == nil and t ~= nil then
							min = t
						end
						if min and min ~= options.Min then
							options.Min = min
							Update()
						end
					end,
					SetMax = function(t, max)
						if max == nil and t ~= nil then
							max = t
						end
						if max and max ~= options.Max then
							options.Max = max
							Update()
						end
					end,
					Update = Update,
					Remove = function()
						if newSlider then
							newSlider.Parent = nil
							sectionFunctions:Update()
						end
					end,
					RawSet = function(t, newValue)
						if nil == newValue and t ~= nil then
							newValue = t
						end
						local last_val = library_flags[flagName]
						library_flags[flagName] = newValue
						if options.Location then
							options.Location[options.LocationFlag or flagName] = newValue
						end
						Update(nil, last_val)
					end,
					Reset = function()
						return Set(nil, default)
					end
				}
				tabFunctions.Flags[flagName], sectionFunctions.Flags[flagName], elements[flagName] = objectdata, objectdata, objectdata
				return objectdata
			end
			sectionFunctions.NewSlider = sectionFunctions.AddSlider
			sectionFunctions.CreateSlider = sectionFunctions.AddSlider
			sectionFunctions.NumberConstraint = sectionFunctions.AddSlider
			sectionFunctions.Slider = sectionFunctions.AddSlider
			sectionFunctions.Slide = sectionFunctions.AddSlider
			function sectionFunctions:AddSearchBox(options, ...)
				options = (options and (type(options) == "string") and resolvevararg("SearchBox", options, ...)) or options
				local dropdownName, listt, val, callback, flagName = assert(options.Name, "Missing Name for new searchbox."), assert(options.List, "Missing List for new searchbox."), options.Value, options.Callback, options.Flag or (function()
					library.unnamedsearchbox = 1 + (library.unnamedsearchbox or 0)
					return "SearchBox" .. tostring(library.unnamedsearchbox)
				end)()
				if elements[flagName] ~= nil then
					warn(debug.traceback("Warning! Re-used flag '" .. flagName .. "'", 3))
				end
				local newDropdown = Instance_new("Frame")
				local dropdown = Instance_new("ImageLabel")
				local dropdownInner = Instance_new("ImageLabel")
				local dropdownToggle = Instance_new("ImageButton")
				local dropdownSelection = Instance_new("TextBox")
				local dropdownHeadline = Instance_new("TextLabel")
				local dropdownHolderFrame = Instance_new("ImageLabel")
				local dropdownHolderInner = Instance_new("ImageLabel")
				local realDropdownHolder = Instance_new("ScrollingFrame")
				local realDropdownHolderList = Instance_new("UIListLayout")
				local dropdownEnabled = false
				local resolvelist = getresolver(listt, options.Filter)
				local list = resolvelist()
				if next(list) then
				else
					local EmptyVal = options.EmptyValue
					if EmptyVal ~= nil then
						table.insert(list, 1, EmptyVal)
					end
				end
				local multiselect = options.MultiSelect or options.Multi or options.Multiple
				local passed_multiselect = multiselect and type(multiselect)
				local blankstring = not multiselect and (options.BlankValue or options.NoValueString or options.Nothing)
				local selectedOption = val or list[1] or blankstring
				local addcallback = options.ItemAdded or options.AddedCallback
				local delcallback = options.ItemRemoved or options.RemovedCallback
				local clrcallback = options.ItemsCleared or options.ClearedCallback
				local modcallback = options.ItemChanged or options.ChangedCallback
				if blankstring and val == nil then
					val = blankstring
				end
				if val ~= nil then
					selectedOption = val
				end
				if multiselect and (not selectedOption or type(selectedOption) ~= "table") then
					selectedOption = {}
				end
				local selectedObjects = {}
				local optionCount = 0
				newDropdown.Name = "newDropdown"
				newDropdown.Parent = sectionHolder
				newDropdown.BackgroundColor3 = Color3.new(1, 1, 1)
				newDropdown.BackgroundTransparency = 1
				newDropdown.Size = UDim2.new(1, 0, 0, 42)
				dropdown.Name = "dropdown"
				dropdown.Parent = newDropdown
				dropdown.Active = true
				dropdown.BackgroundColor3 = library.colors.topGradient
				local colored_dropdown_BackgroundColor3 = {dropdown, "BackgroundColor3", "topGradient"}
				colored[1 + #colored] = colored_dropdown_BackgroundColor3
				dropdown.BorderColor3 = library.colors.elementBorder
				colored[1 + #colored] = {dropdown, "BorderColor3", "elementBorder"}
				dropdown.Position = UDim2.fromScale(0.027, 0.45)
				dropdown.Selectable = true
				dropdown.Size = UDim2.fromOffset(206, 18)
				dropdown.Image = "rbxassetid://2454009026"
				dropdown.ImageColor3 = library.colors.bottomGradient
				local colored_dropdown_ImageColor3 = {dropdown, "ImageColor3", "bottomGradient"}
				colored[1 + #colored] = colored_dropdown_ImageColor3
				dropdownInner.Name = "dropdownInner"
				dropdownInner.Parent = dropdown
				dropdownInner.Active = true
				dropdownInner.AnchorPoint = Vector2.new(0.5, 0.5)
				dropdownInner.BackgroundColor3 = library.colors.topGradient
				colored[1 + #colored] = {dropdownInner, "BackgroundColor3", "topGradient"}
				dropdownInner.BorderColor3 = library.colors.elementBorder
				colored[1 + #colored] = {dropdownInner, "BorderColor3", "elementBorder"}
				dropdownInner.Position = UDim2.fromScale(0.5, 0.5)
				dropdownInner.Selectable = true
				dropdownInner.Size = UDim2.new(1, -4, 1, -4)
				dropdownInner.Image = "rbxassetid://2454009026"
				dropdownInner.ImageColor3 = library.colors.bottomGradient
				colored[1 + #colored] = {dropdownInner, "ImageColor3", "bottomGradient"}
				dropdownToggle.Name = "dropdownToggle"
				dropdownToggle.Parent = dropdown
				dropdownToggle.BackgroundColor3 = Color3.new(1, 1, 1)
				dropdownToggle.BackgroundTransparency = 1
				dropdownToggle.Position = UDim2.fromScale(0.9, 0.17)
				dropdownToggle.Rotation = 90
				dropdownToggle.Size = UDim2.fromOffset(12, 12)
				dropdownToggle.ZIndex = 6
				dropdownToggle.Image = "rbxassetid://71659683"
				dropdownToggle.ImageColor3 = Color3.fromRGB(171, 171, 171)
				dropdownSelection.Name = "dropdownSelection"
				dropdownSelection.Parent = dropdown
				dropdownSelection.BackgroundColor3 = Color3.new(1, 1, 1)
				dropdownSelection.BackgroundTransparency = 1
				dropdownSelection.Position = UDim2.new(0.0295485705)
				dropdownSelection.Size = UDim2.fromScale(0.85, 1)
				dropdownSelection.ZIndex = 5
				dropdownSelection.Font = Enum.Font.Code
				dropdownSelection.LineHeight = 1.15
				dropdownSelection.Text = (passed_multiselect == "string" and multiselect) or tostring((multiselect and (blankstring or "Select Item(s)")) or (selectedOption and tostring(selectedOption)) or blankstring or "No Blank String")
				dropdownSelection.TextColor3 = library.colors.otherElementText
				colored[1 + #colored] = {dropdownSelection, "TextColor3", "otherElementText"}
				dropdownSelection.TextSize = 14
				dropdownSelection.TextXAlignment = Enum.TextXAlignment.Left
				dropdownSelection.ClearTextOnFocus = true
				dropdownHeadline.Name = "dropdownHeadline"
				dropdownHeadline.Parent = newDropdown
				dropdownHeadline.BackgroundColor3 = Color3.new(1, 1, 1)
				dropdownHeadline.BackgroundTransparency = 1
				dropdownHeadline.Position = UDim2.fromScale(0.034, 0.03)
				dropdownHeadline.Size = UDim2.fromOffset(167, 11)
				dropdownHeadline.Font = Enum.Font.Code
				dropdownHeadline.Text = (dropdownName and tostring(dropdownName)) or "???"
				dropdownHeadline.TextColor3 = library.colors.elementText
				colored[1 + #colored] = {dropdownHeadline, "TextColor3", "elementText"}
				dropdownHeadline.TextSize = 14
				dropdownHeadline.TextXAlignment = Enum.TextXAlignment.Left
				dropdownHolderFrame.Name = "dropdownHolderFrame"
				dropdownHolderFrame.Parent = newDropdown
				dropdownHolderFrame.Active = true
				dropdownHolderFrame.BackgroundColor3 = library.colors.topGradient
				colored[1 + #colored] = {dropdownHolderFrame, "BackgroundColor3", "topGradient"}
				dropdownHolderFrame.BorderColor3 = library.colors.elementBorder
				colored[1 + #colored] = {dropdownHolderFrame, "BorderColor3", "elementBorder"}
				dropdownHolderFrame.Position = UDim2.fromScale(0.025, 1.012)
				dropdownHolderFrame.Selectable = true
				dropdownHolderFrame.Size = UDim2.fromOffset(206, 22)
				dropdownHolderFrame.Visible = false
				dropdownHolderFrame.Image = "rbxassetid://2454009026"
				dropdownHolderFrame.ImageColor3 = library.colors.bottomGradient
				colored[1 + #colored] = {dropdownHolderFrame, "ImageColor3", "bottomGradient"}
				dropdownHolderInner.Name = "dropdownHolderInner"
				dropdownHolderInner.Parent = dropdownHolderFrame
				dropdownHolderInner.Active = true
				dropdownHolderInner.AnchorPoint = Vector2.new(0.5, 0.5)
				dropdownHolderInner.BackgroundColor3 = library.colors.topGradient
				colored[1 + #colored] = {dropdownHolderInner, "BackgroundColor3", "topGradient"}
				dropdownHolderInner.BorderColor3 = library.colors.elementBorder
				dropdownHolderInner.Position = UDim2.fromScale(0.5, 0.5)
				dropdownHolderInner.Selectable = true
				dropdownHolderInner.Size = UDim2.new(1, -4, 1, -4)
				dropdownHolderInner.Image = "rbxassetid://2454009026"
				dropdownHolderInner.ImageColor3 = library.colors.bottomGradient
				colored[1 + #colored] = {dropdownHolderInner, "ImageColor3", "bottomGradient"}
				realDropdownHolder.Name = "realDropdownHolder"
				realDropdownHolder.Parent = dropdownHolderInner
				realDropdownHolder.BackgroundColor3 = Color3.new(1, 1, 1)
				realDropdownHolder.BackgroundTransparency = 1
				realDropdownHolder.Selectable = false
				realDropdownHolder.Size = UDim2.fromScale(1, 1)
				realDropdownHolder.CanvasSize = UDim2.new()
				realDropdownHolder.ScrollBarThickness = 5
				realDropdownHolder.ScrollingDirection = Enum.ScrollingDirection.Y
				realDropdownHolder.AutomaticCanvasSize = Enum.AutomaticSize.Y
				realDropdownHolder.ScrollBarImageTransparency = 0.5
				realDropdownHolder.ScrollBarImageColor3 = library.colors.section
				colored[1 + #colored] = {realDropdownHolder, "ScrollBarImageColor3", "section"}
				realDropdownHolderList.Name = "realDropdownHolderList"
				realDropdownHolderList.Parent = realDropdownHolder
				realDropdownHolderList.HorizontalAlignment = Enum.HorizontalAlignment.Center
				realDropdownHolderList.SortOrder = Enum.SortOrder.LayoutOrder
				sectionFunctions:Update()
				local restorezindex = {}
				library.signals[1 + #library.signals] = newDropdown.MouseEnter:Connect(function()
					colored_dropdown_BackgroundColor3[3] = "main"
					colored_dropdown_BackgroundColor3[4] = 1.5
					colored_dropdown_ImageColor3[3] = "main"
					colored_dropdown_ImageColor3[4] = 2.5
					tweenService:Create(dropdown, TweenInfo.new(0.25, library.configuration.easingStyle, library.configuration.easingDirection), {
						BackgroundColor3 = darkenColor(library.colors.main, 1.5),
						ImageColor3 = darkenColor(library.colors.main, 2.5)
					}):Play()
				end)
				library.signals[1 + #library.signals] = newDropdown.MouseLeave:Connect(function()
					if not dropdownEnabled then
						colored_dropdown_BackgroundColor3[3] = "topGradient"
						colored_dropdown_BackgroundColor3[4] = nil
						colored_dropdown_ImageColor3[3] = "bottomGradient"
						colored_dropdown_ImageColor3[4] = nil
						tweenService:Create(dropdown, TweenInfo.new(0.25, library.configuration.easingStyle, library.configuration.easingDirection), {
							BackgroundColor3 = library.colors.topGradient,
							ImageColor3 = library.colors.bottomGradient
						}):Play()
					end
				end)
				local function UpdateDropdownHolder()
					if optionCount >= 6 then
						realDropdownHolder.CanvasSize = UDim2:fromOffset(realDropdownHolderList.AbsoluteContentSize.Y + 2)
					elseif optionCount <= 5 then
						dropdownHolderFrame.Size = UDim2.fromOffset(206, realDropdownHolderList.AbsoluteContentSize.Y + 4)
					end
				end
				local validate = nil
				local SetupValidation = nil
				do
					local Signals = {}
					local Setup = nil
					function SetupValidation()
						for k, v in next, Signals do
							v = v and v:Disconnect()
							Signals[k] = nil
						end
						if options.AutoValidate and list and (typeof(list) == "Instance") then
							local Val = library_flags[flagName] or selectedOption
							if multiselect then
								for _, v in next, Val do
									Setup(v)
								end
							else
								Setup(Val)
							end
						end
					end
					local gpcs = game.GetPropertyChangedSignal
					function Setup(v)
						if typeof(v) == "Instance" then
							local Signal = nil
							Signal = gpcs(v, "Parent"):Connect(function()
								if options.AutoValidate then
									if list and (v.Parent ~= list) then
										Signal = (Signal and Signal:Disconnect() and nil) or nil
										validate()
									end
								else
									for k, v in next, Signals do
										v = v and v:Disconnect()
										Signals[k] = nil
									end
								end
							end)
						end
					end
				end
				local function AddOptions(optionsTable, filter)
					if options.Sort then
						local didstuff, dosort = nil, options.Sort
						if type(dosort) == "function" then
							local g, h = pcall(table.sort, optionsTable, dosort)
							if g then
								didstuff = true
							elseif h then
								warn("Error sorting list:", h, debug.traceback(""))
							end
						end
						if not didstuff then
							table.sort(optionsTable, library.defaultSort)
						end
					end
					if blankstring and (optionsTable[1] ~= blankstring or table.find(optionsTable, blankstring, 2)) then
						local exists = table.find(optionsTable, blankstring)
						if exists then
							for _ = 1, 35 do
								table.remove(optionsTable, exists)
								exists = table.find(optionsTable, blankstring)
								if not exists then
									break
								end
							end
						end
						table.insert(optionsTable, 1, blankstring)
					end
					optionCount = 0
					realDropdownHolderList.Parent = nil
					realDropdownHolder:ClearAllChildren()
					realDropdownHolderList.Parent = realDropdownHolder
					for _, v in next, optionsTable do
						if not filter or tostring(v):lower():find(dropdownSelection.Text:lower(), 1, not options.RegEx) then
							optionCount = optionCount + 1
							UpdateDropdownHolder()
							local newOption = Instance_new("ImageLabel")
							local optionButton = Instance_new("TextButton")
							if selectedOption == v then
								selectedObjects[1] = newOption
								selectedObjects[2] = optionButton
							end
							newOption.Name = "Frame"
							newOption.Parent = realDropdownHolder
							local togged = (not multiselect and selectedOption == v) or (multiselect and table.find(selectedOption, v))
							newOption.BackgroundColor3 = (togged and library.colors.selectedOption) or library.colors.topGradient
							newOption.BorderSizePixel = 0
							newOption.Size = UDim2.fromOffset(202, 18)
							newOption.Image = "rbxassetid://2454009026"
							newOption.ImageColor3 = (togged and library.colors.unselectedOption) or library.colors.bottomGradient
							local stringed = tostring(v)
							optionButton.Name = stringed
							optionButton.Parent = newOption
							optionButton.Active = true
							optionButton.AnchorPoint = Vector2.new(0.5, 0.5)
							optionButton.BackgroundColor3 = Color3.new(1, 1, 1)
							optionButton.BackgroundTransparency = 1
							optionButton.Position = UDim2.fromScale(0.5, 0.5)
							optionButton.Selectable = true
							optionButton.Size = UDim2.new(1, -10, 1)
							optionButton.ZIndex = 5
							optionButton.Font = Enum.Font.Code
							optionButton.Text = (togged and (" " .. stringed)) or stringed
							optionButton.TextColor3 = (togged and library.colors.main) or library.colors.otherElementText
							optionButton.TextSize = 14
							optionButton.TextXAlignment = Enum.TextXAlignment.Left
							library.signals[1 + #library.signals] = optionButton[(multiselect and "MouseButton1Click") or "MouseButton1Down"]:Connect(function()
								if not library.colorpicker then
									dropdownSelection.Text = (passed_multiselect == "string" and multiselect) or tostring(blankstring or "Select Item(s)")
									restorezindex[newSection] = restorezindex[newSection] or newSection.ZIndex
									restorezindex[newDropdown] = restorezindex[newDropdown] or newDropdown.ZIndex
									restorezindex[sectionHolder] = restorezindex[sectionHolder] or sectionHolder.ZIndex
									if multiselect then
										local cloned = {unpack(selectedOption)}
										local togged = table.find(selectedOption, v)
										if togged then
											table.remove(selectedOption, togged)
										else
											selectedOption[1 + #selectedOption] = v
										end
										togged = table.find(selectedOption, v)
										optionButton.Text = (togged and (" " .. stringed)) or stringed
										newOption.BackgroundColor3 = (togged and library.colors.selectedOption) or library.colors.topGradient
										newOption.ImageColor3 = (togged and library.colors.unselectedOption) or library.colors.bottomGradient
										optionButton.TextColor3 = (togged and library.colors.main) or library.colors.otherElementText
										if callback then
											task.spawn(callback, selectedOption, cloned)
										end
										if togged then
											if addcallback then
												task.spawn(addcallback, v, selectedOption)
											end
										elseif delcallback then
											task.spawn(delcallback, v, selectedOption)
										end
										if modcallback then
											task.spawn(modcallback, v, togged, selectedOption)
										end
										if #selectedOption == 0 and clrcallback then
											task.spawn(clrcallback, selectedOption, cloned)
										end
										return
									else
										dropdownSelection.Text = stringed
										if selectedOption ~= v then
											local last_v = library_flags[flagName]
											do
												local First = selectedObjects[1]
												if First then
													selectedObjects[1].BackgroundColor3 = library.colors.topGradient
													selectedObjects[1].ImageColor3 = library.colors.bottomGradient
												end
											end
											do
												local Second = selectedObjects[2]
												if Second then
													selectedObjects[2].Text = selectedObjects[2].Name
													selectedObjects[2].TextColor3 = library.colors.otherElementText
												end
											end
											selectedOption = v
											selectedObjects[1] = newOption
											selectedObjects[2] = optionButton
											newOption.BackgroundColor3 = library.colors.selectedOption
											newOption.ImageColor3 = library.colors.unselectedOption
											optionButton.TextColor3 = library.colors.main
											dropdownHolderFrame.Visible = false
											dropdownToggle.Rotation = 90
											dropdownEnabled = false
											newDropdown.ZIndex = 1
											colored_dropdown_BackgroundColor3[3] = "topGradient"
											colored_dropdown_BackgroundColor3[4] = nil
											colored_dropdown_ImageColor3[3] = "bottomGradient"
											colored_dropdown_ImageColor3[4] = nil
											tweenService:Create(dropdown, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
												BackgroundColor3 = library.colors.topGradient,
												ImageColor3 = library.colors.bottomGradient
											}):Play()
											library_flags[flagName] = selectedOption
											if options.Location then
												options.Location[options.LocationFlag or flagName] = selectedOption
											end
											dropdownSelection.Text = tostring(selectedOption)
											if submenuOpen then
												submenuOpen = nil
											end
											if callback then
												task.spawn(callback, selectedOption, last_v)
											end
										else
											submenuOpen = nil
											dropdownToggle.Rotation = 90
											colored_dropdown_BackgroundColor3[3] = "topGradient"
											colored_dropdown_BackgroundColor3[4] = nil
											colored_dropdown_ImageColor3[3] = "bottomGradient"
											colored_dropdown_ImageColor3[4] = nil
											tweenService:Create(dropdown, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
												BackgroundColor3 = library.colors.topGradient,
												ImageColor3 = library.colors.bottomGradient
											}):Play()
											dropdownHolderFrame.Visible = false
										end
									end
									for ins, z in next, restorezindex do
										ins.ZIndex = z
									end
								end
							end)
							library.signals[1 + #library.signals] = optionButton.MouseEnter:Connect(function()
								tweenService:Create(newOption, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
									BackgroundColor3 = library.colors.hoveredOptionTop,
									ImageColor3 = library.colors.hoveredOptionBottom
								}):Play()
							end)
							library.signals[1 + #library.signals] = optionButton.MouseLeave:Connect(function()
								local togged = (not multiselect and selectedOption == v) or (multiselect and table.find(selectedOption, v))
								tweenService:Create(newOption, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
									BackgroundColor3 = (togged and library.colors.selectedOption) or library.colors.topGradient,
									ImageColor3 = (togged and library.colors.unselectedOption) or library.colors.bottomGradient
								}):Play()
							end)
							UpdateDropdownHolder()
						end
					end
				end
				local precisionscrolling, update = nil
				local showing = false
				local function display(dropdownEnabled, f)
					if submenuOpen == dropdown or submenuOpen == nil then
						if dropdownEnabled then
							list = resolvelist()
							if next(list) then
							else
								local EmptyVal = options.EmptyValue
								if EmptyVal ~= nil then
									table.insert(list, 1, EmptyVal)
								end
							end
							AddOptions(list, f)
							submenuOpen = dropdown
							dropdownToggle.Rotation = 270
							restorezindex[newSection] = restorezindex[newSection] or newSection.ZIndex
							restorezindex[newDropdown] = restorezindex[newDropdown] or newDropdown.ZIndex
							restorezindex[sectionHolder] = restorezindex[sectionHolder] or sectionHolder.ZIndex
							newSection.ZIndex = 50 + newSection.ZIndex
							newDropdown.ZIndex = 2
							sectionHolder.ZIndex = 2
							colored_dropdown_BackgroundColor3[3] = "main"
							colored_dropdown_BackgroundColor3[4] = 1.5
							colored_dropdown_ImageColor3[3] = "main"
							colored_dropdown_ImageColor3[4] = 2.5
							tweenService:Create(dropdown, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
								BackgroundColor3 = darkenColor(library.colors.main, 1.5),
								ImageColor3 = darkenColor(library.colors.main, 2.5)
							}):Play()
							dropdownHolderFrame.Visible = true
							if not options.DisablePrecisionScrolling then
								local scrollrate = tonumber(options.ScrollButtonRate or options.ScrollRate) or 5
								local upkey = options.ScrollUpButton or library.scrollupbutton or shared.scrollupbutton or Enum.KeyCode.Up
								local downkey = options.ScrollDownButton or library.scrolldownbutton or shared.scrolldownbutton or Enum.KeyCode.Down
								precisionscrolling = (precisionscrolling and precisionscrolling:Disconnect() and nil) or userInputService.InputBegan:Connect(function(input)
									if input.UserInputType == Enum.UserInputType.Keyboard then
										local code = input.KeyCode
										local isup = code == upkey
										local isdown = code == downkey
										if isup or isdown then
											local txt = userInputService:GetFocusedTextBox()
											if not txt or txt == dropdownSelection then
												while wait_check() and userInputService:IsKeyDown(code) do
													realDropdownHolder.CanvasPosition = Vector2:new(math.clamp(realDropdownHolder.CanvasPosition.Y + ((isup and -scrollrate) or scrollrate), 0, realDropdownHolder.AbsoluteCanvasSize.Y))
												end
											end
										end
									end
								end)
								library.signals[1 + #library.signals] = precisionscrolling
							end
						else
							submenuOpen = nil
							dropdownToggle.Rotation = 90
							colored_dropdown_BackgroundColor3[3] = "topGradient"
							colored_dropdown_BackgroundColor3[4] = nil
							colored_dropdown_ImageColor3[3] = "bottomGradient"
							colored_dropdown_ImageColor3[4] = nil
							tweenService:Create(dropdown, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
								BackgroundColor3 = library.colors.topGradient,
								ImageColor3 = library.colors.bottomGradient
							}):Play()
							dropdownHolderFrame.Visible = false
							for ins, z in next, restorezindex do
								ins.ZIndex = z
							end
							precisionscrolling = (precisionscrolling and precisionscrolling:Disconnect() and nil) or nil
						end
					end
					showing = dropdownEnabled
					if showing or dropdownEnabled then
					else
						delay(0.01, update)
					end
				end
				local Set = (multiselect and function(t, dat)
					if nil == dat and t ~= nil then
						dat = t
					end
					local lastv = library_flags[flagName]
					if not lastv or selectedOption ~= lastv then
						if lastv and type(lastv) == "table" then
							selectedOption = library_flags[flagName]
						else
							library_flags[flagName] = selectedOption
						end
						warn("Attempting to use new table for", flagName, " Please use :Set(), because setting it through flags table may cause errors", debug.traceback(""))
						lastv = library_flags[flagName]
					end
					local cloned = {unpack(selectedOption)}
					if not dat then
						if #selectedOption ~= 0 then
							table.clear(selectedOption)
							if callback then
								task.spawn(callback, selectedOption, cloned)
							end
						end
						return selectedOption
					elseif type(dat) ~= "table" then
						warn("Expected table for argument #1 on Set for MultiSelect searchbox. Got", dat, debug.traceback(""))
						return selectedOption
					end
					for k = table.pack(unpack(dat)).n, 1, -1 do
						if dat[k] == nil then
							table.remove(dat, k)
						end
					end
					local proceed = #cloned ~= #dat
					table.clear(selectedOption)
					for k, v in next, dat do
						selectedOption[k] = v
						if not proceed and cloned[k] ~= v then
							proceed = 1
						end
					end
					dropdownSelection.Text = (passed_multiselect == "string" and multiselect) or tostring(blankstring or "Select Item(s)")
					if proceed and callback then
						task.spawn(callback, selectedOption, cloned)
					end
					if options.AutoValidate then
						SetupValidation()
					end
					return selectedOption
				end) or function(t, str)
					if nil == str and t then
						str = t
					end
					local last_v = library_flags[flagName]
					selectedOption = str
					library_flags[flagName] = str
					if options.Location then
						options.Location[options.LocationFlag or flagName] = str
					end
					local sstr = (selectedOption and tostring(selectedOption)) or blankstring or "No Blank String"
					if dropdownSelection.Text ~= sstr then
						dropdownSelection.Text = sstr
					end
					if callback and (last_v ~= str or options.AllowDuplicateCalls) then
						task.spawn(callback, str, last_v)
					end
					if options.AutoValidate then
						SetupValidation()
					end
					return str
				end
				if val ~= nil then
					Set(val)
				else
					library_flags[flagName] = selectedOption
					if options.Location then
						options.Location[options.LocationFlag or flagName] = selectedOption
					end
					if options.AutoValidate then
						SetupValidation()
					end
				end
				library.signals[1 + #library.signals] = dropdownToggle.MouseButton1Click:Connect(function()
					showing = not showing
					display(showing)
				end)
				library.signals[1 + #library.signals] = dropdownSelection.Focused:Connect(function()
					showing = true
					display(true)
				end)
				library.signals[1 + #library.signals] = dropdownSelection:GetPropertyChangedSignal("Text"):Connect(function()
					if showing then
						display(true, #dropdownSelection.Text > 0)
					end
				end)
				if not multiselect then
					library.signals[1 + #library.signals] = dropdownSelection.FocusLost:Connect(function(b)
						if showing then
							wait()
						end
						showing = false
						display(false)
						if b then
							Set(dropdownSelection.Text)
						end
					end)
				end
				AddOptions(list)
				local default = library_flags[flagName]
				function update()
					dropdownName, callback = options.Name or dropdownName, options.Callback
					local sstr = (passed_multiselect == "string" and multiselect) or (not multiselect and library_flags[flagName] and tostring(library_flags[flagName])) or (not multiselect and selectedOption and tostring(selectedOption)) or blankstring or "Nothing"
					if dropdownSelection.Text ~= sstr then
						dropdownSelection.Text = sstr
					end
					dropdownHeadline.Text = (dropdownName and tostring(dropdownName)) or "???"
					return sstr
				end
				function validate(fallbackValue)
					if list and table.find(list, library_flags[flagName]) then
						update()
						return true
					end
					if fallbackValue ~= nil then
						if fallbackValue == "__DEFAULT" then
							fallbackValue = default
						end
					else
						fallbackValue = list[1]
					end
					if multiselect and type(fallbackValue) ~= "table" then
						fallbackValue = {fallbackValue}
					end
					return Set(fallbackValue)
				end
				local objectdata = {
					Options = options,
					Name = flagName,
					Flag = flagName,
					Type = "SearchBox",
					Default = default,
					Parent = sectionFunctions,
					Instance = dropdownSelection,
					Validate = validate,
					Set = Set,
					Remove = function()
						if newDropdown then
							newDropdown.Parent = nil
							sectionFunctions:Update()
						end
					end,
					RawSet = ((multiselect and function(t, dat)
						if nil == dat and t ~= nil then
							dat = t
						end
						local lastv = library_flags[flagName]
						if not lastv or selectedOption ~= lastv then
							if lastv and type(lastv) == "table" then
								selectedOption = library_flags[flagName]
							else
								library_flags[flagName] = selectedOption
							end
							warn("Attempting to use new table for", flagName, " Please use :Set(), as setting through flags table may cause errors", debug.traceback(""))
							lastv = library_flags[flagName]
						end
						local cloned = {unpack(selectedOption)}
						if not dat then
							if #selectedOption ~= 0 then
								table.clear(selectedOption)
								if callback then
									task.spawn(callback, selectedOption, cloned)
								end
							end
							return selectedOption
						elseif type(dat) ~= "table" then
							warn("Expected table for argument #1 on Set for MultiSelect searchbox. Got", dat, debug.traceback(""))
							return selectedOption
						end
						for k = table.pack(unpack(dat)).n, 1, -1 do
							if dat[k] == nil then
								table.remove(dat, k)
							end
						end
						local proceed = #cloned ~= #dat
						table.clear(selectedOption)
						for k, v in next, dat do
							selectedOption[k] = v
							if not proceed and cloned[k] ~= v then
								proceed = 1
							end
						end
						update()
						return selectedOption
					end) or function(t, str)
						if nil == str and t then
							str = t
						end
						selectedOption = str
						library_flags[flagName] = str
						if options.Location then
							options.Location[options.LocationFlag or flagName] = str
						end
						update()
						return str
					end),
					Get = function()
						return library_flags[flagName]
					end,
					Update = update,
					Reset = function()
						return Set(nil, default)
					end
				}
				function objectdata.UpdateList(t, listt, updateValues)
					if (nil == listt and t ~= nil) or (type(t) == "table" and type(listt) ~= "table") then
						listt, updateValues = t, listt
					end
					if listt == objectdata then
						listt = nil
					end
					resolvelist = getresolver(listt or options.List, options.Filter, options.Method)
					list = resolvelist()
					if next(list) then
					else
						local EmptyVal = options.EmptyValue
						if EmptyVal ~= nil then
							table.insert(list, 1, EmptyVal)
						end
					end
					if updateValues then
						validate()
					end
					if showing then
						display(false)
						display(true)
					end
					return list
				end
				tabFunctions.Flags[flagName], sectionFunctions.Flags[flagName], elements[flagName] = objectdata, objectdata, objectdata
				return objectdata
			end
			sectionFunctions.NewSearchBox = sectionFunctions.AddSearchBox
			sectionFunctions.CreateSearchBox = sectionFunctions.AddSearchBox
			sectionFunctions.SearchBox = sectionFunctions.AddSearchBox
			sectionFunctions.CreateSearchbox = sectionFunctions.AddSearchBox
			sectionFunctions.NewSearchbox = sectionFunctions.AddSearchBox
			sectionFunctions.Searchbox = sectionFunctions.AddSearchBox
			sectionFunctions.Sbox = sectionFunctions.AddSearchBox
			sectionFunctions.SBox = sectionFunctions.AddSearchBox
			if isfolder and makefolder and listfiles and readfile and writefile then
				function sectionFunctions:AddPersistence(options, ...)
					options = (options and type(options) == "string" and resolvevararg("Tab", options, ...)) or options
					local dropdownName, custom_workspace, val, persistiveflags, suffix, callback, loadcallback, savecallback, postload, postsave, flagName = assert(options.Name, "Missing Name for new persistence."), options.Workspace or library.WorkspaceName, options.Value, options.Persistive or options.Flags or "all", options.Suffix, options.Callback, options.LoadCallback, options.SaveCallback, options.PostLoadCallback, options.PostSaveCallback, options.Flag or (function()
						library.unnamedpersistence = 1 + (library.unnamedpersistence or 0)
						return "Persistence" .. tostring(library.unnamedpersistence)
					end)()
					if elements[flagName] ~= nil then
						warn(debug.traceback("Warning! Re-used flag '" .. flagName .. "'", 3))
					end
					local designerpersists = options.Desginer
					local newDropdown = Instance_new("Frame")
					local dropdown = Instance_new("ImageLabel")
					local dropdownInner = Instance_new("ImageLabel")
					local dropdownToggle = Instance_new("ImageButton")
					local dropdownSelection = Instance_new("TextBox")
					local dropdownHeadline = Instance_new("TextLabel")
					local dropdownHolderFrame = Instance_new("ImageLabel")
					local dropdownHolderInner = Instance_new("ImageLabel")
					local realDropdownHolder = Instance_new("ScrollingFrame")
					local realDropdownHolderList = Instance_new("UIListLayout")
					local dropdownEnabled = false
					if not isfolder("./Pepsi Lib") then
						makefolder("./Pepsi Lib")
					end
					local common_string = "./Pepsi Lib/" .. tostring(custom_workspace or library.WorkspaceName)
					local function resolvelist(nofold)
						if custom_workspace ~= options.Workspace then
							custom_workspace = options.Workspace
							common_string = "./Pepsi Lib/" .. tostring(custom_workspace or library.WorkspaceName)
						end
						if not isfolder or not makefolder or not listfiles then
							return {}
						end
						if not isfolder(common_string) then
							if nofold then
								return {}
							end
							makefolder(common_string)
						end
						assert(isfolder(common_string), "Couldn't create folder: " .. tostring(library.WorkspaceName or "No workspace name?"))
						local names, files = {}, listfiles(common_string)
						if #files > 0 then
							local len = #common_string + 2
							for _, f in next, files do
								names[1 + #names] = string.sub(f, len, -5)
							end
							table.sort(names)
						end
						return names
					end
					local list = resolvelist(true)
					local blankstring = options.BlankValue or options.NoValueString or options.Nothing
					local selectedObjects = {}
					local optionCount = 0
					if blankstring and val == nil then
						val = blankstring
					end
					local selectedOption = val or blankstring or list[1]
					newDropdown.Name = "newDropdown"
					newDropdown.Parent = sectionHolder
					newDropdown.BackgroundColor3 = Color3.new(1, 1, 1)
					newDropdown.BackgroundTransparency = 1
					newDropdown.Size = UDim2.new(1, 0, 0, 42)
					dropdown.Name = "dropdown"
					dropdown.Parent = newDropdown
					dropdown.Active = true
					dropdown.BackgroundColor3 = library.colors.topGradient
					local colored_dropdown_BackgroundColor3 = {dropdown, "BackgroundColor3", "topGradient"}
					colored[1 + #colored] = colored_dropdown_BackgroundColor3
					dropdown.BorderColor3 = library.colors.elementBorder
					colored[1 + #colored] = {dropdown, "BorderColor3", "elementBorder"}
					dropdown.Position = UDim2.fromScale(0.027, 0.45)
					dropdown.Selectable = true
					dropdown.Size = UDim2.fromOffset(206, 18)
					dropdown.Image = "rbxassetid://2454009026"
					dropdown.ImageColor3 = library.colors.bottomGradient
					local colored_dropdown_ImageColor3 = {dropdown, "ImageColor3", "bottomGradient"}
					colored[1 + #colored] = colored_dropdown_ImageColor3
					dropdownInner.Name = "dropdownInner"
					dropdownInner.Parent = dropdown
					dropdownInner.Active = true
					dropdownInner.AnchorPoint = Vector2.new(0.5, 0.5)
					dropdownInner.BackgroundColor3 = library.colors.topGradient
					colored[1 + #colored] = {dropdownInner, "BackgroundColor3", "topGradient"}
					dropdownInner.BorderColor3 = library.colors.elementBorder
					colored[1 + #colored] = {dropdownInner, "BorderColor3", "elementBorder"}
					dropdownInner.Position = UDim2.fromScale(0.5, 0.5)
					dropdownInner.Selectable = true
					dropdownInner.Size = UDim2.new(1, -4, 1, -4)
					dropdownInner.Image = "rbxassetid://2454009026"
					dropdownInner.ImageColor3 = library.colors.bottomGradient
					colored[1 + #colored] = {dropdownInner, "ImageColor3", "bottomGradient"}
					dropdownToggle.Name = "dropdownToggle"
					dropdownToggle.Parent = dropdown
					dropdownToggle.BackgroundColor3 = Color3.new(1, 1, 1)
					dropdownToggle.BackgroundTransparency = 1
					dropdownToggle.Position = UDim2.fromScale(0.9, 0.17)
					dropdownToggle.Rotation = 90
					dropdownToggle.Size = UDim2.fromOffset(12, 12)
					dropdownToggle.ZIndex = 2
					dropdownToggle.Image = "rbxassetid://71659683"
					dropdownToggle.ImageColor3 = Color3.fromRGB(171, 171, 171)
					dropdownSelection.Name = "dropdownSelection"
					dropdownSelection.Parent = dropdown
					dropdownSelection.BackgroundColor3 = Color3.new(1, 1, 1)
					dropdownSelection.BackgroundTransparency = 1
					dropdownSelection.Position = UDim2.new(0.0295485705)
					dropdownSelection.Size = UDim2.fromScale(0.97, 1)
					dropdownSelection.ZIndex = 5
					dropdownSelection.Font = Enum.Font.Code
					dropdownSelection.LineHeight = 1.15
					dropdownSelection.Text = (selectedOption and tostring(selectedOption)) or "nil"
					dropdownSelection.TextColor3 = library.colors.otherElementText
					colored[1 + #colored] = {dropdownSelection, "TextColor3", "otherElementText"}
					dropdownSelection.TextSize = 14
					dropdownSelection.TextXAlignment = Enum.TextXAlignment.Left
					dropdownHeadline.Name = "dropdownHeadline"
					dropdownHeadline.Parent = newDropdown
					dropdownHeadline.BackgroundColor3 = Color3.new(1, 1, 1)
					dropdownHeadline.BackgroundTransparency = 1
					dropdownHeadline.Position = UDim2.fromScale(0.034, 0.03)
					dropdownHeadline.Size = UDim2.fromOffset(167, 11)
					dropdownHeadline.Font = Enum.Font.Code
					dropdownHeadline.Text = (dropdownName and tostring(dropdownName)) or "???"
					dropdownHeadline.TextColor3 = library.colors.elementText
					colored[1 + #colored] = {dropdownHeadline, "TextColor3", "elementText"}
					dropdownHeadline.TextSize = 14
					dropdownHeadline.TextXAlignment = Enum.TextXAlignment.Left
					dropdownHolderFrame.Name = "dropdownHolderFrame"
					dropdownHolderFrame.Parent = newDropdown
					dropdownHolderFrame.Active = true
					dropdownHolderFrame.BackgroundColor3 = library.colors.topGradient
					colored[1 + #colored] = {dropdownHolderFrame, "BackgroundColor3", "topGradient"}
					dropdownHolderFrame.BorderColor3 = library.colors.elementBorder
					colored[1 + #colored] = {dropdownHolderFrame, "BorderColor3", "elementBorder"}
					dropdownHolderFrame.Position = UDim2.fromScale(0.025, 1.012)
					dropdownHolderFrame.Selectable = true
					dropdownHolderFrame.Size = UDim2.fromOffset(206, 22)
					dropdownHolderFrame.Visible = false
					dropdownHolderFrame.Image = "rbxassetid://2454009026"
					dropdownHolderFrame.ImageColor3 = library.colors.bottomGradient
					colored[1 + #colored] = {dropdownHolderFrame, "ImageColor3", "bottomGradient"}
					dropdownHolderInner.Name = "dropdownHolderInner"
					dropdownHolderInner.Parent = dropdownHolderFrame
					dropdownHolderInner.Active = true
					dropdownHolderInner.AnchorPoint = Vector2.new(0.5, 0.5)
					dropdownHolderInner.BackgroundColor3 = library.colors.topGradient
					colored[1 + #colored] = {dropdownHolderInner, "BackgroundColor3", "topGradient"}
					dropdownHolderInner.BorderColor3 = library.colors.elementBorder
					colored[1 + #colored] = {dropdownHolderInner, "BorderColor3", "elementBorder"}
					dropdownHolderInner.Position = UDim2.fromScale(0.5, 0.5)
					dropdownHolderInner.Selectable = true
					dropdownHolderInner.Size = UDim2.new(1, -4, 1, -4)
					dropdownHolderInner.Image = "rbxassetid://2454009026"
					dropdownHolderInner.ImageColor3 = library.colors.bottomGradient
					colored[1 + #colored] = {dropdownHolderInner, "ImageColor3", "bottomGradient"}
					realDropdownHolder.Name = "realDropdownHolder"
					realDropdownHolder.Parent = dropdownHolderInner
					realDropdownHolder.BackgroundColor3 = Color3.new(1, 1, 1)
					realDropdownHolder.BackgroundTransparency = 1
					realDropdownHolder.Selectable = false
					realDropdownHolder.Size = UDim2.fromScale(1, 1)
					realDropdownHolder.CanvasSize = UDim2.new()
					realDropdownHolder.ScrollBarThickness = 5
					realDropdownHolder.ScrollingDirection = Enum.ScrollingDirection.Y
					realDropdownHolder.AutomaticCanvasSize = Enum.AutomaticSize.Y
					realDropdownHolder.ScrollBarImageTransparency = 0.5
					realDropdownHolder.ScrollBarImageColor3 = library.colors.section
					colored[1 + #colored] = {realDropdownHolder, "ScrollBarImageColor3", "section"}
					realDropdownHolderList.Name = "realDropdownHolderList"
					realDropdownHolderList.Parent = realDropdownHolder
					realDropdownHolderList.HorizontalAlignment = Enum.HorizontalAlignment.Center
					realDropdownHolderList.SortOrder = Enum.SortOrder.LayoutOrder
					sectionFunctions:Update()
					library.signals[1 + #library.signals] = newDropdown.MouseEnter:Connect(function()
						colored_dropdown_BackgroundColor3[3] = "main"
						colored_dropdown_BackgroundColor3[4] = 1.5
						colored_dropdown_ImageColor3[3] = "main"
						colored_dropdown_ImageColor3[4] = 2.5
						tweenService:Create(dropdown, TweenInfo.new(0.25, library.configuration.easingStyle, library.configuration.easingDirection), {
							BackgroundColor3 = darkenColor(library.colors.main, 1.5),
							ImageColor3 = darkenColor(library.colors.main, 2.5)
						}):Play()
					end)
					library.signals[1 + #library.signals] = newDropdown.MouseLeave:Connect(function()
						if not dropdownEnabled then
							colored_dropdown_BackgroundColor3[3] = "topGradient"
							colored_dropdown_BackgroundColor3[4] = nil
							colored_dropdown_ImageColor3[3] = "bottomGradient"
							colored_dropdown_ImageColor3[4] = nil
							tweenService:Create(dropdown, TweenInfo.new(0.25, library.configuration.easingStyle, library.configuration.easingDirection), {
								BackgroundColor3 = library.colors.topGradient,
								ImageColor3 = library.colors.bottomGradient
							}):Play()
						end
					end)
					local restorezindex = {}
					local function UpdateDropdownHolder()
						if optionCount >= 6 then
							realDropdownHolder.CanvasSize = UDim2:fromOffset(realDropdownHolderList.AbsoluteContentSize.Y + 2)
						elseif optionCount <= 5 then
							dropdownHolderFrame.Size = UDim2.fromOffset(206, (realDropdownHolderList.AbsoluteContentSize.Y + 4))
						end
					end
					local function AddOptions(optionsTable, filter)
						if options.Sort then
							local didstuff, dosort = nil, options.Sort
							if type(dosort) == "function" then
								local g, h = pcall(table.sort, optionsTable, dosort)
								if g then
									didstuff = true
								elseif h then
									warn("Error sorting list:", h, debug.traceback(""))
								end
							end
							if not didstuff then
								table.sort(optionsTable, library.defaultSort)
							end
						end
						if blankstring and (optionsTable[1] ~= blankstring or table.find(optionsTable, blankstring, 2)) then
							local exists = table.find(optionsTable, blankstring)
							if exists then
								for _ = 1, 35 do
									table.remove(optionsTable, exists)
									exists = table.find(optionsTable, blankstring)
									if not exists then
										break
									end
								end
							end
							table.insert(optionsTable, 1, blankstring)
						end
						optionCount = 0
						realDropdownHolderList.Parent = nil
						realDropdownHolder:ClearAllChildren()
						realDropdownHolderList.Parent = realDropdownHolder
						for _, v in next, optionsTable do
							if not filter or tostring(v):lower():find(dropdownSelection.Text:lower(), 1, true) then
								optionCount = optionCount + 1
								UpdateDropdownHolder()
								local newOption = Instance_new("ImageLabel")
								local optionButton = Instance_new("TextButton")
								if selectedOption == v or not selectedObjects[1] or not selectedObjects[2] then
									selectedObjects[1] = newOption
									selectedObjects[2] = optionButton
								end
								newOption.Name = "Frame"
								newOption.Parent = realDropdownHolder
								newOption.BackgroundColor3 = (selectedOption == v and library.colors.selectedOption or library.colors.topGradient)
								newOption.BorderSizePixel = 0
								newOption.Size = UDim2.fromOffset(202, 18)
								newOption.Image = "rbxassetid://2454009026"
								newOption.ImageColor3 = (selectedOption == v and library.colors.unselectedOption or library.colors.bottomGradient)
								optionButton.Name = tostring(v)
								optionButton.Parent = newOption
								optionButton.AnchorPoint = Vector2.new(0.5, 0.5)
								optionButton.BackgroundColor3 = Color3.new(1, 1, 1)
								optionButton.BackgroundTransparency = 1
								optionButton.Position = UDim2.fromScale(0.5, 0.5)
								optionButton.Size = UDim2.new(1, -10, 1)
								optionButton.ZIndex = 5
								optionButton.Font = Enum.Font.Code
								optionButton.Text = (selectedOption == v and " " .. tostring(v)) or tostring(v)
								optionButton.TextColor3 = (selectedOption == v and library.colors.main or library.colors.otherElementText)
								optionButton.TextSize = 14
								optionButton.TextXAlignment = Enum.TextXAlignment.Left
								library.signals[1 + #library.signals] = optionButton.MouseButton1Down:Connect(function()
									dropdownSelection.Text = tostring(v)
									restorezindex[newSection] = restorezindex[newSection] or newSection.ZIndex
									restorezindex[newDropdown] = restorezindex[newDropdown] or newDropdown.ZIndex
									restorezindex[sectionHolder] = restorezindex[sectionHolder] or sectionHolder.ZIndex
									if selectedOption ~= v then
										local last_v = library_flags[flagName]
										selectedObjects[1].BackgroundColor3 = library.colors.topGradient
										selectedObjects[1].ImageColor3 = library.colors.bottomGradient
										selectedObjects[2].Text = selectedObjects[2].Name
										selectedObjects[2].TextColor3 = library.colors.otherElementText
										selectedOption = v
										selectedObjects[1] = newOption
										selectedObjects[2] = optionButton
										newOption.BackgroundColor3 = library.colors.selectedOption
										newOption.ImageColor3 = library.colors.unselectedOption
										optionButton.TextColor3 = library.colors.main
										dropdownHolderFrame.Visible = false
										dropdownToggle.Rotation = 90
										dropdownEnabled = false
										colored_dropdown_BackgroundColor3[3] = "topGradient"
										colored_dropdown_BackgroundColor3[4] = nil
										colored_dropdown_ImageColor3[3] = "bottomGradient"
										colored_dropdown_ImageColor3[4] = nil
										tweenService:Create(dropdown, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
											BackgroundColor3 = library.colors.topGradient,
											ImageColor3 = library.colors.bottomGradient
										}):Play()
										library_flags[flagName] = selectedOption
										if options.Location then
											options.Location[options.LocationFlag or flagName] = selectedOption
										end
										dropdownSelection.Text = tostring(selectedOption)
										if submenuOpen then
											submenuOpen = nil
										end
										if callback then
											task.spawn(callback, selectedOption, last_v)
										end
									else
										submenuOpen = nil
										dropdownToggle.Rotation = 90
										newDropdown.ZIndex = 1
										sectionHolder.ZIndex = 1
										colored_dropdown_BackgroundColor3[3] = "topGradient"
										colored_dropdown_BackgroundColor3[4] = nil
										colored_dropdown_ImageColor3[3] = "bottomGradient"
										colored_dropdown_ImageColor3[4] = nil
										tweenService:Create(dropdown, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
											BackgroundColor3 = library.colors.topGradient,
											ImageColor3 = library.colors.bottomGradient
										}):Play()
										dropdownHolderFrame.Visible = false
									end
									for ins, z in next, restorezindex do
										ins.ZIndex = z
									end
								end)
								library.signals[1 + #library.signals] = optionButton.MouseEnter:Connect(function()
									tweenService:Create(newOption, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
										BackgroundColor3 = library.colors.hoveredOptionTop,
										ImageColor3 = library.colors.hoveredOptionBottom
									}):Play()
								end)
								library.signals[1 + #library.signals] = optionButton.MouseLeave:Connect(function()
									tweenService:Create(newOption, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
										BackgroundColor3 = library.colors.unhoveredOptionTop,
										ImageColor3 = library.colors.unhoveredOptionBottom
									}):Play()
								end)
								UpdateDropdownHolder()
							end
						end
					end
					local precisionscrolling, update = nil
					local showing = false
					local function display(dropdownEnabled, f)
						if submenuOpen == dropdown or submenuOpen == nil then
							if dropdownEnabled then
								list = resolvelist(true)
								AddOptions(list, f)
								submenuOpen = dropdown
								restorezindex[newSection] = restorezindex[newSection] or newSection.ZIndex
								restorezindex[newDropdown] = restorezindex[newDropdown] or newDropdown.ZIndex
								restorezindex[sectionHolder] = restorezindex[sectionHolder] or sectionHolder.ZIndex
								newSection.ZIndex = 50 + newSection.ZIndex
								dropdownToggle.Rotation = 270
								newDropdown.ZIndex = 2
								sectionHolder.ZIndex = 2
								colored_dropdown_BackgroundColor3[3] = "main"
								colored_dropdown_BackgroundColor3[4] = 1.5
								colored_dropdown_ImageColor3[3] = "main"
								colored_dropdown_ImageColor3[4] = 2.5
								tweenService:Create(dropdown, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
									BackgroundColor3 = darkenColor(library.colors.main, 1.5),
									ImageColor3 = darkenColor(library.colors.main, 2.5)
								}):Play()
								dropdownHolderFrame.Visible = true
								if not options.DisablePrecisionScrolling then
									local upkey = options.ScrollUpButton or library.scrollupbutton or shared.scrollupbutton or Enum.KeyCode.Up
									local downkey = options.ScrollDownButton or library.scrolldownbutton or shared.scrolldownbutton or Enum.KeyCode.Down
									precisionscrolling = (precisionscrolling and precisionscrolling:Disconnect() and nil) or userInputService.InputBegan:Connect(function(input)
										if input.UserInputType == Enum.UserInputType.Keyboard then
											local code = input.KeyCode
											local isup = code == upkey
											local isdown = code == downkey
											if isup or isdown then
												local txt = userInputService:GetFocusedTextBox()
												if not txt then
													while wait_check() and userInputService:IsKeyDown(code) do
														realDropdownHolder.CanvasPosition = Vector2:new(math.clamp(realDropdownHolder.CanvasPosition.Y + ((isup and -5) or 5), 0, realDropdownHolder.AbsoluteCanvasSize.Y))
													end
												end
											end
										end
									end)
									library.signals[1 + #library.signals] = precisionscrolling
								end
							else
								submenuOpen = nil
								dropdownToggle.Rotation = 90
								colored_dropdown_BackgroundColor3[3] = "topGradient"
								colored_dropdown_BackgroundColor3[4] = nil
								colored_dropdown_ImageColor3[3] = "bottomGradient"
								colored_dropdown_ImageColor3[4] = nil
								tweenService:Create(dropdown, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
									BackgroundColor3 = library.colors.topGradient,
									ImageColor3 = library.colors.bottomGradient
								}):Play()
								dropdownHolderFrame.Visible = false
								for ins, z in next, restorezindex do
									ins.ZIndex = z
								end
								precisionscrolling = (precisionscrolling and precisionscrolling:Disconnect() and nil) or nil
							end
							showing = dropdownEnabled
							if showing or dropdownEnabled then
							else
								delay(0.01, update)
							end
						end
					end
					local last_v = nil
					local function Set(t, str)
						if nil == str and t then
							str = t
						end
						selectedOption = str
						last_v = library_flags[flagName]
						library_flags[flagName] = str
						if options.Location then
							options.Location[options.LocationFlag or flagName] = str
						end
						local sstr = (selectedOption and tostring(selectedOption)) or blankstring or "No Blank String"
						if dropdownSelection.Text ~= sstr then
							dropdownSelection.Text = sstr
						end
						if callback and (last_v ~= str or options.AllowDuplicateCalls) then
							task.spawn(callback, str, last_v)
						end
						return str
					end
					if val ~= nil then
						Set(val)
					else
						Set("Filename")
					end
					library.signals[1 + #library.signals] = dropdownSelection.Focused:Connect(function()
						showing = true
						display(true)
					end)
					library.signals[1 + #library.signals] = dropdownSelection:GetPropertyChangedSignal("Text"):Connect(function()
						if showing then
							display(true, #dropdownSelection.Text > 0)
						end
					end)
					library.signals[1 + #library.signals] = dropdownSelection.FocusLost:Connect(function(b)
						if showing then
							wait()
						end
						showing = false
						display(false)
						if b then
							Set(dropdownSelection.Text)
						end
					end)
					AddOptions(list)
					local function savestuff(s, get)
						if not s or type(s) ~= "string" then
							s = nil
						end
						local rawfile = "json__save"
						if not get then
							local filenameddst = string.gsub(s or dropdownSelection.Text or "", "%W", "")
							if #filenameddst == 0 then
								return
							end
							rawfile = string.format("%s/%s.txt", common_string, filenameddst)
						end
						if savecallback then
							local x, e = pcall(savecallback, rawfile, library_flags[flagName])
							if not x and e then
								warn("Error while calling the Pre-Save callback:", e, debug.traceback(""))
							end
						end
						local working_with = {}
						if persistiveflags == 1 or persistiveflags == true or persistiveflags == "*" then
							persistiveflags = "all"
						elseif persistiveflags == 2 then
							persistiveflags = "tab"
						elseif persistiveflags == 3 then
							persistiveflags = "section"
						end
						if persistiveflags == "all" or persistiveflags == "tab" or persistiveflags == "section" then
							for cflag, data in next, (persistiveflags == "all" and elements) or (persistiveflags == "tab" and tabFunctions.Flags) or (persistiveflags == "section" and sectionFunctions.Flags) do
								if data.Type ~= "Persistence" and (designerpersists or string.sub(cflag, 1, 11) ~= "__Designer.") then
									working_with[cflag] = data
								end
							end
						elseif type(persistiveflags) == "table" then
							if #persistiveflags > 0 then
								local inverted = persistiveflags[0] == false or persistiveflags.Inverted
								for k, cflag in next, persistiveflags do
									if k > 0 then
										local data = elements[cflag]
										if data and data.Type ~= "Persistence" and (designerpersists or string.sub(cflag, 1, 11) ~= "__Designer.") then
											working_with[cflag] = (not inverted and data) or nil
										end
									end
								end
							else
								for cflag, persists in next, elements do
									if persists and (designerpersists or string.sub(cflag, 1, 11) ~= "__Designer.") then
										local data = elements[cflag]
										if data then
											working_with[cflag] = data
										end
									end
								end
							end
						end
						local saving = {}
						for cflag in next, working_with do
							local value = library_flags[cflag]
							local good, jval = nil, nil
							if value ~= nil then
								good, jval = JSONEncode(value)
							else
								good, jval = true, "null"
							end
							if not good or (jval == "null" and value ~= nil) then
								local typ = typeof(value)
								if typ == "Color3" then
									value = (library.rainbowflags[cflag] and "rainbow") or Color3ToHex(value)
								end
								value = tostring(value)
								good, jval = JSONEncode(value)
								if not good or (jval == "null" and value ~= nil) then
									warn("Could not save value:", value, debug.traceback(""))
								end
							end
							if good and jval then
								saving[cflag] = value
							end
						end
						local ret = nil
						local good, content = JSONEncode(saving)
						if good and content then
							if not get then
								if not isfolder(common_string) then
									makefolder(common_string)
								end
								writefile(rawfile, content)
							else
								ret = content
							end
						end
						if postsave then
							local x, e = pcall(postsave, rawfile, library_flags[flagName])
							if not x and e then
								warn("Error while calling the Post-Save callback:", e, debug.traceback(""))
							end
						end
						return ret
					end
					local function loadstuff(s, jsonmode, silent)
						if not s or type(s) ~= "string" then
							s = nil
						end
						local filename = "json__load"
						if not jsonmode then
							local filenameddst = convertfilename(s or dropdownSelection.Text, nil, "")
							if #filenameddst == 0 then
								return
							end
							filename = string.format("%s/%s.txt", common_string, filenameddst)
						end
						if loadcallback then
							local x, e = pcall(loadcallback, (jsonmode and s) or filename, library_flags[flagName])
							if not x and e then
								warn("Error while calling the Pre-Load callback:", e, debug.traceback(""))
							end
						end
						if jsonmode or not isfile or isfile(filename) then
							local content = (jsonmode and s) or (not jsonmode and readfile(filename))
							if content and #content > 1 then
								local good, jcontent = JSONDecode(content)
								if good and jcontent then
									for cflag, val in next, jcontent do
										if val and type(val) == "string" and #val > 7 and #val < 64 and string.sub(val, 1, 5) == "Enum." then
											local e = string.find(val, ".", 6, true)
											if e then
												local en = Enum[string.sub(val, 6, e - 1)]
												en = en and en[string.sub(val, e + 1)]
												if en then
													val = en
												else
													warn("Tried & failed to convert '" .. val .. "' to EnumItem")
												end
											end
										end
										local data = elements[cflag]
										if data and data.Type ~= "Persistence" then
											if silent and data.RawSet then
												data:RawSet(val)
											elseif data.Set then
												data:Set(val)
											else
												library_flags[cflag] = val
											end
										end
									end
								end
							end
						end
						if postload then
							local x, e = pcall(postload, filename, library_flags[flagName])
							if not x and e then
								warn("Error while calling the Post-Load callback:", e, debug.traceback(""))
							end
						end
					end
					local fram = nil
					do
						local buttons, offset = {}, 0
						for _, options in next, {{
							Name = "Save" .. ((suffix and (" " .. tostring(suffix))) or ""),
							Callback = savestuff
							}, {
								Name = "Load" .. ((suffix and (" " .. tostring(suffix))) or ""),
								Callback = loadstuff
							}} do
							local buttonName, callback = options.Name, options.Callback
							local realButton = Instance_new("TextButton")
							realButton.Name = "realButton"
							realButton.BackgroundColor3 = Color3.new(1, 1, 1)
							realButton.BackgroundTransparency = 1
							realButton.Size = UDim2.fromScale(1, 1)
							realButton.ZIndex = 5
							realButton.Font = Enum.Font.Code
							realButton.Text = (buttonName and tostring(buttonName)) or "???"
							realButton.TextColor3 = library.colors.elementText
							colored[1 + #colored] = {realButton, "TextColor3", "elementText"}
							realButton.TextSize = 14
							local textsize = textToSize(realButton).X + 14
							if newSection.Parent and (newSection.Parent.AbsoluteSize.X < (offset + textsize + 8)) then
								offset, fram = 0, nil
							end
							local newButton = fram or Instance_new("Frame")
							fram = newButton
							local button = Instance_new("ImageLabel")
							newButton.Name = removeSpaces((buttonName and buttonName:lower() or "???") .. "Holder")
							newButton.Parent = sectionHolder
							newButton.BackgroundColor3 = Color3.new(1, 1, 1)
							newButton.BackgroundTransparency = 1
							newButton.Size = UDim2.new(1, 0, 0, 24)
							button.Name = "button"
							button.Parent = newButton
							button.Active = true
							button.BackgroundColor3 = library.colors.topGradient
							local colored_button_BackgroundColor3 = {button, "BackgroundColor3", "topGradient"}
							colored[1 + #colored] = colored_button_BackgroundColor3
							button.BorderColor3 = library.colors.elementBorder
							colored[1 + #colored] = {button, "BorderColor3", "elementBorder"}
							button.Position = UDim2.new(0.031, offset, 0.166)
							button.Selectable = true
							button.Size = UDim2.fromOffset(28, 18)
							button.Image = "rbxassetid://2454009026"
							button.ImageColor3 = library.colors.bottomGradient
							local colored_button_ImageColor3 = {button, "ImageColor3", "bottomGradient"}
							colored[1 + #colored] = colored_button_ImageColor3
							local buttonInner = Instance_new("ImageLabel")
							buttonInner.Name = "buttonInner"
							buttonInner.Parent = button
							buttonInner.Active = true
							buttonInner.AnchorPoint = Vector2.new(0.5, 0.5)
							buttonInner.BackgroundColor3 = library.colors.topGradient
							colored[1 + #colored] = {buttonInner, "BackgroundColor3", "topGradient"}
							buttonInner.BorderColor3 = library.colors.elementBorder
							colored[1 + #colored] = {buttonInner, "BorderColor3", "elementBorder"}
							buttonInner.Position = UDim2.fromScale(0.5, 0.5)
							buttonInner.Selectable = true
							buttonInner.Size = UDim2.new(1, -4, 1, -4)
							buttonInner.Image = "rbxassetid://2454009026"
							buttonInner.ImageColor3 = library.colors.bottomGradient
							colored[1 + #colored] = {buttonInner, "ImageColor3", "bottomGradient"}
							button.Size = UDim2.fromOffset(textsize, 18)
							realButton.Parent = button
							offset = offset + textsize + 6
							sectionFunctions:Update()
							local presses = 0
							library.signals[1 + #library.signals] = realButton.MouseButton1Click:Connect(function()
								if not library.colorpicker and not submenuOpen then
									presses = 1 + presses
									task.spawn(callback, presses)
								end
							end)
							library.signals[1 + #library.signals] = button.MouseEnter:Connect(function()
								colored_button_BackgroundColor3[3] = "main"
								colored_button_BackgroundColor3[4] = 1.5
								colored_button_ImageColor3[3] = "main"
								colored_button_ImageColor3[4] = 2.5
								tweenService:Create(button, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
									BackgroundColor3 = darkenColor(library.colors.main, 1.5),
									ImageColor3 = darkenColor(library.colors.main, 2.5)
								}):Play()
							end)
							library.signals[1 + #library.signals] = button.MouseLeave:Connect(function()
								colored_button_BackgroundColor3[3] = "topGradient"
								colored_button_BackgroundColor3[4] = nil
								colored_button_ImageColor3[3] = "bottomGradient"
								colored_button_ImageColor3[4] = nil
								tweenService:Create(button, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
									BackgroundColor3 = library.colors.topGradient,
									ImageColor3 = library.colors.bottomGradient
								}):Play()
							end)
						end
					end
					local default = library_flags[flagName]
					function update()
						dropdownName, custom_workspace, persistiveflags, suffix, callback, loadcallback, savecallback, postload, postsave = options.Name or dropdownName, options.Workspace or library.WorkspaceName, options.Persistive or options.Flags or "all", options.Suffix, options.Callback, options.LoadCallback, options.SaveCallback, options.PostLoadCallback, options.PostSaveCallback
						local sstr = tostring(library_flags[flagName])
						if dropdownSelection.Text ~= sstr then
							dropdownSelection.Text = sstr
						end
						dropdownHeadline.Text = (dropdownName and tostring(dropdownName)) or "???"
						return sstr
					end
					local objectdata = {
						Options = options,
						Name = flagName,
						Flag = flagName,
						Type = "Persistence",
						Default = default,
						Parent = sectionFunctions,
						Instance = dropdownSelection,
						Set = Set,
						Remove = function()
							local relod = nil
							if newDropdown then
								newDropdown.Parent = nil
								relod = true
							end
							if fram then
								fram.Parent = nil
								relod = true
							end
							if relod then
								sectionFunctions:Update()
							end
						end,
						SaveFile = function(t, str, ret)
							if t ~= nil and type(t) ~= "table" then
								str, ret = t, str
							end
							if type(str) == "string" then
								str = str:match("(.+)%..+$") or str
							end
							return savestuff(str, ret)
						end,
						LoadFile = function(t, str, jsonmode)
							if t ~= nil and type(t) ~= "table" then
								str, jsonmode = t, str
							end
							if isfile and isfile(str) then
								return loadstuff(readfile(str), true)
							elseif not jsonmode and type(str) == "string" then
								str = str:match("(.+)%..+$") or str
							end
							return loadstuff(str, jsonmode)
						end,
						LoadJSON = function(_, json)
							return loadstuff(json, true)
						end,
						LoadFileRaw = function(t, str, jsonmode)
							if t ~= nil and type(t) ~= "table" then
								str, jsonmode = t, str
							end
							if isfile and isfile(str) then
								return loadstuff(readfile(str), true, true)
							elseif not jsonmode and type(str) == "string" then
								str = str:match("(.+)%..+$") or str
							end
							return loadstuff(str, jsonmode, true)
						end,
						LoadJSONRaw = function(_, json)
							return loadstuff(json, true, true)
						end,
						GetJSON = function(t, clipboard)
							if nil == clipboard and t ~= nil then
								clipboard = t
							end
							local json = savestuff(nil, true)
							local clipfunc = (clipboard and type(clipboard) == "function" and clipboard) or setclipboard
							if clipboard and clipfunc then
								clipfunc(json)
							end
							return json
						end,
						RawSet = function(t, str)
							if nil == str and t ~= nil then
								str = t
							end
							selectedOption = str
							last_v = library_flags[flagName]
							library_flags[flagName] = str
							if options.Location then
								options.Location[options.LocationFlag or flagName] = str
							end
							update()
							return str
						end,
						Get = function()
							return library_flags[flagName]
						end,
						Update = update,
						Reset = function()
							return Set(nil, default)
						end
					}
					tabFunctions.Flags[flagName], sectionFunctions.Flags[flagName], elements[flagName] = objectdata, objectdata, objectdata
					return objectdata
				end
			else
				function sectionFunctions.AddPersistence()
					if not library.warnedpersistance then
						library.warnedpersistance = 1
						warn(debug.traceback("Persistance not supported"))
					end
					function sectionFunctions.AddPersistence()
					end
				end
			end
			sectionFunctions.NewPersistence = sectionFunctions.AddPersistence
			sectionFunctions.CreatePersistence = sectionFunctions.AddPersistence
			sectionFunctions.Persistence = sectionFunctions.AddPersistence
			sectionFunctions.CreateSaveLoad = sectionFunctions.AddPersistence
			sectionFunctions.SaveLoad = sectionFunctions.AddPersistence
			sectionFunctions.SL = sectionFunctions.AddPersistence
			function sectionFunctions:AddDropdown(options, ...)
				options = (options and type(options) == "string" and resolvevararg("Dropdown", options, ...)) or options
				local dropdownName, listt, val, callback, flagName = assert(options.Name, "Missing Name for new searchbox."), assert(options.List, "Missing List for new searchbox."), options.Value, options.Callback, options.Flag or (function()
					library.unnameddropdown = 1 + (library.unnameddropdown or 0)
					return "Dropdown" .. tostring(library.unnameddropdown)
				end)()
				if elements[flagName] ~= nil then
					warn(debug.traceback("Warning! Re-used flag '" .. flagName .. "'", 3))
				end
				local newDropdown = Instance_new("Frame")
				local dropdown = Instance_new("ImageLabel")
				local dropdownInner = Instance_new("ImageLabel")
				local dropdownToggle = Instance_new("ImageButton")
				local dropdownSelection = Instance_new("TextLabel")
				local dropdownHeadline = Instance_new("TextLabel")
				local dropdownHolderFrame = Instance_new("ImageLabel")
				local dropdownHolderInner = Instance_new("ImageLabel")
				local realDropdownHolder = Instance_new("ScrollingFrame")
				local realDropdownHolderList = Instance_new("UIListLayout")
				local dropdownEnabled = false
				local multiselect = options.MultiSelect or options.Multi or options.Multiple
				local addcallback = options.ItemAdded or options.AddedCallback
				local delcallback = options.ItemRemoved or options.RemovedCallback
				local clrcallback = options.ItemsCleared or options.ClearedCallback
				local modcallback = options.ItemChanged or options.ChangedCallback
				local blankstring = not multiselect and (options.BlankValue or options.NoValueString or options.Nothing)
				local resolvelist = getresolver(listt, options.Filter, options.Method)
				local list = resolvelist()
				if next(list) then
				else
					local EmptyVal = options.EmptyValue
					if EmptyVal ~= nil then
						table.insert(list, 1, EmptyVal)
					end
				end
				local selectedOption = list[1]
				local passed_multiselect = multiselect and type(multiselect)
				if blankstring and val == nil then
					val = blankstring
				end
				if val ~= nil then
					selectedOption = val
				end
				if multiselect and (not selectedOption or type(selectedOption) ~= "table") then
					selectedOption = {}
				end
				local selectedObjects = {}
				local optionCount = 0
				newDropdown.Name = "newDropdown"
				newDropdown.Parent = sectionHolder
				newDropdown.BackgroundColor3 = Color3.new(1, 1, 1)
				newDropdown.BackgroundTransparency = 1
				newDropdown.Size = UDim2.new(1, 0, 0, 42)
				dropdown.Name = "dropdown"
				dropdown.Parent = newDropdown
				dropdown.Active = true
				dropdown.BackgroundColor3 = library.colors.topGradient
				local colored_dropdown_BackgroundColor3 = {dropdown, "BackgroundColor3", "topGradient"}
				colored[1 + #colored] = colored_dropdown_BackgroundColor3
				dropdown.BorderColor3 = library.colors.elementBorder
				colored[1 + #colored] = {dropdown, "BorderColor3", "elementBorder"}
				dropdown.Position = UDim2.fromScale(0.027, 0.45)
				dropdown.Selectable = true
				dropdown.Size = UDim2.fromOffset(206, 18)
				dropdown.Image = "rbxassetid://2454009026"
				dropdown.ImageColor3 = library.colors.bottomGradient
				local colored_dropdown_ImageColor3 = {dropdown, "ImageColor3", "bottomGradient"}
				colored[1 + #colored] = colored_dropdown_ImageColor3
				dropdownInner.Name = "dropdownInner"
				dropdownInner.Parent = dropdown
				dropdownInner.Active = true
				dropdownInner.AnchorPoint = Vector2.new(0.5, 0.5)
				dropdownInner.BackgroundColor3 = library.colors.topGradient
				colored[1 + #colored] = {dropdownInner, "BackgroundColor3", "topGradient"}
				dropdownInner.BorderColor3 = library.colors.elementBorder
				colored[1 + #colored] = {dropdownInner, "BorderColor3", "elementBorder"}
				dropdownInner.Position = UDim2.fromScale(0.5, 0.5)
				dropdownInner.Selectable = true
				dropdownInner.Size = UDim2.new(1, -4, 1, -4)
				dropdownInner.Image = "rbxassetid://2454009026"
				dropdownInner.ImageColor3 = library.colors.bottomGradient
				colored[1 + #colored] = {dropdownInner, "ImageColor3", "bottomGradient"}
				dropdownToggle.Name = "dropdownToggle"
				dropdownToggle.Parent = dropdown
				dropdownToggle.BackgroundColor3 = Color3.new(1, 1, 1)
				dropdownToggle.BackgroundTransparency = 1
				dropdownToggle.Position = UDim2.fromScale(0.9, 0.17)
				dropdownToggle.Rotation = 90
				dropdownToggle.Size = UDim2.fromOffset(12, 12)
				dropdownToggle.ZIndex = 2
				dropdownToggle.Image = "rbxassetid://71659683"
				dropdownToggle.ImageColor3 = Color3.fromRGB(171, 171, 171)
				dropdownSelection.Name = "dropdownSelection"
				dropdownSelection.Parent = dropdown
				dropdownSelection.Active = true
				dropdownSelection.BackgroundColor3 = Color3.new(1, 1, 1)
				dropdownSelection.BackgroundTransparency = 1
				dropdownSelection.Position = UDim2.new(0.0295)
				dropdownSelection.Selectable = true
				dropdownSelection.Size = UDim2.fromScale(0.97, 1)
				dropdownSelection.ZIndex = 5
				dropdownSelection.Font = Enum.Font.Code
				dropdownSelection.Text = (passed_multiselect == "string" and multiselect) or (multiselect and tostring(blankstring or "Select Item(s)")) or (selectedOption and tostring(selectedOption)) or tostring(blankstring or "No Blank String")
				dropdownSelection.TextColor3 = library.colors.otherElementText
				colored[1 + #colored] = {dropdownSelection, "TextColor3", "otherElementText"}
				dropdownSelection.TextSize = 14
				dropdownSelection.TextXAlignment = Enum.TextXAlignment.Left
				dropdownHeadline.Name = "dropdownHeadline"
				dropdownHeadline.Parent = newDropdown
				dropdownHeadline.BackgroundColor3 = Color3.new(1, 1, 1)
				dropdownHeadline.BackgroundTransparency = 1
				dropdownHeadline.Position = UDim2.fromScale(0.034, 0.03)
				dropdownHeadline.Size = UDim2.fromOffset(167, 11)
				dropdownHeadline.Font = Enum.Font.Code
				dropdownHeadline.Text = (dropdownName and tostring(dropdownName)) or "???"
				dropdownHeadline.TextColor3 = library.colors.elementText
				colored[1 + #colored] = {dropdownHeadline, "TextColor3", "elementText"}
				dropdownHeadline.TextSize = 14
				dropdownHeadline.TextXAlignment = Enum.TextXAlignment.Left
				dropdownHolderFrame.Name = "dropdownHolderFrame"
				dropdownHolderFrame.Parent = newDropdown
				dropdownHolderFrame.Active = true
				dropdownHolderFrame.BackgroundColor3 = library.colors.topGradient
				colored[1 + #colored] = {dropdownHolderFrame, "BackgroundColor3", "topGradient"}
				dropdownHolderFrame.BorderColor3 = library.colors.elementBorder
				colored[1 + #colored] = {dropdownHolderFrame, "BorderColor3", "elementBorder"}
				dropdownHolderFrame.Position = UDim2.fromScale(0.025, 1.012)
				dropdownHolderFrame.Selectable = true
				dropdownHolderFrame.Size = UDim2.fromOffset(206, 22)
				dropdownHolderFrame.Visible = false
				dropdownHolderFrame.Image = "rbxassetid://2454009026"
				dropdownHolderFrame.ImageColor3 = library.colors.bottomGradient
				colored[1 + #colored] = {dropdownHolderFrame, "ImageColor3", "bottomGradient"}
				dropdownHolderInner.Name = "dropdownHolderInner"
				dropdownHolderInner.Parent = dropdownHolderFrame
				dropdownHolderInner.Active = true
				dropdownHolderInner.AnchorPoint = Vector2.new(0.5, 0.5)
				dropdownHolderInner.BackgroundColor3 = library.colors.topGradient
				colored[1 + #colored] = {dropdownHolderInner, "BackgroundColor3", "topGradient"}
				dropdownHolderInner.BorderColor3 = library.colors.elementBorder
				colored[1 + #colored] = {dropdownHolderInner, "BorderColor3", "elementBorder"}
				dropdownHolderInner.Position = UDim2.fromScale(0.5, 0.5)
				dropdownHolderInner.Selectable = true
				dropdownHolderInner.Size = UDim2.new(1, -4, 1, -4)
				dropdownHolderInner.Image = "rbxassetid://2454009026"
				dropdownHolderInner.ImageColor3 = library.colors.bottomGradient
				colored[1 + #colored] = {dropdownHolderInner, "ImageColor3", "bottomGradient"}
				realDropdownHolder.Name = "realDropdownHolder"
				realDropdownHolder.Parent = dropdownHolderInner
				realDropdownHolder.BackgroundColor3 = Color3.new(1, 1, 1)
				realDropdownHolder.BackgroundTransparency = 1
				realDropdownHolder.Selectable = false
				realDropdownHolder.Size = UDim2.fromScale(1, 1)
				realDropdownHolder.CanvasSize = UDim2.new()
				realDropdownHolder.ScrollBarThickness = 5
				realDropdownHolder.ScrollingDirection = Enum.ScrollingDirection.Y
				realDropdownHolder.AutomaticCanvasSize = Enum.AutomaticSize.Y
				realDropdownHolder.ScrollBarImageTransparency = 0.5
				realDropdownHolder.ScrollBarImageColor3 = library.colors.section
				colored[1 + #colored] = {realDropdownHolder, "ScrollBarImageColor3", "section"}
				realDropdownHolderList.Name = "realDropdownHolderList"
				realDropdownHolderList.Parent = realDropdownHolder
				realDropdownHolderList.HorizontalAlignment = Enum.HorizontalAlignment.Center
				realDropdownHolderList.SortOrder = Enum.SortOrder.LayoutOrder
				sectionFunctions:Update()
				local showing = false
				local function UpdateDropdownHolder()
					if optionCount >= 6 then
						realDropdownHolder.CanvasSize = UDim2:fromOffset(realDropdownHolderList.AbsoluteContentSize.Y + 2)
					elseif optionCount <= 5 then
						dropdownHolderFrame.Size = UDim2.fromOffset(206, realDropdownHolderList.AbsoluteContentSize.Y + 4)
					end
				end
				local validate = nil
				local SetupValidation = nil
				do
					local Signals = {}
					local Setup = nil
					function SetupValidation()
						for k, v in next, Signals do
							v = v and v:Disconnect()
							Signals[k] = nil
						end
						if options.AutoValidate and list and (typeof(list) == "Instance") then
							local Val = library_flags[flagName] or selectedOption
							if multiselect then
								for _, v in next, Val do
									Setup(v)
								end
							else
								Setup(Val)
							end
						end
					end
					local gpcs = game.GetPropertyChangedSignal
					function Setup(v)
						if typeof(v) == "Instance" then
							local Signal = nil
							Signal = gpcs(v, "Parent"):Connect(function()
								if options.AutoValidate then
									if list and (v.Parent ~= list) then
										Signal = (Signal and Signal:Disconnect() and nil) or nil
										validate()
									end
								else
									for k, v in next, Signals do
										v = v and v:Disconnect()
										Signals[k] = nil
									end
								end
							end)
						end
					end
				end
				local restorezindex = {}
				local Set = (multiselect and function(t, dat)
					if nil == dat and t ~= nil then
						dat = t
					end
					local lastv = library_flags[flagName]
					if not lastv or selectedOption ~= lastv then
						if lastv and type(lastv) == "table" then
							selectedOption = library_flags[flagName]
						else
							library_flags[flagName] = selectedOption
						end
						warn("Attempting to use new table for", flagName, " Please use :Set(), as setting through flags table may cause errors", debug.traceback(""))
						lastv = library_flags[flagName]
					end
					local cloned = {unpack(selectedOption)}
					if not dat then
						if #selectedOption ~= 0 then
							table.clear(selectedOption)
							if callback then
								task.spawn(callback, selectedOption, cloned)
							end
						end
						return selectedOption
					elseif type(dat) ~= "table" then
						warn("Expected table for argument #1 on Set for MultiSelect dropdown. Got", dat, debug.traceback(""))
						return selectedOption
					end
					for k = table.pack(unpack(dat)).n, 1, -1 do
						if dat[k] == nil then
							table.remove(dat, k)
						end
					end
					local proceed = #cloned ~= #dat
					table.clear(selectedOption)
					for k, v in next, dat do
						selectedOption[k] = v
						if not proceed and cloned[k] ~= v then
							proceed = 1
						end
					end
					dropdownSelection.Text = (passed_multiselect == "string" and multiselect) or tostring(blankstring or "Select Item(s)")
					if proceed and callback then
						task.spawn(callback, selectedOption, cloned)
					end
					if options.AutoValidate then
						SetupValidation()
					end
					return selectedOption
				end) or function(t, str)
					if nil == str and t ~= nil then
						str = t
					end
					local last_v = library_flags[flagName]
					selectedOption = str
					library_flags[flagName] = str
					if options.Location then
						options.Location[options.LocationFlag or flagName] = str
					end
					local sstr = (selectedOption and tostring(selectedOption)) or blankstring or "No Blank String"
					if dropdownSelection.Text ~= sstr then
						dropdownSelection.Text = sstr
					end
					if callback and (last_v ~= str or options.AllowDuplicateCalls) then
						task.spawn(callback, str, last_v)
					end
					if options.AutoValidate then
						SetupValidation()
					end
					return str
				end
				if val ~= nil then
					Set(val)
				else
					library_flags[flagName] = selectedOption
					if options.Location then
						options.Location[options.LocationFlag or flagName] = selectedOption
					end
					if options.AutoValidate then
						SetupValidation()
					end
				end
				local function AddOptions(optionsTable)
					if options.Sort then
						local didstuff, dosort = nil, options.Sort
						if type(dosort) == "function" then
							local g, h = pcall(table.sort, optionsTable, dosort)
							if g then
								didstuff = true
							elseif h then
								warn("Error sorting list:", h, debug.traceback(""))
							end
						elseif (dosort ~= 1) and (dosort ~= true) then
							warn("Potential mistake for passed Sort argument:", dosort, debug.traceback(""))
						end
						if not didstuff then
							table.sort(optionsTable, library.defaultSort)
						end
					end
					if blankstring and ((optionsTable[1] ~= blankstring) or table.find(optionsTable, blankstring, 2)) then
						local exists = table.find(optionsTable, blankstring)
						if exists then
							for _ = 1, 35 do
								table.remove(optionsTable, exists)
								exists = table.find(optionsTable, blankstring)
								if not exists then
									break
								end
							end
						end
						table.insert(optionsTable, 1, blankstring)
					end
					optionCount = 0
					realDropdownHolderList.Parent = nil
					realDropdownHolder:ClearAllChildren()
					realDropdownHolderList.Parent = realDropdownHolder
					for _, v in next, optionsTable do
						optionCount = optionCount + 1
						local newOption = Instance_new("ImageLabel")
						local optionButton = Instance_new("TextButton")
						if selectedOption == v then
							selectedObjects[1] = newOption
							selectedObjects[2] = optionButton
						end
						newOption.Name = "Frame"
						newOption.Parent = realDropdownHolder
						local togged = (not multiselect and selectedOption == v) or (multiselect and table.find(selectedOption, v))
						newOption.BackgroundColor3 = (togged and library.colors.selectedOption) or library.colors.topGradient
						newOption.BorderSizePixel = 0
						newOption.Size = UDim2.fromOffset(202, 18)
						newOption.Image = "rbxassetid://2454009026"
						newOption.ImageColor3 = (togged and library.colors.unselectedOption) or library.colors.bottomGradient
						local stringed = tostring(v)
						optionButton.Name = stringed
						optionButton.Parent = newOption
						optionButton.AnchorPoint = Vector2.new(0.5, 0.5)
						optionButton.BackgroundColor3 = Color3.new(1, 1, 1)
						optionButton.BackgroundTransparency = 1
						optionButton.Position = UDim2.fromScale(0.5, 0.5)
						optionButton.Size = UDim2.new(1, -10, 1)
						optionButton.ZIndex = 5
						optionButton.Font = Enum.Font.Code
						optionButton.Text = (togged and (" " .. stringed)) or stringed
						optionButton.TextColor3 = (togged and library.colors.main) or library.colors.otherElementText
						optionButton.TextSize = 14
						optionButton.TextXAlignment = Enum.TextXAlignment.Left
						library.signals[1 + #library.signals] = optionButton.MouseButton1Click:Connect(function()
							if not library.colorpicker then
								restorezindex[newSection] = restorezindex[newSection] or newSection.ZIndex
								restorezindex[newDropdown] = restorezindex[newDropdown] or newDropdown.ZIndex
								restorezindex[sectionHolder] = restorezindex[sectionHolder] or sectionHolder.ZIndex
								if multiselect then
									local cloned = {unpack(selectedOption)}
									local togged = table.find(selectedOption, v)
									if togged then
										table.remove(selectedOption, togged)
									else
										selectedOption[1 + #selectedOption] = v
									end
									togged = table.find(selectedOption, v)
									optionButton.Text = (togged and (" " .. stringed)) or stringed
									newOption.BackgroundColor3 = (togged and library.colors.selectedOption) or library.colors.topGradient
									newOption.ImageColor3 = (togged and library.colors.unselectedOption) or library.colors.bottomGradient
									optionButton.TextColor3 = (togged and library.colors.main) or library.colors.otherElementText
									dropdownSelection.Text = (passed_multiselect == "string" and multiselect) or tostring(blankstring or "Select Item(s)")
									if callback then
										task.spawn(callback, selectedOption, cloned)
									end
									if togged then
										if addcallback then
											task.spawn(addcallback, v, selectedOption)
										end
									elseif delcallback then
										task.spawn(delcallback, v, selectedOption)
									end
									if modcallback then
										task.spawn(modcallback, v, togged, selectedOption)
									end
									if #selectedOption == 0 and clrcallback then
										task.spawn(clrcallback, selectedOption, cloned)
									end
									return
								else
									if selectedOption ~= v then
										local last_v = library_flags[flagName]
										selectedObjects[1].BackgroundColor3 = library.colors.topGradient
										selectedObjects[1].ImageColor3 = library.colors.bottomGradient
										selectedObjects[2].Text = selectedObjects[2].Name
										selectedObjects[2].TextColor3 = library.colors.otherElementText
										selectedOption = v
										dropdownSelection.Text = stringed
										selectedObjects[1] = newOption
										selectedObjects[2] = optionButton
										newOption.BackgroundColor3 = library.colors.selectedOption
										newOption.ImageColor3 = library.colors.unselectedOption
										optionButton.Text = " " .. stringed
										optionButton.TextColor3 = library.colors.main
										dropdownHolderFrame.Visible = false
										dropdownToggle.Rotation = 90
										dropdownEnabled = false
										newDropdown.ZIndex = 1
										colored_dropdown_BackgroundColor3[3] = "topGradient"
										colored_dropdown_BackgroundColor3[4] = nil
										colored_dropdown_ImageColor3[3] = "bottomGradient"
										colored_dropdown_ImageColor3[4] = nil
										tweenService:Create(dropdown, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
											BackgroundColor3 = library.colors.topGradient,
											ImageColor3 = library.colors.bottomGradient
										}):Play()
										library_flags[flagName] = selectedOption
										if options.Location then
											options.Location[options.LocationFlag or flagName] = selectedOption
										end
										submenuOpen = nil
										showing = false
										if callback then
											task.spawn(callback, selectedOption, last_v)
										end
									else
										showing = false
										submenuOpen = nil
										dropdownToggle.Rotation = 90
										newDropdown.ZIndex = 1
										sectionHolder.ZIndex = 1
										colored_dropdown_BackgroundColor3[3] = "topGradient"
										colored_dropdown_BackgroundColor3[4] = nil
										colored_dropdown_ImageColor3[3] = "bottomGradient"
										colored_dropdown_ImageColor3[4] = nil
										tweenService:Create(dropdown, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
											BackgroundColor3 = library.colors.topGradient,
											ImageColor3 = library.colors.bottomGradient
										}):Play()
										dropdownHolderFrame.Visible = false
									end
								end
								for ins, z in next, restorezindex do
									ins.ZIndex = z
								end
							end
						end)
						library.signals[1 + #library.signals] = optionButton.MouseEnter:Connect(function()
							tweenService:Create(newOption, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
								BackgroundColor3 = library.colors.hoveredOptionTop,
								ImageColor3 = library.colors.hoveredOptionBottom
							}):Play()
						end)
						library.signals[1 + #library.signals] = optionButton.MouseLeave:Connect(function()
							local togged = (not multiselect and selectedOption == v) or (multiselect and table.find(selectedOption, v))
							tweenService:Create(newOption, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
								BackgroundColor3 = (togged and library.colors.selectedOption) or library.colors.topGradient,
								ImageColor3 = (togged and library.colors.unselectedOption) or library.colors.bottomGradient
							}):Play()
						end)
						UpdateDropdownHolder()
					end
				end
				local precisionscrolling, update = nil
				local function display(dropdownEnabled)
					list = resolvelist()
					if next(list) then
					else
						local EmptyVal = options.EmptyValue
						if EmptyVal ~= nil then
							table.insert(list, 1, EmptyVal)
						end
					end
					if dropdownEnabled then
						AddOptions(list)
						submenuOpen = dropdown
						dropdownToggle.Rotation = 270
						restorezindex[newSection] = restorezindex[newSection] or newSection.ZIndex
						restorezindex[newDropdown] = restorezindex[newDropdown] or newDropdown.ZIndex
						restorezindex[sectionHolder] = restorezindex[sectionHolder] or sectionHolder.ZIndex
						newSection.ZIndex = 50 + newSection.ZIndex
						newDropdown.ZIndex = 2
						sectionHolder.ZIndex = 2
						colored_dropdown_BackgroundColor3[3] = "main"
						colored_dropdown_BackgroundColor3[4] = 1.5
						colored_dropdown_ImageColor3[3] = "main"
						colored_dropdown_ImageColor3[4] = 2.5
						tweenService:Create(dropdown, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
							BackgroundColor3 = darkenColor(library.colors.main, 1.5),
							ImageColor3 = darkenColor(library.colors.main, 2.5)
						}):Play()
						dropdownHolderFrame.Visible = true
						if not options.DisablePrecisionScrolling then
							local upkey = options.ScrollUpButton or library.scrollupbutton or shared.scrollupbutton or Enum.KeyCode.Up
							local downkey = options.ScrollDownButton or library.scrolldownbutton or shared.scrolldownbutton or Enum.KeyCode.Down
							precisionscrolling = (precisionscrolling and precisionscrolling:Disconnect() and nil) or userInputService.InputBegan:Connect(function(input)
								if input.UserInputType == Enum.UserInputType.Keyboard then
									local code = input.KeyCode
									local isup = code == upkey
									local isdown = code == downkey
									if isup or isdown then
										local txt = userInputService:GetFocusedTextBox()
										if not txt or txt == dropdownSelection then
											while wait_check() and userInputService:IsKeyDown(code) do
												realDropdownHolder.CanvasPosition = Vector2:new(math.clamp(realDropdownHolder.CanvasPosition.Y + ((isup and -5) or 5), 0, realDropdownHolder.AbsoluteCanvasSize.Y))
											end
										end
									end
								end
							end)
							library.signals[1 + #library.signals] = precisionscrolling
						end
					else
						submenuOpen = nil
						dropdownToggle.Rotation = 90
						colored_dropdown_BackgroundColor3[3] = "topGradient"
						colored_dropdown_BackgroundColor3[4] = nil
						colored_dropdown_ImageColor3[3] = "bottomGradient"
						colored_dropdown_ImageColor3[4] = nil
						tweenService:Create(dropdown, TweenInfo.new(0.35, library.configuration.easingStyle, library.configuration.easingDirection), {
							BackgroundColor3 = library.colors.topGradient,
							ImageColor3 = library.colors.bottomGradient
						}):Play()
						dropdownHolderFrame.Visible = false
						for ins, z in next, restorezindex do
							ins.ZIndex = z
						end
						precisionscrolling = (precisionscrolling and precisionscrolling:Disconnect() and nil) or nil
					end
					if not multiselect and (not next(list) or not table.find(list, library_flags[flagName])) then
						Set(list[1])
					end
					showing = dropdownEnabled
					if showing or dropdownEnabled then
					else
						delay(0.01, update)
					end
				end
				library.signals[1 + #library.signals] = newDropdown.InputEnded:Connect(function(input)
					if not library.colorpicker and input.UserInputType == Enum.UserInputType.MouseButton1 then
						showing = not showing
						display(showing)
					end
				end)
				library.signals[1 + #library.signals] = newDropdown.MouseEnter:Connect(function()
					colored_dropdown_BackgroundColor3[3] = "main"
					colored_dropdown_BackgroundColor3[4] = 1.5
					colored_dropdown_ImageColor3[3] = "main"
					colored_dropdown_ImageColor3[4] = 2.5
					tweenService:Create(dropdown, TweenInfo.new(0.25, library.configuration.easingStyle, library.configuration.easingDirection), {
						BackgroundColor3 = darkenColor(library.colors.main, 1.5),
						ImageColor3 = darkenColor(library.colors.main, 2.5)
					}):Play()
				end)
				library.signals[1 + #library.signals] = newDropdown.MouseLeave:Connect(function()
					if not dropdownEnabled then
						colored_dropdown_BackgroundColor3[3] = "topGradient"
						colored_dropdown_BackgroundColor3[4] = nil
						colored_dropdown_ImageColor3[3] = "bottomGradient"
						colored_dropdown_ImageColor3[4] = nil
						tweenService:Create(dropdown, TweenInfo.new(0.25, library.configuration.easingStyle, library.configuration.easingDirection), {
							BackgroundColor3 = library.colors.topGradient,
							ImageColor3 = library.colors.bottomGradient
						}):Play()
					end
				end)
				library.signals[1 + #library.signals] = dropdownToggle.MouseButton1Click:Connect(function()
					if not library.colorpicker then
						showing = not showing
						display(showing)
					end
				end)
				AddOptions(list)
				local default = library_flags[flagName]
				function update()
					dropdownName, callback = options.Name or dropdownName, options.Callback
					local sstr = (passed_multiselect == "string" and multiselect) or (library_flags[flagName] and tostring(library_flags[flagName])) or (selectedOption and tostring(selectedOption)) or blankstring or "nil"
					if dropdownSelection.Text ~= sstr then
						dropdownSelection.Text = sstr
					end
					dropdownHeadline.Text = (dropdownName and tostring(dropdownName)) or "???"
					return sstr
				end
				function validate(fallbackValue)
					if list and table.find(list, library_flags[flagName]) then
						update()
						return true
					end
					if fallbackValue ~= nil then
						if fallbackValue == "__DEFAULT" then
							fallbackValue = fallbackValue
						end
					else
						fallbackValue = list[1]
					end
					return Set((multiselect and {fallbackValue}) or fallbackValue)
				end
				local objectdata = {
					Options = options,
					Name = flagName,
					Flag = flagName,
					Type = "Dropdown",
					Default = default,
					Parent = sectionFunctions,
					Instance = dropdownSelection,
					Get = function()
						return library_flags[flagName]
					end,
					Set = Set,
					Remove = function()
						if newDropdown then
							newDropdown.Parent = nil
							sectionFunctions:Update()
						end
					end,
					RawSet = ((multiselect and function(t, dat)
						if nil == dat and t ~= nil then
							dat = t
						end
						local lastv = library_flags[flagName]
						if not lastv or selectedOption ~= lastv then
							if lastv and type(lastv) == "table" then
								selectedOption = library_flags[flagName]
							else
								library_flags[flagName] = selectedOption
							end
							warn("Attempting to use new table for", flagName, " Please use :Set(), as setting through flags table may cause errors", debug.traceback(""))
							lastv = library_flags[flagName]
						end
						local cloned = {unpack(selectedOption)}
						if not dat then
							if #selectedOption ~= 0 then
								table.clear(selectedOption)
							end
							return selectedOption
						elseif type(dat) ~= "table" then
							warn("Expected table for argument #1 on Set for MultiSelect dropdown. Got", dat, debug.traceback(""))
							return selectedOption
						end
						for k = table.pack(unpack(dat)).n, 1, -1 do
							if dat[k] == nil then
								table.remove(dat, k)
							end
						end
						table.clear(selectedOption)
						for k, v in next, dat do
							selectedOption[k] = v
						end
						return selectedOption
					end) or function(t, str)
						if nil == str and t ~= nil then
							str = t
						end
						selectedOption = str
						library_flags[flagName] = str
						if options.Location then
							options.Location[options.LocationFlag or flagName] = str
						end
						update()
						return str
					end),
					Update = update,
					Reset = function()
						return Set(nil, default)
					end
				}
				function objectdata.UpdateList(t, listt, updateValues)
					if (nil == listt and t ~= nil) or (type(t) == "table" and type(listt) ~= "table") then
						listt, updateValues = t, listt
					end
					if listt == objectdata then
						listt = nil
					end
					resolvelist = getresolver(listt or options.List, options.Filter, options.Method)
					list = resolvelist()
					if next(list) then
					else
						local EmptyVal = options.EmptyValue
						if EmptyVal ~= nil then
							table.insert(list, 1, EmptyVal)
						end
					end
					if updateValues then
						validate()
					end
					if showing then
						display(false)
						display(true)
					end
					return list
				end
				tabFunctions.Flags[flagName], sectionFunctions.Flags[flagName], elements[flagName] = objectdata, objectdata, objectdata
				return objectdata
			end
			sectionFunctions.AddDropDown = sectionFunctions.AddDropdown
			sectionFunctions.NewDropDown = sectionFunctions.AddDropdown
			sectionFunctions.NewDropdown = sectionFunctions.AddDropdown
			sectionFunctions.CreateDropdown = sectionFunctions.AddDropdown
			sectionFunctions.CreateDropdown = sectionFunctions.AddDropdown
			sectionFunctions.DropDown = sectionFunctions.AddDropdown
			sectionFunctions.Dropdown = sectionFunctions.AddDropdown
			sectionFunctions.DD = sectionFunctions.AddDropdown
			sectionFunctions.Dd = sectionFunctions.AddDropdown
			function sectionFunctions:AddColorpicker(options, ...)
				options = (options and type(options) == "string" and resolvevararg("Colorpicker", options, ...)) or options
				if options.Random == true then
					options.Value = "random"
				elseif options.Rainbow == true then
					options.Value = "rainbow"
				end
				local colorPickerName, presetColor, callback, flagName = assert(options.Name, "Missing Name for new colorpicker."), options.Value, options.Callback, options.Flag or (function()
					library.unnamedcolorpicker = 1 + (library.unnamedcolorpicker or 0)
					return "Colorpicker" .. tostring(library.unnamedcolorpicker)
				end)()
				if elements[flagName] ~= nil then
					warn(debug.traceback("Warning! Re-used flag '" .. flagName .. "'", 3))
				end
				local designers = options.__designer
				options.__designer = nil
				local rainbowColorMode = false
				if presetColor == "random" then
					presetColor = Color3.new(math.random(), math.random(), math.random())
				elseif presetColor == "rainbow" then
					presetColor = Color3.new(1, 1, 1)
					rainbowColorMode = true
				end
				local newColorPicker = Instance_new("Frame")
				local colorPicker = Instance_new("ImageLabel")
				local colorPickerInner = Instance_new("ImageLabel")
				local colorPickerHeadline = Instance_new("TextLabel")
				local colorPickerButton = Instance_new("TextButton")
				local colorPickerHolderFrame = Instance_new("ImageLabel")
				local colorPickerHolderInner = Instance_new("ImageLabel")
				local color = Instance_new("ImageLabel")
				local selectorColor = Instance_new("Frame")
				local hue = Instance_new("ImageLabel")
				local hueGradient = Instance_new("UIGradient")
				local selectorHue = Instance_new("Frame")
				local randomColor = Instance_new("ImageLabel")
				local randomColorInner = Instance_new("ImageLabel")
				local randomColorButton = Instance_new("ImageButton")
				local hexInputBox = Instance_new("TextBox")
				local hexInput = Instance_new("ImageLabel")
				local hexInputInner = Instance_new("ImageLabel")
				local rainbow = Instance_new("ImageLabel")
				local rainbowInner = Instance_new("ImageLabel")
				local rainbowButton = Instance_new("ImageButton")
				local startingColor = presetColor or Color3.new(1, 1, 1)
				local colorPickerEnabled = false
				local colorH, colorS, colorV = 1, 1, 1
				local colorInput, hueInput = nil, nil
				local oldBackgroundColor = Color3.new()
				local oldImageColor = oldBackgroundColor
				local oldColor = oldBackgroundColor
				local rainbowColorValue = 0
				newColorPicker.Name = "newColorPicker"
				newColorPicker.Parent = sectionHolder
				newColorPicker.BackgroundColor3 = Color3.new(1, 1, 1)
				newColorPicker.BackgroundTransparency = 1
				newColorPicker.Size = UDim2.new(1, 0, 0, 19)
				colorPicker.Name = "colorPicker"
				colorPicker.Parent = newColorPicker
				colorPicker.Active = true
				colorPicker.BackgroundColor3 = library.colors.topGradient
				local colored_colorPicker_BackgroundColor3 = {colorPicker, "BackgroundColor3", "topGradient"}
				colored[1 + #colored] = colored_colorPicker_BackgroundColor3
				colorPicker.BorderColor3 = library.colors.elementBorder
				colored[1 + #colored] = {colorPicker, "BorderColor3", "elementBorder"}
				colorPicker.Position = UDim2.fromScale(0.842, 0.113)
				colorPicker.Selectable = true
				colorPicker.Size = UDim2.fromOffset(24, 12)
				colorPicker.Image = "rbxassetid://2454009026"
				colorPicker.ImageColor3 = library.colors.bottomGradient
				local colored_colorPicker_ImageColor3 = {colorPicker, "ImageColor3", "bottomGradient"}
				colored[1 + #colored] = colored_colorPicker_ImageColor3
				colorPickerInner.Name = "colorPickerInner"
				colorPickerInner.Parent = colorPicker
				colorPickerInner.Active = true
				colorPickerInner.AnchorPoint = Vector2.new(0.5, 0.5)
				colorPickerInner.BorderColor3 = library.colors.elementBorder
				colored[1 + #colored] = {colorPickerInner, "BorderColor3", "elementBorder"}
				colorPickerInner.Position = UDim2.fromScale(0.5, 0.5)
				colorPickerInner.Selectable = true
				colorPickerInner.Size = UDim2.new(1, -4, 1, -4)
				colorPickerInner.Image = "rbxassetid://2454009026"
				colorPickerInner.BackgroundColor3 = darkenColor(startingColor, 1.5)
				colorPickerInner.ImageColor3 = darkenColor(startingColor, 2.5)
				colorPickerHeadline.Name = "colorPickerHeadline"
				colorPickerHeadline.Parent = newColorPicker
				colorPickerHeadline.BackgroundColor3 = Color3.new(1, 1, 1)
				colorPickerHeadline.BackgroundTransparency = 1
				colorPickerHeadline.Position = UDim2.fromScale(0.034, 0.113)
				colorPickerHeadline.Size = UDim2.fromOffset(173, 11)
				colorPickerHeadline.Font = Enum.Font.Code
				colorPickerHeadline.Text = colorPickerName or "???"
				colorPickerHeadline.TextColor3 = library.colors.elementText
				colored[1 + #colored] = {colorPickerHeadline, "TextColor3", "elementText"}
				colorPickerHeadline.TextSize = 14
				colorPickerHeadline.TextXAlignment = Enum.TextXAlignment.Left
				colorPickerButton.Name = "colorPickerButton"
				colorPickerButton.Parent = newColorPicker
				colorPickerButton.BackgroundColor3 = Color3.new(1, 1, 1)
				colorPickerButton.BackgroundTransparency = 1
				colorPickerButton.Size = UDim2.fromScale(1, 1)
				colorPickerButton.ZIndex = 5
				colorPickerButton.Font = Enum.Font.SourceSans
				colorPickerButton.Text = ""
				colorPickerButton.TextColor3 = Color3.new()
				colorPickerButton.TextSize = 14
				colorPickerButton.TextTransparency = 1
				colorPickerButton.BorderColor3 = library.colors.elementBorder
				local colored_colorPickerButton_BorderColor3 = {colorPickerButton, "BorderColor3", "elementBorder"}
				colored[1 + #colored] = colored_colorPickerButton_BorderColor3
				local function UpdateColorPicker(force, rainbsow)
					local last_vv = library_flags[flagName]
					local newColor = force or Color3.fromHSV(colorH, colorS, colorV)
					if not force then
						colorH, colorS, colorV = newColor:ToHSV()
					end
					colorPickerInner.BackgroundColor3 = darkenColor(newColor, 1.5)
					colorPickerInner.ImageColor3 = darkenColor(newColor, 2.5)
					color.BackgroundColor3 = Color3.fromHSV(colorH, 1, 1)
					library_flags[flagName] = newColor
					if options.Location then
						options.Location[options.LocationFlag or flagName] = newColor
					end
					hexInputBox.Text = Color3ToHex(newColor)
					if force then
						color.BackgroundColor3 = force
						selectorColor.Position = UDim2.new(force and select(3, Color3.toHSV(force)))
					end
					local pos = 1 - (Color3.toHSV(newColor))
					local scalex = selectorHue.Position.X.Scale
					if scalex ~= pos and not (((pos == 0) or (pos == 1)) and ((scalex == 1) or (scalex == 0))) then
						selectorHue.Position = UDim2.new(pos)
					end
					if callback and last_vv ~= newColor then
						task.spawn(callback, newColor, last_vv, rainbsow)
					end
				end
				library.signals[1 + #library.signals] = colorPickerButton.MouseButton1Click:Connect(function()
					if submenuOpen == colorPicker or submenuOpen == nil then
						colorPickerEnabled = not colorPickerEnabled
						library.colorpicker = colorPickerEnabled
						colorPickerHolderFrame.Visible = colorPickerEnabled
						if colorPickerEnabled then
							for _, v in next, colorpickerconflicts do
								v.Visible = false
							end
							submenuOpen = colorPicker
							newColorPicker.ZIndex = 2
							newSection.ZIndex = 100 + newSection.ZIndex
							colorPickerButton.BorderColor3 = library.colors.main
							colored_colorPickerButton_BorderColor3[3] = "main"
							UpdateColorPicker()
						else
							for _, v in next, colorpickerconflicts do
								v.Visible = true
							end
							submenuOpen = nil
							newColorPicker.ZIndex = 0
							newSection.ZIndex = newSection.ZIndex - 100
							colorPickerButton.BorderColor3 = library.colors.elementBorder
							colored_colorPickerButton_BorderColor3[3] = "elementBorder"
						end
					end
				end)
				colorPickerHolderFrame.Name = "colorPickerHolderFrame"
				colorPickerHolderFrame.Parent = newColorPicker
				colorPickerHolderFrame.Active = true
				colorPickerHolderFrame.BackgroundColor3 = library.colors.topGradient
				colored[1 + #colored] = {colorPickerHolderFrame, "BackgroundColor3", "topGradient"}
				colorPickerHolderFrame.BorderColor3 = library.colors.elementBorder
				colored[1 + #colored] = {colorPickerHolderFrame, "BorderColor3", "elementBorder"}
				colorPickerHolderFrame.Selectable = true
				colorPickerHolderFrame.Position = UDim2.fromScale(0.025, 1.012)
				colorPickerHolderFrame.Size = UDim2.fromOffset(206, 250)
				if math.ceil(colorPickerHolderFrame.AbsolutePosition.Y + colorPickerHolderFrame.AbsoluteSize.Y) > floor(newTabHolder.AbsoluteSize.Y + newTabHolder.AbsolutePosition.Y) then
					colorPickerHolderFrame.Position = UDim2.new(0.025, 0, 1.012, -colorPickerHolderFrame.AbsoluteSize.Y - colorPickerButton.AbsoluteSize.Y - 2)
				end
				colorPickerHolderFrame.Visible = false
				colorPickerHolderFrame.Image = "rbxassetid://2454009026"
				colorPickerHolderFrame.ImageColor3 = library.colors.bottomGradient
				colored[1 + #colored] = {colorPickerHolderFrame, "ImageColor3", "bottomGradient"}
				colorPickerHolderInner.Name = "colorPickerHolderInner"
				colorPickerHolderInner.Parent = colorPickerHolderFrame
				colorPickerHolderInner.Active = true
				colorPickerHolderInner.AnchorPoint = Vector2.new(0.5, 0.5)
				colorPickerHolderInner.BackgroundColor3 = library.colors.topGradient
				colored[1 + #colored] = {colorPickerHolderInner, "BackgroundColor3", "topGradient"}
				colorPickerHolderInner.BorderColor3 = library.colors.elementBorder
				colored[1 + #colored] = {colorPickerHolderInner, "BorderColor3", "elementBorder"}
				colorPickerHolderInner.Position = UDim2.fromScale(0.5, 0.5)
				colorPickerHolderInner.Selectable = true
				colorPickerHolderInner.Size = UDim2.new(1, -4, 1, -4)
				colorPickerHolderInner.Image = "rbxassetid://2454009026"
				colorPickerHolderInner.ImageColor3 = library.colors.bottomGradient
				colored[1 + #colored] = {colorPickerHolderInner, "ImageColor3", "bottomGradient"}
				color.Name = "color"
				color.Parent = colorPickerHolderInner
				color.BackgroundColor3 = startingColor
				color.BorderSizePixel = 0
				color.Position = UDim2.fromOffset(5, 5)
				color.Size = UDim2.new(1, -10, 0, 192)
				color.Image = "rbxassetid://4155801252"
				selectorColor.Name = "selectorColor"
				selectorColor.Parent = color
				selectorColor.AnchorPoint = Vector2.new(0.5, 0.5)
				selectorColor.BackgroundColor3 = Color3.fromRGB(144, 144, 144)
				selectorColor.BorderColor3 = Color3.fromRGB(69, 65, 70)
				selectorColor.Position = UDim2.new(startingColor and select(3, Color3.toHSV(startingColor)))
				selectorColor.Size = UDim2.fromOffset(4, 4)
				hue.Name = "hue"
				hue.Parent = colorPickerHolderInner
				hue.BackgroundColor3 = Color3.new(1, 1, 1)
				hue.BorderSizePixel = 0
				hue.Position = UDim2.fromOffset(5, 202)
				hue.Size = UDim2.new(1, -10, 0, 14)
				hue.Image = "rbxassetid://3570695787"
				hue.ScaleType = Enum.ScaleType.Slice
				hue.SliceScale = 0.01
				hueGradient.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 4)), ColorSequenceKeypoint.new(0.17, Color3.fromRGB(235, 7, 255)), ColorSequenceKeypoint.new(0.33, Color3:fromRGB(9, 189)), ColorSequenceKeypoint.new(0.5, Color3:fromRGB(193, 196)), ColorSequenceKeypoint.new(0.66, Color3:new(1)), ColorSequenceKeypoint.new(0.84, Color3.fromRGB(255, 247)), ColorSequenceKeypoint.new(1, Color3.new(1))})
				hueGradient.Name = "hueGradient"
				hueGradient.Parent = hue
				selectorHue.Name = "selectorHue"
				selectorHue.Parent = hue
				selectorHue.BackgroundColor3 = Color3:fromRGB(125, 255)
				selectorHue.BackgroundTransparency = 0.2
				selectorHue.BorderColor3 = Color3:fromRGB(84, 91)
				selectorHue.Position = UDim2.new(1 - (Color3.toHSV(startingColor)))
				selectorHue.Size = UDim2:new(2, 1)
				hexInput.Name = "hexInput"
				hexInput.Parent = colorPickerHolderInner
				hexInput.Active = true
				hexInput.BackgroundColor3 = library.colors.topGradient
				colored[1 + #colored] = {hexInput, "BackgroundColor3", "topGradient"}
				hexInput.BorderColor3 = library.colors.elementBorder
				colored[1 + #colored] = {hexInput, "BorderColor3", "elementBorder"}
				hexInput.Position = UDim2.fromOffset(5, 223)
				hexInput.Selectable = true
				hexInput.Size = UDim2.fromOffset(150, 18)
				hexInput.Image = "rbxassetid://2454009026"
				hexInput.ImageColor3 = library.colors.bottomGradient
				colored[1 + #colored] = {hexInput, "ImageColor3", "bottomGradient"}
				hexInputInner.Name = "hexInputInner"
				hexInputInner.Parent = hexInput
				hexInputInner.Active = true
				hexInputInner.AnchorPoint = Vector2.new(0.5, 0.5)
				hexInputInner.BackgroundColor3 = library.colors.topGradient
				colored[1 + #colored] = {hexInputInner, "BackgroundColor3", "topGradient"}
				hexInputInner.BorderColor3 = library.colors.elementBorder
				colored[1 + #colored] = {hexInputInner, "BorderColor3", "elementBorder"}
				hexInputInner.Position = UDim2.fromScale(0.5, 0.5)
				hexInputInner.Selectable = true
				hexInputInner.Size = UDim2.new(1, -4, 1, -4)
				hexInputInner.Image = "rbxassetid://2454009026"
				hexInputInner.ImageColor3 = library.colors.bottomGradient
				colored[1 + #colored] = {hexInputInner, "ImageColor3", "bottomGradient"}
				hexInputBox.Name = "hexInputBox"
				hexInputBox.Parent = hexInput
				hexInputBox.BackgroundColor3 = Color3.new(1, 1, 1)
				hexInputBox.BackgroundTransparency = 1
				hexInputBox.Size = UDim2.fromScale(1, 1)
				hexInputBox.ZIndex = 5
				hexInputBox.Font = Enum.Font.Code
				hexInputBox.PlaceholderText = "Hex Input"
				hexInputBox.Text = Color3ToHex(startingColor)
				hexInputBox.TextColor3 = library.colors.elementText
				colored[1 + #colored] = {hexInputBox, "TextColor3", "elementText"}
				hexInputBox.TextSize = 14
				hexInputBox.ClearTextOnFocus = false
				randomColor.Name = "randomColor"
				randomColor.Parent = colorPickerHolderInner
				randomColor.Active = true
				randomColor.BackgroundColor3 = library.colors.topGradient
				colored[1 + #colored] = {randomColor, "BackgroundColor3", "topGradient"}
				randomColor.BorderColor3 = library.colors.elementBorder
				colored[1 + #colored] = {randomColor, "BorderColor3", "elementBorder"}
				randomColor.Position = UDim2.fromOffset(158, 223)
				randomColor.Selectable = true
				randomColor.Size = UDim2.fromOffset(18, 18)
				randomColor.Image = "rbxassetid://2454009026"
				randomColor.ImageColor3 = library.colors.bottomGradient
				colored[1 + #colored] = {randomColor, "ImageColor3", "bottomGradient"}
				randomColorInner.Name = "randomColorInner"
				randomColorInner.Parent = randomColor
				randomColorInner.Active = true
				randomColorInner.AnchorPoint = Vector2.new(0.5, 0.5)
				randomColorInner.BackgroundColor3 = library.colors.topGradient
				colored[1 + #colored] = {randomColorInner, "BackgroundColor3", "topGradient"}
				randomColorInner.BorderColor3 = library.colors.elementBorder
				colored[1 + #colored] = {randomColorInner, "BorderColor3", "elementBorder"}
				randomColorInner.Position = UDim2.fromScale(0.5, 0.5)
				randomColorInner.Selectable = true
				randomColorInner.Size = UDim2.new(1, -4, 1, -4)
				randomColorInner.Image = "rbxassetid://2454009026"
				randomColorInner.ImageColor3 = library.colors.bottomGradient
				colored[1 + #colored] = {randomColorInner, "ImageColor3", "bottomGradient"}
				randomColorButton.Name = "randomColorButton"
				randomColorButton.Parent = randomColor
				randomColorButton.BackgroundColor3 = Color3.new(1, 1, 1)
				randomColorButton.BackgroundTransparency = 1
				randomColorButton.Size = UDim2.fromScale(1, 1)
				randomColorButton.ZIndex = 5
				randomColorButton.Image = "rbxassetid://7484765651"
				rainbow.Name = "rainbow"
				rainbow.Parent = colorPickerHolderInner
				rainbow.Active = true
				rainbow.BackgroundColor3 = library.colors.topGradient
				colored[1 + #colored] = {rainbow, "BackgroundColor3", "topGradient"}
				rainbow.BorderColor3 = library.colors.elementBorder
				colored[1 + #colored] = {rainbow, "BorderColor3", "elementBorder"}
				rainbow.Position = UDim2.fromOffset(158 + 18 + 4, 223)
				rainbow.Selectable = true
				rainbow.Size = UDim2.fromOffset(18, 18)
				rainbow.Image = "rbxassetid://2454009026"
				rainbow.ImageColor3 = library.colors.bottomGradient
				colored[1 + #colored] = {rainbow, "ImageColor3", "bottomGradient"}
				rainbowInner.Name = "rainbowInner"
				rainbowInner.Parent = randomColor
				rainbowInner.Active = true
				rainbowInner.AnchorPoint = Vector2.new(0.5, 0.5)
				rainbowInner.BackgroundColor3 = library.colors.topGradient
				colored[1 + #colored] = {rainbowInner, "BackgroundColor3", "topGradient"}
				rainbowInner.BorderColor3 = library.colors.elementBorder
				colored[1 + #colored] = {rainbowInner, "BorderColor3", "elementBorder"}
				rainbowInner.Position = UDim2.fromScale(0.5, 0.5)
				rainbowInner.Selectable = true
				rainbowInner.Size = UDim2.new(1, -4, 1, -4)
				rainbowInner.Image = "rbxassetid://2454009026"
				rainbowInner.ImageColor3 = library.colors.bottomGradient
				colored[1 + #colored] = {rainbowInner, "ImageColor3", "bottomGradient"}
				rainbowButton.Name = "rainbowButton"
				rainbowButton.Parent = rainbow
				rainbowButton.BackgroundColor3 = Color3.new(1, 1, 1)
				rainbowButton.BackgroundTransparency = 1
				rainbowButton.Size = UDim2.fromScale(1, 1)
				rainbowButton.ZIndex = 5
				rainbowButton.Image = "rbxassetid://7484772919"
				local indexwith = (designers and "rainbows") or "rainbowsg"
				local function setrainbow(t, rainbowColorMod)
					if nil == rainbowColorMod and t ~= nil then
						rainbowColorMod = t
					end
					if rainbowColorMod == nil or type(rainbowColorMod) ~= "boolean" then
						rainbowColorMode = not rainbowColorMode
					else
						rainbowColorMode = rainbowColorMod
					end
					if colorInput then
						colorInput = (colorInput:Disconnect() and nil) or nil
					end
					if hueInput then
						hueInput = (hueInput:Disconnect() and nil) or nil
					end
					pcall(function()
						if destroyrainbows and library.rainbows <= 0 then
							destroyrainbows = nil
						end
						if destroyrainbowsg and library.rainbowsg <= 0 then
							destroyrainbowsg = nil
						end
					end)
					if rainbowColorMode then
						pcall(function()
							if not library.rainbowflags[flagName] then
								library[indexwith] = 1 + library[indexwith]
							end
							library.rainbowflags[flagName] = true
							oldImageColor = colorPickerInner.ImageColor3
							oldBackgroundColor = colorPickerInner.BackgroundColor3
							oldColor = color.BackgroundColor3
							pcall(function()
								local common_float = 1 / 255
								while wait_check() and rainbowColorMode and (options.Value == "rainbow" or ((not designers and not destroyrainbowsg) or (designers and not destroyrainbows))) do
									rainbowColorValue = common_float + rainbowColorValue
									if rainbowColorValue > 1 then
										rainbowColorValue = 0
									end
									colorH = rainbowColorValue
									UpdateColorPicker(Color3.fromHSV(rainbowColorValue, 1, 1), true)
								end
							end)
						end)
						pcall(function()
							rainbowColorMode = nil
							if library.rainbowflags[flagName] then
								library[indexwith] = library[indexwith] - 1
							end
							library.rainbowflags[flagName] = nil
						end)
					end
					UpdateColorPicker(library_flags[flagName])
				end
				library.signals[1 + #library.signals] = randomColorButton.MouseButton1Click:Connect(function()
					if rainbowColorMode then
						setrainbow(false)
					end
					UpdateColorPicker(Color3.fromRGB(math.random(0, 255), math.random(0, 255), math.random(0, 255)))
				end)
				library.signals[1 + #library.signals] = rainbowButton.MouseButton1Click:Connect(setrainbow)
				sectionFunctions:Update()
				library.signals[1 + #library.signals] = newColorPicker.MouseEnter:Connect(function()
					tweenService:Create(colorPicker, TweenInfo.new(0.25, library.configuration.easingStyle, library.configuration.easingDirection), {
						BackgroundColor3 = darkenColor(library.colors.main, 1.5),
						ImageColor3 = darkenColor(library.colors.main, 2.5)
					}):Play()
					colored_colorPicker_BackgroundColor3[3] = "main"
					colored_colorPicker_BackgroundColor3[4] = 1.5
					colored_colorPicker_ImageColor3[3] = "main"
					colored_colorPicker_ImageColor3[4] = 2.5
				end)
				library.signals[1 + #library.signals] = newColorPicker.MouseLeave:Connect(function()
					if not colorPickerEnabled then
						tweenService:Create(colorPicker, TweenInfo.new(0.25, library.configuration.easingStyle, library.configuration.easingDirection), {
							BackgroundColor3 = library.colors.topGradient,
							ImageColor3 = library.colors.bottomGradient
						}):Play()
						colored_colorPicker_BackgroundColor3[3] = "topGradient"
						colored_colorPicker_BackgroundColor3[4] = nil
						colored_colorPicker_ImageColor3[3] = "bottomGradient"
						colored_colorPicker_ImageColor3[4] = nil
					end
				end)
				hexInputBox.FocusLost:Connect(function()
					if #hexInputBox.Text > 5 then
						local last_vv = library_flags[flagName]
						local not_fucked, clr = pcall(Color3FromHex, hexInputBox.Text)
						UpdateColorPicker((not_fucked and clr) or last_vv)
					end
				end)
				colorH = 1 - (math.clamp(selectorHue.AbsolutePosition.X - hue.AbsolutePosition.X, 0, hue.AbsoluteSize.X) / hue.AbsoluteSize.X)
				colorS = (math.clamp(selectorColor.AbsolutePosition.X - color.AbsolutePosition.X, 0, color.AbsoluteSize.X) / color.AbsoluteSize.X)
				colorV = 1 - (math.clamp(selectorColor.AbsolutePosition.Y - color.AbsolutePosition.Y, 0, color.AbsoluteSize.Y) / color.AbsoluteSize.Y)
				library.signals[1 + #library.signals] = color.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						isDraggingSomething = true
						colorInput = (colorInput and colorInput:Disconnect() and nil) or runService.RenderStepped:Connect(function()
							local colorX = (math.clamp(mouse.X - color.AbsolutePosition.X, 0, color.AbsoluteSize.X) / color.AbsoluteSize.X)
							local colorY = (math.clamp(mouse.Y - color.AbsolutePosition.Y, 0, color.AbsoluteSize.Y) / color.AbsoluteSize.Y)
							selectorColor.Position = UDim2.fromScale(colorX, colorY)
							colorS = colorX
							colorV = 1 - colorY
							UpdateColorPicker()
						end)
						library.signals[1 + #library.signals] = colorInput
					end
				end)
				library.signals[1 + #library.signals] = color.InputEnded:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						if colorInput then
							isDraggingSomething = false
							colorInput:Disconnect()
						end
					end
				end)
				library.signals[1 + #library.signals] = hue.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						if hueInput then
							hueInput:Disconnect()
						end
						isDraggingSomething = true
						hueInput = runService.RenderStepped:Connect(function()
							local hueX = math.clamp(mouse.X - hue.AbsolutePosition.X, 0, hue.AbsoluteSize.X) / hue.AbsoluteSize.X
							selectorHue.Position = UDim2.new(hueX)
							colorH = 1 - hueX
							UpdateColorPicker()
						end)
						library.signals[1 + #library.signals] = hueInput
					end
				end)
				library.signals[1 + #library.signals] = hue.InputEnded:Connect(function(input)
					if hueInput and input.UserInputType == Enum.UserInputType.MouseButton1 then
						isDraggingSomething = false
						hueInput:Disconnect()
					end
				end)
				if rainbowColorMode then
					spawn(function()
						rainbowColorMode = nil
						setrainbow(true)
					end)
				end
				local function Set(t, clr)
					if clr == nil and t ~= nil then
						clr = t
					end
					if clr == "rainbow" then
						if not rainbowColorMode then
							task.spawn(setrainbow, true)
						end
						return
					elseif clr == "random" then
						clr = Color3.new(math.random(), math.random(), math.random())
					elseif type(clr) == "string" and tonumber(clr, 16) then
						clr = Color3FromHex(clr)
					end
					task.spawn(setrainbow, false)
					local last_v = library_flags[flagName]
					library_flags[flagName] = clr
					if options.Location then
						options.Location[options.LocationFlag or flagName] = clr
					end
					color.BackgroundColor3 = clr
					selectorColor.Position = UDim2.new(clr and select(3, Color3.toHSV(clr)))
					selectorHue.Position = UDim2.new(1 - (Color3.toHSV(clr)))
					colorPickerInner.BackgroundColor3 = darkenColor(clr, 1.5)
					colorPickerInner.ImageColor3 = darkenColor(clr, 2.5)
					hexInputBox.Text = Color3ToHex(clr)
					colorH, colorS, colorV = Color3.toHSV(clr)
					if callback and (last_v ~= clr or options.AllowDuplicateCalls) then
						task.spawn(callback, clr, last_v)
					end
					return clr
				end
				if presetColor ~= nil then
					Set(presetColor)
				else
					library_flags[flagName] = startingColor
					if options.Location then
						options.Location[options.LocationFlag or flagName] = startingColor
					end
				end
				local default = options.Value or startingColor or library_flags[flagName]
				local function update()
					colorPickerName, callback = options.Name or colorPickerName, options.Callback
					local clr = library_flags[flagName]
					color.BackgroundColor3 = clr
					selectorColor.Position = UDim2.new(clr and select(3, Color3.toHSV(clr)))
					selectorHue.Position = UDim2.new(1 - (Color3.toHSV(clr)))
					colorPickerInner.BackgroundColor3 = darkenColor(clr, 1.5)
					colorPickerInner.ImageColor3 = darkenColor(clr, 2.5)
					hexInputBox.Text = Color3ToHex(clr)
					colorPickerHeadline.Text = colorPickerName or "???"
					return clr
				end
				local objectdata = {
					Options = options,
					Name = flagName,
					Flag = flagName,
					Type = "Colorpicker",
					Default = default,
					Parent = sectionFunctions,
					Instance = newColorPicker,
					SetRainbow = setrainbow,
					Get = function()
						return library_flags[flagName]
					end,
					GetRainbow = function()
						return rainbowColorMode
					end,
					Set = Set,
					Remove = function()
						if newColorPicker then
							newColorPicker.Parent = nil
							sectionFunctions:Update()
						end
					end,
					RawSet = function(t, clr)
						if clr == nil and t ~= nil then
							clr = t
						end
						if clr == "rainbow" then
							if not rainbowColorMode then
								task.spawn(setrainbow, true)
							end
							return clr
						elseif clr == "random" then
							clr = Color3.new(math.random(), math.random(), math.random())
						elseif clr and type(clr) == "string" and tonumber(clr, 16) then
							clr = Color3FromHex(clr)
						end
						task.spawn(setrainbow, false)
						library_flags[flagName] = clr
						if options.Location then
							options.Location[options.LocationFlag or flagName] = clr
						end
						return clr
					end,
					Update = update,
					Reset = function()
						return Set(nil, default)
					end
				}
				tabFunctions.Flags[flagName], sectionFunctions.Flags[flagName], elements[flagName] = objectdata, objectdata, objectdata
				return objectdata
			end
			sectionFunctions.AddColorPicker = sectionFunctions.AddColorpicker
			sectionFunctions.NewColorpicker = sectionFunctions.AddColorpicker
			sectionFunctions.NewColorPicker = sectionFunctions.AddColorpicker
			sectionFunctions.CreateColorPicker = sectionFunctions.AddColorpicker
			sectionFunctions.CreateColorpicker = sectionFunctions.AddColorpicker
			sectionFunctions.ColorPicker = sectionFunctions.AddColorpicker
			sectionFunctions.Colorpicker = sectionFunctions.AddColorpicker
			sectionFunctions.Cp = sectionFunctions.AddColorpicker
			sectionFunctions.CP = sectionFunctions.AddColorpicker
			return sectionFunctions
		end
		tabFunctions.AddSection = tabFunctions.CreateSection
		tabFunctions.NewSection = tabFunctions.CreateSection
		tabFunctions.Section = tabFunctions.CreateSection
		tabFunctions.Sec = tabFunctions.CreateSection
		tabFunctions.S = tabFunctions.CreateSection
		function tabFunctions:UpdateAll()
			local target = self or tabFunctions
			if target and type(target) == "table" and target.Flags then
				for _, e in next, target.Flags do
					if e and type(e) == "table" and e.Update then
						pcall(e.Update)
					end
				end
			end
		end
		
		
		
		
		
		
		
		
		
		
		return tabFunctions
	end
	windowFunctions.AddTab = windowFunctions.CreateTab
	windowFunctions.NewTab = windowFunctions.CreateTab
	windowFunctions.Tab = windowFunctions.CreateTab
	windowFunctions.T = windowFunctions.CreateTab
	function windowFunctions:CreateDesigner(options, ...)
		options = (options and type(options) == "string" and resolvevararg("Tab", options, ...)) or options
		assert(shared.bypasstablimit or (library.Designer == nil), "Designer already exists")
		options = options or {}
		options.Image = options.Image or 7483871523
		options.LastTab = true
		local designer = windowFunctions:CreateTab(options)
		local colorsection = designer:CreateSection({
			Name = "Colors"
		})
		local backgroundsection = designer:CreateSection({
			Name = "Background",
			Side = "right"
		})
		local detailssection = designer:CreateSection({
			Name = "More Info"
		})
		local filessection = designer:CreateSection({
			Name = "Profiles",
			Side = "right"
		})
		local settingssection = designer:CreateSection({
			Name = "Settings",
			Side = "right"
		})
		local designerelements = {}
		library.designerelements = designerelements
		for _, v in next, {{"Main", "main"}, {"Background", "background"}, {"Outer Border", "outerBorder"}, {"Inner Border", "innerBorder"}, {"Top Gradient", "topGradient"}, {"Bottom Gradient", "bottomGradient"}, {"Section Background", "sectionBackground"}, {"Section", "section"}, {"Element Text", "elementText"}, {"Other Element Text", "otherElementText"}, {"Tab Text", "tabText"}, {"Element Border", "elementBorder"}, {"Selected Option", "selectedOption"}, {"Unselected Option", "unselectedOption"}, {"Hovered Option Top", "hoveredOptionTop"}, {"Unhovered Option Top", "unhoveredOptionTop"}, {"Hovered Option Bottom", "hoveredOptionBottom"}, {"Unhovered Option Bottom", "unhoveredOptionBottom"}} do
			local nam, codename = v[1], v[2]
			local cflag = "__Designer.Colors." .. codename
			designerelements[codename] = {
				Return = colorsection:AddColorpicker({
					Name = nam,
					Flag = cflag,
					Value = library.colors[codename],
					Callback = function(v, y)
						library.colors[codename] = v or y
					end,
					__designer = 1
				}),
				Flag = cflag
			}
		end
		local flags = {}
		local persistoptions = {
			Name = "Workspace Profile",
			Flag = "__Designer.Background.WorkspaceProfile",
			Flags = true,
			Suffix = "Config",
			Workspace = library.WorkspaceName or "Unnamed Workspace",
			Desginer = true
		}
		local daaata = {{"AddTextbox", "__Designer.Textbox.ImageAssetID", backgroundsection, {
			Name = "Image Asset ID",
			Placeholder = "rbxassetid://13077068950",
			Flag = "__Designer.Background.ImageAssetID",
			Value = "rbxassetid://13077068950",
			Callback = updatecolorsnotween
		}}, {"AddColorpicker", "__Designer.Colorpicker.ImageColor", backgroundsection, {
			Name = "Image Color",
			Flag = "__Designer.Background.ImageColor",
			Value = Color3.new(1, 1, 1),
			Callback = updatecolorsnotween,
			__designer = 1
		}}, {"AddSlider", "__Designer.Slider.ImageTransparency", backgroundsection, {
			Name = "Image Transparency",
			Flag = "__Designer.Background.ImageTransparency",
			Value = 65,
			Min = 0,
			Max = 100,
			Format = "Image Transparency: %s%%",
			Textbox = true,
			Callback = updatecolorsnotween
		}}, {"AddToggle", "__Designer.Toggle.UseBackgroundImage", backgroundsection, {
			Name = "Use Background Image",
			Flag = "__Designer.Background.UseBackgroundImage",
			Value = true,
			Callback = updatecolorsnotween
		}}, {"AddPersistence", "__Designer.Persistence.ThemeFile", filessection, {
			Name = "Theme Profile",
			Flag = "__Designer.Files.ThemeFile",
			Workspace = "Pepsi Lib Themes",
			Flags = flags,
			Suffix = "Theme",
			Desginer = true
		}}, {"AddTextbox", "__Designer.Textbox.WorkspaceName", filessection, {
			Name = "Workspace Name",
			Value = library.WorkspaceName or "Unnamed Workspace",
			Flag = "__Designer.Files.WorkspaceFile",
			Callback = function(n, o)
				persistoptions.Workspace = n or o
			end
		}}, {"AddPersistence", "__Designer.Persistence.WorkspaceProfile", filessection, persistoptions}, {"AddButton", "__Designer.Button.TerminateGUI", settingssection, {{
			Name = "Terminate GUI",
			Callback = library.unload
		}, {
			Name = "Reset GUI",
			Callback = resetall
		}, {
			Name = "Reset Designer",
			Callback = function()
				destroyrainbows = true
				pcall(function()
					for k, v in next, elements do
						if v and k and v.Set and (v.Default ~= nil) and (library_flags[k] ~= v.Default) and (string.sub(k, 1, 11) == "__Designer.") then
							v:Set(v.Default)
						end
					end
				end)
			end
		}}}, {"AddKeybind", "__Designer.Keybind.ShowHideKey", settingssection, {
			Name = "Show/Hide Key",
			Location = library.configuration,
			Flag = "__Designer.Settings.ShowHideKey",
			LocationFlag = "hideKeybind",
			Value = library.configuration.hideKeybind,
			CoreBinding = true,
			Callback = function()
				lasthidebing = os.clock()
			end
		}}, {"AddLabel", "__Designer.Label.Version", settingssection, {
			Name = "Library Version: " .. tostring(library.Version or "?")
		}}}
		if setclipboard and daaata[8] then
			local common_table = daaata[8][4]
			if common_table then
				common_table[1 + #common_table] = {
					Name = "Copy Theme",
					Callback = function()
						local working_with = {}
						if #flags > 0 then
							for k, cflag in next, flags do
								if k > 0 then
									local data = elements[cflag]
									if data and (data.Type ~= "Persistence") and (string.sub(cflag, 1, 11) == "__Designer.") then
										working_with[cflag] = data
									end
								end
							end
						end
						local saving = {}
						for cflag in next, working_with do
							local value = library_flags[cflag]
							local good, jval = nil, nil
							if value ~= nil then
								good, jval = JSONEncode(value)
							else
								good, jval = true, "null"
							end
							if not good or ((jval == "null") and (value ~= nil)) then
								local typ = typeof(value)
								if typ == "Color3" then
									value = (library.rainbowflags[cflag] and "rainbow") or Color3ToHex(value)
								end
								value = tostring(value)
								good, jval = JSONEncode(value)
								if not good or ((jval == "null") and (value ~= nil)) then
									warn("Could not save value:", value, debug.traceback(""))
								end
							end
							if good and jval then
								saving[cflag] = value
							end
						end
						local good, content = JSONEncode(saving)
						if good and content then
							setclipboard(content)
						end
					end
				}
				common_table = nil
			end
		end
		if options.Credit ~= false then
			daaata[1 + #daaata] = {"AddLabel", "__Designer.Label.Creator", detailssection, {
				Text = "Library by Pepsi#5229 "
			}}
		elseif "Gee, thanks for your support." then
		end
		if options.Info then
			local typ = type(options.Info)
			if typ == "string" then
				daaata[1 + #daaata] = {"AddLabel", "__Designer.Label.Creator", detailssection, {
					Text = options.Info
				}}
			elseif typ == "table" and #options.Info > 0 then
				for _, v in next, options.Info do
					daaata[1 + #daaata] = {"AddLabel", "__Designer.Label.Creator", detailssection, {
						Text = tostring(v)
					}}
				end
			end
		end
		for _, v in next, daaata do
			designerelements[v[2]] = v[3][v[1]](v[3], v[4])
		end
		designerelements["__Designer.Textbox.WorkspaceName"]:Set(library.WorkspaceName or "Unnamed Workspace")
		for k, v in next, elements do
			if v and k and string.sub(k, 1, 11) == "__Designer." and v.Type and v.Type ~= "Persistence" then
				flags[1 + #flags] = k
			end
		end
		if library.Backdrop then
			library.Backdrop.Image = resolveid(library_flags["__Designer.Background.ImageAssetID"], "__Designer.Background.ImageAssetID") or ""
			library.Backdrop.Visible = library_flags["__Designer.Background.UseBackgroundImage"] and true
			library.Backdrop.ImageTransparency = (library_flags["__Designer.Background.ImageTransparency"] or 95) / 100
			library.Backdrop.ImageColor3 = library_flags["__Designer.Background.ImageColor"] or Color3.new(1, 1, 1)
		end
		local function setbackground(t, Asset, Transparency, Visible)
			if Visible == nil and t ~= nil and type(t) ~= "table" then
				Asset, Transparency, Visible = t, Transparency, Visible
			end
			if Visible == 0 or ((Asset == 0 or Asset == false) and Visible == nil and Transparency == nil) then
				Visible = false
			elseif Visible == 1 or ((Asset == 1 or Asset == true) and Visible == nil and Transparency == nil) then
				Visible = true
			elseif Asset == nil and Transparency == nil and Visible == nil then
				Visible = not library_flags["__Designer.Background.UseBackgroundImage"]
			end
			local temp = Asset and type(Asset)
			if Transparency == nil and Visible == nil and temp == "number" and ((Asset ~= 1 and Asset ~= 0) or (Asset > 0 and Asset <= 100)) then
				Transparency, Asset, temp = Asset, nil
			end
			if temp and ((temp == "number" and Asset > 1) or temp == "string") then
				designerelements["__Designer.Textbox.ImageAssetID"]:Set(Asset)
			end
			temp = tonumber(Transparency)
			temp = (temp >= 0 and temp <= 1 and temp * 100) or temp
			if temp then
				designerelements["__Designer.Slider.ImageTransparency"]:Set(temp)
			end
			if Visible ~= nil then
				designerelements["__Designer.Toggle.UseBackgroundImage"]:Set(Visible and true)
			end
			return Asset, Transparency, Visible
		end
		local bk = options.Background or options.Backdrop or options.Grahpic
		if bk then
			if type(bk) == "table" then
				setbackground(bk.Asset or bk[1], bk.Transparency or bk[2], bk.Visible or bk[3])
			else
				setbackground(bk, 0, 1)
			end
		end
		library.Designer = {
			Options = options,
			Parent = windowFunctions,
			Name = "Designer",
			Flag = "Designer",
			Type = "Designer",
			Instance = designer,
			SetBackground = setbackground,
			Remove = designer.Remove
		}
		library.SetBackground = setbackground
		local savestuff = library.elements["__Designer.Background.WorkspaceProfile"]
		if savestuff then
			library.LoadFile = savestuff.LoadFile
			library.LoadFileRaw = savestuff.LoadFileRaw
			library.LoadJSON = savestuff.LoadJSON
			library.LoadJSONRaw = savestuff.LoadJSONRaw
			library.SaveFile = savestuff.SaveFile
			library.GetJSON = savestuff.GetJSON
		end
		spawn(updatecolorsnotween)
		local dorlod = nil
		if options.HideTheme then
			designer.Remove()
			dorlod = true
		elseif options.LockTheme then
			if colorsection then
				colorsection.Remove()
				dorlod = true
			end
			if backgroundsection then
				backgroundsection.Remove()
				dorlod = true
			end
			if designerelements then
				local thing = designerelements["__Designer.Persistence.ThemeFile"]
				if thing then
					thing.Remove()
					dorlod = true
				end
				thing = designerelements["__Designer.Button.TerminateGUI"]
				thing = thing and thing[3]
				if thing then
					thing.Remove()
					dorlod = true
				end
			end
		end
		if dorlod then
			windowFunctions:UpdateAll()
		end
		return library.Designer
	end
	windowFunctions.AddDesigner = windowFunctions.CreateDesigner
	windowFunctions.NewDesigner = windowFunctions.CreateDesigner
	windowFunctions.Designer = windowFunctions.CreateDesigner
	windowFunctions.D = windowFunctions.CreateDesigner
	function windowFunctions:UpdateAll()
		local target = self or windowFunctions
		if target and type(target) == "table" and target.Flags then
			for _, e in next, target.Flags do
				if e and type(e) == "table" then
					if e.Update then
						pcall(e.Update)
					end
					if e.UpdateAll then
						pcall(e.Update)
					end
				end
			end
			pcall(function()
				if library.Backdrop then
					library.Backdrop.Visible = library_flags["__Designer.Background.UseBackgroundImage"] and true
					library.Backdrop.Image = resolveid(library_flags["__Designer.Background.ImageAssetID"], "__Designer.Background.ImageAssetID") or ""
					library.Backdrop.ImageColor3 = library_flags["__Designer.Background.ImageColor"] or Color3.new(1, 1, 1)
					library.Backdrop.ImageTransparency = (library_flags["__Designer.Background.ImageTransparency"] or 95) / 100
				end
			end)
		end
	end
	library.UpdateAll = windowFunctions.UpdateAll
	if options.Themeable or options.DefaultTheme or options.Theme then
		spawn(function()
			local os_clock = os.clock
			local starttime = os_clock()
			while os_clock() - starttime < 12 do
				if homepage then
					windowFunctions.GoHome = homepage
					local x, e = pcall(homepage)
					if not x and e then
						warn("Error going to Homepage:", e)
					end
					x, e = nil
					break
				end
				task.wait()
			end
			local whatDoILookLike = options.Themeable or options.DefaultTheme or options.Theme
			if type(whatDoILookLike) == "table" then
				whatDoILookLike.LockTheme = whatDoILookLike.LockTheme or options.LockTheme or nil
				whatDoILookLike.HideTheme = whatDoILookLike.HideTheme or options.HideTheme or nil
			else
				whatDoILookLike = nil
			end
			windowFunctions:CreateDesigner(whatDoILookLike)
			if options.DefaultTheme or options.Theme then
				spawn(function()
					local content = options.DefaultTheme or options.Theme or options.JSON or options.ThemeJSON
					if content and type(content) == "string" and #content > 1 then
						local good, jcontent = JSONDecode(content)
						if good and jcontent then
							for cflag, val in next, jcontent do
								local data = elements[cflag]
								if data and (data.Type ~= "Persistence") then
									if data.Set then
										data:Set(val)
									elseif data.RawSet then
										data:RawSet(val)
									else
										library.flags[cflag] = val
									end
								end
							end
						end
					end
				end)
			end
			os_clock, starttime = nil
		end)
	end
	return windowFunctions
end
library.NewWindow = library.CreateWindow
library.AddWindow = library.CreateWindow
library.Window = library.CreateWindow
library.W = library.CreateWindow


Date = os.date("%d".." ".."%B".." ".."%Y")

local PepsiUi =
    library:CreateWindow(
    {
        Name = "Twst : Kaitan | "..Date,
        Theme = {Image = "rbxassetid://13077068950", Info = "This Script look like Normal Script \n Butn`t this is Kaitan Script For Blox Fruit \n this script make have work at pc only \n this Script Have Update any version On blox Fruit \n This Scritp Work on Synapse X And Krnl On ly \n But can run script on mobile on Flux and Oxigen x in mobile \n Thank for use My Script", Background = {Asset = "rbxassetid://5553946656"}}
    }
)



local KaiTun = PepsiUi:CreateTab({Name = "Genaral"})
local KaiTun1 = KaiTun:CreateSection({Name = "Main", Side = "Left"})
KaiTun1:AddToggle({
	Name = "Start Farm",
	Value = _G.Main["Start"], 
	Callback = function(value)
		_G.Main["Start"] = value
    end
})
KaiTun1:AddToggle({
	Name = "Black Screen",
	Value = _G.HUD["Black Screen"], 
	Callback = function(value)
		_G.HUD["Black Screen"] = value
		if _G.HUD["Black Screen"] or game:GetService("VirtualUser"):SetKeyDown("0x4E") then
			local UI = Instance.new("ScreenGui")
			UI.Name = "Black"
			UI.Parent = game.CoreGui:WaitForChild("RobloxGui"):WaitForChild("Modules")
			UI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
			local Main = Instance.new("Frame")
			Main.Name = "Main"
			Main.Parent = UI
			Main.BackgroundColor3 = Color3.fromRGB(0,0,0)
			Main.Position = UDim2.new(0.5, 0, 0.5, 0)
			Main.Size = UDim2.new(0, 99999999999999, 0, 999999999999999)
			Main.ClipsDescendants = true
			Main.AnchorPoint = Vector2.new(0.5, 0.5)
			game:GetService("RunService"):Set3dRenderingEnabled(false)
		elseif game:GetService("VirtualUser"):SetKeyDown("0x55") or _G.HUD["Black Screen"] == false then
			if game.CoreGui:WaitForChild("RobloxGui"):WaitForChild("Modules"):FindFirstChild("Black") then
				game.CoreGui:WaitForChild("RobloxGui"):WaitForChild("Modules").Black:Destroy()
			end
			game:GetService("RunService"):Set3dRenderingEnabled(true)
		end
    end
})
KaiTun1:AddButton({
    Name = "Rejoin Server",
    Callback = function()
        local ts = game:GetService("TeleportService") local p = game:GetService("Players").LocalPlayer ts:Teleport(game.PlaceId, p)
    end
})

local Infos = KaiTun:CreateSection({Name = "InFo", Side = "Left"})


Name = Infos:AddLabel({Name = "Name : "})
Race = Infos:AddLabel({Name = "Race : "})
fruit = Infos:AddLabel({Name = "Fruit : "})



function Info()
	Name:Set("Name : ".. game.Players.LocalPlayer.Name)
	Race:Set("Race : ".. game.Players.LocalPlayer.Data.Race.Value)
	if game.Players.LocalPlayer.Data.DevilFruit.Value ~= "" then
		fruit:Set("Fruit : "..game.Players.LocalPlayer.Data.DevilFruit.Value)
	else
		fruit:Set("Fruit : nil")
	end
end

spawn(function()
	while task.wait() do
		Info()
	end
end)

local KaiTun3 = KaiTun:CreateSection({Name = "Main", Side = "Right"})
local KaiTuns = KaiTun:CreateSection({Name = "Status", Side = "Right"})

local tim = KaiTuns:AddLabel({
    Name = ""
})


function UpdateTime()
    local GameTime = math.floor(workspace.DistributedGameTime+0.5)
    local Hour = math.floor(GameTime/(60^2))%24
    local Minute = math.floor(GameTime/(60^1))%60
    local Second = math.floor(GameTime/(60^0))%60
    tim:Set("Hour "..Hour.." Minute "..Minute.." Second "..Second)
end

spawn(function()
    while true do
        UpdateTime()
        wait()
    end
end)

local st = KaiTuns:AddLabel({
	Name = "Status : "
})

local po = KaiTun:CreateSection({Name = "Progress", Side = "Right"})

local enm = po:AddLabel({
	Name = "Elite : "
})

local cak = po:AddLabel({
	Name = "Cake Spawn : "
})



task.spawn(function()
    while task.wait() do
        pcall(function()
            if string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 88 then
                cak:Set("Killed : "..string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"),39,41))
            elseif string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 87 then
                cak:Set("Killed : "..string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"),39,40))
            elseif string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 86 then
                cak:Set("Killed : "..string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"),39,39))
            else
                cak:Set("Portal : Opened ✅")
            end
        end)
    end
end)




task.spawn(
    function()
		while wait() do
        	pcall(function()
                enm:Set("Elite : " .. game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter","Progress"))
            end)
        end
    end
)
havse = false
local KaiTun6 = KaiTun:CreateSection({Name = "Sword", Side = "Right"})
local KaiTun555 = KaiTun:CreateSection({Name = "Legendary Sword", Side = "Right"})
local KaiTun5 = KaiTun:CreateSection({Name = "Melee", Side = "Left"})
QuestAR = KaiTun:CreateSection({Name = "Quest", Side = "Left"})
Gun = KaiTun:CreateSection({Name = "Gun", Side = "Left"})
Superhuman = KaiTun5:AddLabel({Name = "❌ : Superhuman"})
SharkmanKarate = KaiTun5:AddLabel({Name = "❌ : Sharkman Karate"})
DeathStep = KaiTun5:AddLabel({Name = "❌ : Death Step"})
ElectricClaw = KaiTun5:AddLabel({Name = "❌ : Electric Claw"})
DragonTalon = KaiTun5:AddLabel({Name = "❌ : Dragon Talon"})
GodHuman = KaiTun5:AddLabel({Name = "❌ : God Human"})
Shisui = KaiTun555:AddLabel({Name = "❌ : Shisui"})
Saddi = KaiTun555:AddLabel({Name = "❌ : Saddi"})
Wando = KaiTun555:AddLabel({Name = "❌ : Wando"})
TrueTripleKatana = KaiTun555:AddLabel({Name = "❌ : True Triple Katana"})
Rengoku = KaiTun6:AddLabel({Name = "❌ : Rengoku"})
Saber = KaiTun6:AddLabel({Name = "❌ : Saber"})
polev1 = KaiTun6:AddLabel({Name = "❌ : Pole (1st Form)"})
MidnightBlade = KaiTun6:AddLabel({Name = "❌ : Midnight Blade"})
DragonTrident = KaiTun6:AddLabel({Name = "❌ : DragonTrident"})
Yama = KaiTun6:AddLabel({Name = "❌ : Yama"})
BuddySword = KaiTun6:AddLabel({Name = "❌ : Buddy Sword"})
Canvander = KaiTun6:AddLabel({Name = "❌ : Canvander"})
TwinHooks = KaiTun6:AddLabel({Name = "❌ : Twin Hooks"})
SpikeyTrident = KaiTun6:AddLabel({Name = "❌ : Spikey Trident"})
HallowScythe = KaiTun6:AddLabel({Name = "❌ : Hallow Scythe"})
DarkDagger = KaiTun6:AddLabel({Name = "❌ : Dark Dagger"})
Tushita = KaiTun6:AddLabel({Name = "❌ : Tushita"})
CDK = KaiTun6:AddLabel({Name = "❌ : Cursed Dual Katana"})
Kabucha = Gun:AddLabel({Name = "❌ : Kabucha"})
AcidumRifle = Gun:AddLabel({Name = "❌ : Acidum Rifle"})
BizarreRifle = Gun:AddLabel({Name = "❌ : Bizarre Rifle"})
Guita = Gun:AddLabel({Name = "❌ : Soul Guita"})
QuestShark = QuestAR:AddLabel({Name = "❌ : Quest Sharkman"})
QuestDeath = QuestAR:AddLabel({Name = "❌ : Quest Death Step"})
BartiloQuest = QuestAR:AddLabel({Name = "❌ : Bartilo Quest"})
DonSwanQuest = QuestAR:AddLabel({Name = "❌ : Don Swan Quest"})
KillDonSwan = QuestAR:AddLabel({Name = "❌ : Kill Don Swan"})



spawn(function()
	while task.wait() do
		pcall(function()
			if StatrMagnet then
				if _G.Main["Start"] then
					if game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == true then
						for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
							if Old_World then
								if v.Name == Ms and (v.HumanoidRootPart.Position-_G.PosMon.Position).Magnitude <= 250 then
									v.Humanoid:ChangeState(11)
									v.Humanoid.JumpPower = 0
									v.Humanoid.WalkSpeed = 0
									v.HumanoidRootPart.CanCollide = false
									v.HumanoidRootPart.Size = Vector3.new(5,5,5)
									v.HumanoidRootPart.CFrame = _G.PosMon
									sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  math.huge)
									Attack = true
								end
							elseif New_World or Three_World then
								if v.Name == Ms and (v.HumanoidRootPart.Position-_G.PosMon.Position).Magnitude <= 350 then
									v.Humanoid:ChangeState(11)
									v.Humanoid.JumpPower = 0
									v.Humanoid.WalkSpeed = 0
									v.HumanoidRootPart.CanCollide = false
									v.HumanoidRootPart.Size = Vector3.new(5,5,5)
									v.HumanoidRootPart.CFrame = _G.PosMon
									sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  math.huge)
									Attack = true
								end
							elseif Ms == "Ship Deckhand [Lv. 1250]" or Ms == "Ship Engineer [Lv. 1275]" or Ms == "Ship Steward [Lv. 1300]" or Ms == "Ship Officer [Lv. 1325]" then
								if v.Name == Ms and (v.HumanoidRootPart.Position-_G.PosMon.Position).Magnitude <= 150 then
									v.Humanoid:ChangeState(11)
									v.Humanoid.JumpPower = 0
									v.Humanoid.WalkSpeed = 0
									v.HumanoidRootPart.CanCollide = false
									v.HumanoidRootPart.Size = Vector3.new(5,5,5)
									v.HumanoidRootPart.CFrame = _G.PosMon
									sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  math.huge)
									Attack = true
								end
							end
						end
					end
				elseif _G.Main["Start"] and MagnetBartilo then
					if v.Name == "Swan Pirate [Lv. 775]" then
						v.Head.CanCollide = false
						v.HumanoidRootPart.CanCollide = false
						v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
						v.Humanoid.WalkSpeed = 0
						v.HumanoidRootPart.CFrame = PosMonBartilo
						sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
					end
				elseif _G.Main["Start"] and RengokuMagnet then
					if (v.Name == "Snow Lurker [Lv. 1375]" or v.Name == "Arctic Warrior [Lv. 1350]") and (v.HumanoidRootPart.Position - PosMonRengoku.Position).Magnitude <= 375 then
						v.Head.CanCollide = false
						v.HumanoidRootPart.CanCollide = false
						v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
						v.Humanoid.WalkSpeed = 0
						v.HumanoidRootPart.CFrame = PosMonRengoku
						sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
					end
				end
			end
		end)
	end
end)

spawn(function()
    while wait() do
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LegendarySwordDealer", "1")
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LegendarySwordDealer", "2")
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LegendarySwordDealer", "3")
		local UpStatus = game.Players.localPlayer.Data.Points.Value or 1
        if game:GetService("Players").LocalPlayer.Data.Stats.Melee.Level.Value < 2450 then
            local args = {
                [1] = "AddPoint",
                [2] = "Melee",
                [3] = tonumber(UpStatus)
            }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        elseif game:GetService("Players").LocalPlayer.Data.Stats.Defense.Level.Value < 2450 and game:GetService("Players").LocalPlayer.Data.Stats.Melee.Level.Value == 2450 then
            local args = {
                [1] = "AddPoint",
                [2] = "Defense",
                [3] = tonumber(UpStatus)
            }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        elseif game:GetService("Players").LocalPlayer.Data.Stats["Demon Fruit"].Level.Value < 1225 and game:GetService("Players").LocalPlayer.Data.Stats.Defense.Level.Value == 2450 then
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", "Demon Fruit", 1)
		else
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", "Sword", 1)
		end
        if setscriptable then
            setscriptable(game.Players.LocalPlayer, "SimulationRadius", true)
            game.Players.LocalPlayer.SimulationRadius = math.huge * math.huge, math.huge * math.huge * 1 / 0 * 1 / 0 * 1 / 0 * 1 / 0 * 1 / 0
        end
    end
end)

task.spawn(function()
	if game.Players.LocalPlayer.Character:FindFirstChild("Stun") then
		game.Players.LocalPlayer.Character.Stun.Changed:connect(function()
			pcall(function()
				if game.Players.LocalPlayer.Character:FindFirstChild("Stun") then
					game.Players.LocalPlayer.Character.Stun.Value = 0
				end
			end)
		end)
	end
end)

local YaY = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework)
local CameraShakerR = require(game.ReplicatedStorage.Util.CameraShaker)
task.spawn(function()
	while task.wait() do
		if RawFastAttack then
			pcall(function()
				for i,CombatFrameworkR in pairs(debug.getupvalues(YaY)) do
					if i == 2 then
						CameraShakerR:Stop()
						CombatFrameworkR.activeController.attacking = false
						CombatFrameworkR.activeController.timeToNextAttack = 0
						CombatFrameworkR.activeController.increment = 4
						CombatFrameworkR.activeController.increment = 2
						CombatFrameworkR.activeController.hitboxMagnitude = 150
						CombatFrameworkR.activeController.blocking = false
						CombatFrameworkR.activeController.timeToNextBlock = 0
						CombatFrameworkR.activeController.focusStart = 0
						CombatFrameworkR.activeController.humanoid.AutoRotate = true
					end
				end
			end)
		else
			for i,CombatFrameworkR in pairs(debug.getupvalues(YaY)) do
				if i == 2 then
					pcall(function()
						CameraShakerR:Stop()
						CombatFrameworkR.activeController.attacking = false
						CombatFrameworkR.activeController.hitboxMagnitude = 150
						CombatFrameworkR.activeController.blocking = false
						CombatFrameworkR.activeController.focusStart = 0
						CombatFrameworkR.activeController.humanoid.AutoRotate = true
					end)
				end
			end
		end
	end
end)







task.spawn(function()
    while wait() do
        pcall(function()
			if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
			else
				wait(.1)
			end
        end)
    end
end)

spawn(function()
	while wait() do
		pcall(function()
			for i,v in pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventoryFruits")) do
				if v ~= nil and v.Price < 1000000 then
					HaveFruit = true
				else
					HaveFruit = false
				end
			end
		end)
	end
end)



function EquipAllWeapon()
	pcall(function()
		for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
			if v:IsA('Tool') and not (v.Name == "Summon Sea Beast" or v.Name == "Water Body" or v.Name == "Awakening") then
				local ToolHumanoid = game.Players.LocalPlayer.Backpack:FindFirstChild(v.Name) 
				game.Players.LocalPlayer.Character.Humanoid:EquipTool(ToolHumanoid) 
                wait(1)
			end
		end
	end)
end

function Text(Text)
	st:Set("Status : ".. tostring(Text))
end

if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Wenlocktoad","1") == -2 then
	if game.Players.LocalPlayer.Data.Race.Value == 'Mink' then
		Mink = true
	elseif game.Players.LocalPlayer.Data.Race.Value == 'Human' then
		Human = true
	elseif game.Players.LocalPlayer.Data.Race.Value == 'Skypiea' then
		Skypiea = true
	elseif game.Players.LocalPlayer.Data.Race.Value == 'Fishman' then
		Fish = true
	end
end

function Check_Race_Skypiea()
	for i,v in pairs(game.Players:GetChildren()) do
		if v.Name ~= game.Players.LocalPlayer.Name and tostring(v.Data.Race.Value) == "Skypiea" then
			print(v.Name)
			_G.Select_Player = v.Name
			return
		end
	end
end

function HopServer()
    if not _G.TP_Ser then
		_G.TP_Ser = true
		game.StarterGui:SetCore("SendNotification", {
			Title = "Hop Low Server ", 
			Text = "กำลังหาเซิฟ",
			Icon = "http://www.roblox.com/asset/?id=9606070311",
			Duration = 25
		})
		local PlaceID = game.PlaceId
		local AllIDs = {}
		local foundAnything = ""
		local actualHour = os.date("!*t").hour
		local Deleted = false
		function TPReturner()
			local Site;
			if foundAnything == "" then
				Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
			else
				Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
			end
			local ID = ""
			if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
				foundAnything = Site.nextPageCursor
			end
			local num = 0;
			for i,v in pairs(Site.data) do
				local Possible = true
				ID = tostring(v.id)
				game.StarterGui:SetCore("SendNotification", {
					Title = "Hop Low Server ", 
					Text = "Players : " ..tonumber(v.playing),
					Icon = "http://www.roblox.com/asset/?id=9606070311",
					Duration = 1.5
				})
				if tonumber(v.maxPlayers) > tonumber(v.playing) then
					for _,Existing in pairs(AllIDs) do
						if num ~= 0 then
							if ID == tostring(Existing) then
								Possible = false
							end
						else
							if tonumber(actualHour) ~= tonumber(Existing) then
								local delFile = pcall(function()
									-- delfile("NotSameServers.json")
									AllIDs = {}
									table.insert(AllIDs, actualHour)
								end)
							end
						end
						num = num + 1
					end
					if Possible == true then
						table.insert(AllIDs, ID)
						wait()
						pcall(function()
							_G.Setting_table.Hop_Server = true 
							Update_Setting(getgenv()['MyName'])
							_G.TP_Ser = true
							-- writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
							wait()
							game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
						end)
						wait(.1)
					end
				end
			end
		end
		function Bring()
			while wait(.2) do
				pcall(function()
					TPReturner()
					if foundAnything ~= "" then
						TPReturner()
					end
				end)
			end
		end
		Bring()
	end
end




local gg = getrawmetatable(game)
local old = gg.__namecall
setreadonly(gg,false)
gg.__namecall = newcclosure(function(...)
	local method = getnamecallmethod()
	local args = {...}
	if tostring(method) == "FireServer" then
		if tostring(args[1]) == "RemoteEvent" then
			if tostring(args[2]) ~= "true" and tostring(args[2]) ~= "false" then
				if Skillaimbot then
					args[2] = AimBotSkillPosition
					return old(unpack(args))
				end
			end
		end
	end
	return old(...)
end)


task.spawn(function()
	local gg = getrawmetatable(game)
	local old = gg.__namecall
	setreadonly(gg,false)
	gg.__namecall = newcclosure(function(...)
		local method = getnamecallmethod()
		local args = {...}
		if tostring(method) == "FireServer" then
			if tostring(args[1]) == "RemoteEvent" then
				if tostring(args[2]) ~= "true" and tostring(args[2]) ~= "false" then
					if UseSkillMasteryDevilFruit then
						if type(args[2]) == "vector" then 
							args[2] = PositionSkillMasteryDevilFruit
						else
							args[2] = CFrame.new(PositionSkillMasteryDevilFruit)
						end
						return old(unpack(args))
					end
				end
			end
		end
		return old(...)
	end)
end)

Skillz = true
Skillx = true
Skillc = true
Skillv = true

spawn(function()
    while task.wait() do
        pcall(function()
            if AutoSkill then
                if Skillz then
                    game:service('VirtualInputManager'):SendKeyEvent(true, "Z", false, game)
                    wait(.1)
                    game:service('VirtualInputManager'):SendKeyEvent(false, "Z", false, game)
                end
                if Skillx then
                    game:service('VirtualInputManager'):SendKeyEvent(true, "X", false, game)
                    wait(.1)
                    game:service('VirtualInputManager'):SendKeyEvent(false, "X", false, game)
                end
                if Skillc then
                    game:service('VirtualInputManager'):SendKeyEvent(true, "C", false, game)
                    wait(.1)
                    game:service('VirtualInputManager'):SendKeyEvent(false, "C", false, game)
                end
                if Skillv then
                    game:service('VirtualInputManager'):SendKeyEvent(true, "V", false, game)
                    wait(.1)
                    game:service('VirtualInputManager'):SendKeyEvent(false, "V", false, game)
                end
            end
        end)
    end
end)


function Ksill()
	if Skillz then
		game:service('VirtualInputManager'):SendKeyEvent(true, "Z", false, game)
		wait(.1)
		game:service('VirtualInputManager'):SendKeyEvent(false, "Z", false, game)
	end
	if Skillx then
		game:service('VirtualInputManager'):SendKeyEvent(true, "X", false, game)
		wait(.1)
		game:service('VirtualInputManager'):SendKeyEvent(false, "X", false, game)
	end
	if Skillc then
		game:service('VirtualInputManager'):SendKeyEvent(true, "C", false, game)
		wait(.1)
		game:service('VirtualInputManager'):SendKeyEvent(false, "C", false, game)
	end
	if Skillv then
		game:service('VirtualInputManager'):SendKeyEvent(true, "V", false, game)
		wait(.1)
		game:service('VirtualInputManager'):SendKeyEvent(false, "V", false, game)
	end
end

Check = 1
spawn(function()
	while task.wait() do
		Check = math.random(1,4)
		wait(0.2)
	end
end)

_G.Quest = {
	SharkMan = false,
	DeathStep = false,
	Rengoku = false,
	Midnight = false,
	Kabucha = false,
	DonSwanQuest = false,
	Balito = false,
	---World 3
	Yama = false,
	Tushita = false,
	Spike = false,
	Dagger = false,
	Val = false,
	Canvander = false,
	Buddy  = false,
	Twin = false,
	CDK = false,
	Soul_Guita = false
}

_G.Check = false
--[[spawn(function()
	while wait() do
		wait(5)
		_G.Check = true
	end
end)]]

local SupComplete = false
local EClawComplete = false
local TalComplete = false
local SharkComplete = false
local DeathComplete = false
local GodComplete = false

function GetAllMeleeFarm()
	if SupComplete == false then
		local args = {
			[1] = "BuySuperhuman"
		}
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
		if CheckMasteryWeapon("Superhuman",600) == "true UpTo" then
			SupComplete = true
		end
	end
	wait(.5)
	if EClawComplete == false and SupComplete == true then
		local string_1 = "BuyElectricClaw";
		local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
		Target:InvokeServer(string_1);

		if CheckMasteryWeapon("Electric Claw",600) == "true UpTo" then
			EClawComplete = true
		end
	end
	wait(.5)
	if TalComplete == false and EClawComplete == true then
		game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyDragonTalon")

		if CheckMasteryWeapon("Dragon Talon",600) == "true UpTo" then
			TalComplete = true
		end
	end
	wait(.5)
	if SharkComplete == false and TalComplete == true then
		local args = {
			[1] = "BuySharkmanKarate"
		}
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

		if CheckMasteryWeapon("Sharkman Karate",600) == "true UpTo" then
			SharkComplete = true
		end
	end
	wait(.5)
	if DeathComplete == false and SharkComplete == true then
		local args = {
			[1] = "BuyDeathStep"
		}
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

		if CheckMasteryWeapon("Death Step",600) == "true UpTo" then
			DeathComplete = true
		end
	end
	if GodComplete == false and DeathComplete == true then
		local args = {
			[1] = "BuyGodhuman"
		}
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

		if CheckMasteryWeapon("Godhuman",600) == "true UpTo" then
			GodComplete = true
		end
	end
end





s1 = false
df = false
gotp3 = false
spf = false
spawn(function()
	while wait() do
		pcall(function()
			for i, v in pairs(game:GetService("Workspace"):GetChildren()) do	
				if string.find(v.Name, "Fruit") then
					if v:IsA("Tool") then
						spf = true
					end
				elseif not string.find(v.Name, "Fruit") then
					spf = false
				end		
			end
		end)
	end
end)


local AllSwordInInventroy = {};
for i,v in pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventory")) do
	if type(v) == "table" then
		if v.Type == "Sword" then
			if table.find(_G.Mastery["Setting Rarity"], "All") then
				table.insert(AllSwordInInventroy,v.Name)
			elseif table.find(_G.Mastery["Setting Rarity"], "Common") then
				if v.Rarity == 0 then
					table.insert(AllSwordInInventroy,v.Name)
				end
			elseif table.find(_G.Mastery["Setting Rarity"], "Uncommon") then
				if v.Rarity == 1 then
					table.insert(AllSwordInInventroy,v.Name)
				end
			elseif table.find(_G.Mastery["Setting Rarity"], "Rare") then
				if v.Rarity == 2 then
					table.insert(AllSwordInInventroy,v.Name)
				end
			elseif table.find(_G.Mastery["Setting Rarity"], "Legendary") then
				if v.Rarity == 3 then
					table.insert(AllSwordInInventroy,v.Name)
				end
			elseif table.find(_G.Mastery["Setting Rarity"], "Mytical") then
				if v.Rarity == 4 then
					table.insert(AllSwordInInventroy,v.Name)
				end
			end
		end
	end
end

spawn(function()
	while wait() do
		table.clear(AllSwordInInventroy)
		for i,v in pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventory")) do
			if type(v) == "table" then
				if v.Type == "Sword" then
					if table.find(_G.Mastery["Setting Rarity"], "All") then
						table.insert(AllSwordInInventroy,v.Name)
					elseif table.find(_G.Mastery["Setting Rarity"], "Common") then
						if v.Rarity == 0 then
							table.insert(AllSwordInInventroy,v.Name)
						end
					elseif table.find(_G.Mastery["Setting Rarity"], "Uncommon") then
						if v.Rarity == 1 then
							table.insert(AllSwordInInventroy,v.Name)
						end
					elseif table.find(_G.Mastery["Setting Rarity"], "Rare") then
						if v.Rarity == 2 then
							table.insert(AllSwordInInventroy,v.Name)
						end
					elseif table.find(_G.Mastery["Setting Rarity"], "Legendary") then
						if v.Rarity == 3 then
							table.insert(AllSwordInInventroy,v.Name)
						end
					elseif table.find(_G.Mastery["Setting Rarity"], "Mytical") then
						if v.Rarity == 4 then
							table.insert(AllSwordInInventroy,v.Name)
						end
					end
				end
			end
		end
	end
end)

spawn(function()
	while wait() do
		_G.SelectSW = AllSwordInInventroy
	end
end)


local function inmyself(name)
	return game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(name) or game:GetService("Players").LocalPlayer.Character:FindFirstChild(name);
end



function AutoFarmMasterySwordList()
	if (game:GetService("Workspace").Enemies:FindFirstChild("Reborn Skeleton [Lv. 1975]") or game:GetService("Workspace").Enemies:FindFirstChild("Living Zombie [Lv. 2000]") or game:GetService("Workspace").Enemies:FindFirstChild("Demonic Soul [Lv. 2025]") or game:GetService("Workspace").Enemies:FindFirstChild("Posessed Mummy [Lv. 2050]")) then
		for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
			if (v.Name == "Reborn Skeleton [Lv. 1975]" or v.Name == "Living Zombie [Lv. 2000]" or v.Name == "Demonic Soul [Lv. 2025]" or v.Name == "Posessed Mummy [Lv. 2050]") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
				repeat task.wait()
					EquipWeaponSword()
					StartMagnet = true
					FastAttacSlow = true
					PosMon = v.HumanoidRootPart.CFrame
					v.Humanoid.JumpPower = 0
					v.Humanoid.WalkSpeed = 0
					v.HumanoidRootPart.CanCollide = false
					TP(v.HumanoidRootPart.CFrame * CFrame.new(0,20,0))
				until not (v.Name == "Reborn Skeleton [Lv. 1975]" or v.Name == "Living Zombie [Lv. 2000]" or v.Name == "Demonic Soul [Lv. 2025]" or v.Name == "Posessed Mummy [Lv. 2050]") or not _G.Main["Start"] or v.Humanoid.Health <= 0 or not v.Parent
				StartMagnet = false
				FastAttacSlow = false
			end
		end
	else
		StartMagnet = false
		FastAttacSlow = false
		TP(CFrame.new(-9506.14648, 172.130661, 6101.79053))
	end
end

SwordListFarmComplete = {};

function FW()
	if _G.SelectSW ~= 0 then
		for i,v in pairs(_G.SelectSW) do
			if table.find(SwordListFarmComplete,v) then
				break;
			end
			if not game.Players.LocalPlayer.Backpack:FindFirstChild(v) and not game.Players.LocalPlayer.Character:FindFirstChild(v) and game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):GetState() ~= Enum.HumanoidStateType.Dead and game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Health ~= 0 then
				while true do wait()
					if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Health == 0 then repeat wait() until game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Health > 0; wait(0.2) end
					if game.Players.LocalPlayer.Backpack:FindFirstChild(v) or game.Players.LocalPlayer.Character:FindFirstChild(v) or table.find(SwordListFarmComplete,v) then 
						break;
					end
					wait(1)
					Com("F_","StoreItem",tostring(GetFightingStyle("Sword")),inmyself(GetFightingStyle("Sword")))
					wait(1)
					Com("F_","LoadItem",tostring(v))
					wait(0.5)
					if game.Players.LocalPlayer.Backpack:FindFirstChild(v) or game.Players.LocalPlayer.Character:FindFirstChild(v) then
						SelectWeaponInSwordList = v
						break;
					end
					if CheckMasteryWeapon(v,375) == "true" or CheckMasteryWeapon(v,375) == "true UpTo" then
						print("DONE "..v)     
						table.insert(SwordListFarmComplete,v)
						break;
					end
				end
			end
			wait(0.2)
			if game.Players.LocalPlayer.Backpack:FindFirstChild(v) or game.Players.LocalPlayer.Character:FindFirstChild(v) then
				while true do wait()
					if table.find(SwordListFarmComplete,v) and #_G.SelectSW ~= 0 and #SwordListFarmComplete ~= 0 then
						break
					end
					if game.Players.LocalPlayer.Backpack:FindFirstChild(v) or game.Players.LocalPlayer.Character:FindFirstChild(v) then
						SelectWeaponInSwordList = v
					end
					AutoFarmMasterySwordList()
					if CheckMasteryWeapon(v,375) == "true" or CheckMasteryWeapon(v,375) == "true UpTo" then
						print("DONE "..v)
						table.insert(SwordListFarmComplete,v)
						break;
					end
				end
			end
		end
	end
end

Cursed = false
_G.ch = 0




spawn(function()
	while wait() do
		pcall(function()
			local MyLevel = game.Players.LocalPlayer.Data.Level.Value
			if _G.Melee["Super Human"] and _G.Mud.Superhuman.Superhuman == false then
				if game.Players.LocalPlayer:FindFirstChild("WeaponAssetCache") then 
					local Beli = game:GetService("Players").LocalPlayer.Data.Beli.Value
					local FG = game:GetService("Players").LocalPlayer.Data.Fragments.Value
					if _G.Mud.Superhuman.BlackLeg == false then
						local args = {
							[1] = "BuyBlackLeg"
						}
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
						if CheckMasteryWeapon("Black Leg",300) == "true" or CheckMasteryWeapon("Black Leg",300) == "true UpTo" then
							_G.Mud.Superhuman.BlackLeg = true
						end
					end
					if _G.Mud.Superhuman.Electro == false and _G.Mud.Superhuman.BlackLeg == true then
						local args = {
							[1] = "BuyElectro"
						}
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
						if CheckMasteryWeapon("Electro",300) == "true" or CheckMasteryWeapon("Electro",300) == "true UpTo" then
							_G.Mud.Superhuman.Electro = true
						end
					end
					if _G.Mud.Superhuman.Electro == false and _G.Mud.Superhuman.BlackLeg == true then
						local args = {
							[1] = "BuyElectro"
						}
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
						if CheckMasteryWeapon("Electro",300) == "true" or CheckMasteryWeapon("Electro",300) == "true UpTo" then
							_G.Mud.Superhuman.Electro = true
						end
					end
					if _G.Mud.Superhuman.Fishman == false and (_G.Mud.Superhuman.Electro) == true then
						local args = {
							[1] = "BuyFishmanKarate"
						}
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
						if CheckMasteryWeapon("Fishman Karate",300) == "true" or CheckMasteryWeapon("Fishman Karate",300) == "true UpTo" then
							_G.Mud.Superhuman.Fishman = true
						end
					end
					if _G.Mud.Superhuman.Fishman == false and (_G.Mud.Superhuman.Electro) == true then
						local args = {
							[1] = "BuyFishmanKarate"
						}
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
						if CheckMasteryWeapon("Fishman Karate",300) == "true" or CheckMasteryWeapon("Fishman Karate",300) == "true UpTo" then
							_G.Mud.Superhuman.Fishman = true
						end
					end
					if _G.Mud.Superhuman.DragonClaw == false and _G.Mud.Superhuman.Fishman == true then
						if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","2") == 0 then
							local args = {
								[1] = "BlackbeardReward",
								[2] = "DragonClaw",
								[3] = "2"
							}
							HaveDragonClaw = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
							if _G.Main["Start"] and game.Players.LocalPlayer.Data.Fragments.Value < 1500 and HaveDragonClaw == 0 and HaveFruit  then
								if game.Players.LocalPlayer.Data.Level.Value > 1100 then
									--_G.Main["Start"] = false
									AutoRaids = true
								end
							elseif game.Players.LocalPlayer.Data.Fragments.Value >= 1500 then
								AutoRaids = false
								--_G.Main["Start"] = true
								local args = {
									[1] = "BlackbeardReward",
									[2] = "DragonClaw",
									[3] = "2"
								}
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
							end
							if CheckMasteryWeapon("Dragon Claw",300) == "true" or CheckMasteryWeapon("Dragon Claw",300) == "true UpTo" then
								_G.Mud.Superhuman.DragonClaw = true
							end
						else
							local args = {
								[1] = "BlackbeardReward",
								[2] = "DragonClaw",
								[3] = "2"
							}
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
							if CheckMasteryWeapon("Dragon Claw",300) == "true" or CheckMasteryWeapon("Dragon Claw",300) == "true UpTo" then
								_G.Mud.Superhuman.DragonClaw = true
							end
						end
					end
					if _G.Mud.Superhuman.DragonClaw == false and _G.Mud.Superhuman.Fishman == true then
						if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","2") == 0 then
							local args = {
								[1] = "BlackbeardReward",
								[2] = "DragonClaw",
								[3] = "2"
							}
							HaveDragonClaw = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
							if _G.Main["Start"] and game.Players.LocalPlayer.Data.Fragments.Value < 1500 and HaveDragonClaw == 0 and HaveFruit  then
								if game.Players.LocalPlayer.Data.Level.Value > 1100 then
									--_G.Main["Start"] = false
									AutoRaids = true
								end
							elseif game.Players.LocalPlayer.Data.Fragments.Value >= 1500 then
								AutoRaids = false
								--_G.Main["Start"] = true
								local args = {
									[1] = "BlackbeardReward",
									[2] = "DragonClaw",
									[3] = "2"
								}
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
							end
							if CheckMasteryWeapon("Dragon Claw",300) == "true" or CheckMasteryWeapon("Dragon Claw",300) == "true UpTo" then
								_G.Mud.Superhuman.DragonClaw = true
							end
						else
							local args = {
								[1] = "BlackbeardReward",
								[2] = "DragonClaw",
								[3] = "2"
							}
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
							if CheckMasteryWeapon("Dragon Claw",300) == "true" or CheckMasteryWeapon("Dragon Claw",300) == "true UpTo" then
								_G.Mud.Superhuman.DragonClaw = true
							end
						end
					end
					if _G.Mud.Superhuman.Superhuman == false and _G.Mud.Superhuman.DragonClaw == true then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman")
						wait()
						if CheckMasteryWeapon("Superhuman",330) == "true" or CheckMasteryWeapon("Superhuman",330) == "true UpTo" then
							_G.Mud.Superhuman.Superhuman = true
						end
					end
					if _G.Mud.Superhuman.Superhuman == false and _G.Mud.Superhuman.DragonClaw == true then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman")
						wait()
						if CheckMasteryWeapon("Superhuman",330) == "true" or CheckMasteryWeapon("Superhuman",330) == "true UpTo" then
							_G.Mud.Superhuman.Superhuman = true
						end
					end
				end
			elseif _G.Melee["Sharkman Karate"] and _G.Quest.SharkMan == true and _G.Mud.Sharkman.SharkmanKarate == false and (_G.Mud.Superhuman.Superhuman) == true then
				if _G.Mud.Sharkman.Fishman == false then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")
					if CheckMasteryWeapon("Fishman Karate",400) == "true" or CheckMasteryWeapon("Fishman Karate",400) == "true UpTo" then
						_G.Mud.Sharkman.Fishman = true
					end
				end
				if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate") == 0 then
					if _G.Mud.Sharkman.SharkmanKarate == false and _G.Mud.Sharkman.Fishman == true and HaveFruit and not gotp3 then
						local args = {
							[1] = "BuySharkmanKarate"
						}
						HaveShark = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
						if game.Players.LocalPlayer.Data.Fragments.Value < 5000 and HaveShark == 0 then
							if game.Players.LocalPlayer.Data.Level.Value >= 1100 then
								--_G.Main["Start"] = false
								AutoRaids = true
							end
						elseif game.Players.LocalPlayer.Data.Fragments.Value >= 5000 or not HaveFruit then
							AutoRaids = false
							--_G.Main["Start"] = true
							local args = {
								[1] = "BuySharkmanKarate"
							}
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
							if CheckMasteryWeapon("Sharkman Karate",300) == "true" or CheckMasteryWeapon("Sharkman Karate",300) == "true UpTo" then
								_G.Mud.Sharkman.SharkmanKarate = true
							end
						end	
					end
				else
					local args = {
						[1] = "BuySharkmanKarate"
					}
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
					if CheckMasteryWeapon("Sharkman Karate",300) == "true" or CheckMasteryWeapon("Sharkman Karate",300) == "true UpTo" then
						_G.Mud.Sharkman.SharkmanKarate = true
					end
				end
			elseif _G.Melee["Death Step"] == true and _G.Mud.DeathStep.DeathStep == false and _G.Mud.Sharkman.SharkmanKarate == true and _G.Quest.DeathStep == true then
				if _G.Mud.DeathStep.BlackLeg == false then
					local args = {
						[1] = "BuyBlackLeg"
					}
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
					if CheckMasteryWeapon("Black Leg",400) == "true" or CheckMasteryWeapon("Black Leg",400) == "true UpTo" then
						_G.Mud.DeathStep.BlackLeg = true
					end
				end
				if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep") == 0 then
					if _G.Mud.DeathStep.DeathStep == false and _G.Mud.DeathStep.BlackLeg == true and HaveFruit and not gotp3 then
						local args = {
							[1] = "BuyDeathStep"
						}
						HaveDeath = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
						if _G.Main["Start"] and game.Players.LocalPlayer.Data.Fragments.Value < 5000 and HaveDeath == 0 then
							if game.Players.LocalPlayer.Data.Level.Value >= 1100 then
								--_G.Main["Start"] = false
								AutoRaids = true
							end
						elseif game.Players.LocalPlayer.Data.Fragments.Value >= 5000 or not HaveFruit then
							AutoRaids = false
							--_G.Main["Start"] = true
							local args = {
								[1] = "BuyDeathStep"
							}
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
							if CheckMasteryWeapon("Death Step",400) == "true" or CheckMasteryWeapon("Death Step",400) == "true UpTo" then
								_G.Mud.DeathStep.DeathStep = true
							end
						end	
					end
				else
					local args = {
						[1] = "BuyDeathStep"
					}
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
					if CheckMasteryWeapon("Death Step",400) == "true" or CheckMasteryWeapon("Death Step",400) == "true UpTo" then
						_G.Mud.DeathStep.DeathStep = true
					end
				end
			elseif _G.Melee["Electric Claw"] and _G.Mud.DeathStep.DeathStep == true and _G.Mud.ElectricClaw.ElectricClaw == false then
				if _G.Mud.ElectricClaw.Electro == false then
					local args = {
						[1] = "BuyElectro"
					}
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
					if CheckMasteryWeapon("Electro",400) == "true" or CheckMasteryWeapon("Electro",400) == "true UpTo" then
						_G.Mud.ElectricClaw.Electro = true
					end
				end
				if _G.Mud.ElectricClaw.Electro == true and _G.Mud.ElectricClaw.ElectricClaw == false then
					if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyElectricClaw", true) ~= 1 then
						if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyElectricClaw", true) == 4 then
							if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyElectricClaw", "Start") == nil and not AutoRaid and not New_Word then
								QuestEle = true
							end
						elseif _G.Main["Start"] and game.Players.LocalPlayer.Data.Fragments.Value < 5000 and HaveFruit and game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyElectricClaw", true) ~= 1 then
							if game.Players.LocalPlayer.Data.Level.Value >= 1100 then
								AutoRaids = true
							end
						elseif game.Players.LocalPlayer.Data.Fragments.Value >= 5000 or game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyElectricClaw", true) ~= 0 or not HaveFruit then
							AutoRaids = false
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
							if CheckMasteryWeapon("Electric Claw",330) == "true" or CheckMasteryWeapon("Electric Claw",330) == "true UpTo" then
								_G.Mud.ElectricClaw.ElectricClaw = true
							end
						end	
					else
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
						if CheckMasteryWeapon("Electric Claw",330) == "true" or CheckMasteryWeapon("Electric Claw",330) == "true UpTo" then
							_G.Mud.ElectricClaw.ElectricClaw = true
						end
					end
				end
				if CheckMasteryWeapon("Electric Claw",330) == "true" or CheckMasteryWeapon("Electric Claw",330) == "true UpTo" then
					_G.Mud.ElectricClaw.ElectricClaw = true
				end
			elseif _G.Melee["Dragon Talon"] and _G.Mud.ElectricClaw.ElectricClaw == true and _G.Mud.DragonTalon.DragonTalon == false then
				if _G.Mud.DragonTalon.DragonClaw == false then
					local args = {
						[1] = "BlackbeardReward",
						[2] = "DragonClaw",
						[3] = "2"
					}
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
					if CheckMasteryWeapon("Dragon Claw",400) == "true" or CheckMasteryWeapon("Dragon Claw",400) == "true UpTo" then
						_G.Mud.DragonTalon.DragonClaw = true
					end
				end
				if _G.Mud.DragonTalon.DragonClaw == true and _G.Mud.DragonTalon.DragonTalon == false then
					if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon") ~= 1 then
						if MyLevel == 2450 then
							AutoBone = true
							if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Health > 1 then
								local args = {
									[1] = "Bones",
									[2] = "Buy",
									[3] = 1,
									[4] = 1
								}
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
							end
							if game.Players.LocalPlayer.Backpack:FindFirstChild("Fire Essence") or game.Players.LocalPlayer.Character:FindFirstChild("Fire Essence") then
								game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyDragonTalon",true)
								_G.Main["Start"] = true
							end
							if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyDragonTalon", true) ~= 0 then
								if _G.Main["Start"] and game.Players.LocalPlayer.Data.Fragments.Value < 5000 and HaveFruit then
									if game.Players.LocalPlayer.Data.Level.Value >= 1100 then
										--_G.Main["Start"] = false
										AutoRaids = true
									end
								elseif game.Players.LocalPlayer.Data.Fragments.Value >= 5000 or not HaveFruit then
									AutoRaids = false
									--_G.Main["Start"] = true
									game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyDragonTalon")
									if CheckMasteryWeapon("BuyDragon Talon",350) == "true" or CheckMasteryWeapon("BuyDragon Talon",350) == "true UpTo" then
										_G.Mud.DragonTalon.DragonTalon = true
									end
								end
							else
								game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyDragonTalon",true)
								game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyDragonTalon")
								if CheckMasteryWeapon("BuyDragon Talon",350) == "true" or CheckMasteryWeapon("BuyDragon Talon",350) == "true UpTo" then
									_G.Mud.DragonTalon.DragonTalon = true
								end
							end
						end
					else
						AutoBone = false
						game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyDragonTalon")
						if CheckMasteryWeapon("Dragon Talon",350) == "true" or CheckMasteryWeapon("Dragon Talon",350) == "true UpTo" then
							_G.Mud.DragonTalon.DragonTalon = true
						end
					end
				end
			elseif _G.Melee["God Human"] and _G.Mud.DragonTalon.DragonTalon == true and _G.Mud.GodHuman.Godhuman == false then
				if _G.Mud.GodHuman.Superhuman == true then
					if _G.Mud.GodHuman.Sharkman == true then
						if _G.Mud.GodHuman.DeathStep == true then
							if _G.Mud.GodHuman.DragonTalon == true then
								if _G.Mud.GodHuman.ElectricClaw == true then
									if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman",true) ~= 1 and _G.Mud.GodHuman.Godhuman == false then
										QuestGod = true
									elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman",true) ~= 0 and game.Players.LocalPlayer.Data.Fragments.Value < 5000 and _G.Mud.GodHuman.Godhuman == false then
										if _G.Main["Start"] and game.Players.LocalPlayer.Data.Fragments.Value < 5000 then
											if HaveFruit then
												if game.Players.LocalPlayer.Data.Level.Value >= 1100 then
													--_G.Main["Start"] = false
													AutoRaids = true
												end
											end
										end
									elseif game.Players.LocalPlayer.Data.Fragments.Value >= 5000 or not HaveFruit or game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman",true) ~= 0 and _G.Mud.GodHuman.Godhuman == false then
										Mas = false
										AutoRaids = false
										--_G.Main["Start"] = true
										game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman")
										if CheckMasteryWeapon("Godhuman",350) == "true" or CheckMasteryWeapon("Godhuman",350) == "true UpTo" then
											_G.Mud.GodHuman.Godhuman = true
										end
									end	
								else
									Mas = true
								end
							else
								Mas = true
							end
						else
							Mas = true
						end
					else
						Mas = true
					end
				else
					Mas = true
				end
				if _G.Mud.GodHuman.Superhuman == false then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman")
					wait()
					if CheckMasteryWeapon("Superhuman",400) == "true" or CheckMasteryWeapon("Superhuman",400) == "true UpTo" then
						_G.Mud.GodHuman.Superhuman = true
					end
				end
				if _G.Mud.GodHuman.Sharkman == false and _G.Mud.GodHuman.Superhuman == true then
					local args = {
						[1] = "BuySharkmanKarate"
					}
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
					if CheckMasteryWeapon("Sharkman Karate",400) == "true" or CheckMasteryWeapon("Sharkman Karate",400) == "true UpTo" then
						_G.Mud.GodHuman.Sharkman = true
					end
				end
				if _G.Mud.GodHuman.DeathStep == false and _G.Mud.GodHuman.Sharkman == true then
					local args = {
						[1] = "BuyDeathStep"
					}
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
					if CheckMasteryWeapon("Death Step",400) == "true" or CheckMasteryWeapon("Death Step",400) == "true UpTo" then
						_G.Mud.GodHuman.DeathStep = true
					end
				end
				if _G.Mud.GodHuman.ElectricClaw == false and _G.Mud.GodHuman.DeathStep == true then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
					if CheckMasteryWeapon("Electric Claw",400) == "true" or CheckMasteryWeapon("Electric Claw",400) == "true UpTo" then
						_G.Mud.GodHuman.ElectricClaw = true
					end
				end
				if _G.Mud.GodHuman.DragonTalon == false and _G.Mud.GodHuman.ElectricClaw == true then
					game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyDragonTalon")
					if CheckMasteryWeapon("Dragon Talon",400) == "true" or CheckMasteryWeapon("Dragon Talon",400) == "true UpTo" then
						_G.Mud.GodHuman.DragonTalon = true
					end
				end
				if _G.Mud.GodHuman.Godhuman == false and _G.Mud.GodHuman.DragonTalon == true then
					if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman",true) ~= 1 then
						if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman",true) ~= 1 then
							QuestGod = true
						elseif _G.Main["Start"] and game.Players.LocalPlayer.Data.Fragments.Value < 5000 and HaveFruit then
							QuestGod = false
							if game.Players.LocalPlayer.Data.Level.Value >= 1100 then
								AutoRaids = true
							end
						elseif game.Players.LocalPlayer.Data.Fragments.Value >= 5000 or BuyGodhuman ~= 0 then
							AutoRaids = false
							--_G.Main["Start"] = true
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman")
							if CheckMasteryWeapon("Godhuman",350) == "true" or CheckMasteryWeapon("Godhuman",350) == "true UpTo" then
								_G.Mud.GodHuman.Godhuman = true
							end
						end	
					else
						Masv2 = true
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman")
						if CheckMasteryWeapon("Godhuman",350) == "true" or CheckMasteryWeapon("Godhuman",350) == "true UpTo" then
							_G.Mud.GodHuman.Godhuman = true
							Masv2 = false
						end	
					end
				end
			end
		end)
	end
end)
spawn(function()
	while wait() do
		pcall(function()
			for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
				if string.find(v.Name, "Fruit") then
					hfi = true
				elseif not string.find(v.Name, "Fruit") then
					hfi = false
				end
			end
		end)
	end
end)

task.spawn(function()
    while task.wait() do
		pcall(function()
			if _G.Check then
				if _G.Main["Start"] then
					
					GetQuestTitle = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title
					GetQuest = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest
					local Remotes = game:GetService("ReplicatedStorage").Remotes
					local LocalPlayer = game.Players.LocalPlayer    
					local MyLevel = game.Players.LocalPlayer.Data.Level.Value
					local Q_Tushita = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TushitaProgress")
					local Q_Torch = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TushitaProgress")['Torches']
					if spf then
						if _G.Main["Bring Fruit"] then
							for i, v in pairs(game:GetService("Workspace"):GetChildren()) do	
								if v:IsA("Tool") then
									if string.find(v.Name, "Fruit") then
										--if v.Parent ~= game.Players.LocalPlayer.Character then
											st:Set("Status : Bring Fruit")
											repeat task.wait()
												if (v.Handle.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 1500 then
													TP(v.Handle.CFrame)
												else
													TP(v.Handle.CFrame	* CFrame.new(0,0,10))
												end	
												EquipWeaponMelee()
											until v.Parent == game.Players.LocalPlayer.Character or _G.Main["Start"] == false or spf == false
										--end	
									end
								end
							end
						end
					elseif MyLevel >= 15 and MyLevel <= 70 then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
						if (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047)).Magnitude <= 3500 then
							local CFrameMon = CFrame.new(-7678.2168, 5566.77734, -492.867432, -0.998147547, -4.29575664e-08, -0.0608393028, -4.53528806e-08, 1, 3.79902225e-08, 0.0608393028, 4.06790868e-08, -0.998147547)
							if game:GetService("Workspace").Enemies:FindFirstChild("Shanda [Lv. 475]") then
								for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
									if _G.Main["Skip Level Farm"] and v.Name == "Shanda [Lv. 475]" and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
										repeat task.wait()
											st:Set("Status : Farm Shanda")
											if InMyNetWork(v.HumanoidRootPart) then
												v.Humanoid.JumpPower = 0
												v.Humanoid.WalkSpeed = 0
												v.HumanoidRootPart.CanCollide = false
												v.Humanoid:ChangeState(11)
												v.Humanoid:ChangeState(14)
												PosMon = v.HumanoidRootPart.CFrame
												StartMagnet = true
												FastAttackSpeed = true
												EquipWeaponMelee()
												if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 150 then
													game:service('VirtualInputManager'):SendKeyEvent(true, "V", false, game)
													game:service('VirtualInputManager'):SendKeyEvent(false, "V", false, game)
												end
												TP(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 1))
											end
										until v.Humanoid.Health <= 0 or not _G.Main["Start"] or not _G.Main["Skip Level Farm"]
										StartMagnet = false
										FastAttackSpeed = false
									end
								end
							else
								StartMagnet = false
								FastAttackSpeed = false
								Modstween = TP(CFrameMon)
								if Old_World and (CFrameMon.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude >1500 then
									if Modstween then Modstween:Cancel() end wait(.5)
									--game.Players.LocalPlayer.Character.Humanoid:ChangeState(15)
									game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7894.61768, 5545.4917, -380.291199, 1, 1.18593251e-08, 1.20024249e-12, -1.18593251e-08, 1, 5.91565197e-09, -1.20017234e-12, -5.91565197e-09, 1))
								elseif (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150 then
									if Modstween then Modstween:Cancel() end
									for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].EnemySpawns:GetChildren())do
										if v.Name == "Shanda [Lv. 475]" then
											local Distance = (v.Position - game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position).Magnitude
											--pcall(function()
											if Distance < 1000 then
												Speed = 375
											elseif Distance >= 1000 then
												Speed = 375
											end
											--InMyNetWork(v.Name)
												repeat wait()
													local tween_s = game:service"TweenService"  
													local info = TweenInfo.new((v.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).Magnitude/Speed, Enum.EasingStyle.Linear)
													tween = tween_s:Create(game.Players.LocalPlayer.Character["HumanoidRootPart"], info, {CFrame = v.CFrame * CFrame.new(0,20,0)})
													tween:Play()
														--TP(v.CFrame * CFrame.new(0,30,0))
												until (v.CFrame * CFrame.new(0,20,0).Position - game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position).Magnitude < 5 or game:GetService("Workspace").Enemies:FindFirstChild(Ms)
											--end
										end
									end  
								end 
							end
						else
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))			
						end
					elseif MyLevel >= 70 and MyLevel <= 300 then
						if GetQuest.Visible == false then
							if not tostring(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("PlayerHunter")):find("We heard some") then 
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
								local CFrameMon = CFrame.new(-7678.2168, 5566.77734, -492.867432, -0.998147547, -4.29575664e-08, -0.0608393028, -4.53528806e-08, 1, 3.79902225e-08, 0.0608393028, 4.06790868e-08, -0.998147547)
								if game:GetService("Workspace").Enemies:FindFirstChild("Shanda [Lv. 475]") then
									for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
										if _G.Main["Skip Level Farm"] and v.Name == "Shanda [Lv. 475]" and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
											repeat task.wait()
												st:Set("Status : Farm Shanda wait Lv.310")
												if InMyNetWork(v.HumanoidRootPart) then
													v.Humanoid.JumpPower = 0
													v.Humanoid.WalkSpeed = 0
													v.HumanoidRootPart.CanCollide = false
													v.Humanoid:ChangeState(11)
													v.Humanoid:ChangeState(14)
													PosMon = v.HumanoidRootPart.CFrame
													StartMagnet = true
													FastAttackSpeed = true
													EquipWeaponMelee()
													if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 150 then
														game:service('VirtualInputManager'):SendKeyEvent(true, "V", false, game)
														game:service('VirtualInputManager'):SendKeyEvent(false, "V", false, game)
													end
													TP(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 1))
												end
											until v.Humanoid.Health <= 0 or not _G.Main["Start"] or not _G.Main["Skip Level Farm"]
											StartMagnet = false
											FastAttackSpeed = false
										end
									end
								else
									StartMagnet = false
									FastAttackSpeed = false
									Modstween = TP(CFrameMon)
									if Old_World and (CFrameMon.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 1500 then
										if Modstween then Modstween:Cancel() end wait(.5)
										game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7894.61768, 5545.4917, -380.291199, 1, 1.18593251e-08, 1.20024249e-12, -1.18593251e-08, 1, 5.91565197e-09, -1.20017234e-12, -5.91565197e-09, 1))
									elseif (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150 then
										if Modstween then Modstween:Cancel() end
										for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].EnemySpawns:GetChildren())do
											if v.Name == "Shanda [Lv. 475]" then
												local Distance = (v.Position - game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position).Magnitude
												--pcall(function()
												if Distance < 1000 then
													Speed = 375
												elseif Distance >= 1000 then
													Speed = 375
												end
												--InMyNetWork(v.Name)
													repeat wait()
														local tween_s = game:service"TweenService"  
														local info = TweenInfo.new((v.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).Magnitude/Speed, Enum.EasingStyle.Linear)
														tween = tween_s:Create(game.Players.LocalPlayer.Character["HumanoidRootPart"], info, {CFrame = v.CFrame * CFrame.new(0,20,0)})
														tween:Play()
															--TP(v.CFrame * CFrame.new(0,30,0))
													until (v.CFrame * CFrame.new(0,20,0).Position - game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position).Magnitude < 5 or game:GetService("Workspace").Enemies:FindFirstChild(Ms)
												--end
											end
										end  
									end 
								end
							end
						elseif GetQuest.Visible == true then
							local AllPlayersTableSkipFarm = {}
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Buso")
							for i,v in pairs(game:GetService("Workspace").Characters:GetChildren()) do
								table.insert(AllPlayersTableSkipFarm,v.Name)
							end
							if table.find(AllPlayersTableSkipFarm,GetQuestTitle.Text:split(" ")[2]) then
								for i,v in pairs(game:GetService("Workspace").Characters:GetChildren()) do
									if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,v.Name) then
										if _G.Main["Start"] and _G.Main["Skip Level Farm"] and v.Name == GetQuestTitle.Text:split(" ")[2] and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
											st:Set("Status : Farm Quest Players")
											repeat task.wait()
												if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 150 then
													FarmtoTarget = TP(v.HumanoidRootPart.CFrame)
												elseif v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150 then
													if FarmtoTarget then FarmtoTarget:Stop() end
													EquipWeaponMelee()
													_G.FastAttackNormalSpeed = true
													TP(v.HumanoidRootPart.CFrame * CFrame.new(0, 0, 5))
													if game:GetService("Players")["LocalPlayer"].PlayerGui.Main.PvpDisabled.Visible == true then
														game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 1000, 0)
														game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EnablePvp")
													end
													if game:GetService("Players").LocalPlayer.PlayerGui.Main.SafeZone.Visible == true and (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 50 then
														game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
													end
													if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 20000 then
														game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
													end
													if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 150 then
														game:service('VirtualInputManager'):SendKeyEvent(true, "V", false, game)
														game:service('VirtualInputManager'):SendKeyEvent(false, "V", false, game)
													end
													if game:GetService("Players").LocalPlayer.PlayerGui.Notifications.NotificationTemplate.TranslateMe.Text == "{color1_Red}Cannot attack players in a Safe Zone!{color1_/}" then
														game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
													end	
													local AC = CbFw2.activeController
													for i = 1, 1 do 
														local bladehit = require(game.ReplicatedStorage.CombatFramework.RigLib).getBladeHits(
															plr.Character,
															{plr.Character.HumanoidRootPart},
															60
														)
														local cac = {}
														local hash = {}
														for k, v in pairs(bladehit) do
															if v.Parent:FindFirstChild("HumanoidRootPart") and not hash[v.Parent] then
																table.insert(cac, v.Parent.HumanoidRootPart)
																hash[v.Parent] = true
															end
														end
														bladehit = cac
														if #bladehit > 0 then
															local u8 = debug.getupvalue(AC.attack, 5)
															local u9 = debug.getupvalue(AC.attack, 6)
															local u7 = debug.getupvalue(AC.attack, 4)
															local u10 = debug.getupvalue(AC.attack, 7)
															local u12 = (u8 * 798405 + u7 * 727595) % u9
															local u13 = u7 * 798405
															(function()
																u12 = (u12 * u9 + u13) % 1099511627776
																u8 = math.floor(u12 / u9)
																u7 = u12 - u8 * u9
															end)()
															u10 = u10 + 1
															debug.setupvalue(AC.attack, 5, u8)
															debug.setupvalue(AC.attack, 6, u9)
															debug.setupvalue(AC.attack, 4, u7)
															debug.setupvalue(AC.attack, 7, u10)
															pcall(function()
																if plr.Character:FindFirstChildOfClass("Tool") and AC.blades and AC.blades[1] then
																	AC.animator.anims.basic[1]:Play(0.01,0.01,0.01)
																	game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("weaponChange",tostring(GetCurrentBlade()))
																	game.ReplicatedStorage.Remotes.Validator:FireServer(math.floor(u12 / 1099511627776 * 16777215), u10)
																	game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit", bladehit, i, "")
																end
															end)
														end
													end
													local ac = CombatFrameworkR.activeController
													if ac and ac.equipped then
														for indexincrement = 1, 1 do
															local bladehit = getAllBladeHitsPlayers(60)
															if #bladehit > 0 then
																local AcAttack8 = debug.getupvalue(ac.attack, 5)
																local AcAttack9 = debug.getupvalue(ac.attack, 6)
																local AcAttack7 = debug.getupvalue(ac.attack, 4)
																local AcAttack10 = debug.getupvalue(ac.attack, 7)
																local NumberAc12 = (AcAttack8 * 798405 + AcAttack7 * 727595) % AcAttack9
																local NumberAc13 = AcAttack7 * 798405
																(function()
																	NumberAc12 = (NumberAc12 * AcAttack9 + NumberAc13) % 1099511627776
																	AcAttack8 = math.floor(NumberAc12 / AcAttack9)
																	AcAttack7 = NumberAc12 - AcAttack8 * AcAttack9
																end)()
																AcAttack10 = AcAttack10 + 1
																debug.setupvalue(ac.attack, 5, AcAttack8)
																debug.setupvalue(ac.attack, 6, AcAttack9)
																debug.setupvalue(ac.attack, 4, AcAttack7)
																debug.setupvalue(ac.attack, 7, AcAttack10)
																for k, v in pairs(ac.animator.anims.basic) do
																	v:Play(0.01,0.01,0.01)
																end                 
																if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") and ac.blades and ac.blades[1] then 
																	game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("weaponChange",tostring(CurrentWeapon()))
																	game.ReplicatedStorage.Remotes.Validator:FireServer(math.floor(NumberAc12 / 1099511627776 * 16777215), AcAttack10)
																	game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit", bladehit, 2, "") 
																end
															end
														end
													end
													Ksill()
												end
											until not _G.Main["Start"] or not _G.Main["Skip Level Farm"] or not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,v.Name) or v.Humanoid.Health <= 0 or not v.Parent or GetQuest.Visible == false
											_G.FastAttackNormalSpeed = false
										end
									end
								end
							end
						end
					elseif (_G.Sword['Saber'] and Old_World and not QuestGod and MyLevel >= 310) and (game:GetService("Workspace").Enemies:FindFirstChild("Saber Expert [Lv. 200] [Boss]") or game:GetService("ReplicatedStorage"):FindFirstChild("Saber Expert [Lv. 200] [Boss]")) and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress").KilledShanks == false then
						local RemoteProQuest = Remotes.CommF_:InvokeServer("ProQuestProgress")
						st:Set("Status : Make Saber Sword")
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
						if not Workspace.Map.Jungle.QuestPlates.Door.CanCollide then
							if RemoteProQuest["UsedTorch"] then
								if RemoteProQuest["UsedCup"] then
									if RemoteProQuest["TalkedSon"] then
										if RemoteProQuest["KilledMob"] then
											if RemoteProQuest["UsedRelic"] then
												if not RemoteProQuest["KilledShanks"] then
													if game:GetService("Workspace").Enemies:FindFirstChild("Saber Expert [Lv. 200] [Boss]") then
														for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
															if v.Name == "Saber Expert [Lv. 200] [Boss]" then
																repeat task.wait()
																	FastAttackSpeed = true
																	EquipWeaponMelee()
																	TP(v.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
																	v.HumanoidRootPart.CanCollide = false
																	v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
																until not v.Parent or v.Humanoid.Health <= 0 or _G.Main["Start"] == false
																FastAttackSpeed = false
															end
														end
													else
														if Ms == "Fishman Commando [Lv. 400]" or Ms == "Fishman Warrior [Lv. 375]" then
															game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(3864.8515625, 6.6796875, -1926.7841796875))
															if GetDistance(Vector3.new(3864.8515625, 6.6796875, -1926.7841796875)) <= 100 then
																TP(game:GetService("ReplicatedStorage")["Saber Expert [Lv. 200] [Boss]"].HumanoidRootPart.CFrame)
															end
														else
															TP(game:GetService("ReplicatedStorage")["Saber Expert [Lv. 200] [Boss]"].HumanoidRootPart.CFrame)
															if GetDistance(CFrame.new(-1458.89502, 29.8870335, -50.633564)) <= 100 then
																game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
															end
														end
													end
												end
											else
												if not LocalPlayer.Character:FindFirstChild("Relic") and not LocalPlayer.Backpack:FindFirstChild("Relic") then
													Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon")
												else
													EquipWeapon("Relic")
													if LocalPlayer.Character:FindFirstChild("Relic") then
														Remotes.CommF_:InvokeServer("ProQuestProgress", "PlaceRelic")
													end
												end
											end
										elseif game:GetService("Workspace").Enemies:FindFirstChild("Mob Leader [Lv. 120] [Boss]") then
											for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
												if v.Name == "Mob Leader [Lv. 120] [Boss]" then
													repeat task.wait()
														FastAttackSpeed = true
														EquipWeaponMelee()
														TPs(v.HumanoidRootPart.CFrame * CFrame.new(0,30,1))
														v.HumanoidRootPart.CanCollide = false
														v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
													until not v.Parent or v.Humanoid.Health <= 0 or _G.Main["Start"] == false
													FastAttackSpeed = false
												end
											end
										else
											if Ms == "Fishman Commando [Lv. 400]" or Ms == "Fishman Warrior [Lv. 375]" then
												game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(3864.8515625, 6.6796875, -1926.7841796875))
												if GetDistance(Vector3.new(3864.8515625, 6.6796875, -1926.7841796875)) <= 100 then
													TPs(CFrame.new(-2844.7307128906, 7.4180502891541, 5356.6723632813))
												end
											else
												TPs(CFrame.new(-2844.7307128906, 7.4180502891541, 5356.6723632813))
												if GetDistance(CFrame.new(-2844.7307128906, 7.4180502891541, 5356.6723632813)) <= 100 then
													game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
												end
											end
										end
									else
										game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon")
									end
								else
									if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Cup") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Cup") then
										EquipWeapon("Cup")
										if game:GetService("Players").LocalPlayer.Character.Cup.Handle.Drop1.Transparency == 1 then
											game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","FillCup",game:GetService("Players").LocalPlayer.Character.Cup)
										elseif game:GetService("Players").LocalPlayer.Character.Cup.Handle.Drop1.Transparency ~= 1 then
											game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","SickMan")
										end
									elseif not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Cup") and not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Cup") then
										game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","GetCup")
									end
								end
							elseif not LocalPlayer.Character:FindFirstChild("Torch") and not LocalPlayer.Backpack:FindFirstChild("Torch") then
								Remotes.CommF_:InvokeServer("ProQuestProgress", "GetTorch")
							else
								Remotes.CommF_:InvokeServer("ProQuestProgress", "DestroyTorch")
							end
						else
							for i,v in pairs(RemoteProQuest["Plates"]) do
								if v == false then
									Remotes.CommF_:InvokeServer("ProQuestProgress", "Plate", i)
								end
							end
							getsenv(game.Players.LocalPlayer.PlayerScripts.QuestPro):refresh()
						end
					elseif (_G.Sword['Pole v1'] and Old_World and not QuestGod and MyLevel >= 310) and (game.ReplicatedStorage:FindFirstChild("Thunder God [Lv. 575] [Boss]") or game.Workspace.Enemies:FindFirstChild("Thunder God [Lv. 575] [Boss]")) then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
						st:Set("Status : Farm Thunder God")
						if game.Workspace.Enemies:FindFirstChild("Thunder God [Lv. 575] [Boss]") then
							for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
								if v.Name == "Thunder God [Lv. 575] [Boss]" then
									repeat task.wait()
										v.Humanoid.JumpPower = 0
										v.Humanoid.WalkSpeed = 0
										v.HumanoidRootPart.CanCollide = false
										v.Humanoid:ChangeState(11)
										v.Humanoid:ChangeState(14)
										FastAttackSpeed = true
										EquipWeaponMelee()
										if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 150 then
											game:service('VirtualInputManager'):SendKeyEvent(true, "V", false, game)
											game:service('VirtualInputManager'):SendKeyEvent(false, "V", false, game)
										end
										TP(v.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
									until _G.Main["Start"]== false or v.Humanoid.Health <= 0
									FastAttackSpeed = false
								end
							end
						elseif (game:GetService("ReplicatedStorage")["Thunder God [Lv. 575] [Boss]"].HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude < 3000 then
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
							TP(game:GetService("ReplicatedStorage")["Thunder God [Lv. 575] [Boss]"].HumanoidRootPart.CFrame * CFrame.new(0,30,0))
						else
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
							_G.Stop = true
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
							_G.Stop = nill
						end
					elseif (Old_World and MyLevel >= 700) and not QuestGod and game.ReplicatedStorage.Remotes.CommF_:InvokeServer("DressrosaQuestProgress", "Dressrosa") ~= 0 then
						st:Set("Status : Take a Key")
						if game.Workspace.Map.Ice.Door.CanCollide == true and game.Workspace.Map.Ice.Door.Transparency == 0 then
							if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Key") and not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Key") and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("DressrosaQuestProgress").UsedKey == false then
								TPs(CFrame.new(4851.8720703125, 5.6514348983765, 718.47094726563))
								wait(.5)
								if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrame.new(4851.8720703125, 5.6514348983765, 718.47094726563).Position).Magnitude <= 5 then
									game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("DressrosaQuestProgress","Detective")
								end
							elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Key") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Key") then
								EquipWeapon("Key")
								TPs(CFrame.new(1347.7124, 37.3751602, -1325.6488))
							end
						elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("DressrosaQuestProgress").KilledIceBoss == false and game.Workspace.Map.Ice.Door.CanCollide == false and game.Workspace.Map.Ice.Door.Transparency == 1 then
							if game:GetService("Workspace").Enemies:FindFirstChild("Ice Admiral [Lv. 700] [Boss]") then
								for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
									if v.Name == "Ice Admiral [Lv. 700] [Boss]" and v.Humanoid.Health > 0 then
										repeat task.wait()
											EquipWeaponMelee()
											TP(v.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
											v.Humanoid.JumpPower = 0
											v.Humanoid.WalkSpeed = 0
											v.Humanoid:ChangeState(11)
											v.Humanoid:ChangeState(14)
											v.HumanoidRootPart.CanCollide = false
											v.HumanoidRootPart.Size = Vector3.new(60,60,60)
											FastAttackSpeed = true
											st:Set("Status : Kill Ice Admiral")
										until v.Humanoid.Health <= 0 or not v.Parent or not _G.Main["Start"]
										game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
									end
								end
							else
								FastAttackSpeed = false
								TP(CFrame.new(1347.7124, 37.3751602, -1325.6488))
							end
						elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("DressrosaQuestProgress").TalkedDetective == true and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("DressrosaQuestProgress").UsedKey == true and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("DressrosaQuestProgress").KilledIceBoss == true then
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
						end
					elseif New_World and not RaidSumfruit and not AutoRaids and game:GetService("Workspace").Enemies:FindFirstChild("Darkbeard [Lv. 1000] [Raid Boss]") or game:GetService("ReplicatedStorage"):FindFirstChild("Darkbeard [Lv. 1000] [Raid Boss]") then
						if game:GetService("Workspace").Enemies:FindFirstChild("Darkbeard [Lv. 1000] [Raid Boss]") then
							for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
								if v.Name == ("Darkbeard [Lv. 1000] [Raid Boss]" or v.Name == "Darkbeard [Lv. 1000] [Raid Boss]") and v.Humanoid.Health > 0 and v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
									repeat wait()
										StartMagnet = true
										FastAttackSpeed = true
										PosMon = v.HumanoidRootPart.CFrame
										v.HumanoidRootPart.Size = Vector3.new(60,60,60)
										v.Humanoid.JumpPower = 0
										v.Humanoid.WalkSpeed = 0
										v.HumanoidRootPart.CanCollide = false
										v.Humanoid:ChangeState(11)
										TP(v.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
									until _G.Main["Start"] == false or v.Humanoid.Health <= 0
									StartMagnet = false
									FastAttackSpeed = false
								end
							end
						else
							if (game:GetService("ReplicatedStorage"):FindFirstChild("Darkbeard [Lv. 1000] [Raid Boss]").HumanoidRootPart.CFrame.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 50 then
								if (CFrame.new(5552.3720703125, 28.36754608154297, -6365.59521484375).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 50 and df == false then
									TP(CFrame.new(5552.3720703125, 28.36754608154297, -6365.59521484375))
									df = true
								elseif (CFrame.new(5552.3720703125, 28.36754608154297, -6365.59521484375).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 1500 then
									TP(game:GetService("ReplicatedStorage"):FindFirstChild("Darkbeard [Lv. 1000] [Raid Boss]").HumanoidRootPart.CFrame)
									if game:GetService("Workspace").Enemies:FindFirstChild("Darkbeard [Lv. 1000] [Raid Boss]") then
										df = false 
									end
								end
							end
						end
					elseif _G.Gun['Acidum Rifle'] and not QuestGod and game.ReplicatedStorage:FindFirstChild("Core") and game.ReplicatedStorage:FindFirstChild("Core"):FindFirstChild("Humanoid") or game.Workspace.Enemies:FindFirstChild("Core") and not gotp3 and not RaidSumfruit and not AutoRaids then
						st:Set("Status : Farm Factory")
						if game.ReplicatedStorage:FindFirstChild("Core") and game.ReplicatedStorage:FindFirstChild("Core"):FindFirstChild("Humanoid") then
							Questtween = TP(CFrame.new(448.46756, 199.356781, -441.389252))
							if New_World and game.ReplicatedStorage:FindFirstChild("Core") and (CFrame.new(448.46756, 199.356781, -441.389252).Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 30000 then
								if Questtween then Questtween:Stop() end
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422))
							elseif (CFrame.new(448.46756, 199.356781, -441.389252).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 350 then
								if Questtween then Questtween:Stop()end
								game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(448.46756, 199.356781, -441.389252)
							end
						elseif game.Workspace.Enemies:FindFirstChild("Core") then
							for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
								if _G.Main["Start"] and v.Name == "Core" and v.Humanoid.Health > 0 then
									repeat task.wait()
										FastAttackSpeed = true
										EquipWeaponMelee()
										if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 350 then
											Farmtween = TP(v.HumanoidRootPart.CFrame)
										elseif (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 350 then
											if Farmtween then Farmtween:Cancel() end
											if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
												local args = {
													[1] = "Buso"
												}
												game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
											end
											TP(v.HumanoidRootPart.CFrame * CFrame.new(0, 10, 0))
										end		
									until not game.Workspace.Enemies:FindFirstChild("Core") or not _G.Main["Start"]
									FastAttackSpeed  = false
								end
							end
						end
						--[[if game.Workspace.Enemies:FindFirstChild("Core") then
							for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
								if _G.Main["Start"] and v.Name == "Core" and v.Humanoid.Health > 0 then
									st:Set("Status : Farm Factory")
									repeat task.wait()
										FastAttackSpeed = true
										EquipWeaponMelee()
										if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 350 then
											Farmtween = TP(v.HumanoidRootPart.CFrame)
										elseif (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 350 then
											if Farmtween then Farmtween:Cancel() end
											if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
												local args = {
													[1] = "Buso"
												}
												game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
											end
											game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 10, 0)
										end		
									until not _G.Main["Start"] or v.Humanoid.Health <= 0 or Factory == false
									FastAttackSpeed = false
								end
							end
						else
							GOtween = TP(CFrame.new(448.46756, 199.356781, -441.389252))
							if New_World and game.ReplicatedStorage:FindFirstChild("Core") and (CFrame.new(448.46756, 199.356781, -441.389252).Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 30000 then
								if Questtween then Questtween:Cancel() end
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422))
							elseif (CFrame.new(448.46756, 199.356781, -441.389252).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 350 then
								if Farmtween then GOtween:Cancel() end
								game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(448.46756, 199.356781, -441.389252)
							end
						end]]
					elseif _G.Main["Auto Factory"] and not QuestGod and game.ReplicatedStorage:FindFirstChild("Core") and game.ReplicatedStorage:FindFirstChild("Core"):FindFirstChild("Humanoid") and not gotp3 and not RaidSumfruit and not AutoRaids then
						st:Set("Status : Farm Factory")
						if game.ReplicatedStorage:FindFirstChild("Core") and game.ReplicatedStorage:FindFirstChild("Core"):FindFirstChild("Humanoid") then
							GOtween = TP(CFrame.new(448.46756, 199.356781, -441.389252))
							if New_World and game.ReplicatedStorage:FindFirstChild("Core") and (CFrame.new(448.46756, 199.356781, -441.389252).Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 30000 then
								if Questtween then Questtween:Stop() end
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422))
							elseif (CFrame.new(448.46756, 199.356781, -441.389252).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 350 then
								if Farmtween then GOtween:Stop()end
								game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(448.46756, 199.356781, -441.389252)
							end
						elseif game.Workspace.Enemies:FindFirstChild("Core") then
							for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
								if _G.Main["Start"] and v.Name == "Core" and v.Humanoid.Health > 0 then
									repeat task.wait()
										FastAttackSpeed = true
										EquipWeaponMelee()
										if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 350 then
											Farmtween = TP(v.HumanoidRootPart.CFrame)
										elseif (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 350 then
											if Farmtween then Farmtween:Cancel() end
											if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
												local args = {
													[1] = "Buso"
												}
												game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
											end
											TP(v.HumanoidRootPart.CFrame * CFrame.new(0, 10, 0))
										end		
									until not game.Workspace.Enemies:FindFirstChild("Core") or not _G.Main["Start"]
									FastAttackSpeed  = false
								end
							end
						end
					elseif _G.Melee["Death Step"] and New_World and not QuestGod and not gotp3 and not RaidSumfruit and not AutoRaids and (game:GetService("ReplicatedStorage"):FindFirstChild("Awakened Ice Admiral [Lv. 1400] [Boss]") or game:GetService("Workspace").Enemies:FindFirstChild("Awakened Ice Admiral [Lv. 1400] [Boss]")) then
						st:Set("Status : Kill Awakened Ice Admiral")
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
						if game:GetService("Workspace").Enemies:FindFirstChild("Awakened Ice Admiral [Lv. 1400] [Boss]") then 	
							for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
								if v.Name == "Awakened Ice Admiral [Lv. 1400] [Boss]" then    
									repeat task.wait()
										FastAttackSpeed = true
										EquipWeaponMelee()
										v.HumanoidRootPart.Size = Vector3.new(60,60,60)
										v.Humanoid.JumpPower = 0
										v.Humanoid.WalkSpeed = 0
										v.HumanoidRootPart.CanCollide = false
										v.Humanoid:ChangeState(11)
										TP(v.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
										if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 150 then
											game:service('VirtualInputManager'):SendKeyEvent(true, "V", false, game)
											game:service('VirtualInputManager'):SendKeyEvent(false, "V", false, game)
										end
									until not v.Parent or v.Humanoid.Health <= 0 or _G.Main["Start"] == false or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Library Key") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Library Key")
									FastAttackSpeed = false
								end
							end
						else
							TP(game:GetService("ReplicatedStorage"):FindFirstChild("Awakened Ice Admiral [Lv. 1400] [Boss]").HumanoidRootPart.CFrame)
						end
					elseif _G.Melee["Death Step"] and New_World and not QuestGod and not gotp3 and not RaidSumfruit and not AutoRaids and _G.Quest.DeathStep == false and (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Library Key") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Library Key")) then
						if game:GetService("Workspace").Map.IceCastle.Hall.LibraryDoor:FindFirstChild("PhoeyuDoor") then  
							st:Set("Status : Use Library Key")
							EquipWeapon("Library Key")
							repeat wait() TP(CFrame.new(6376.12061, 296.634613, -6845.74951, -0.742177546, -0, -0.670203328, -0, 1, -0, 0.670203328, 0, -0.742177546)) until not game:GetService("Workspace").Map.IceCastle.Hall.LibraryDoor:FindFirstChild("PhoeyuDoor")--(CFrame.new(6376.12061, 296.634613, -6845.74951, -0.742177546, -0, -0.670203328, -0, 1, -0, 0.670203328, 0, -0.742177546).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 and 
							if not game:GetService("Workspace").Map.IceCastle.Hall.LibraryDoor:FindFirstChild("PhoeyuDoor") then
								_G.Quest.DeathStep = true
							end
							--[[if (CFrame.new(6376.12061, 296.634613, -6845.74951, -0.742177546, -0, -0.670203328, -0, 1, -0, 0.670203328, 0, -0.742177546).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 then
								wait(1.2)
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep",true)
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep")
								wait(0.5)
								
							end]]
						elseif not game:GetService("Workspace").Map.IceCastle.Hall.LibraryDoor:FindFirstChild("PhoeyuDoor") then
							game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid"):ChangeState(15)
						end
					elseif _G.Sword['Rengoku'] and GetWeaponInventory("Rengoku") == false and not QuestGod and New_World and not gotp3 and game.Players.LocalPlayer.Backpack:FindFirstChild("Hidden Key") or game.Players.LocalPlayer.Character:FindFirstChild("Hidden Key") and _G.Quest.Rengoku == false then
						TP(game:GetService("Workspace").Map.IceCastle:FindFirstChild("RengokuChest").Detection.CFrame)
						if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Rengoku") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rengoku") then
							_G.Quest.Rengoku = true
						end
						st:Set("Status : Do Rengohu")
					elseif _G.Melee["Sharkman Karate"] and not QuestGod and New_World and not gotp3 and not RaidSumfruit and not AutoRaids and (game:GetService("ReplicatedStorage"):FindFirstChild("Tide Keeper [Lv. 1475] [Boss]") or game:GetService("Workspace").Enemies:FindFirstChild("Tide Keeper [Lv. 1475] [Boss]")) then
						st:Set("Status : Kill Tide Keeper")
						local CFrameMon = CFrame.new(-3570.18652, 123.328949, -11555.9072, 0.465199202, -1.3857326e-08, 0.885206044, 4.0332897e-09, 1, 1.35347511e-08, -0.885206044, -2.72606271e-09, 0.465199202)
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
						if game:GetService("Workspace").Enemies:FindFirstChild("Tide Keeper [Lv. 1475] [Boss]") then 	
							for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
								if v.Name == "Tide Keeper [Lv. 1475] [Boss]" then    
									repeat task.wait()
										FastAttackSpeed = true
										EquipWeaponMelee()
										if Farmtween then Farmtween:Stop() end
										v.Humanoid.JumpPower = 0
										v.Humanoid.WalkSpeed = 0
										v.HumanoidRootPart.CanCollide = false
										v.Humanoid:ChangeState(11)
										TP(v.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
										if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 150 then
											game:service('VirtualInputManager'):SendKeyEvent(true, "V", false, game)
											game:service('VirtualInputManager'):SendKeyEvent(false, "V", false, game)
										end
									until not v.Parent or v.Humanoid.Health <= 0 or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Library Key") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Library Key")
									FastAttackSpeed = false
								end
							end
						else
							TP(game:GetService("ReplicatedStorage"):FindFirstChild("Tide Keeper [Lv. 1475] [Boss]").HumanoidRootPart.CFrame)
						end
					elseif _G.Melee["Sharkman Karate"] and not QuestGod and New_World and not gotp3 and not RaidSumfruit and not AutoRaids and _G.Quest.SharkMan == false and (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Water Key") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Water Key")) then
						st:Set("Status : Use Water Key")
						repeat wait() TP(-2604.6958, 239.432526, -10315.1982, 0.0425701365, 0, -0.999093413, 0, 1, 0, 0.999093413, 0, 0.0425701365) until (CFrame.new(-2604.6958, 239.432526, -10315.1982, 0.0425701365, 0, -0.999093413, 0, 1, 0, 0.999093413, 0, 0.0425701365).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or not _G.Auto_Fully_SharkMan_Karate
						if (CFrame.new(-2604.6958, 239.432526, -10315.1982, 0.0425701365, 0, -0.999093413, 0, 1, 0, 0.999093413, 0, 0.0425701365).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 then
							wait(1.2)
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate",true)
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")
							wait(0.5)
						end
					elseif _G.Sword['Midnight Blade'] and not QuestGod and  _G.Quest.Midnight == false and MyLevel >= 1500 and New_World and not RaidSumfruit and not AutoRaids then
						st:Set("Status : do Midnight Blade")
						--[[for i1, v1 in pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventoryWeapons")) do
							if v1.Name == "Midnight Blade" then
								Midnight = true
							else
								Midnight = false
							end
						end]]
						for i,v in pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventory")) do
							if v["Type"] == "Material" then
								if v.Name == "Ectoplasm" then
									if v.Count >= 100 then
										local args = {
											[1] = "Ectoplasm",
											[2] = "BuyCheck",
											[3] = 3
										}
										game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
										local args = {
											[1] = "Ectoplasm",
											[2] = "Buy",
											[3] = 3
										}
										game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
										Midnight = true
									elseif v.Count <= 100 then
										if game:GetService("Workspace").Enemies:FindFirstChild("Ship Deckhand [Lv. 1250]") or game:GetService("Workspace").Enemies:FindFirstChild("Ship Engineer [Lv. 1275]") or game:GetService("Workspace").Enemies:FindFirstChild("Ship Steward [Lv. 1300]") or game:GetService("Workspace").Enemies:FindFirstChild("Ship Officer [Lv. 1325]") or game:GetService("Workspace").Enemies:FindFirstChild("Arctic Warrior [Lv. 1350]") then
											for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
												if v.Name == "Ship Deckhand [Lv. 1250]" or v.Name == "Ship Engineer [Lv. 1275]" or v.Name == "Ship Steward [Lv. 1300]" or v.Name == "Ship Officer [Lv. 1325]" or v.Name == "Arctic Warrior [Lv. 1350]" then
													if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
														repeat task.wait()
															EquipWeaponMelee()
															StatrMagnet = true
															FastAttackSpeed = true
															_G.PosMon = v.HumanoidRootPart.CFrame
															v.HumanoidRootPart.Size = Vector3.new(60,60,60)
															v.Humanoid.JumpPower = 0
															v.Humanoid.WalkSpeed = 0
															v.HumanoidRootPart.CanCollide = false
															v.Humanoid:ChangeState(11)
															TP(v.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
														until not _G.Main["Start"] or not v.Parent or v.Humanoid.Health <= 0
														StatrMagnet = false
														FastAttackSpeed = false
													end
												end
											end
										else
											StatrMagnet = false
											game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
										end
									end
								end
							end
						end
					elseif _G.Sword['Rengoku'] and not QuestGod and _G.Quest.Rengoku == false and _G.Quest.Midnight == true and MyLevel >= 1500 and New_World and not RaidSumfruit and not AutoRaids then
						st:Set("Status : Do Rengoku")
						if game.Players.LocalPlayer.Backpack:FindFirstChild("Hidden Key") or game.Players.LocalPlayer.Character:FindFirstChild("Hidden Key") then
							TP(game:GetService("Workspace").Map.IceCastle:FindFirstChild("RengokuChest").Detection.CFrame)
							if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Rengoku") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rengoku") then
								_G.Quest.Rengoku = true
							end
						else
							if game:GetService("Workspace").Enemies:FindFirstChild("Snow Lurker [Lv. 1375]") or game:GetService("Workspace").Enemies:FindFirstChild("Arctic Warrior [Lv. 1350]") then
								for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
									if (v.Name == "Snow Lurker [Lv. 1375]" or v.Name == "Arctic Warrior [Lv. 1350]") and v.Humanoid.Health > 0 then
										repeat task.wait()
											EquipWeaponMelee()
											TP(v.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
											v.HumanoidRootPart.CanCollide = false
											v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
											PosMon = v.HumanoidRootPart.CFrame
											StartMagnet = true
											FastAttackSpeed = true
										until game.Players.LocalPlayer.Backpack:FindFirstChild("Hidden Key") or _G.Sword['Rengoku'] == false or not v.Parent or v.Humanoid.Health <= 0
										StartMagnet = false
										FastAttackSpeed = false
									end
								end
							else
								TP(CFrame.new(5552.3720703125, 28.36754608154297, -6365.59521484375))
							end
						end
					elseif GetMaterial("Ectoplasm") <= 250 and New_World and GetMaterial("Dark Fragment") >= 1 then
						if game:GetService("Workspace").Enemies:FindFirstChild("Ship Deckhand [Lv. 1250]") or game:GetService("Workspace").Enemies:FindFirstChild("Ship Engineer [Lv. 1275]") or game:GetService("Workspace").Enemies:FindFirstChild("Ship Steward [Lv. 1300]") or game:GetService("Workspace").Enemies:FindFirstChild("Ship Officer [Lv. 1325]") or game:GetService("Workspace").Enemies:FindFirstChild("Arctic Warrior [Lv. 1350]") then
							for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
								if v.Name == "Ship Deckhand [Lv. 1250]" or v.Name == "Ship Engineer [Lv. 1275]" or v.Name == "Ship Steward [Lv. 1300]" or v.Name == "Ship Officer [Lv. 1325]" or v.Name == "Arctic Warrior [Lv. 1350]" then
									if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
										repeat task.wait()
											EquipWeaponMelee()
											StatrMagnet = true
											FastAttackSpeed = true
											_G.PosMon = v.HumanoidRootPart.CFrame
											v.HumanoidRootPart.Size = Vector3.new(60,60,60)
											v.Humanoid.JumpPower = 0
											v.Humanoid.WalkSpeed = 0
											v.HumanoidRootPart.CanCollide = false
											v.Humanoid:ChangeState(11)
											TP(v.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
										until not _G.Main["Start"] or not v.Parent or v.Humanoid.Health <= 0
										StatrMagnet = false
										FastAttackSpeed = false
									end
								end
							end
						else
							StatrMagnet = false
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
						end
					elseif not Three_World and New_World and MyLevel >= 1500 and not game.Players.LocalPlayer.Data.Race:FindFirstChild("Evolved") and not (QuestGod or RaidSumfruit or AutoRaids) and (_G.Quest.Rengoku and _G.Quest.Midnight and _G.Quest.DeathStep and _G.Quest.SharkMan) == true and Have1m or (_G.Quest.Balito or _G.Quest.DonSwanQuest) == true then
						st:Set("Status : do Quest Go to World 3")
						gotp3 = true
						--if New_World then
							if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ZQuestProgress").KilledIndraBoss == false then
								if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 3 then
									if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TalkTrevor","1") == 0 then
										if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ZQuestProgress","Check") == 0 then
											if game.Players.LocalPlayer.Data.Race:FindFirstChild("Evolved") then
												if (CFrame.new(-1926.3221435547, 12.819851875305, 1738.3092041016).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then
													wait(1.1)
													game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ZQuestProgress","Begin")
												else
													TP(CFrame.new(-1926.3221435547, 12.819851875305, 1738.3092041016))
												end
												if game:GetService("Workspace").Enemies:FindFirstChild("rip_indra [Lv. 1500] [Boss]") then
													for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
														if v.Name == "rip_indra [Lv. 1500] [Boss]" then
															repeat task.wait()
																EquipWeaponMelee()
																TP(v.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
																v.HumanoidRootPart.CanCollide = false
																v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
																FastAttackSpeed = true
																game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
															until _G.Main["Start"] == false or v.Humanoid.Health <= 0 or not v.Parent
															FastAttackSpeed = false
														end
													end
												elseif not game:GetService("Workspace").Enemies:FindFirstChild("rip_indra [Lv. 1500] [Boss]") and (CFrame.new(-26880.93359375, 22.848554611206, 473.18951416016).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 1000 then
													TP(CFrame.new(-26880.93359375, 22.848554611206, 473.18951416016))
												end
											elseif _G.Race["Auto Evo V3"] and not game.Players.LocalPlayer.Data.Race:FindFirstChild("Evolved") then
												st:Set("Status : Evo Race V3")
												if game.Players.LocalPlayer.Data.Race.Value == 'Mink' then
													if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","1") ~= -2 then
														if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","1") == 0 then
															game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","2")
														elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","1") == 1 then
															if not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 1") and not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 1") then
																TP(game.Workspace.Flower1.CFrame)
															elseif not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 2") and not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 2") then
																TP(game.Workspace.Flower2.CFrame)
															elseif not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 3") and not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 3") then
																if game:GetService("Workspace").Enemies:FindFirstChild("Swan Pirate [Lv. 775]") then
																	for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
																		if v.Name == "Swan Pirate [Lv. 775]" then
																			repeat task.wait()
																				StartMagnet = true
																				FastAttackSpeed = true
																				PosMon = v.HumanoidRootPart.CFrame
																				EquipWeaponMelee()
																				v.HumanoidRootPart.Size = Vector3.new(60,60,60)
																				v.Humanoid.JumpPower = 0
																				v.Humanoid.WalkSpeed = 0
																				v.HumanoidRootPart.CanCollide = false
																				v.Humanoid:ChangeState(11)
																				TP(v.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
																			until game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 3") or not v.Parent or v.Humanoid.Health <= 0 or _G.Main["Start"] == false
																			StartMagnet = true
																			FastAttackSpeed = true
																		end
																	end
																else
																	StartMagnet = false
																	TP(CFrame.new(980.0985107421875, 121.331298828125, 1287.2093505859375))
																end
															end
														elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","1") == 2 then
															game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","3")
														end
													elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Wenlocktoad","1") == 0 then
														game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Wenlocktoad","2")
													elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Wenlocktoad","1") == 1 then
														for i,v in pairs(game:GetService("Workspace"):GetChildren()) do 
															if v.Name:find("Chest") then
																if game:GetService("Workspace"):FindFirstChild(v.Name) then
																	if (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 1500 then
																		repeat task.wait()
																			if game:GetService("Workspace"):FindFirstChild(v.Name) then
																				TPP(v.CFrame)
																				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Wenlocktoad","3")
																			end
																			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Wenlocktoad","3")
																		until _G.Main["Start"] == false or not v.Parent
																		TP(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
																		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Wenlocktoad","3")
																	end
																end
															end
														end
													end
												elseif game.Players.LocalPlayer.Data.Race.Value == 'Fishman' then
													if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","1") ~= -2 then
														if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","1") == 0 then
															game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","2")
														elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","1") == 1 then
															if not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 1") and not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 1") then
																TP(game.Workspace.Flower1.CFrame)
															elseif not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 2") and not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 2") then
																TP(game.Workspace.Flower2.CFrame)
															elseif not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 3") and not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 3") then
																if game:GetService("Workspace").Enemies:FindFirstChild("Swan Pirate [Lv. 775]") then
																	for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
																		if v.Name == "Swan Pirate [Lv. 775]" then
																			repeat task.wait()
																				StartMagnet = true
																				FastAttackSpeed = true
																				PosMon = v.HumanoidRootPart.CFrame
																				EquipWeaponMelee()
																				v.HumanoidRootPart.Size = Vector3.new(60,60,60)
																				v.Humanoid.JumpPower = 0
																				v.Humanoid.WalkSpeed = 0
																				v.HumanoidRootPart.CanCollide = false
																				v.Humanoid:ChangeState(11)
																				TP(v.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
																			until game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 3") or not v.Parent or v.Humanoid.Health <= 0 or _G.Main["Start"] == false
																			FastAttackSpeed = false
																			StartMagnet = false
																			
																		end
																	end
																else
																	StartMagnet = false
																	TP(CFrame.new(980.0985107421875, 121.331298828125, 1287.2093505859375))
																end
															end
														elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","1") == 2 then
															game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","3")
														end
													elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Wenlocktoad","1") == 0 then
														game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Wenlocktoad","2")
													elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Wenlocktoad","1") == 1 then
														game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Wenlocktoad","3")
														if (game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit == true) or CheckSeabeast() then
															if CheckSeabeast() then
																pcall(function()
																	game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit = false
																	for i,v in pairs(game.Workspace.SeaBeasts:GetChildren()) do
																		if _G.Main["Start"] and v:FindFirstChild("HumanoidRootPart") and v.Health.Value > 0 then
																			repeat wait()
																				if (CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position.X,250,game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Z).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 150 then
																					Farmtween = TP(CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position.X,250,game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Z))
																				elseif (CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position.X,250,game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Z).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150 then
																					if Farmtween then
																						Farmtween:Stop()
																					end
																					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position.X,250,game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Z)
																					SpamSkillSea = true
																					PosKillSea = v.HumanoidRootPart.Position
																				end
																				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Wenlocktoad","3")
																			until not _G.Main["Start"] or not v.Parent or not v:FindFirstChild("HumanoidRootPart") or v.Health.Value == 0
																			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Wenlocktoad","3")
																			SpamSkillSea = false
																		end
																	end
																end)
															elseif game.Players.LocalPlayer.Character.Humanoid.Sit == true then
																SpamSkillSea = false
																game:service('VirtualInputManager'):SendKeyEvent(true, "W", false, game)
																wait(0.5)
																game:service('VirtualInputManager'):SendKeyEvent(false, "W", false, game)
																wait(1)
																game:service('VirtualInputManager'):SendKeyEvent(true, "S", false, game)
																wait(0.5)
																game:service('VirtualInputManager'):SendKeyEvent(false, "S", false, game)
																wait(1)
															end
														elseif myboat() and (game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit == false) and (New_Word and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(38.905670166015625, -0.4971587657928467, 5150.13623046875)).Magnitude > 30) or (Three_World and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(163.8607940673828, -0.4971587657928467, 3242.834716796875)).Magnitude > 30) then
															SpamSkillSea = false
															local TweenToSea
															if New_World then
																TweenToSea = TP(CFrame.new(38.905670166015625, -0.4971587657928467, 5150.13623046875))
															elseif Three_World then
																TweenToSea = TP(CFrame.new(163.8607940673828, -0.4971587657928467, 3242.834716796875))
															end
															TweenToSea:Wait()
															wait(2)
														elseif myboat() and (game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit == false) then
															SpamSkillSea = false
															game:service('VirtualInputManager'):SendKeyEvent(true, "W", false, game)
															game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = myboat()
															wait()
															game:service('VirtualInputManager'):SendKeyEvent(false, "W", false, game)
															game:service('VirtualInputManager'):SendKeyEvent(true, "W", false, game)
															game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = myboat()
															wait()
															game:service('VirtualInputManager'):SendKeyEvent(false, "W", false, game)
														elseif not myboat() then
															Com("F_","BuyBoat","Dinghy")
															wait(1)
														end
													end
												elseif game.Players.LocalPlayer.Data.Race.Value == 'Human' then
													if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","1") ~= -2 then
														if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","1") == 0 then
															game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","2")
														elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","1") == 1 then
															if not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 1") and not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 1") then
																TP(game.Workspace.Flower1.CFrame)
															elseif not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 2") and not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 2") then
																TP(game.Workspace.Flower2.CFrame)
															elseif not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 3") and not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 3") then
																if game:GetService("Workspace").Enemies:FindFirstChild("Swan Pirate [Lv. 775]") then
																	for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
																		if v.Name == "Swan Pirate [Lv. 775]" then
																			repeat task.wait()
																				StartMagnet = true
																				FastAttackSpeed = true
																				PosMon = v.HumanoidRootPart.CFrame
																				EquipWeaponMelee()
																				v.HumanoidRootPart.Size = Vector3.new(60,60,60)
																				v.Humanoid.JumpPower = 0
																				v.Humanoid.WalkSpeed = 0
																				v.HumanoidRootPart.CanCollide = false
																				v.Humanoid:ChangeState(11)
																				TP(v.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
																			until game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 3") or not v.Parent or v.Humanoid.Health <= 0 or _G.Main["Start"] == false
																			FastAttackSpeed = false
																			StartMagnet = false
																		end
																	end
																else
																	StartMagnet = false
																	TP(CFrame.new(980.0985107421875, 121.331298828125, 1287.2093505859375))
																end
															end
														elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","1") == 2 then
															game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","3")
														end
													elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Wenlocktoad","1") == 0 then
														game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Wenlocktoad","2")
													elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Wenlocktoad","1") == 1 then
														if game.Workspace.Enemies:FindFirstChild("Fajita [Lv. 925] [Boss]") then
															for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
																if v.Name == "Fajita [Lv. 925] [Boss]" then
																	if v.Humanoid.Health > 0 and v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
																		repeat task.wait()
																			StartMagnet = true
																			FastAttackSpeed = true
																			PosMon = v.HumanoidRootPart.CFrame
																			EquipWeaponMelee()
																			v.HumanoidRootPart.Size = Vector3.new(60,60,60)
																			v.Humanoid.JumpPower = 0
																			v.Humanoid.WalkSpeed = 0
																			v.HumanoidRootPart.CanCollide = false
																			v.Humanoid:ChangeState(11)
																			TP(v.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
																			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Wenlocktoad","3")
																		until v.Humanoid.Health <= 0 or not v.Parent or not _G.Main["Start"]
																		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Wenlocktoad","3")
																		FastAttackSpeed = false
																		StartMagnet = false
																	end
																end
															end
														elseif game.ReplicatedStorage:FindFirstChild("Fajita [Lv. 925] [Boss]") then
															TP(game.ReplicatedStorage:FindFirstChild("Fajita [Lv. 925] [Boss]").HumanoidRootPart.CFrame*CFrame.new(0,30,0))
														elseif game.Workspace.Enemies:FindFirstChild("Jeremy [Lv. 850] [Boss]") then
															for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
																if v.Name == "Jeremy [Lv. 850] [Boss]" then
																	if v.Humanoid.Health > 0 and v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
																		repeat task.wait()
																			StartMagnet = true
																			FastAttackSpeed = true
																			PosMon = v.HumanoidRootPart.CFrame
																			EquipWeaponMelee()
																			v.HumanoidRootPart.Size = Vector3.new(60,60,60)
																			v.Humanoid.JumpPower = 0
																			v.Humanoid.WalkSpeed = 0
																			v.HumanoidRootPart.CanCollide = false
																			v.Humanoid:ChangeState(11)
																			TP(v.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
																			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Wenlocktoad","3")
																		until v.Humanoid.Health <= 0 or not v.Parent or not _G.Main["Start"]
																		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Wenlocktoad","3")
																		FastAttackSpeed = false
																		StartMagnet = false
																	end
																end
															end
														elseif game.ReplicatedStorage:FindFirstChild("Jeremy [Lv. 850] [Boss]") then
															TP(game.ReplicatedStorage:FindFirstChild("Jeremy [Lv. 850] [Boss]").HumanoidRootPart.CFrame*CFrame.new(0,30,0))
														elseif game.Workspace.Enemies:FindFirstChild("Diamond [Lv. 750] [Boss]") then
															for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
																if v.Name == "Diamond [Lv. 750] [Boss]" then
																	if v.Humanoid.Health > 0 and v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
																		repeat task.wait()
																			StartMagnet = true
																			FastAttackSpeed = true
																			PosMon = v.HumanoidRootPart.CFrame
																			EquipWeaponMelee()
																			v.HumanoidRootPart.Size = Vector3.new(60,60,60)
																			v.Humanoid.JumpPower = 0
																			v.Humanoid.WalkSpeed = 0
																			v.HumanoidRootPart.CanCollide = false
																			v.Humanoid:ChangeState(11)
																			TP(v.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
																			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Wenlocktoad","3")
																		until v.Humanoid.Health <= 0 or not v.Parent or not _G.Main["Start"]
																		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Wenlocktoad","3")
																		FastAttackSpeed = false
																		StartMagnet = false
																	end
																end
															end
														elseif game.ReplicatedStorage:FindFirstChild("Diamond [Lv. 750] [Boss]") then
															TP(game.ReplicatedStorage:FindFirstChild("Diamond [Lv. 750] [Boss]").HumanoidRootPart.CFrame*CFrame.new(0,30,0))
														end
													end
												elseif game.Players.LocalPlayer.Data.Race.Value == 'Skypiea' then
													if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","1") ~= -2 then
														if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","1") == 0 then
															game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","2")
														elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","1") == 1 then
															if not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 1") and not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 1") then
																TP(game.Workspace.Flower1.CFrame)
															elseif not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 2") and not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 2") then
																TP(game.Workspace.Flower2.CFrame)
															elseif not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 3") and not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 3") then
																if game:GetService("Workspace").Enemies:FindFirstChild("Swan Pirate [Lv. 775]") then
																	for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
																		if v.Name == "Swan Pirate [Lv. 775]" then
																			repeat task.wait()
																				StartMagnet = true
																				FastAttackSpeed = true
																				PosMon = v.HumanoidRootPart.CFrame
																				EquipWeaponMelee()
																				v.HumanoidRootPart.Size = Vector3.new(60,60,60)
																				v.Humanoid.JumpPower = 0
																				v.Humanoid.WalkSpeed = 0
																				v.HumanoidRootPart.CanCollide = false
																				v.Humanoid:ChangeState(11)
																				TP(v.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
																			until game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 3") or not v.Parent or v.Humanoid.Health <= 0 or _G.Main["Start"] == false
																			FastAttackSpeed = false
																			StartMagnet = false
																		end
																	end
																else
																	StartMagnet = false
																	TP(CFrame.new(980.0985107421875, 121.331298828125, 1287.2093505859375))
																end
															end
														elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","1") == 2 then
															game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","3")
														end
													elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Wenlocktoad","1") == 0 then
														game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Wenlocktoad","2")
													elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Wenlocktoad","1") == 1 then
														game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Wenlocktoad","3")
														for i,v in pairs(game.Players:GetChildren()) do
															if v.Name ~= game.Players.LocalPlayer.Name and tostring(v.Data.Race.Value) == "Skypiea" then
																repeat task.wait()
																	StartMagnet = true
																	FastAttackSpeed = true
																	PosMon = v.HumanoidRootPart.CFrame
																	EquipWeaponMelee()
																	v.HumanoidRootPart.Size = Vector3.new(60,60,60)
																	v.Humanoid.JumpPower = 0
																	v.Humanoid.WalkSpeed = 0
																	v.HumanoidRootPart.CanCollide = false
																	v.Humanoid:ChangeState(11)
																	TP(v.HumanoidRootPart.CFrame * CFrame.new(0,20,0))
																	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Wenlocktoad","3")
																until v.Humanoid.Health <= 0 or _G.Main["Start"] == false
																game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Wenlocktoad","3")
																FastAttackSpeed = false
																StartMagnet = false
															end
														end
													end
												end
											end
										elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ZQuestProgress","Check") ~= 0 then
											if game:GetService("Workspace").Enemies:FindFirstChild("Don Swan [Lv. 1000] [Boss]") or game:GetService("ReplicatedStorage"):FindFirstChild("Don Swan [Lv. 1000] [Boss]") then
												if game:GetService("Workspace").Enemies:FindFirstChild("Don Swan [Lv. 1000] [Boss]") then
													for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
														if v.Name == "Don Swan [Lv. 1000] [Boss]" then
															repeat task.wait()
																EquipWeaponMelee()
																TP(v.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
																v.HumanoidRootPart.CanCollide = false
																v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
																FastAttackSpeed = true
																KilldoFa = true
															until _G.Main["Start"] == false or v.Humanoid.Health <= 0 or not v.Parent
															FastAttackSpeed = false
														end
													end
												else
													if (CFrame.new(2284.912109375, 15.537666320801, 905.48291015625).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 1000 then
														game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(2284.912109375, 15.537666320801, 905.48291015625))
													end
													TP(CFrame.new(2284.912109375, 15.537666320801, 905.48291015625))
												end
											elseif not game:GetService("Workspace").Enemies:FindFirstChild("Don Swan [Lv. 1000] [Boss]") and not game:GetService("ReplicatedStorage"):FindFirstChild("Don Swan [Lv. 1000] [Boss]") then
												if (CFrame.new(2284.912109375, 15.537666320801, 905.48291015625).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 1000 then
													game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(2284.912109375, 15.537666320801, 905.48291015625))
												end
												TP(CFrame.new(2284.912109375, 15.537666320801, 905.48291015625))
											end
										end
									elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TalkTrevor","1") ~= 0 then
										CheckFruit = true
										if game.Players.LocalPlayer.Backpack:FindFirstChild("Quake Fruit") or game.Players.LocalPlayer.Backpack:FindFirstChild("Buddha Fruit") or game.Players.LocalPlayer.Backpack:FindFirstChild("Spider Fruit") or game.Players.LocalPlayer.Backpack:FindFirstChild("Phoenix Fruit") or game.Players.LocalPlayer.Backpack:FindFirstChild("Rumble Fruit") or game.Players.LocalPlayer.Backpack:FindFirstChild("Paw Fruit") or game.Players.LocalPlayer.Backpack:FindFirstChild("Gravity Fruit") or game.Players.LocalPlayer.Backpack:FindFirstChild("Dough Fruit") or game.Players.LocalPlayer.Backpack:FindFirstChild("Shadow Fruit") or game.Players.LocalPlayer.Backpack:FindFirstChild("Venom Fruit") or game.Players.LocalPlayer.Backpack:FindFirstChild("Control Fruit") or game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Fruit") or game.Players.LocalPlayer.Backpack:FindFirstChild("Soul Fruit") or game.Players.LocalPlayer.Character:FindFirstChild("Quake Fruit") or game.Players.LocalPlayer.Character:FindFirstChild("Buddha Fruit") or game.Players.LocalPlayer.Character:FindFirstChild("Spider Fruit") or game.Players.LocalPlayer.Character:FindFirstChild("Phoenix Fruit") or game.Players.LocalPlayer.Character:FindFirstChild("Rumble Fruit") or game.Players.LocalPlayer.Character:FindFirstChild("Paw Fruit") or game.Players.LocalPlayer.Character:FindFirstChild("Gravity Fruit") or game.Players.LocalPlayer.Character:FindFirstChild("Dough Fruit") or game.Players.LocalPlayer.Character:FindFirstChild("Shadow Fruit") or game.Players.LocalPlayer.Character:FindFirstChild("Venom Fruit") or game.Players.LocalPlayer.Character:FindFirstChild("Control Fruit") or game.Players.LocalPlayer.Backpack:FindFirstChild("Soul Fruit") or game.Players.LocalPlayer.Character:FindFirstChild("Dragon Fruit") then
											game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TalkTrevor","1")
											game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TalkTrevor","2")
											game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TalkTrevor","3")
											CheckFruit = false
										elseif ExpensiveFruit[1] ~= nil and game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Health > 1 then
											if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Health > 1 then
												wait(2)
												game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LoadFruit", ExpensiveFruit[1].Name)
											end
										end
									end
								elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 0 then
									if string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Swan Pirates") and string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "50") and game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == true then 
										if game:GetService("Workspace").Enemies:FindFirstChild("Swan Pirate [Lv. 775]") then
											for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
												if v.Name == "Swan Pirate [Lv. 775]" then
													repeat task.wait()
														EquipWeaponMelee()
														TP(v.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
														v.HumanoidRootPart.CanCollide = false
														v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
														PosMon = v.HumanoidRootPart.CFrame
														StartMagnet = true
														FastAttackSpeed = true
													until not v.Parent or v.Humanoid.Health <= 0 or _G.Main["Start"] == false or game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false
													StartMagnet = false
													FastAttackSpeed = false
												end
											end
										else
											TP(CFrame.new(968.2816162109375, 142.31495666503906, 1217.4793701171875))
										end
									else
										game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest","BartiloQuest",1)
									end
								elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 1 then
									if QuestBartilo == nil then
										game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo")
										QuestBartilo = 1
									end
									if game:GetService("Workspace").Enemies:FindFirstChild("Jeremy [Lv. 850] [Boss]") then
										for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
											if v.Name == "Jeremy [Lv. 850] [Boss]" then
												repeat task.wait()
													EquipWeaponMelee()
													TP(v.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
													v.HumanoidRootPart.CanCollide = false
													v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
													FastAttackSpeed = true
												until not v.Parent or v.Humanoid.Health <= 0 or _G.Main["Start"] == false
												FastAttackSpeed = false
											end
										end
									elseif QuestBartilo == 1 and game:GetService("ReplicatedStorage"):FindFirstChild("Jeremy [Lv. 850] [Boss]") then
										TP(CFrame.new(2226.070556640625, 448.930908203125, 708.0992431640625))
									end
								elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 2 then
									firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate1, 0)
									task.wait()
									firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate2, 0)
									task.wait()
									firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate3, 0)
									task.wait()
									firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate4, 0)
									task.wait()
									firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate5, 0)
									task.wait()
									firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate6, 0)
									task.wait()
									firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate7, 0)
									task.wait()
									firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate8, 0)
								end
							else
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
							end
						--end
					elseif Castal and Three_World then
						if (CFrame.new(-5155.15234375, 313.7154846191406, -2948.581787109375).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 500 then
							for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
								if Castal and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
									if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 2000 then
										repeat task.wait()
											StartMagnet = true
											PosMon = v.HumanoidRootPart.CFrame
											v.HumanoidRootPart.CanCollide = false
											v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
											EquipWeapon("Tushita")
											FastAttackSpeed = true
											TP(v.HumanoidRootPart.CFrame * CFrame.new(0,50,0))
										until v.Humanoid.Health <= 0 or not v.Parent or Castal == false
										FastAttackSpeed = false
										StartMagnet = false
									end
								end
							end
						else
							TP(CFrame.new(-5155.15234375, 313.7154846191406, -2948.581787109375))
						end
					elseif _G.Quest.Tushita == false and _G.Sword['Tushita'] == true and MyLevel >= 2000 and Three_World and not RaidSumfruit and not AutoRaids and game.Workspace.Enemies:FindFirstChild("rip_indra True Form [Lv. 5000] [Raid Boss]") or game.ReplicatedStorage:FindFirstChild("rip_indra True Form [Lv. 5000] [Raid Boss]") then
						st:Set("Status : Do Tushita")
						if game.Workspace.Enemies:FindFirstChild("rip_indra True Form [Lv. 5000] [Raid Boss]") or game.ReplicatedStorage:FindFirstChild("rip_indra True Form [Lv. 5000] [Raid Boss]") then
							if game.Players.LocalPlayer.Backpack:FindFirstChild("Holy Torch") or game.Players.LocalPlayer.Character:FindFirstChild("Holy Torch") then
								wait(1)
								local Q_Tushita = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TushitaProgress")
								local Q_Torch = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TushitaProgress")['Torches']
								if Q_Torch[1] == false then
									if game.Players.LocalPlayer.Backpack:FindFirstChild("Holy Torch") or game.Players.LocalPlayer.Character:FindFirstChild("Holy Torch") then
										EquipWeapon("Holy Torch")
										repeat TP(game:GetService("Workspace").Map.Turtle.QuestTorches.Torch1.CFrame) wait() until not _G.Main["Start"] or (game:GetService("Workspace").Map.Turtle.QuestTorches.Torch1.CFrame).Magnitude <= 5
									end
								elseif Q_Torch[2] == false then
									if game.Players.LocalPlayer.Backpack:FindFirstChild("Holy Torch") or game.Players.LocalPlayer.Character:FindFirstChild("Holy Torch") then
										EquipWeapon("Holy Torch")
										repeat TP(game:GetService("Workspace").Map.Turtle.QuestTorches.Torch2.CFrame) wait() until not _G.Main["Start"] or (game:GetService("Workspace").Map.Turtle.QuestTorches.Torch2.CFrame).Magnitude <= 5
									end
								elseif Q_Torch[3] == false then
									if game.Players.LocalPlayer.Backpack:FindFirstChild("Holy Torch") or game.Players.LocalPlayer.Character:FindFirstChild("Holy Torch") then
										EquipWeapon("Holy Torch")
										repeat TP(game:GetService("Workspace").Map.Turtle.QuestTorches.Torch3.CFrame) wait() until not _G.Main["Start"] or (game:GetService("Workspace").Map.Turtle.QuestTorches.Torch3.CFrame).Magnitude <= 5
									end
								elseif Q_Torch[4] == false then
									if game.Players.LocalPlayer.Backpack:FindFirstChild("Holy Torch") or game.Players.LocalPlayer.Character:FindFirstChild("Holy Torch") then
										EquipWeapon("Holy Torch")
										repeat TP(game:GetService("Workspace").Map.Turtle.QuestTorches.Torch4.CFrame) wait() until not _G.Main["Start"] or (game:GetService("Workspace").Map.Turtle.QuestTorches.Torch4.CFrame).Magnitude <= 5
									end
								elseif Q_Torch[5] == false then
									if game.Players.LocalPlayer.Backpack:FindFirstChild("Holy Torch") or game.Players.LocalPlayer.Character:FindFirstChild("Holy Torch") then
										EquipWeapon("Holy Torch")
										repeat TP(game:GetService("Workspace").Map.Turtle.QuestTorches.Torch5.CFrame) wait() until not _G.Main["Start"] or (game:GetService("Workspace").Map.Turtle.QuestTorches.Torch5.CFrame).Magnitude <= 5
									end
								elseif _G.Sword['Tushita'] == true and MyLevel >= 2000 and _G.Quest.Tushita == false and Three_World and not RaidSumfruit and not AutoRaids and Q_Tushita['KilledLongma'] == false and game.Workspace.Enemies:FindFirstChild("Longma [Lv. 2000] [Boss]") or game.ReplicatedStorage:FindFirstChild("Longma [Lv. 2000] [Boss]") then
									st:Set("Status : Kill Longma")
									if game:GetService("Workspace").Enemies:FindFirstChild("Longma [Lv. 2000] [Boss]") then
										for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
											if v.Name == "Longma [Lv. 2000] [Boss]" then
												repeat task.wait()
													StartMagnet = true
													FastAttackSpeed = true
													PosMon = v.HumanoidRootPart.CFrame
													EquipWeaponMelee()
													v.HumanoidRootPart.Size = Vector3.new(60,60,60)
													v.Humanoid.JumpPower = 0
													v.Humanoid.WalkSpeed = 0
													v.HumanoidRootPart.CanCollide = false
													v.Humanoid:ChangeState(11)
													TP(v.HumanoidRootPart.CFrame * CFrame.new(0,20,0))
												until not _G.Main["Start"] or not v.Parent or v.Humanoid.Health <= 0
												_G.Quest.Tushita = true
												StartMagnet = false
												FastAttackSpeed = false
											end
										end
									else
										TP(CFrame.new(-10238.875976563, 389.7912902832, -9549.7939453125))
									end
								end
								if game.Players.LocalPlayer.Backpack:FindFirstChild("Holy Torch") or game.Players.LocalPlayer.Character:FindFirstChild("Holy Torch") then
									game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TushitaProgress","Torch",1)
									game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TushitaProgress","Torch",2)
									game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TushitaProgress","Torch",3)
									game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TushitaProgress","Torch",4)
									game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TushitaProgress","Torch",5)
									wait(1)
								end
							else
								if Dis(CFrame.new(5314.58203125, 25.419387817382812, -125.94227600097656)) > 10 and not Q_Torch[5] == false then
									local args = {
										[1] = "requestEntrance",
										[2] = Vector3.new(5314.58203125, 25.419387817382812, -125.94227600097656)
									}
									
									game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
								end
								wait(1)
								TP(game:GetService("Workspace").Map.Waterfall.SecretRoom.Room.Door.Door.Hitbox.CFrame)
							end
						end
					elseif _G.Quest.Tushita == true and _G.Sword['Dark Dagger'] == true and Three_World and not RaidSumfruit and not AutoRaids and game.Workspace.Enemies:FindFirstChild("rip_indra True Form [Lv. 5000] [Raid Boss]") or game.ReplicatedStorage:FindFirstChild("rip_indra True Form [Lv. 5000] [Raid Boss]") then
						st:Set("Status : Do Dark Dagger")
						if game.Workspace.Enemies:FindFirstChild("rip_indra True Form [Lv. 5000] [Raid Boss]") or game.ReplicatedStorage:FindFirstChild("rip_indra True Form [Lv. 5000] [Raid Boss]") then
							if game:GetService("Workspace").Enemies:FindFirstChild("rip_indra True Form [Lv. 5000] [Raid Boss]") then
								for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
									if v.Name == "rip_indra True Form [Lv. 5000] [Raid Boss]" then
										oldFast = _G.Main["Delay"]
										repeat task.wait()
											_G.Main["Delay"] = 0.4375
											FastAttackSpeed = true
											EquipWeaponMelee()
											TP(v.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
										until v.Humanoid.Health <= 0 or not v.Parent or not _G.Main["Start"]
										_G.Main["Delay"] = oldFast
										FastAttackSpeed = false
									end
								end
							elseif game:GetService("ReplicatedStorage"):FindFirstChild("rip_indra True Form [Lv. 5000] [Raid Boss]") then
								TP(game:GetService("ReplicatedStorage"):FindFirstChild("rip_indra True Form [Lv. 5000] [Raid Boss]").HumanoidRootPart.CFrame*CFrame.new(0,30,0))
							end
						end
					elseif Three_World and not RaidSumfruit and not AutoRaids and _G.Mat["Mirror Factal"] and game.Players.LocalPlayer.Backpack:FindFirstChild("God's Chalice") or game.Players.LocalPlayer.Character:FindFirstChild("God's Chalice") or game.Workspace:FindFirstChild("Enemies"):FindFirstChild("Dough King [Lv. 2300] [Raid Boss]") or game:GetService("ReplicatedStorage"):FindFirstChild("Dough King [Lv. 2300] [Raid Boss]") then
						st:Set("Status : Farm Mirror Factal")
						if game.Players.LocalPlayer.Character:FindFirstChild("Red Key") or game.Players.LocalPlayer.Backpack:FindFirstChild("Red Key") then
							RedDorTween = TP(CFrame.new(-2681.97998, 64.3921585, -12853.7363, 0.149007782, -1.87902192e-08, 0.98883605, 3.60619588e-08, 1, 1.35681812e-08, -0.98883605, 3.36376011e-08, 0.149007782))
							if (CFrame.new(-2681.97998, 64.3921585, -12853.7363, 0.149007782, -1.87902192e-08, 0.98883605, 3.60619588e-08, 1, 1.35681812e-08, -0.98883605, 3.36376011e-08, 0.149007782).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 5 then
								if RedDorTween then RedDorTween:Stop() end
								game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2681.97998, 64.3921585, -12853.7363, 0.149007782, -1.87902192e-08, 0.98883605, 3.60619588e-08, 1, 1.35681812e-08, -0.98883605, 3.36376011e-08, 0.149007782)
								wait(0.5)
								EquipWeapon("Red Key")
							end
						elseif game.Workspace:FindFirstChild("Enemies"):FindFirstChild("Dough King [Lv. 2300] [Raid Boss]") or game:GetService("ReplicatedStorage"):FindFirstChild("Dough King [Lv. 2300] [Raid Boss]") then
							if game:GetService("Workspace").Enemies:FindFirstChild("Dough King [Lv. 2300] [Raid Boss]") then
								for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
									if v.Name == "Dough King [Lv. 2300] [Raid Boss]" and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
										oldFast = _G.Main["Delay"]
										repeat task.wait()
											_G.Main["Delay"] = 0.4375
											FastAttackSpeed = true
											PosMon = v.HumanoidRootPart.CFrame
											EquipWeaponMelee()
											TP(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
											StartMagnet = true
											--end
										until not _G.Main["Start"] or not v.Parent or v.Humanoid.Health <= 0 or game:GetService("ReplicatedStorage"):FindFirstChild("Dough King [Lv. 2300] [Raid Boss]")
										FastAttackSpeed = false
										_G.Main["Delay"] = oldFast
									end
								end
							else
								if game:GetService("Workspace").Map.CakeLoaf.BigMirror.Other.Transparency == 0 then
									FastAttackSpeed = false
									Questtween = TP(CFrame.new(-2151.82153, 149.315704, -12404.9053))
									if (CFrame.new(-2151.82153, 149.315704, -12404.9053).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
										if Questtween then Questtween:Stop() end
										game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2151.82153, 149.315704, -12404.9053)
										wait(1)
									end
								end 
							end
						elseif game.Players.LocalPlayer.Character:FindFirstChild("Sweet Chalice") or game.Players.LocalPlayer.Backpack:FindFirstChild("Sweet Chalice") then
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner", true)
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")
							if game:GetService("Workspace").Enemies:FindFirstChild("Cookie Crafter [Lv. 2200]") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Guard [Lv. 2225]") or game:GetService("Workspace").Enemies:FindFirstChild("Baking Staff [Lv. 2250]") or game:GetService("Workspace").Enemies:FindFirstChild("Head Baker [Lv. 2275]") then
								for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
									if (v.Name == "Cookie Crafter [Lv. 2200]" or v.Name == "Cake Guard [Lv. 2225]" or v.Name == "Baking Staff [Lv. 2250]" or v.Name == "Head Baker [Lv. 2275]") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
										repeat task.wait()
											
												FastAttackSpeed = true
												PosMon = v.HumanoidRootPart.CFrame
												EquipWeaponMelee()
												TP(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
												StartMagnet = true
												game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner", true)
												game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")

										until not _G.Main["Start"] or not v.Parent or v.Humanoid.Health <= 0
										FastAttackSpeed = false
										StartMagnet = false
									end
								end
							else
								StartMagnet = false
								FastAttackSpeed = false
								Questtween = TP(CFrame.new(-2077, 252, -12373))
								if (CFrame.new(-2077, 252, -12373).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
									if Questtween then Questtween:Stop() end
									game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2077, 252, -12373)
								end
							end
						elseif GetMaterial("Conjured Cocoa") >= 10 then
							if (game.Players.LocalPlayer.Backpack:FindFirstChild("God's Chalice") or game.Players.LocalPlayer.Character:FindFirstChild("God's Chalice")) and GetMaterial("Conjured Cocoa") >= 10 then
								game.ReplicatedStorage.Remotes.CommF_:InvokeServer("SweetChaliceNpc")
								wait(0.2)
							end
						elseif GetMaterial("Conjured Cocoa") < 10 then
							if game:GetService("Workspace").Enemies:FindFirstChild("Candy Rebel [Lv. 2375]") or game:GetService("Workspace").Enemies:FindFirstChild("Sweet Thief [Lv. 2350]") or game:GetService("Workspace").Enemies:FindFirstChild("Chocolate Bar Battler [Lv. 2325]") or game:GetService("Workspace").Enemies:FindFirstChild("Cocoa Warrior [Lv. 2300]") then
								for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
									if (v.Name == "Candy Rebel [Lv. 2375]" or v.Name == "Sweet Thief [Lv. 2350]" or v.Name == "Chocolate Bar Battler [Lv. 2325]" or v.Name == "Cocoa Warrior [Lv. 2300]") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
										repeat task.wait()
											--if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 150 then
											--	Farmtween = TP(v.HumanoidRootPart.CFrame)
											--elseif (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150 then
											--	if Farmtween then Farmtween:Stop() end
												FastAttackSpeed = true
												PosMon = v.HumanoidRootPart.CFrame
												EquipWeaponMelee()
												TP(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
												StartMagnet = true
											--end
										until not _G.Main["Start"] or not v.Parent or v.Humanoid.Health <= 0
										FastAttackSpeed = false
										StartMagnet = false
									end
								end
							else
								FastAttackSpeed = false
								StartMagnet = false
								Questtween = TP(CFrame.new(620.6344604492188, 78.93644714355469, -12581.369140625))
								if (CFrame.new(620.6344604492188, 78.93644714355469, -12581.369140625).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150 then
									if Questtween then
										Questtween:Stop()
									end
									game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(620.6344604492188, 78.93644714355469, -12581.369140625)
								end
							end
						end	
					elseif  Three_World and not QuestGod and not RaidSumfruit and not AutoRaids and game:GetService("ReplicatedStorage"):FindFirstChild("Urban [Lv. 1750]") or game:GetService("Workspace").Enemies:FindFirstChild("Urban [Lv. 1750]") or game:GetService("ReplicatedStorage"):FindFirstChild("Diablo [Lv. 1750]") or game:GetService("Workspace").Enemies:FindFirstChild("Diablo [Lv. 1750]") or game:GetService("ReplicatedStorage"):FindFirstChild("Deandre [Lv. 1750]") or game:GetService("Workspace").Enemies:FindFirstChild("Deandre [Lv. 1750]") then
						if tonumber(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter","Progress")) >= 30 and _G.Quest.Yama == false and _G.Sword['Yama'] then
							repeat task.wait()
								st:Set("Status : Make Yama")
								fireclickdetector(game:GetService("Workspace").Map.Waterfall.SealedKatana.Handle.ClickDetector)
								print("Do Yama")	
							until game.Players.LocalPlayer.Backpack:FindFirstChild("Yama") or not _G.Main["Start"]
						else
							st:Set("Status : Kill Elite")
							if game:GetService("ReplicatedStorage"):FindFirstChild("Urban [Lv. 1750]") or game:GetService("Workspace").Enemies:FindFirstChild("Urban [Lv. 1750]") or game:GetService("ReplicatedStorage"):FindFirstChild("Diablo [Lv. 1750]") or game:GetService("Workspace").Enemies:FindFirstChild("Diablo [Lv. 1750]") or game:GetService("ReplicatedStorage"):FindFirstChild("Deandre [Lv. 1750]") or game:GetService("Workspace").Enemies:FindFirstChild("Deandre [Lv. 1750]") then
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter")
								if game:GetService("Workspace").Enemies:FindFirstChild("Deandre [Lv. 1750]") or game:GetService("Workspace").Enemies:FindFirstChild("Diablo [Lv. 1750]") or game:GetService("Workspace").Enemies:FindFirstChild("Urban [Lv. 1750]") then
									for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
										if v.Name == "Deandre [Lv. 1750]" or v.Name == "Diablo [Lv. 1750]" or v.Name == "Urban [Lv. 1750]" then
											repeat task.wait()
												FastAttackSpeed = true
												EquipWeaponMelee()
												TP(v.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
												v.HumanoidRootPart.CanCollide = false
												v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
												v.Humanoid.WalkSpeed = 0
											until v.Humanoid.Health <= 0 or not _G.Main["Start"] or game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false
											FastAttackSpeed = false
										end
									end
								elseif game:GetService("ReplicatedStorage"):FindFirstChild("Deandre [Lv. 1750]") then
									TP(game:GetService("ReplicatedStorage"):FindFirstChild("Deandre [Lv. 1750]").HumanoidRootPart.CFrame * CFrame.new(0,20,0))
								elseif game:GetService("ReplicatedStorage"):FindFirstChild("Urban [Lv. 1750]") then
									TP(game:GetService("ReplicatedStorage"):FindFirstChild("Urban [Lv. 1750]").HumanoidRootPart.CFrame * CFrame.new(0,20,0))
								elseif game:GetService("ReplicatedStorage"):FindFirstChild("Diablo [Lv. 1750]") then
									TP(game:GetService("ReplicatedStorage"):FindFirstChild("Diablo [Lv. 1750]").HumanoidRootPart.CFrame * CFrame.new(0,20,0))
								end
							end
						end
					elseif _G.Sword['Cursed Dual Katana'] and Three_World and _G.Quest.Tushita == true and _G.Quest.Yama == true and _G.Quest.CDK == false then
						if GetWeaponInventory("Cursed Dual Katana") == true then
							_G.Quest.CDK = true
							if game.Players.LocalPlayer.Character:FindFirstChild("Cursed Dual Katana") or game.Players.LocalPlayer.Backpack:FindFirstChild("Cursed Dual Katana") then
								_G.Quest.CDK = true
							else
								print("Get Weapon")
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LoadItem","Cursed Dual Katana")
							end
						else
							if game.Players.LocalPlayer.Character:FindFirstChild("Tushita") or game.Players.LocalPlayer.Backpack:FindFirstChild("Tushita") or game.Players.LocalPlayer.Character:FindFirstChild("Yama") or game.Players.LocalPlayer.Backpack:FindFirstChild("Yama") then
								if game.Players.LocalPlayer.Character:FindFirstChild("Tushita") or game.Players.LocalPlayer.Backpack:FindFirstChild("Tushita") then
									if game.Players.LocalPlayer.Backpack:FindFirstChild("Tushita") then
										EquipWeapon("Tushita")
									else
										for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
											if v.Name == "Tushita" and v:IsA("Tool") then
												if v.Level.Value >= 350 then
													game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LoadItem","Yama")
												else
													if game:GetService("Workspace").Enemies:FindFirstChild("Reborn Skeleton [Lv. 1975]") or game:GetService("Workspace").Enemies:FindFirstChild("Living Zombie [Lv. 2000]") or game:GetService("Workspace").Enemies:FindFirstChild("Demonic Soul [Lv. 2025]") or game:GetService("Workspace").Enemies:FindFirstChild("Posessed Mummy [Lv. 2050]") then
														for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
															if v.Name == "Reborn Skeleton [Lv. 1975]" or v.Name == "Living Zombie [Lv. 2000]" or v.Name == "Demonic Soul [Lv. 2025]" or v.Name == "Posessed Mummy [Lv. 2050]" then
																st:Set("Status : Do Cursed Dual Katana")
																repeat task.wait()
																	EquipWeaponSword()
																	StartMagnet = true
																	FastAttackSpeed = true
																	PosMon = v.HumanoidRootPart.CFrame
																	v.HumanoidRootPart.Size = Vector3.new(60,60,60)
																	v.Humanoid.JumpPower = 0
																	v.Humanoid.WalkSpeed = 0
																	v.HumanoidRootPart.CanCollide = false
																	v.Humanoid:ChangeState(11)
																	TP(v.HumanoidRootPart.CFrame * CFrame.new(0,20,0))
																until not _G.Main["Start"] or v.Humanoid.Health <= 0 or not v.Parent or v.Humanoid.Health <= 0
																StartMagnet = false
																FastAttackSpeed = false
															end
														end
													elseif not game:GetService("Workspace").Enemies:FindFirstChild("Reborn Skeleton [Lv. 1975]") or game:GetService("Workspace").Enemies:FindFirstChild("Living Zombie [Lv. 2000]") or game:GetService("Workspace").Enemies:FindFirstChild("Demonic Soul [Lv. 2025]") or game:GetService("Workspace").Enemies:FindFirstChild("Posessed Mummy [Lv. 2050]") then
														TP(CFrame.new(-9504.8564453125, 172.14292907714844, 6057.259765625))
													end
												end				
											end
										end
									end
								elseif game.Players.LocalPlayer.Character:FindFirstChild("Yama") or game.Players.LocalPlayer.Backpack:FindFirstChild("Yama") then
									if game.Players.LocalPlayer.Backpack:FindFirstChild("Yama") then
										EquipWeapon("Yama")
									else
										for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
											if v.Name == "Yama" and v:IsA("Tool") then
												if v.Level.Value >= 350 then
													Auto_CDK_Quest = true
												else
													if game:GetService("Workspace").Enemies:FindFirstChild("Reborn Skeleton [Lv. 1975]") or game:GetService("Workspace").Enemies:FindFirstChild("Living Zombie [Lv. 2000]") or game:GetService("Workspace").Enemies:FindFirstChild("Demonic Soul [Lv. 2025]") or game:GetService("Workspace").Enemies:FindFirstChild("Posessed Mummy [Lv. 2050]") then
														for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
															if v.Name == "Reborn Skeleton [Lv. 1975]" or v.Name == "Living Zombie [Lv. 2000]" or v.Name == "Demonic Soul [Lv. 2025]" or v.Name == "Posessed Mummy [Lv. 2050]" then
																st:Set("Status : Do Cursed Dual Katana")
																repeat task.wait()
																	EquipWeaponSword()
																	StartMagnet = true
																	FastAttackSpeed = true
																	PosMon = v.HumanoidRootPart.CFrame
																	v.HumanoidRootPart.Size = Vector3.new(60,60,60)
																	v.Humanoid.JumpPower = 0
																	v.Humanoid.WalkSpeed = 0
																	v.HumanoidRootPart.CanCollide = false
																	v.Humanoid:ChangeState(11)
																	TP(v.HumanoidRootPart.CFrame * CFrame.new(0,20,0))
																until not _G.Main["Start"] or v.Humanoid.Health <= 0 or not v.Parent or v.Humanoid.Health <= 0
																StartMagnet = false
																FastAttackSpeed = false
															end
														end
													elseif not game:GetService("Workspace").Enemies:FindFirstChild("Reborn Skeleton [Lv. 1975]") or game:GetService("Workspace").Enemies:FindFirstChild("Living Zombie [Lv. 2000]") or game:GetService("Workspace").Enemies:FindFirstChild("Demonic Soul [Lv. 2025]") or game:GetService("Workspace").Enemies:FindFirstChild("Posessed Mummy [Lv. 2050]") then
														TP(CFrame.new(-9504.8564453125, 172.14292907714844, 6057.259765625))
													end
												end
											end
										end
									end
								end
							else
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LoadItem","Tushita")
							end  
						end
					elseif _G.Sword['SpikeyTrident'] and not QuestGod and not RaidSumfruit and not AutoRaids and Three_World and game.ReplicatedStorage:FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") then
						st:Set("Status : Do SpikeyTrident")
						if game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") then
							for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
								if _G.Main["Start"] and v.Name == "Cake Prince [Lv. 2300] [Raid Boss]" and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
									oldFast = _G.Main["Delay"]
									repeat task.wait()
										_G.Main["Delay"] = 0.7375
										FastAttackSpeed = true
										EquipWeaponMelee()
										PosMon = v.HumanoidRootPart.CFrame
										v.HumanoidRootPart.Size = Vector3.new(60,60,60)
										v.Humanoid.JumpPower = 0
										v.Humanoid.WalkSpeed = 0
										v.HumanoidRootPart.CanCollide = false
										v.Humanoid:ChangeState(11)
										TP(v.HumanoidRootPart.CFrame * CFrame.new(30,30,30))
									until not _G.Main["Start"] or not v.Parent or v.Humanoid.Health <= 0
									FastAttackSpeed = false
									_G.Main["Delay"] = oldFast
								end
							end
						else
							if (CFrame.new(-2151.82153, 149.315704, -12404.9053).Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude < 350 then
								TP(CFrame.new(-2151.82153, 149.315704, -12404.9053))
							else
								TP(CFrame.new(-2151.82153, 149.315704, -12404.9053)*CFrame.new(0,0,-50))
							end
						end
					
					elseif _G.Sword['Canvander'] and not QuestGod and not RaidSumfruit and not AutoRaids and Three_World and game:GetService("Workspace").Enemies:FindFirstChild("Beautiful Pirate [Lv. 1950] [Boss]") or game:GetService("ReplicatedStorage"):FindFirstChild("Beautiful Pirate [Lv. 1950] [Boss]") then
						st:Set("Status : Do Canvander")
						if game:GetService("Workspace").Enemies:FindFirstChild("Beautiful Pirate [Lv. 1950] [Boss]") or game:GetService("ReplicatedStorage"):FindFirstChild("Beautiful Pirate [Lv. 1950] [Boss]") then
							if game:GetService("Workspace").Enemies:FindFirstChild("Beautiful Pirate [Lv. 1950] [Boss]") then
								for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
									if v.Name == "Beautiful Pirate [Lv. 1950] [Boss]" and v.Humanoid.Health > 0 and v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
										repeat task.wait()
											FastAttackSpeed = true
											EquipWeaponMelee()
											TP(v.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
											v.HumanoidRootPart.CanCollide = false
											v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
											v.Humanoid.WalkSpeed = 0
										until not _G.Main["Start"] or v.Humanoid.Health <= 0
										FastAttackSpeed = false
									end
								end
							else
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(5314.58203125, 25.419387817382812, -125.94227600097656))
							end
						end
					elseif _G.Sword['Buddy Sword'] and not QuestGod and not RaidSumfruit and not AutoRaids and Three_World and game:GetService("ReplicatedStorage"):FindFirstChild("Cake Queen [Lv. 2175] [Boss]") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Queen [Lv. 2175] [Boss]") then
						st:Set("Status : Do Buddy Sword")
						if game:GetService("ReplicatedStorage"):FindFirstChild("Cake Queen [Lv. 2175] [Boss]") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Queen [Lv. 2175] [Boss]") then
							if game:GetService("Workspace").Enemies:FindFirstChild("Cake Queen [Lv. 2175] [Boss]") then
								for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
									if v.Name == ("Cake Queen [Lv. 2175] [Boss]" or v.Name == "Cake Queen [Lv. 2175] [Boss]") and v.Humanoid.Health > 0 and v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
										repeat task.wait()
											FastAttackSpeed = true
											EquipWeaponMelee()
											TP(v.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
											v.HumanoidRootPart.CanCollide = false
											v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
											v.Humanoid.WalkSpeed = 0
										until v.Humanoid.Health <= 0 or not _G.Main["Start"]
										FastAttackSpeed = false
									end
								end
							elseif not game:GetService("Workspace").Enemies:FindFirstChild("Cake Queen [Lv. 2175] [Boss]") then
								TP(game:GetService("ReplicatedStorage"):FindFirstChild("Cake Queen [Lv. 2175] [Boss]").HumanoidRootPart.CFrame * CFrame.new(0,20,0))
							end
						end 
					elseif _G.Sword['Twin Hooks'] and not RaidSumfruit and not QuestGod and not AutoRaids and Three_World and game:GetService("ReplicatedStorage"):FindFirstChild("Captain Elephant [Lv. 1875] [Boss]") or game:GetService("Workspace").Enemies:FindFirstChild("Captain Elephant [Lv. 1875] [Boss]") then
						st:Set("Status : Do Twin Hooks")
						if game:GetService("ReplicatedStorage"):FindFirstChild("Captain Elephant [Lv. 1875] [Boss]") or game:GetService("Workspace").Enemies:FindFirstChild("Captain Elephant [Lv. 1875] [Boss]") then
							if game:GetService("Workspace").Enemies:FindFirstChild("Captain Elephant [Lv. 1875] [Boss]") then
								for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
									if v.Name == "Captain Elephant [Lv. 1875] [Boss]" then
										repeat task.wait()
											FastAttackSpeed = true
											EquipWeaponMelee()
											TP(v.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
											v.HumanoidRootPart.CanCollide = false
											v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
											v.Humanoid.WalkSpeed = 0
										until not _G.Main["Start"] or v.Humanoid.Health <= 0 or not v.Parent
										StartMagnet = false
										FastAttackSpeed = false
									end
								end
							elseif not game:GetService("Workspace").Enemies:FindFirstChild("Captain Elephant [Lv. 1875] [Boss]") then
								TP(game:GetService("ReplicatedStorage"):FindFirstChild("Captain Elephant [Lv. 1875] [Boss]").HumanoidRootPart.CFrame* CFrame.new(0,20,0))
							end
						end
					elseif _G.Sword['Hallow Scryte'] and not RaidSumfruit and not QuestGod and not AutoRaids and game.ReplicatedStorage:FindFirstChild("Soul Reaper [Lv. 2100] [Raid Boss]") or game:GetService("Workspace").Enemies:FindFirstChild("Soul Reaper [Lv. 2100] [Raid Boss]") then
						st:Set("Status : Do Hallow Scryte")
						if game.ReplicatedStorage:FindFirstChild("Soul Reaper [Lv. 2100] [Raid Boss]") or game:GetService("Workspace").Enemies:FindFirstChild("Soul Reaper [Lv. 2100] [Raid Boss]") then
							if game:GetService("Workspace").Enemies:FindFirstChild("Soul Reaper [Lv. 2100] [Raid Boss]") then
								for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
									if v.Name == "Soul Reaper [Lv. 2100] [Raid Boss]" then
										repeat task.wait()
											FastAttackSpeed = true
											EquipWeaponMelee()
											PosMon = v.HumanoidRootPart.CFrame
											v.HumanoidRootPart.Size = Vector3.new(60,60,60)
											v.Humanoid.JumpPower = 0
											v.Humanoid.WalkSpeed = 0
											v.HumanoidRootPart.CanCollide = false
											v.Humanoid:ChangeState(11)
											TP(v.HumanoidRootPart.CFrame * CFrame.new(30,30,30))
										until v.Humanoid.Health <= 0 or not _G.Main["Start"]
										StartMagnet = false
										FastAttackSpeed = false
									end
								end
							elseif not game:GetService("Workspace").Enemies:FindFirstChild("Soul Reaper [Lv. 2100] [Raid Boss]") then
								TP(CFrame.new(-9524.7890625, 315.80429077148, 6655.7192382813))
							end
						end
					
					elseif _G.Sword['Hallow Scryte'] and not RaidSumfruit and not AutoRaids and not QuestGod and game.Players.LocalPlayer.Backpack:FindFirstChild("Hallow Essence") or game.Players.LocalPlayer.Character:FindFirstChild("Hallow Essence") then
						if game.ReplicatedStorage:FindFirstChild("Soul Reaper [Lv. 2100] [Raid Boss]") or game:GetService("Workspace").Enemies:FindFirstChild("Soul Reaper [Lv. 2100] [Raid Boss]") then
							if game:GetService("Workspace").Enemies:FindFirstChild("Soul Reaper [Lv. 2100] [Raid Boss]") then
								for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
									if v.Name == "Soul Reaper [Lv. 2100] [Raid Boss]" then
										repeat task.wait()
											FastAttackSpeed = true
											EquipWeaponMelee()
											PosMon = v.HumanoidRootPart.CFrame
											v.HumanoidRootPart.Size = Vector3.new(60,60,60)
											v.Humanoid.JumpPower = 0
											v.Humanoid.WalkSpeed = 0
											v.HumanoidRootPart.CanCollide = false
											v.Humanoid:ChangeState(11)
											TP(v.HumanoidRootPart.CFrame * CFrame.new(30,30,30))
										until v.Humanoid.Health <= 0 or not _G.Main["Start"]
										StartMagnet = false
										FastAttackSpeed = false
									end
								end
							elseif not game:GetService("Workspace").Enemies:FindFirstChild("Soul Reaper [Lv. 2100] [Raid Boss]") then
								TP(CFrame.new(-9524.7890625, 315.80429077148, 6655.7192382813))
							end
						elseif (game.Players.LocalPlayer.Backpack:FindFirstChild("Hallow Essence") or game.Players.LocalPlayer.Character:FindFirstChild("Hallow Essence")) and not (game.ReplicatedStorage:FindFirstChild("Soul Reaper [Lv. 2100] [Raid Boss]") or game:GetService("Workspace").Enemies:FindFirstChild("Soul Reaper [Lv. 2100] [Raid Boss]")) then
							repeat wait()
								EquipWeapon("Hallow Essence")
								TP(CFrame.new(-8933.30566, 143.725754, 6058.21875, -0.99808532, -7.87057246e-08, -0.0618524998, -8.52176498e-08, 1, 1.02643483e-07, 0.0618524998, 1.07717874e-07, -0.99808532))
							until not _G.Main["Start"] or game.ReplicatedStorage:FindFirstChild("Soul Reaper [Lv. 2100] [Raid Boss]") or game:GetService("Workspace").Enemies:FindFirstChild("Soul Reaper [Lv. 2100] [Raid Boss]") or not (game.Players.LocalPlayer.Backpack:FindFirstChild("Hallow Essence") or game.Players.LocalPlayer.Character:FindFirstChild("Hallow Essence"))
						end
					elseif _G.Gun['Soul Guitar'] and GetMaterial("Dark Fragment") >= 1 and game:GetService("Lighting").Sky.MoonTextureId=="http://www.roblox.com/asset/?id=9709149431" and Three_World and not RaidSumfruit and not AutoRaids and not QuestGod then
						if (CFrame.new(-9681.458984375, 6.139880657196045, 6341.3720703125).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3000 then
							if game:GetService("Workspace").Map["Haunted Castle"].Candle1.Transparency == 0 then
								local Remotes = game.ReplicatedStorage:WaitForChild("Remotes");
								local __CommF = Remotes:WaitForChild("CommF_");
								local GuitarProgress = __CommF:InvokeServer("GuitarPuzzleProgress", "Check");
								--[[if not GuitarProgress then 
									local gravestoneEvent = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("gravestoneEvent", 2);
									if gravestoneEvent == true then
										__CommF:InvokeServer("gravestoneEvent", 2, true);
									else 
										if _G.Settings.Main["Auto Quest Soul Guitar Hop"] then
											Fast_Hop()
										end
									end;
								end]]
								if GuitarProgress then 
									local Swamp = GuitarProgress.Swamp;
									local Gravestones = GuitarProgress.Gravestones;
									local Ghost = GuitarProgress.Ghost;
									local Trophies = GuitarProgress.Trophies;
									local Pipes = GuitarProgress.Pipes;
									local CraftedOnce = GuitarProgress.CraftedOnce;
									if not Swamp then 
										repeat wait() 
											Tween(CFrame.new(-10141.462890625, 138.6524658203125, 5935.06298828125) * CFrame.new(0,30,0))
										until game.Players.LocalPlayer:DistanceFromCharacter(Vector3.new(-10141.462890625, 138.6524658203125, 5935.06298828125)) <= 100
										for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
											if v.Name == "Living Zombie [Lv. 2000]" then
												if v:FindFirstChild('Humanoid') then 
													if v:FindFirstChild('HumanoidRootPart') then 
														if game.Players.LocalPlayer:DistanceFromCharacter(v.HumanoidRootPart.Position) <= 2000 then 
															repeat wait() 
																v.HumanoidRootPart.Size = Vector3.new(60,60,60)
																v.HumanoidRootPart.CFrame = CFrame.new(-10138.3974609375, 138.6524658203125, 5902.89208984375)
																StartSoulGuitarMagnt = true
																FastAttackSpeed = true
																EquipWeaponMelee()
																v.Humanoid.JumpPower = 0
																v.Humanoid.WalkSpeed = 0
																v.HumanoidRootPart.CanCollide = false
																v.Humanoid:ChangeState(11)
																TP(v.HumanoidRootPart.CFrame * CFrame.new(0,30,15))
															until not v.Parent or v.Humanoid.Health <= 0 or not  v:FindFirstChild('HumanoidRootPart') or not v:FindFirstChild('Humanoid') or not _G.Main["Start"]
															StartSoulGuitarMagnt = false
															FastAttackSpeed = false
														end
													end
												end
											end
										end   
									end
									wait(1)
									if Swamp and not Gravestones then 
										__CommF:InvokeServer("GuitarPuzzleProgress", "Gravestones");
									end
									wait(1)
									if Swamp and  Gravestones and not Ghost then 
										__CommF:InvokeServer("GuitarPuzzleProgress", "Ghost");
									end 
									wait(1)
									if  Swamp and  Gravestones and Ghost and not Trophies then 
										__CommF:InvokeServer("GuitarPuzzleProgress", "Trophies");
									end
									wait(1)
									if  Swamp and  Gravestones and Ghost and Trophies and not Pipes then 
										__CommF:InvokeServer("GuitarPuzzleProgress", "Pipes");
									end
								end
							else
								if string.find(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("gravestoneEvent",2), "Error") then
									print("Go to Grave")
									TP(CFrame.new(-8653.2060546875, 140.98487854003906, 6160.033203125))
								elseif string.find(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("gravestoneEvent",2), "Nothing") then
									print("Wait Next Night")
								else
									game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("gravestoneEvent",2,true)
								end
							end
						else
							TP(CFrame.new(-9681.458984375, 6.139880657196045, 6341.3720703125))
						end 
					elseif  AutoBone and Three_World and not QuestGod then
						st:Set("Status : Farm Bone")
						if game:GetService("Workspace").Enemies:FindFirstChild("Reborn Skeleton [Lv. 1975]") or game:GetService("Workspace").Enemies:FindFirstChild("Living Zombie [Lv. 2000]") or game:GetService("Workspace").Enemies:FindFirstChild("Demonic Soul [Lv. 2025]") or game:GetService("Workspace").Enemies:FindFirstChild("Posessed Mummy [Lv. 2050]") then
							for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
								if v.Name == "Reborn Skeleton [Lv. 1975]" or v.Name == "Living Zombie [Lv. 2000]" or v.Name == "Demonic Soul [Lv. 2025]" or v.Name == "Posessed Mummy [Lv. 2050]" then
									repeat wait()
										EquipWeaponMelee()
										StartMagnet = true
										FastAttackSpeed = true
										PosMon = v.HumanoidRootPart.CFrame
										TP(v.HumanoidRootPart.CFrame * CFrame.new(0,20,0))
									until not AutoBone or v.Humanoid.Health <= 0 or not v.Parent or v.Humanoid.Health <= 0
									StartMagnet = false
									FastAttackSpeed = false
								end
							end
						else
							TP(CFrame.new(-9504.8564453125, 172.14292907714844, 6057.259765625))
						end
					elseif Masv2 and Three_World then
						st:Set("Status : Farm Mastery")
						if game:GetService("Workspace").Enemies:FindFirstChild("Reborn Skeleton [Lv. 1975]") or game:GetService("Workspace").Enemies:FindFirstChild("Living Zombie [Lv. 2000]") or game:GetService("Workspace").Enemies:FindFirstChild("Demonic Soul [Lv. 2025]") or game:GetService("Workspace").Enemies:FindFirstChild("Posessed Mummy [Lv. 2050]") then
							for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
								if v.Name == "Reborn Skeleton [Lv. 1975]" or v.Name == "Living Zombie [Lv. 2000]" or v.Name == "Demonic Soul [Lv. 2025]" or v.Name == "Posessed Mummy [Lv. 2050]" then
									repeat wait()
										EquipWeaponMelee()
										StartMagnet = true
										FastAttackSpeed = true
										PosMon = v.HumanoidRootPart.CFrame
										TP(v.HumanoidRootPart.CFrame * CFrame.new(0,20,0))
									until not Masv2 or v.Humanoid.Health <= 0 or not v.Parent or v.Humanoid.Health <= 0
									StartMagnet = false
									FastAttackSpeed = false
								end
							end
						else
							TP(CFrame.new(-9504.8564453125, 172.14292907714844, 6057.259765625))
						end
					elseif _G.Mastery["Fruit"] == true and CheckMas("V") == "true DownTo" and _G.Mud.GodHuman.Godhuman == true and _G.set["Fruitcompleat"] == false and MyLevel == 2450 and not RaidSumfruit and not AutoRaids then
						st:Set("Status : Farm Mastery Fruit")
						if  Mas == true then  Mas = false end
						if CheckMas("V") == "true UpTo" then
							_G.set["Fruitcompleat"] = true
							getgenv().SaveSetting()
						end
						CheckLevel()
						if game:GetService("Workspace").Enemies:FindFirstChild(Ms) then
							for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
								if v.Name == Ms and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
									repeat task.wait()
										FarmTP = TP(v.HumanoidRootPart.Position,v.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
										if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150 then
											if FarmTP then FarmTP:Stop() end
											StartMagnet = true
											PosMon = v.HumanoidRootPart.CFrame
											HealthMin = v.Humanoid.MaxHealth*15/100
											if v.Humanoid.Health <= HealthMin and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
												EquipWeapon(game.Players.LocalPlayer.Data.DevilFruit.Value)
												game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 40, 10)
												if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") then
													PositionSkillMasteryDevilFruit = v.HumanoidRootPart.Position
													UseSkillMasteryDevilFruit = true
													if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon-Dragon") then
														if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and DevilFruitMastery >= MasteryDevilFruit.Lvl.Z then
															game:service('VirtualInputManager'):SendKeyEvent(true, "Z", false, game)
															wait(.1)
															game:service('VirtualInputManager'):SendKeyEvent(false, "Z", false, game)
														end
														if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and DevilFruitMastery >= MasteryDevilFruit.Lvl.X then
															game:service('VirtualInputManager'):SendKeyEvent(true, "X", false, game)
															wait(.1)
															game:service('VirtualInputManager'):SendKeyEvent(false, "X", false, game)
														end   
														if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and DevilFruitMastery >= MasteryDevilFruit.Lvl.C then
															game:service('VirtualInputManager'):SendKeyEvent(true, "C", false, game)
															wait(.1)
															game:service('VirtualInputManager'):SendKeyEvent(false, "C", false, game)
														end  
													elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Human-Human: Buddha") then
														if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and game.Players.LocalPlayer.Character.HumanoidRootPart.Size == Vector3.new(7.6, 7.676, 3.686) and DevilFruitMastery >= MasteryDevilFruit.Lvl.Z then
														else
															game:service('VirtualInputManager'):SendKeyEvent(true, "Z", false, game)
															wait(.1)
															game:service('VirtualInputManager'):SendKeyEvent(false, "Z", false, game)
														end
														if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and DevilFruitMastery >= MasteryDevilFruit.Lvl.X then
															game:service('VirtualInputManager'):SendKeyEvent(true, "X", false, game)
															wait(.1)
															game:service('VirtualInputManager'):SendKeyEvent(false, "X", false, game)
														end
														if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and DevilFruitMastery >= MasteryDevilFruit.Lvl.C then
															game:service('VirtualInputManager'):SendKeyEvent(true, "C", false, game)
															wait(.1)
															game:service('VirtualInputManager'):SendKeyEvent(false, "C", false, game)
														end  
													elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Venom-Venom") then
														if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and DevilFruitMastery >= MasteryDevilFruit.Lvl.Z then
															game:service('VirtualInputManager'):SendKeyEvent(true, "Z", false, game)
															wait(4)
															game:service('VirtualInputManager'):SendKeyEvent(false, "Z", false, game)
														end
														if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and DevilFruitMastery >= MasteryDevilFruit.Lvl.X then
															game:service('VirtualInputManager'):SendKeyEvent(true, "X", false, game)
															wait(.1)
															game:service('VirtualInputManager'):SendKeyEvent(false, "X", false, game)
														end
														if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and DevilFruitMastery >= MasteryDevilFruit.Lvl.C then
															game:service('VirtualInputManager'):SendKeyEvent(true, "C", false, game)
															wait(.1)
															game:service('VirtualInputManager'):SendKeyEvent(false, "C", false, game)
														end
													elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value) then
														game:GetService("Players").LocalPlayer.Character:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value).MousePos.Value = v.HumanoidRootPart.Position
														if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and DevilFruitMastery >= MasteryDevilFruit.Lvl.Z then
															game:service('VirtualInputManager'):SendKeyEvent(true, "Z", false, game)
															wait(.1)
															game:service('VirtualInputManager'):SendKeyEvent(false, "Z", false, game)
														end
														if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and DevilFruitMastery >= MasteryDevilFruit.Lvl.X then
															game:service('VirtualInputManager'):SendKeyEvent(true, "X", false, game)
															wait(.1)
															game:service('VirtualInputManager'):SendKeyEvent(false, "X", false, game)
														end
														if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and DevilFruitMastery >= MasteryDevilFruit.Lvl.C then
															game:service('VirtualInputManager'):SendKeyEvent(true, "C", false, game)
															wait(.1)
															game:service('VirtualInputManager'):SendKeyEvent(false, "C", false, game)
														end
														if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and DevilFruitMastery >= MasteryDevilFruit.Lvl.V then
															game:service('VirtualInputManager'):SendKeyEvent(true, "V", false, game)
															wait(.1)
															game:service('VirtualInputManager'):SendKeyEvent(false, "V", false, game)
														end
													end
												end
											else
												game:GetService('VirtualUser'):CaptureController()
												game:GetService('VirtualUser'):ClickButton1(Vector2.new(851, 158), game:GetService("Workspace").Camera.CFrame)
												UseSkillMasteryDevilFruit = false
												EquipWeaponMelee()
												v.HumanoidRootPart.Size = Vector3.new(60,60,60)
												game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)
											end
										end
									until not game:GetService("Workspace").Enemies:FindFirstChild(Ms) or v.Humanoid.Health <= 0 or not v.Parent or not _G.Main["Start"]
									StartMagnet = false
								end
							end
						else
							StartMagnet = false
							Modstween = TP(CFrameMon)
						end
					elseif _G.Mastery["Melee"] == true and _G.Mud.GodHuman.Godhuman == true and CheckMas("V") == "true UpTo" and MyLevel == 2450 and _G.set["Meleecompleat"] == false and not RaidSumfruit and not AutoRaids then
						st:Set("Status : Farm Mastery Melee")
						repeat task.wait()
							GetAllMeleeFarm()
							if CheckMasteryWeapon("Godhuman",600) == "true UpTo" then
								_G.set["Meleecompleat"] = true
								getgenv().SaveSetting()
							end
							if game:GetService("Workspace").Enemies:FindFirstChild("Reborn Skeleton [Lv. 1975]") or game:GetService("Workspace").Enemies:FindFirstChild("Living Zombie [Lv. 2000]") or game:GetService("Workspace").Enemies:FindFirstChild("Demonic Soul [Lv. 2025]") or game:GetService("Workspace").Enemies:FindFirstChild("Posessed Mummy [Lv. 2050]") then
								for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
									if v.Name == "Reborn Skeleton [Lv. 1975]" or v.Name == "Living Zombie [Lv. 2000]" or v.Name == "Demonic Soul [Lv. 2025]" or v.Name == "Posessed Mummy [Lv. 2050]" then
										repeat task.wait()
											EquipWeaponMelee()
											StartMagnet = true
											FastAttackSpeed = true
											PosMon = v.HumanoidRootPart.CFrame
											v.HumanoidRootPart.Size = Vector3.new(60,60,60)
											v.Humanoid.JumpPower = 0
											v.Humanoid.WalkSpeed = 0
											v.HumanoidRootPart.CanCollide = false
											v.Humanoid:ChangeState(11)
											TP(v.HumanoidRootPart.CFrame * CFrame.new(0,20,0))
										until v.Humanoid.Health <= 0 or not v.Parent or v.Humanoid.Health <= 0 or not _G.Main["Start"]
										StartMagnet = false
										FastAttackSpeed = false
									end
								end
							else
								TP(CFrame.new(-9508.6015625, 172.1048126220703, 6160.68603515625))
								--[[repeat task.wait()
									if (CFrame.new(-9508.6015625, 172.1048126220703, 6160.68603515625).Position-game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50 and s1 == false then
										TP(CFrame.new(-9508.6015625, 172.1048126220703, 6160.68603515625))
										s1 = true
									elseif (CFrame.new(-9508.6015625, 172.1048126220703, 6160.68603515625).Position-game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude < 50 then
										TP(CFrame.new(-8764.4638671875, 142.1048126220703, 6002.8095703125))
									elseif (CFrame.new(-8764.4638671875, 142.1048126220703, 6002.8095703125).Position-game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude < 50 then
										TP(CFrame.new(-9576.2802734375, 5.792530536651611, 6191.97314453125))
									elseif (CFrame.new(-9576.2802734375, 5.792530536651611, 6191.97314453125).Position-game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude < 50 then
										TP(CFrame.new(-10160.5107421875, 138.6266632080078, 5972.81201171875))
									elseif (CFrame.new(-10160.5107421875, 138.6266632080078, 5972.81201171875).Position-game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude < 50 then
										s1 = false
										TP(CFrame.new(-9508.6015625, 172.1048126220703, 6160.68603515625))
									end
								until not _G.Main["Start"] or game:GetService("Workspace").Enemies:FindFirstChild("Reborn Skeleton [Lv. 1975]") or game:GetService("Workspace").Enemies:FindFirstChild("Living Zombie [Lv. 2000]") or game:GetService("Workspace").Enemies:FindFirstChild("Demonic Soul [Lv. 2025]") or game:GetService("Workspace").Enemies:FindFirstChild("Posessed Mummy [Lv. 2050]")]]
							end
						until _G.set["Meleecompleat"] == true or _G.Main["Start"] == false
					elseif _G.set["Meleecompleat"] == true and _G.Mastery["Sword"] == true and MyLevel == 2450 and not RaidSumfruit and not AutoRaids and _G.Mud.GodHuman.Godhuman == true and CheckMas("V") == "true UpTo" then
						st:Set("Status : Farm Mastery Sword")
						--[[spawn(function()
							while wait() do]]
								if _G.SelectSW ~= 0 then
									for i,v in pairs(_G.SelectSW) do
										if not game.Players.LocalPlayer.Backpack:FindFirstChild(v) and not game.Players.LocalPlayer.Character:FindFirstChild(v) and game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):GetState() ~= Enum.HumanoidStateType.Dead and game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Health ~= 0 then
											while true do wait()
												if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Health == 0 then repeat wait() until game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Health > 0; wait(0.2) end
												if game.Players.LocalPlayer.Backpack:FindFirstChild(v) or game.Players.LocalPlayer.Character:FindFirstChild(v) or table.find(SwordListFarmComplete,v) then 
													print("com1")
													break;
												end
												wait(0.5)
												Com("F_","StoreItem",tostring(GetFightingStyle("Sword")),inmyself(GetFightingStyle("Sword")))
												wait(0.5)
												Com("F_","LoadItem",tostring(v))
												wait(0.5)
												if game.Players.LocalPlayer.Backpack:FindFirstChild(v) or game.Players.LocalPlayer.Character:FindFirstChild(v) then
													SelectWeaponInSwordList = v
													break;
												end
												if CheckMasteryWeapon(v,375) == "true" or CheckMasteryWeapon(v,375) == "true UpTo" then
													print("DONE "..v)     
													table.insert(SwordListFarmComplete,v)
													print("com2")
													break;
												end
											end
										end
										wait(0.2)
										if game.Players.LocalPlayer.Backpack:FindFirstChild(v) or game.Players.LocalPlayer.Character:FindFirstChild(v) then
											while true do wait()
												if table.find(SwordListFarmComplete,v) and #_G.SelectSW ~= 0 and #SwordListFarmComplete ~= 0 then
													print("com3")
													break
												end
												if game.Players.LocalPlayer.Backpack:FindFirstChild(v) or game.Players.LocalPlayer.Character:FindFirstChild(v) then
													SelectWeaponInSwordList = v
												end
												
												AutoFarmMasterySwordList()
												if CheckMasteryWeapon(v,375) == "true" or CheckMasteryWeapon(v,375) == "true UpTo" then
													print("DONE "..v)
													table.insert(SwordListFarmComplete,v)
													print("com4")
													break;
												end
											end
										end
									end
								end
							--[[end
						end)]]
					elseif not Old_World and AutoRaids and MyLevel >= 1100 then
						st:Set("Status : Auto Raid")
						repeat wait()
							--game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Awakener","Awaken")
							if not game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1") then
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Awakener","Awaken")
								if game.Players.LocalPlayer.Data.DevilFruit.Value == "Bird: Phoenix" then
									NameChip = "Ice"
								else
									if game.Players.LocalPlayer.Data.DevilFruit.Value ~= "" then
										if game.Players.LocalPlayer.Data.DevilFruit.Value:find(" ") then
											NameChip = game.Players.LocalPlayer.Data.DevilFruit.Value
										elseif game.Players.LocalPlayer.Data.DevilFruit.Value:find("-") then
											NameChip = game.Players.LocalPlayer.Data.DevilFruit.Value:split("-")[1]
										end
									else
										NameChip = "Flame"
									end
								end
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaidsNpc", "Select", NameChip)
								if not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Special Microchip") and not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Special Microchip") and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaidsNpc", "Select", NameChip):find("cooldown") then
									CheckFruit = true
									local args = {
										[1] = "LoadFruit",
										[2] = UseLessFruit()[1]
									}
									game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
									wait()
									game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaidsNpc", "Select", NameChip)
									wait()
									CheckFruit = false
								elseif game.Players.LocalPlayer.Backpack:FindFirstChild("Special Microchip") or game.Players.LocalPlayer.Character:FindFirstChild("Special Microchip") then
									if New_World and game.Players.LocalPlayer.Backpack:FindFirstChild("Special Microchip") or game.Players.LocalPlayer.Character:FindFirstChild("Special Microchip") then
										fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector)
										repeat wait() until not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Special Microchip") and not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Special Microchip") 
									elseif Three_World and game.Players.LocalPlayer.Backpack:FindFirstChild("Special Microchip") or game.Players.LocalPlayer.Character:FindFirstChild("Special Microchip") then
										fireclickdetector(game:GetService("Workspace").Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector)
										repeat wait() until not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Special Microchip") and not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Special Microchip") 
									end
								end
							elseif not game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Timer.Visible and game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1") then
								if game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Y < 200 then
									game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X, 200, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z)
								end
							elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1") and game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Timer.Visible then
								for i,v in pairs(Workspace.Enemies:GetChildren()) do
									if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
										v.Humanoid.Health = 0
										sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
									end
								end
								if game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 5") or game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 4") or game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 3") or game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 2") or game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1") then
									if game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 5") and (game:GetService("Workspace")["_WorldOrigin"].Locations["Island 5"].CFrame.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5000 then
										TP(game:GetService("Workspace")["_WorldOrigin"].Locations["Island 5"].CFrame*CFrame.new(0,80,0))
									elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 4") and (game:GetService("Workspace")["_WorldOrigin"].Locations["Island 4"].CFrame.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5000 then
										TP(game:GetService("Workspace")["_WorldOrigin"].Locations["Island 4"].CFrame*CFrame.new(0,80,0))
									elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 3") and (game:GetService("Workspace")["_WorldOrigin"].Locations["Island 3"].CFrame.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5000 then
										TP(game:GetService("Workspace")["_WorldOrigin"].Locations["Island 3"].CFrame*CFrame.new(0,80,0))
									elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 2") and (game:GetService("Workspace")["_WorldOrigin"].Locations["Island 2"].CFrame.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5000 then
										if game:GetService("Workspace")["_WorldOrigin"].Locations["Island 2"]:FindFirstChild("Mesh").Scale.Y >= 1580 then
											if (game:GetService("Workspace")["_WorldOrigin"].Locations["Island 2"].CFrame.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5000 then
												TP(game:GetService("Workspace")["_WorldOrigin"].Locations["Island 2"].CFrame*CFrame.new(300,30,0))
											end
										else
											if (game:GetService("Workspace")["_WorldOrigin"].Locations["Island 2"].CFrame.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5000 then
												TP(game:GetService("Workspace")["_WorldOrigin"].Locations["Island 2"].CFrame*CFrame.new(0,30,0))
											end
										end
									elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1") and (game:GetService("Workspace")["_WorldOrigin"].Locations["Island 1"].CFrame.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5000 then
										TP(game:GetService("Workspace")["_WorldOrigin"].Locations["Island 1"].CFrame*CFrame.new(0,70,0))
									end
								end
							end
						until not AutoRaids or not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Special Microchip") and not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Special Microchip")
					elseif not Old_World and RaidSumfruit and MyLevel >= 1100 and not gotp3 then
						st:Set("Status : Auto Raid Sum Fruit")
						--repeat task.wait()
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Awakener","Awaken")
							if not game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1") then
								if game.Players.LocalPlayer.Data.DevilFruit.Value == "Bird: Phoenix" then
									NameChip = "Ice"
								else
									if game.Players.LocalPlayer.Data.DevilFruit.Value ~= "" then
										if game.Players.LocalPlayer.Data.DevilFruit.Value:find(" ") then
											NameChip = game.Players.LocalPlayer.Data.DevilFruit.Value
										elseif game.Players.LocalPlayer.Data.DevilFruit.Value:find("-") then
											NameChip = game.Players.LocalPlayer.Data.DevilFruit.Value:split("-")[1]
										end
									else
										NameChip = "Flame"
									end
								end
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaidsNpc", "Select", NameChip)
								if not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Special Microchip") and not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Special Microchip") and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaidsNpc", "Select", NameChip):find("cooldown") then
									CheckFruit = true
									wait()
									game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaidsNpc", "Select", NameChip)
									wait()
									CheckFruit = false
								elseif game.Players.LocalPlayer.Backpack:FindFirstChild("Special Microchip") or game.Players.LocalPlayer.Character:FindFirstChild("Special Microchip") then
									if New_World then
										fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector)
										repeat wait() until not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Special Microchip") and not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Special Microchip") 
									elseif Three_World then
										fireclickdetector(game:GetService("Workspace").Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector)
										repeat wait() until not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Special Microchip") and not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Special Microchip") 
									end
								end
							elseif not game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Timer.Visible and game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1") then
								if game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Y < 200 then
									game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X, 200, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z)
								end
							elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1") and game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Timer.Visible then
								for i,v in pairs(Workspace.Enemies:GetChildren()) do
									if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
										v.Humanoid.Health = 0
										sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
									end
								end
								if game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 5") or game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 4") or game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 3") or game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 2") or game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1") then
									if game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 5") and (game:GetService("Workspace")["_WorldOrigin"].Locations["Island 5"].CFrame.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5000 then
										TP(game:GetService("Workspace")["_WorldOrigin"].Locations["Island 5"].CFrame*CFrame.new(0,80,0))
									elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 4") and (game:GetService("Workspace")["_WorldOrigin"].Locations["Island 4"].CFrame.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5000 then
										TP(game:GetService("Workspace")["_WorldOrigin"].Locations["Island 4"].CFrame*CFrame.new(0,80,0))
									elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 3") and (game:GetService("Workspace")["_WorldOrigin"].Locations["Island 3"].CFrame.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5000 then
										TP(game:GetService("Workspace")["_WorldOrigin"].Locations["Island 3"].CFrame*CFrame.new(0,80,0))
									elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 2") and (game:GetService("Workspace")["_WorldOrigin"].Locations["Island 2"].CFrame.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5000 then
										if game:GetService("Workspace")["_WorldOrigin"].Locations["Island 2"]:FindFirstChild("Mesh").Scale.Y >= 1580 then
											if (game:GetService("Workspace")["_WorldOrigin"].Locations["Island 2"].CFrame.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5000 then
												TP(game:GetService("Workspace")["_WorldOrigin"].Locations["Island 2"].CFrame*CFrame.new(300,30,0))
											end
										else
											if (game:GetService("Workspace")["_WorldOrigin"].Locations["Island 2"].CFrame.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5000 then
												TP(game:GetService("Workspace")["_WorldOrigin"].Locations["Island 2"].CFrame*CFrame.new(0,30,0))
											end
										end
									elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1") and (game:GetService("Workspace")["_WorldOrigin"].Locations["Island 1"].CFrame.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5000 then
										TP(game:GetService("Workspace")["_WorldOrigin"].Locations["Island 1"].CFrame*CFrame.new(0,70,0))
									end
								end
							end
						--until not RaidSumfruit or not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Special Microchip") and not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Special Microchip")
					elseif Mas and Three_World and not QuestGod then
						st:Set("Status : Farm Mas + Fragment")
						game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CakePrinceSpawner")
						if game.ReplicatedStorage:FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") then
							if game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") then
								for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
									if v.Name == "Cake Prince [Lv. 2300] [Raid Boss]" and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
										oldFast = _G.Main["Delay"]
										repeat wait()
											_G.Main["Delay"] = 0.7375
											FastAttackSpeed = true
											EquipWeaponMelee()
											PosMon = v.HumanoidRootPart.CFrame
											v.HumanoidRootPart.Size = Vector3.new(60,60,60)
											v.Humanoid.JumpPower = 0
											v.Humanoid.WalkSpeed = 0
											v.HumanoidRootPart.CanCollide = false
											v.Humanoid:ChangeState(11)
											TP(v.HumanoidRootPart.CFrame * CFrame.new(30,30,30))
										until not _G.Main["Start"] or not v.Parent or v.Humanoid.Health <= 0
										FastAttackSpeed = false
										_G.Main["Delay"] = oldFast
									end
								end
							else
								if game:GetService("Workspace").Map.CakeLoaf.BigMirror.Other.Transparency == 0 then
									FastAttackSpeed = false
									Questtween = TP(CFrame.new(-2151.82153, 149.315704, -12404.9053))
									if (CFrame.new(-2151.82153, 149.315704, -12404.9053).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
										if Questtween then Questtween:Stop() end
										game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2151.82153, 149.315704, -12404.9053)
										wait(1)
									end
								end 
							end
						elseif not game.ReplicatedStorage:FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") or not game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") then
							if game:GetService("Workspace").Enemies:FindFirstChild("Cookie Crafter [Lv. 2200]") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Guard [Lv. 2225]") or game:GetService("Workspace").Enemies:FindFirstChild("Baking Staff [Lv. 2250]") or game:GetService("Workspace").Enemies:FindFirstChild("Head Baker [Lv. 2275]") then
								for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
									if (v.Name == "Cookie Crafter [Lv. 2200]" or v.Name == "Cake Guard [Lv. 2225]" or v.Name == "Baking Staff [Lv. 2250]" or v.Name == "Head Baker [Lv. 2275]") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
										repeat task.wait()
											StartMagnet = true
											FastAttackSpeed = true
											EquipWeaponMelee()
											PosMon = v.HumanoidRootPart.CFrame
											v.HumanoidRootPart.Size = Vector3.new(60,60,60)
											v.Humanoid.JumpPower = 0
											v.Humanoid.WalkSpeed = 0
											v.HumanoidRootPart.CanCollide = false
											v.Humanoid:ChangeState(11)
											TP(v.HumanoidRootPart.CFrame * CFrame.new(0,20,0))
										until not _G.Main["Start"] or not v.Parent or v.Humanoid.Health <= 0
										StartMagnet = false
										FastAttackSpeed = false
									end
								end
							else
								TP(CFrame.new(-2151.82153, 149.315704, -12404.9053))
							end
						end
					elseif QuestEle and not RaidSumfruit and not AutoRaids and Three_World and not QuestGod then
						st:Set("Status : Quest ElectricClaw")
						repeat task.wait(1)
							if (CFrame.new(-12471.169921875, 374.94024658203, -7551.677734375).Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10 then
								local args = {
									[1] = "requestEntrance",
									[2] = Vector3.new(-11993.580078125, 334.7812805175781, -8844.1826171875)
								}

								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
							end
							wait(1)
							TPP(CFrame.new(-12549.6328125, 337.16827392578125, -7549.6875))
						until (CFrame.new(-12549.6328125, 337.16827392578125, -7549.6875).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 or QuestEle == false
						Mix_Farm = nil
					elseif QuestGod and not RaidSumfruit and not AutoRaids then
						
						if GetMaterial("Fish Tail") >= 20 then
							if GetMaterial("Magma Ore") >= 20 then
								if GetMaterial("Dragon Scale") >= 10 then
									if GetMaterial("Mystic Droplet") >= 10 then
										Com("F_","BuyGodhuman")
										BuyGodhuman = tonumber(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman",true))
										if BuyGodhuman then
											if BuyGodhuman == 1 then
												QuestGod = false
											end
										end
									elseif New_World == false then
										Com("F_","TravelDressrosa")
									elseif New_World then
										CheckMaterial("Mystic Droplet")
										st:Set("Status : Do God Human : Mystic Droplet")
										if CustomFindFirstChild(MaterialMob) then
											for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
												if QuestGod and table.find(MaterialMob,v.Name) and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
													repeat task.wait()
														FarmTP = TP(v.HumanoidRootPart.CFrame * CFrame.new(0,30,1))
														if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150 then
															if FarmTP then FarmTP:Stop() end
															FastAttackSpeed = true
															EquipWeaponMelee()
															spawn(function()
																for i,v2 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
																	if v2.Name == v.Name then
																		spawn(function()
																			if InMyNetWork(v2.HumanoidRootPart) then
																				v2.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
																				v2.Humanoid.JumpPower = 0
																				v2.Humanoid.WalkSpeed = 0
																				v2.HumanoidRootPart.CanCollide = false
																				v2.Humanoid:ChangeState(11)
																				v2.HumanoidRootPart.Size = Vector3.new(80,80,80)
																			end
																		end)
																	end
																end
															end)
															if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 150 then
																game:service('VirtualInputManager'):SendKeyEvent(true, "V", false, game)
																game:service('VirtualInputManager'):SendKeyEvent(false, "V", false, game)
															end
															TP(v.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
														end
													until not CustomFindFirstChild(MaterialMob) or not QuestGod or v.Humanoid.Health <= 0 or not v.Parent
													FastAttackSpeed = false
												end
											end
										else
											FastAttackSpeed = false
											Modstween = TP(CFrameMon.Position,CFrameMon)
											if Old_World and (table.find(MaterialMob,"Fishman Commando [Lv. 400]")) and (CFrameMon.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000 then
												if Modstween then Modstween:Stop() end wait(.5)
												game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
											elseif Old_World and not (table.find(MaterialMob,"Fishman Commando [Lv. 400]")) and (CFrameMon.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000 then
												if Modstween then Modstween:Stop() end wait(.5)
												game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(3864.8515625, 6.6796875, -1926.7841796875))
											elseif Old_World and (table.find(MaterialMob,"God's Guard [Lv. 450]")) and (CFrameMon.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 3000 then
												if Modstween then Modstween:Stop() end wait(.5)
												game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-4607.8227539063, 872.54248046875, -1667.5568847656))
											elseif (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150 then
												if Modstween then Modstween:Stop() end
												game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
											end 
										end
									end
								elseif Three_World == false then
									Com("F_","TravelZou")
								elseif Three_World then
									CheckMaterial("Dragon Scale")
									st:Set("Status : Do God Human : Dragon Scale")
									if CustomFindFirstChild(MaterialMob) then
										for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
											if QuestGod and table.find(MaterialMob,v.Name) and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
												repeat task.wait()
													FarmTP = TP(v.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
													if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150 then
														if FarmTP then FarmTP:Stop() end
														FastAttackSpeed = true
														EquipWeaponMelee()
														spawn(function()
															for i,v2 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
																if v2.Name == v.Name then
																	spawn(function()
																		if InMyNetWork(v2.HumanoidRootPart) then
																			v2.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
																			v2.Humanoid.JumpPower = 0
																			v2.Humanoid.WalkSpeed = 0
																			v2.HumanoidRootPart.CanCollide = false
																			v2.Humanoid:ChangeState(11)
																			v2.HumanoidRootPart.Size = Vector3.new(80,80,80)
																		end
																	end)
																end
															end
														end)
														if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 150 then
															game:service('VirtualInputManager'):SendKeyEvent(true, "V", false, game)
															game:service('VirtualInputManager'):SendKeyEvent(false, "V", false, game)
														end
														TP(v.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
													end
												until not CustomFindFirstChild(MaterialMob) or not QuestGod or v.Humanoid.Health <= 0 or not v.Parent
												FastAttackSpeed = false
											end
										end
									else
										FastAttackSpeed = false
										Modstween = TP(CFrameMon.Position,CFrameMon)
										if Old_World and (table.find(MaterialMob,"Fishman Commando [Lv. 400]")) and (CFrameMon.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000 then
											if Modstween then Modstween:Stop() end wait(.5)
											game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
										elseif Old_World and not (table.find(MaterialMob,"Fishman Commando [Lv. 400]")) and (CFrameMon.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000 then
											if Modstween then Modstween:Stop() end wait(.5)
											game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(3864.8515625, 6.6796875, -1926.7841796875))
										elseif Old_World and (table.find(MaterialMob,"God's Guard [Lv. 450]")) and (CFrameMon.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 3000 then
											if Modstween then Modstween:Stop() end wait(.5)
											game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-4607.8227539063, 872.54248046875, -1667.5568847656))
										elseif (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150 then
											if Modstween then Modstween:Stop() end
											game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
										end 
									end
								end
							elseif not Old_World then
								Com("F_","TravelMain")
							elseif Old_World then
								
								CheckMaterial("Magma Ore")
								st:Set("Status : Do God Human : Magma Ore")
								if CustomFindFirstChild(MaterialMob) then
									for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
										if QuestGod and table.find(MaterialMob,v.Name) and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
											repeat task.wait()
												FarmTP = TP(v.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
												if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150 then
													if FarmTP then FarmTP:Stop() end
													FastAttackSpeed = true
													EquipWeaponMelee()
													spawn(function()
														for i,v2 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
															if v2.Name == v.Name then
																spawn(function()
																	if InMyNetWork(v2.HumanoidRootPart) then
																		v2.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
																		v2.Humanoid.JumpPower = 0
																		v2.Humanoid.WalkSpeed = 0
																		v2.HumanoidRootPart.CanCollide = false
																		v2.Humanoid:ChangeState(11)
																		v2.HumanoidRootPart.Size = Vector3.new(80,80,80)
																	end
																end)
															end
														end
													end)
													if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 150 then
														game:service('VirtualInputManager'):SendKeyEvent(true, "V", false, game)
														game:service('VirtualInputManager'):SendKeyEvent(false, "V", false, game)
													end
													TP(v.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
												end
											until not CustomFindFirstChild(MaterialMob) or not QuestGod or v.Humanoid.Health <= 0 or not v.Parent
											FastAttackSpeed = false
										end
									end
								else
									FastAttackSpeed = false
									Modstween = TP(CFrameMon.Position,CFrameMon)
									if Old_World and (table.find(MaterialMob,"Fishman Commando [Lv. 400]")) and (CFrameMon.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000 then
										if Modstween then Modstween:Stop() end wait(.5)
										game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
									elseif Old_World and not (table.find(MaterialMob,"Fishman Commando [Lv. 400]")) and (CFrameMon.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000 then
										if Modstween then Modstween:Stop() end wait(.5)
										game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(3864.8515625, 6.6796875, -1926.7841796875))
									elseif Old_World and (table.find(MaterialMob,"God's Guard [Lv. 450]")) and (CFrameMon.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 3000 then
										if Modstween then Modstween:Stop() end wait(.5)
										game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-4607.8227539063, 872.54248046875, -1667.5568847656))
									elseif (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150 then
										if Modstween then Modstween:Stop() end
										game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
									end 
								end
							end
						elseif not Old_World then
							Com("F_","TravelMain")
						elseif Old_World then
							CheckMaterial("Fish Tail")
							st:Set("Status : Do God Human : Fish Tail")
							if CustomFindFirstChild(MaterialMob) then
								for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
									if QuestGod and table.find(MaterialMob,v.Name) and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
										repeat task.wait()
											FarmTP = TP(v.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
											if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150 then
												if FarmTP then FarmTP:Stop() end
												FastAttackSpeed = true
												EquipWeaponMelee()
												spawn(function()
													for i,v2 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
														if v2.Name == v.Name then
															spawn(function()
																if InMyNetWork(v2.HumanoidRootPart) then
																	v2.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
																	v2.Humanoid.JumpPower = 0
																	v2.Humanoid.WalkSpeed = 0
																	v2.HumanoidRootPart.CanCollide = false
																	v2.Humanoid:ChangeState(11)
																	v2.HumanoidRootPart.Size = Vector3.new(80,80,80)
																end
															end)
														end
													end
												end)
												if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 150 then
													game:service('VirtualInputManager'):SendKeyEvent(true, "V", false, game)
													game:service('VirtualInputManager'):SendKeyEvent(false, "V", false, game)
												end
												TP(v.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
											end
										until not CustomFindFirstChild(MaterialMob) or not QuestGod or v.Humanoid.Health <= 0 or not v.Parent
										FastAttackSpeed = false
									end
								end
							else
								FastAttackSpeed = false
								Modstween = TP(CFrameMon.Position,CFrameMon)
								if Old_World and (table.find(MaterialMob,"Fishman Commando [Lv. 400]")) and (CFrameMon.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000 then
									if Modstween then Modstween:Stop() end wait(.5)
									game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
								elseif Old_World and not (table.find(MaterialMob,"Fishman Commando [Lv. 400]")) and (CFrameMon.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000 then
									if Modstween then Modstween:Stop() end wait(.5)
									game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(3864.8515625, 6.6796875, -1926.7841796875))
								elseif Old_World and (table.find(MaterialMob,"God's Guard [Lv. 450]")) and (CFrameMon.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 3000 then
									if Modstween then Modstween:Stop() end wait(.5)
									game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-4607.8227539063, 872.54248046875, -1667.5568847656))
								elseif (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 500 then
									if Modstween then Modstween:Stop() end
									if Check == 1 then
										game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon * CFrame.new(0,10,300)
									elseif Check == 2 then
										game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon * CFrame.new(0,10,-300)
									elseif Check == 3 then
										game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon * CFrame.new(300,10,0)
									elseif Check == 4 then
										game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon * CFrame.new(-300,10,0)
									end
								end 
							end
						end
					else--if _G.Main["Start"] and not RaidSumfruit and not AutoRaids then
						st:Set("Status : Farm Level")
						--CheckLevel()
						if game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false then
							if SelectMonster ~= nil then
								CheckLevel()
								Questtween = TP(CFrameQ)
								--[[if Old_World and (Ms == "Fishman Commando [Lv. 400]" or Ms == "Fishman Warrior [Lv. 375]") and (CFrameQ.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000 then
									if Questtween then Questtween:Stop() end wait(.5)
									game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
								elseif Old_World and not (Ms == "Fishman Commando [Lv. 400]" or Ms == "Fishman Warrior [Lv. 375]") and (CFrameQ.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000 then
									if Questtween then Questtween:Stop() end wait(.5)
									game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(3864.8515625, 6.6796875, -1926.7841796875))
								elseif Old_World and (Ms == "God's Guard [Lv. 450]") and (CFrameQ.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000 then
									if Questtween then Questtween:Stop() end wait(.5)
									game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-4607.82275, 872.54248, -1667.55688))
								elseif Old_World and not (Ms == "God's Guard [Lv. 450]") and (CFrameQ.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000 then
									if Questtween then Questtween:Stop() end wait(.5)
									game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-4607.82275, 872.54248, -1667.55688))
								elseif Old_World and (Ms == "Shanda [Lv. 475]") and (CFrameQ.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 1500 then
									if Questtween then Questtween:Stop() end wait(.5)
									game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
								elseif Old_World and not (Ms == "Shanda [Lv. 475]") and (CFrameQ.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 1500 then
									if Questtween then Questtween:Stop() end wait(.5)
									game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
								elseif Old_World and not (Ms == "Royal Squad [Lv. 525]") and (CFrameQ.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 1500 then
									if Questtween then Questtween:Stop() end wait(.5)
									game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
								elseif Old_World and not (Ms == "Royal Squad [Lv. 525]") and (CFrameQ.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 1500 then
									if Questtween then Questtween:Stop() end wait(.5)
									game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
								elseif Old_World and not (Ms == "Royal Soldier [Lv. 550]") and (CFrameQ.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 1500 then
									if Questtween then Questtween:Stop() end wait(.5)
									game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
								elseif Old_World and not (Ms == "Royal Soldier [Lv. 550]") and (CFrameQ.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 1500 then
									if Questtween then Questtween:Stop() end wait(.5)
									game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
								elseif New_World and string.find(Ms, "Ship") and (CFrameQ.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 30000 then
									if Questtween then Questtween:Stop() end
									game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
								elseif New_World and not string.find(Ms, "Ship") and (CFrameQ.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 30000 then
									if Questtween then Questtween:Stop() end
									game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422))]]
								if (CFrameQ.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 10 then
									if Questtween then Questtween:Stop() end
									game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameQ
									if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0 then
										Com("F_","StartQuest", NameQuest, QuestLv)
										Com("F_","SetSpawnPoint")
									end
								end
								SelectMonster = nil
								_G.Farm_Mon = nil
							else
								CheckLevel()
								Questtween = TP(CFrameQ)
								if (CFrameQ.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 10 then
									if Questtween then Questtween:Stop() end
									game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameQ
									if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0 then
										Com("F_","StartQuest", NameQuest, QuestLv)
										Com("F_","SetSpawnPoint")
									end
								end
							end
						elseif game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == true then
							if game:GetService("Workspace").Enemies:FindFirstChild(Ms) then
								for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
									if _G.Main["Start"] and v.Name == Ms and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
										if string.find(GetQuestTitle.Text, NameMon) then
											repeat task.wait()
												FastAttackSpeed = true
												PosMon = v.HumanoidRootPart.CFrame
												StartMagnet = true
												v.HumanoidRootPart.Size = Vector3.new(60,60,60)
												v.HumanoidRootPart.Transparency = 1
												v.Humanoid.JumpPower = 0
												v.Humanoid.WalkSpeed = 0
												v.HumanoidRootPart.CanCollide = false
												v.Humanoid:ChangeState(11)
												v.Humanoid:ChangeState(14)
												if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 150 then
													game:service('VirtualInputManager'):SendKeyEvent(true, "V", false, game)
													game:service('VirtualInputManager'):SendKeyEvent(false, "V", false, game)
												end
												EquipWeaponMelee()
												TP(v.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
											until not game:GetService("Workspace").Enemies:FindFirstChild(Ms) or not _G.Main["Start"] or not string.find(GetQuestTitle.Text, NameMon) or v.Humanoid.Health <= 0 or not v.Parent or GetQuest.Visible == false
											FastAttackSpeed = false
											StartMagnet = false
										else
											game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest");
										end
									end
								end
							else
								if not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) then
									game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
								end
								--Questtween = TP(CFrameMon)
								FastAttackSpeed = false
								StartMagnet = false
								if game:GetService("Workspace")["_WorldOrigin"].EnemySpawns:FindFirstChild(Ms) then
									for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].EnemySpawns:GetChildren())do
										if v.Name == Ms then
											--sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
											--local Distance = (v.Position - game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position).Magnitude
											Speed = 375
											repeat task.wait(.1)
												--[[local tween_s = game:service"TweenService"  
												local info = TweenInfo.new((v.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).Magnitude/Speed, Enum.EasingStyle.Linear)
												tween = tween_s:Create(game.Players.LocalPlayer.Character["HumanoidRootPart"], info, {CFrame = v.CFrame * CFrame.new(0,20,0)})
												tween:Play()]]
												TP(v.CFrame * CFrame.new(0,20,0))
											until (v.CFrame * CFrame.new(0,20,0).Position - game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position).Magnitude < 5 or game:GetService("Workspace").Enemies:FindFirstChild(Ms)
										end
									end
								elseif Old_World and (Ms == "Fishman Commando [Lv. 400]" or Ms == "Fishman Warrior [Lv. 375]") and (CFrameQ.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000 then
									if Questtween then Questtween:Stop() end wait(.5)
									game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
								elseif Old_World and not (Ms == "Fishman Commando [Lv. 400]" or Ms == "Fishman Warrior [Lv. 375]") and (CFrameQ.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000 then
									if Questtween then Questtween:Stop() end wait(.5)
									game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(3864.8515625, 6.6796875, -1926.7841796875))
								elseif Old_World and (Ms == "God's Guard [Lv. 450]") and (CFrameQ.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000 then
									if Questtween then Questtween:Stop() end wait(.5)
									game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-4607.82275, 872.54248, -1667.55688))
								elseif Old_World and not (Ms == "God's Guard [Lv. 450]") and (CFrameQ.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000 then
									if Questtween then Questtween:Stop() end wait(.5)
									game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-4607.82275, 872.54248, -1667.55688))
								elseif Old_World and (Ms == "Shanda [Lv. 475]") and (CFrameQ.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 1500 then
									if Questtween then Questtween:Stop() end wait(.5)
									game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
								elseif Old_World and not (Ms == "Shanda [Lv. 475]") and (CFrameQ.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 1500 then
									if Questtween then Questtween:Stop() end wait(.5)
									game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
								elseif Old_World and not (Ms == "Royal Squad [Lv. 525]") and (CFrameQ.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 1500 then
									if Questtween then Questtween:Stop() end wait(.5)
									game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
								elseif Old_World and not (Ms == "Royal Squad [Lv. 525]") and (CFrameQ.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 1500 then
									if Questtween then Questtween:Stop() end wait(.5)
									game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
								elseif Old_World and not (Ms == "Royal Soldier [Lv. 550]") and (CFrameQ.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 1500 then
									if Questtween then Questtween:Stop() end wait(.5)
									game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
								elseif Old_World and not (Ms == "Royal Soldier [Lv. 550]") and (CFrameQ.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 1500 then
									if Questtween then Questtween:Stop() end wait(.5)
									game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
								elseif New_World and string.find(Ms, "Ship") and (CFrameQ.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 30000 then
									if Questtween then Questtween:Stop() end
									game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
								elseif New_World and not string.find(Ms, "Ship") and (CFrameQ.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 30000 then
									if Questtween then Questtween:Stop() end
									game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422))
								elseif (CFrameMon.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 300 then
									mss = TP(CFrameMon)
								elseif Ms == "Raider [Lv. 700]" or Ms == "Factory Staff [Lv. 800]" or Ms == "Magma Ninja [Lv. 1175]" or Ms == "Sea Soldier [Lv. 1425]" then
									if mss then mss:Stop() end
									if Check == 1 then
										game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon * CFrame.new(0,10,300)
									elseif Check == 2 then
										game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon * CFrame.new(0,10,-300)
									elseif Check == 3 then
										game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon * CFrame.new(300,10,0)
									elseif Check == 4 then
										game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon * CFrame.new(-300,10,0)
									end
								else
									if mss then mss:Stop() end
									if Check == 1 then
										game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon * CFrame.new(0,10,70)
									elseif Check == 2 then
										game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon * CFrame.new(0,10,-70)
									elseif Check == 3 then
										game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon * CFrame.new(70,10,0)
									elseif Check == 4 then
										game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon * CFrame.new(-70,10,0)
									end
								end
							end
						end
					end
				end
			end
        end)
    end
end)



spawn(function()
	while wait() do
		pcall(function()
			if SpamSkillSea then
				local NameWeaponBounty = {}
				for index,value in pairs({"Melee", "Sword","DevilFruit","Gun"}) do 
					if value == "DevilFruit" then value = "Blox Fruit" end
					for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
						if v:IsA("Tool") then
							if v.ToolTip == value then
								table.insert(NameWeaponBounty,v.Name)
							end
						end
					end
					for i ,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
						if v:IsA("Tool") then
							if v.ToolTip == value then
								table.insert(NameWeaponBounty,v.Name)
							end
						end
					end
				end
				for i,v in pairs(NameWeaponBounty) do 
					repeat wait()
						EquipWeapon(v)
					until game.Players.LocalPlayer.Character:FindFirstChild(v)
					wait()
					local Module = require(game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool"):FindFirstChild("Data") or game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool"):FindFirstChildOfClass("ModuleScript"))
					for i2,v2 in pairs(Module["Cooldown"]) do 
						if Module["Lvl"][i2] <= game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool"):WaitForChild("Level").Value then
							if i2 ~= nil and i2 and #i2 == 1 then
								game:service('VirtualInputManager'):SendKeyEvent(true, tostring(i2), false, game)
								wait(.1)
								game:service('VirtualInputManager'):SendKeyEvent(false, tostring(i2), false, game)

								wait()
							end
						end
					end
					wait(0.1)
				end
			end
		end)
	end
end)

spawn(function()
	while wait() do
		pcall(function()
			if Auto_CDK_Quest then
				_G.Main["Start"] = false
				if GetWeaponInventory("Cursed Dual Katana") == true then
					_G.Main["Start"] = true
					Auto_CDK_Quest = false
				end
				if GetMaterial("Alucard Fragment") == 0 then
					st:Set("Status : Quest Yama 1")
					Auto_Quest_Yama_1 = true
					Auto_Quest_Yama_2 = false
					Auto_Quest_Yama_3 = false
					Auto_Quest_Tushita_1 = false
					Auto_Quest_Tushita_2 = false
					Auto_Quest_Tushita_3 = false
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","Progress","Evil")
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","StartTrial","Evil")
				elseif GetMaterial("Alucard Fragment") == 1 then
					st:Set("Status : Quest Yama 2")
					Auto_Quest_Yama_1 = false
					Auto_Quest_Yama_2 = true
					Auto_Quest_Yama_3 = false
					Auto_Quest_Tushita_1 = false
					Auto_Quest_Tushita_2 = false
					Auto_Quest_Tushita_3 = false
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","Progress","Evil")
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","StartTrial","Evil")
				elseif GetMaterial("Alucard Fragment") == 2 then
					st:Set("Status : Quest Yama 3")
					Auto_Quest_Yama_1 = false
					Auto_Quest_Yama_2 = false
					Auto_Quest_Yama_3 = true
					Auto_Quest_Tushita_1 = false
					Auto_Quest_Tushita_2 = false
					Auto_Quest_Tushita_3 = false
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","Progress","Evil")
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","StartTrial","Evil")
				elseif GetMaterial("Alucard Fragment") == 3 then
					if not (game.Players.LocalPlayer.Character:FindFirstChild("Tushita") or game.Players.LocalPlayer.Backpack:FindFirstChild("Tushita")) then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LoadItem","Tushita")
					end
					st:Set("Status : Quest Tushita 1")
					Auto_Quest_Yama_1 = false
					Auto_Quest_Yama_2 = false
					Auto_Quest_Yama_3 = false
					Auto_Quest_Tushita_1 = true
					Auto_Quest_Tushita_2 = false
					Auto_Quest_Tushita_3 = false
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","Progress","Good")
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","StartTrial","Good")
				elseif GetMaterial("Alucard Fragment") == 4 then
					if not (game.Players.LocalPlayer.Character:FindFirstChild("Tushita") or game.Players.LocalPlayer.Backpack:FindFirstChild("Tushita")) then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LoadItem","Tushita")
					end
					st:Set("Status : Quest Tushita 2")
					Auto_Quest_Yama_1 = false
					Auto_Quest_Yama_2 = false
					Auto_Quest_Yama_3 = false
					Auto_Quest_Tushita_1 = false
					Auto_Quest_Tushita_2 = true
					Auto_Quest_Tushita_3 = false
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","Progress","Good")
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","StartTrial","Good")
				elseif GetMaterial("Alucard Fragment") == 5 then
					if not (game.Players.LocalPlayer.Character:FindFirstChild("Tushita") or game.Players.LocalPlayer.Backpack:FindFirstChild("Tushita")) then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LoadItem","Tushita")
					end
					st:Set("Status : Quest Tushita 3")
					Auto_Quest_Yama_1 = false
					Auto_Quest_Yama_2 = false
					Auto_Quest_Yama_3 = false
					Auto_Quest_Tushita_1 = false
					Auto_Quest_Tushita_2 = false
					Auto_Quest_Tushita_3 = true
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","Progress","Good")
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","StartTrial","Good")
				elseif GetMaterial("Alucard Fragment") == 6 and GetWeaponInventory("Cursed Dual Katana") == false then
					st:Set("Status : Final Quest")
					if not (game.Players.LocalPlayer.Character:FindFirstChild("Tushita") or game.Players.LocalPlayer.Backpack:FindFirstChild("Tushita")) then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LoadItem","Tushita")
					end
					if game:GetService("Workspace").Enemies:FindFirstChild("Cursed Skeleton Boss [Lv. 2025] [Boss]") then
						Auto_Quest_Yama_1 = false
						Auto_Quest_Yama_2 = false
						Auto_Quest_Yama_3 = false
						Auto_Quest_Tushita_1 = false
						Auto_Quest_Tushita_2 = false
						Auto_Quest_Tushita_3 = false
						if game:GetService("Workspace").Enemies:FindFirstChild("Cursed Skeleton Boss [Lv. 2025] [Boss]") then
							for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
								if v.Name == "Cursed Skeleton Boss [Lv. 2025] [Boss]" then
									if v.Humanoid.Health > 0 then
										repeat wait()
											v.HumanoidRootPart.CanCollide = false
											v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
											EquipWeaponSword()
											TP(v.HumanoidRootPart.CFrame * CFrame.new(0,50,0))
											FastAttackSpeed = true
										until v.Humanoid.Health <= 0 or Auto_CDK_Quest == false or GetWeaponInventory("Cursed Dual Katana") == true
									end
									FastAttackSpeed = false
									if GetWeaponInventory("Cursed Dual Katana") == true then
										_G.Main["Start"] = true
									end
								end
							end
						end
					else
						if (CFrame.new(-12361.7060546875, 603.3547973632812, -6550.5341796875).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 100 then
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","Progress","Good")
							wait(1)
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","Progress","Evil")
							wait(1)
							TP(CFrame.new(-12361.7060546875, 603.3547973632812, -6550.5341796875))
							wait(1.5)
							game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
							wait(1.5)
							TP(CFrame.new(-12253.5419921875, 598.8999633789062, -6546.8388671875))
						else
							TP(CFrame.new(-12361.7060546875, 603.3547973632812, -6550.5341796875))
						end   
					end
				end
			end
		end)
	end
end)


_G.Tu1 = false
spawn(function()
	while task.wait() do
		pcall(function()
			if Auto_Quest_Yama_1 then
				if game:GetService("Workspace").Enemies:FindFirstChild("Mythological Pirate [Lv. 1850]") then
					for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
						if v.Name == "Mythological Pirate [Lv. 1850]" then
							repeat task.wait()
								TP(v.HumanoidRootPart.CFrame * CFrame.new(0,0,-2))
							until not Auto_CDK_Quest 
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","StartTrial","Evil")
						end
					end
				else
					TP(CFrame.new(-13451.46484375, 543.712890625, -6961.0029296875))
				end
			elseif Auto_Quest_Yama_2 then
				
				for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
					if v:FindFirstChild("HazeESP") then
						repeat task.wait()
							
								StartMagnete = true
								FastAttackSpeed = true
								EquipWeaponSword()			
								PosMonsEsp = v.HumanoidRootPart.CFrame
								v.HumanoidRootPart.Size = Vector3.new(60,60,60)
								v.Humanoid.JumpPower = 0
								v.Humanoid.WalkSpeed = 0
								v.HumanoidRootPart.CanCollide = false
								v.Humanoid:ChangeState(11)
								TP(v.HumanoidRootPart.CFrame * CFrame.new(0,20,0))		
							
						until Auto_Quest_Yama_2 == false or not v.Parent or v.Humanoid.Health <= 0 or not v:FindFirstChild("HazeESP")
						FastAttackSpeed = false
					else
						repeat wait()
							for x,y in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
								if not y:FindFirstChild("HazeESP") then
									Che = true
								elseif y:FindFirstChild("HazeESP") then
									Che = false
								end
							end
						until Auto_Quest_Yama_2 == false or v:FindFirstChild("HazeESP") or  y:FindFirstChild("HazeESP")
					end
				end
			elseif Auto_Quest_Yama_3 then
				pcall(function()	
					if game.Players.LocalPlayer.Backpack:FindFirstChild("Hallow Essence") then 
						havse = true                  
						TP(game:GetService("Workspace").Map["Haunted Castle"].Summoner.Detection.CFrame)
					elseif game:GetService("Workspace").Map:FindFirstChild("HellDimension") then
						havse = true
						repeat wait()
							if game:GetService("Workspace").Enemies:FindFirstChild("Cursed Skeleton [Lv. 2200]") or game:GetService("Workspace").Enemies:FindFirstChild("Cursed Skeleton [Lv. 2200] [Boss]") or game:GetService("Workspace").Enemies:FindFirstChild("Hell's Messenger [Lv. 2200] [Boss]") then
								for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
									if v.Name == "Cursed Skeleton [Lv. 2200]" or v.Name == "Cursed Skeleton [Lv. 2200] [Boss]" or v.Name == "Hell's Messenger [Lv. 2200] [Boss]" then
										if v.Humanoid.Health > 0 then
											repeat task.wait()
												---StartMagnet = true
												FastAttackSpeed = true
												EquipWeaponSword()
												PosMonsEsp = v.HumanoidRootPart.CFrame
												v.HumanoidRootPart.Size = Vector3.new(60,60,60)
												v.Humanoid.JumpPower = 0
												v.Humanoid.WalkSpeed = 0
												v.HumanoidRootPart.CanCollide = false
												v.Humanoid:ChangeState(11)
												TP(v.HumanoidRootPart.CFrame * CFrame.new(0,50,0))
											until v.Humanoid.Health <= 0 or not v.Parent or Auto_Quest_Yama_3 == false
											FastAttackSpeed = false
											havse = false
										end
									end
								end
							else
								havse = true                  
								wait(5)
								TP(game:GetService("Workspace").Map.HellDimension.Torch1.CFrame)
								wait(1.5)
								game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
								wait(1.5)        
								TP(game:GetService("Workspace").Map.HellDimension.Torch2.CFrame)
								wait(1.5)
								game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
								wait(1.5)     
								TP(game:GetService("Workspace").Map.HellDimension.Torch3.CFrame)
								wait(1.5)
								game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
								wait(1.5)     
								TP(game:GetService("Workspace").Map.HellDimension.Exit.CFrame)
							end
						until Auto_Quest_Yama_3 == false or GetMaterial("Alucard Fragment") == 3
					else
						if game:GetService("Workspace").Enemies:FindFirstChild("Soul Reaper [Lv. 2100] [Raid Boss]") or game.ReplicatedStorage:FindFirstChild("Soul Reaper [Lv. 2100] [Raid Boss]") then
							havse = true  
							if game:GetService("Workspace").Enemies:FindFirstChild("Soul Reaper [Lv. 2100] [Raid Boss]") then  
								for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
									if v.Name == "Soul Reaper [Lv. 2100] [Raid Boss]" then
										if v.Humanoid.Health > 0 then
											repeat task.wait()
												TP(v.HumanoidRootPart.CFrame * CFrame.new(0,0,-2))
											until Auto_Quest_Yama_3 == false or game:GetService("Workspace").Map:FindFirstChild("HellDimension")
										end
									end
								end
							else
								havse = true    
								TP(CFrame.new(-9570.033203125, 315.9346923828125, 6726.89306640625))
							end
						else
							if game:GetService("Workspace").Enemies:FindFirstChild("Reborn Skeleton [Lv. 1975]") or game:GetService("Workspace").Enemies:FindFirstChild("Living Zombie [Lv. 2000]") or game:GetService("Workspace").Enemies:FindFirstChild("Demonic Soul [Lv. 2025]") or game:GetService("Workspace").Enemies:FindFirstChild("Posessed Mummy [Lv. 2050]") then
								for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
									if v.Name == "Reborn Skeleton [Lv. 1975]" or v.Name == "Living Zombie [Lv. 2000]" or v.Name == "Demonic Soul [Lv. 2025]" or v.Name == "Posessed Mummy [Lv. 2050]" then
										repeat task.wait()
											EquipWeaponSword()
											StartMagnet = true
											FastAttackSpeed = true
											PosMon = v.HumanoidRootPart.CFrame
											v.HumanoidRootPart.Size = Vector3.new(60,60,60)
											v.Humanoid.JumpPower = 0
											v.Humanoid.WalkSpeed = 0
											v.HumanoidRootPart.CanCollide = false
											v.Humanoid:ChangeState(11)
											TP(v.HumanoidRootPart.CFrame * CFrame.new(0,20,0))
										until v.Humanoid.Health <= 0 or not v.Parent or v.Humanoid.Health <= 0
										StartMagnet = false
										FastAttackSpeed = false
									end
								end
							elseif not game:GetService("Workspace").Enemies:FindFirstChild("Reborn Skeleton [Lv. 1975]") or game:GetService("Workspace").Enemies:FindFirstChild("Living Zombie [Lv. 2000]") or game:GetService("Workspace").Enemies:FindFirstChild("Demonic Soul [Lv. 2025]") or game:GetService("Workspace").Enemies:FindFirstChild("Posessed Mummy [Lv. 2050]") then
								TP(CFrame.new(-9504.8564453125, 172.14292907714844, 6057.259765625))
							end
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones","Buy",1,1)
						end
					end
				end)
			elseif Auto_Quest_Tushita_1 then
				repeat wait(3)
					if (CFrame.new(-9546.990234375, 21.139892578125, 4686.1142578125).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 50 and _G.Tu1 == false then
						TP(CFrame.new(-9546.990234375, 21.139892578125, 4686.1142578125))
						_G.Tu1 = true
						if (CFrame.new(-9546.990234375, 21.139892578125, 4686.1142578125).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 10 then
							repeat task.wait()
								local args = {
									[1] = "CDKQuest",
									[2] = "BoatQuest",
									[3] = workspace.NPCs:FindFirstChild("Luxury Boat Dealer"),
									[4] = "Check"
								}
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))							
								local args = {
									[1] = "CDKQuest",
									[2] = "BoatQuest",
									[3] = workspace.NPCs:FindFirstChild("Luxury Boat Dealer")
								}
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
							until (CFrame.new(-9546.990234375, 21.139892578125, 4686.1142578125).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10
						end
					elseif (CFrame.new(-9546.990234375, 21.139892578125, 4686.1142578125).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 50 then
						TP(CFrame.new(-6120.0576171875, 16.455780029296875, -2250.697265625))
						if (CFrame.new(-6120.0576171875, 16.455780029296875, -2250.697265625).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 10 then
							repeat task.wait()
								local args = {
									[1] = "CDKQuest",
									[2] = "BoatQuest",
									[3] = workspace.NPCs:FindFirstChild("Luxury Boat Dealer"),
									[4] = "Check"
								}
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))							
								local args = {
									[1] = "CDKQuest",
									[2] = "BoatQuest",
									[3] = workspace.NPCs:FindFirstChild("Luxury Boat Dealer")
								}
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
							until (CFrame.new(-6120.0576171875, 16.455780029296875, -2250.697265625).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10
						end
					elseif (CFrame.new(-6120.0576171875, 16.455780029296875, -2250.697265625).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 50 then
						TP(CFrame.new(-9531.55078, 7.69919062, -8376.58008, 0.853771627, -9.73128707e-08, -0.520647705, 9.58176258e-08, 1, -2.97830987e-08, 0.520647705, -2.44592631e-08, 0.853771627))   
						if (CFrame.new(-9531.55078, 7.69919062, -8376.58008, 0.853771627, -9.73128707e-08, -0.520647705, 9.58176258e-08, 1, -2.97830987e-08, 0.520647705, -2.44592631e-08, 0.853771627).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 10 then
							repeat task.wait()
								local args = {
									[1] = "CDKQuest",
									[2] = "BoatQuest",
									[3] = workspace.NPCs:FindFirstChild("Luxury Boat Dealer"),
									[4] = "Check"
								}
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))							
								local args = {
									[1] = "CDKQuest",
									[2] = "BoatQuest",
									[3] = workspace.NPCs:FindFirstChild("Luxury Boat Dealer")
								}
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
							until (CFrame.new(-9531.55078, 7.69919062, -8376.58008, 0.853771627, -9.73128707e-08, -0.520647705, 9.58176258e-08, 1, -2.97830987e-08, 0.520647705, -2.44592631e-08, 0.853771627).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10
						end
					end 
				until Auto_Quest_Tushita_1 == false
			elseif Auto_Quest_Tushita_2 then
				pcall(function()
					if (CFrame.new(-5539.3115234375, 313.800537109375, -2972.372314453125).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 500 then
						for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
							if Auto_Quest_Tushita_2 and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
								if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 2000 then
									repeat task.wait()
										v.HumanoidRootPart.CanCollide = false
										v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
										EquipWeapon("Tushita")
										FastAttackSpeed = true
										TP(v.HumanoidRootPart.CFrame * CFrame.new(0,50,0))
										game:GetService'VirtualUser':CaptureController()
										game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
									until v.Humanoid.Health <= 0 or not v.Parent or Auto_Quest_Tushita_2 == false
									FastAttackSpeed = false
								end
							end
						end
					else
						TP(CFrame.new(-5545.1240234375, 313.800537109375, -2976.616455078125))
					end
				end)
			elseif Auto_Quest_Tushita_3 then
				pcall(function()
					if game:GetService("Workspace").Enemies:FindFirstChild("Cake Queen [Lv. 2175] [Boss]") or game.ReplicatedStorage:FindFirstChild("Cake Queen [Lv. 2175] [Boss]") then
						if game:GetService("Workspace").Enemies:FindFirstChild("Cake Queen [Lv. 2175] [Boss]") then
							for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
								if v.Name == "Cake Queen [Lv. 2175] [Boss]" then
									if v.Humanoid.Health > 0 then
										repeat task.wait()
											EquipWeapon("Tushita")
											FastAttackSpeed = true
											v.HumanoidRootPart.Size = Vector3.new(60,60,60)
											v.Humanoid.JumpPower = 0
											v.Humanoid.WalkSpeed = 0
											v.HumanoidRootPart.CanCollide = false
											v.Humanoid:ChangeState(11)
											TP(v.HumanoidRootPart.CFrame * CFrame.new(0,50,0))
										until Auto_Quest_Tushita_3 == false or game:GetService("Workspace").Map:FindFirstChild("HeavenlyDimension")
										FastAttackSpeed = false
									end
								end
							end
						else
							TP(CFrame.new(-709.3132934570312, 381.6005859375, -11011.396484375))
						end
					elseif game:GetService("Workspace").Map:FindFirstChild("HeavenlyDimension") then
						repeat wait()
							if game:GetService("Workspace").Enemies:FindFirstChild("Cursed Skeleton [Lv. 2200]") or game:GetService("Workspace").Enemies:FindFirstChild("Cursed Skeleton [Lv. 2200] [Boss]") or game:GetService("Workspace").Enemies:FindFirstChild("Heaven's Guardian [Lv. 2200] [Boss]") then
								for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
									if v.Name == "Cursed Skeleton [Lv. 2200]" or v.Name == "Cursed Skeleton [Lv. 2200] [Boss]" or v.Name == "Heaven's Guardian [Lv. 2200] [Boss]" then
										if v.Humanoid.Health > 0 then
											repeat task.wait()
												EquipWeapon("Tushita")
												FastAttackSpeed = true
												v.HumanoidRootPart.Size = Vector3.new(60,60,60)
												v.Humanoid.JumpPower = 0
												v.Humanoid.WalkSpeed = 0
												v.HumanoidRootPart.CanCollide = false
												v.Humanoid:ChangeState(11)
												TP(v.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
											until v.Humanoid.Health <= 0 or not v.Parent or Auto_Quest_Tushita_3 == false
											FastAttackSpeed = false
										end
									end
								end
							else
								wait(5)
								TP(game:GetService("Workspace").Map.HeavenlyDimension.Torch1.CFrame)
								wait(1.5)
								game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
								wait(1.5)        
								TP(game:GetService("Workspace").Map.HeavenlyDimension.Torch2.CFrame)
								wait(1.5)
								game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
								wait(1.5)     
								TP(game:GetService("Workspace").Map.HeavenlyDimension.Torch3.CFrame)
								wait(1.5)
								game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
								wait(1.5)     
								TP(game:GetService("Workspace").Map.HeavenlyDimension.Exit.CFrame)
							end
						until Auto_Quest_Tushita_3 == false or GetMaterial("Alucard Fragment") == 6
					end
				end)
			end
		end)
	end
end)

task.spawn(function() 
	while wait() do
		if Auto_Quest_Tushita_1 then
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest","BoatQuest",workspace.NPCs:FindFirstChild("Luxury Boat Dealer"))
		end
	end
end)

spawn(function()
	while wait() do
		pcall(function()
			if Auto_Quest_Yama_2 then
				for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
					if v:FindFirstChild("HazeESP") then
						v.HazeESP.Size = UDim2.new(50,50,50,50)
						v.HazeESP.MaxDistance = "inf"
					end
				end
				for i,v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
					if v:FindFirstChild("HazeESP") then
						v.HazeESP.Size = UDim2.new(50,50,50,50)
						v.HazeESP.MaxDistance = "inf"
					end
				end
			end
		end)
	end
end)

spawn(function()
	while wait() do
		pcall(function()
			for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
				if StartMagnete and v:FindFirstChild("HazeESP") and (v.HumanoidRootPart.Position - PosMonsEsp.Position).magnitude <= 300 then
					v.HumanoidRootPart.CFrame = PosMonsEsp
					v.Humanoid.JumpPower = 0
					v.Humanoid.WalkSpeed = 0
					v.HumanoidRootPart.Size = Vector3.new(60,60,60)
					v.HumanoidRootPart.Transparency = 1
					v.HumanoidRootPart.CanCollide = false
					v.Head.CanCollide = false
					if v.Humanoid:FindFirstChild("Animator") then
						v.Humanoid.Animator:Destroy()
					end
					v.Humanoid:ChangeState(11)
					v.Humanoid:ChangeState(14)
				end
			end
		end)
	end
end)

	LPH_JIT_MAX(function()
		task.spawn(function() -- Bring Mob Function
			while wait() do
				if StartSoulGuitarMagnt then 
					pcall(function() 
						for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
							if v.Name == "Living Zombie [Lv. 2000]" then 
								v.HumanoidRootPart.CFrame = CFrame.new(-10138.3974609375, 138.6524658203125, 5902.89208984375)
								v.Head.CanCollide = false
								v.Humanoid.Sit = false
								v.HumanoidRootPart.CanCollide = false
								v.Humanoid.JumpPower = 0
								v.Humanoid.WalkSpeed = 0
								if v.Humanoid:FindFirstChild('Animator') then
									v.Humanoid:FindFirstChild('Animator'):Destroy() 
								end
								sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
							end
						end    
					end)
				end
			end
		end)
	end)()

spawn(function()
	while wait() do
		pcall(function()
			if game.Players.LocalPlayer.Data.DevilFruit.Value == "" then
				if _G.Main["Eat Fruit Can Awake"] then
					for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
						for x,y in pairs(FruitCanAwake) do
							for s,r in pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventoryFruits")) do
								if r.Name == y then--and not v.Name == ExpensiveFruit then
									EatFrut = true
									_G.Main["Start"] = false
									wait()
									game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LoadFruit", y)
									wait(.5)
									if string.find(v.Name, "Fruit") then
										if v.Parent == "Backpack" then
											v.Parent = game.Players.LocalPlayer.Character
											wait(1)
											game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(v.Name).EatRemote:InvokeServer()
										else
											game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LoadFruit", y)
										end
									end
									wait(5)
									EatFrut = false
									_G.Main["Start"] = true
								end
							end
						end
					end
				end
			end
		end)
	end
end)

spawn(function()
	while wait() do
		pcall(function()
			if _G.Fruit["Buy Fruit"] then
				if not table.find(_G.Fruit["Select Fruit"], game.Players.LocalPlayer.Data.DevilFruit.Value) then
					for i,v in pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetFruits")) do
						for i1,v1 in next, v do
							if i1 == "Name" then
								if v["OnSale"] and table.find(_G.Fruit["Select Fruit"], v1) and not table.find(_G.Fruit["Select Fruit"], game.Players.LocalPlayer.Data.DevilFruit.Value) then
							        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("PurchaseRawFruit", v1)
								end
							end
						end
					end
				end
			end
		end)
	end
end)



spawn(function()
	while wait() do
		pcall(function()
			local My = game.Players.LocalPlayer.Data.Level.Value
			if game:GetService("Players").LocalPlayer.PlayerGui.Notifications.NotificationTemplate.TranslateMe.Text == "{color1_Red}You can only store 1 of each fruit.{color1_/}" then
				if New_World then
					if My >= 1100 then
						if not game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 5") and (CFrame.new(-11578.7676, 48.7659416, -7557.87988).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 100 then
							RaidSumfruit = true
						elseif not game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 5") and not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Special Microchip") and not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Special Microchip") and hfi == false then
							RaidSumfruit = false
						end
					else
						game.Players.LocalPlayer.Character.Head:Destroy()
					end
				elseif Three_World then
					if not game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 5") and (CFrame.new(-11578.7676, 48.7659416, -7557.87988).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 100 then
						RaidSumfruit = true
					elseif not game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 5") and not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Special Microchip") and not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Special Microchip") and hfi == false then
						RaidSumfruit = false
					end
				end
			end
		end)
	end
end)



spawn(function()
	while wait() do
		pcall(function()
			if _G.Main["Store Fruit"] and not CheckFruit then
				for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
					if string.find(v.Name, "Fruit") then
						l__EatRemote__245 = v:FindFirstChild("EatRemote", true)
						if l__EatRemote__245 then
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
								"StoreFruit",
								l__EatRemote__245.Parent:GetAttribute("OriginalName"),
								game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(v.Name)
							)
						end
					end
				end
			end
		end)
	end
end)

spawn(function()
	while wait() do
		pcall(function()
			if Che then
				for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
					if not v:FindFirstChild("HazeESP") then
						repeat wait(3)
							if _G.ch == 0 then
								TP(CFrame.new(-2136.967041015625, 69.98303985595703, -12278.23046875))
								if (CFrame.new(-2136.967041015625, 69.98303985595703, -12278.23046875).Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude <= 50 then
									_G.ch = 1
								end
							elseif _G.ch == 1 then
								TP(CFrame.new(-1077.6512451171875, 14.61463451385498, -14472.87109375))
								if (CFrame.new(-1077.6512451171875, 14.61463451385498, -14472.87109375).Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude <= 50 then
									_G.ch = 2
								end
							elseif _G.ch == 2 then
								TP(CFrame.new(583.4339599609375, 77.1622314453125, -12461.349609375))
								if (CFrame.new(583.4339599609375, 77.1622314453125, -12461.349609375).Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude <= 50 then
									_G.ch = 3
								end
							elseif _G.ch == 3 then
								TP(CFrame.new(-9.630806922912598, 78.35212707519531, -12543.40234375))
								if (CFrame.new(-9.630806922912598, 78.35212707519531, -12543.40234375).Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude <= 50 then
									_G.ch = 4
								end
							elseif _G.ch == 4 then
								TP(CFrame.new(-616.3192749023438, 126.87114715576172, -11115.509765625))
								if (CFrame.new(-616.3192749023438, 126.87114715576172, -11115.509765625).Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude <= 50 then
									_G.ch = 5
								end
							elseif _G.ch == 5 then
								TP(CFrame.new(-2149.23583984375, 122.47181701660156, -10359.98828125))
								if (CFrame.new(-2149.23583984375, 122.47181701660156, -10359.98828125).Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude <= 50 then
									_G.ch = 6
								end
							elseif _G.ch == 6 then
								TP(CFrame.new(2385.3955078125, 121.6033935546875, -7603.6943359375))
								if (CFrame.new(2385.3955078125, 121.6033935546875, -7603.6943359375).Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude <= 50 then
									_G.ch = 7
								end
							elseif _G.ch == 7 then
								TP(CFrame.new(3693.50341796875, 160.5240478515625, -6969.98828125))
								if (CFrame.new(3693.50341796875, 160.5240478515625, -6969.98828125).Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude <= 50 then
									_G.ch = 8
								end
							elseif _G.ch == 8 then
								TP(CFrame.new(4023.73974609375, 51.481868743896484, -1135.0145263671875))
								if (CFrame.new(4023.73974609375, 51.481868743896484, -1135.0145263671875).Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude <= 50 then
									_G.ch = 9
								end
							elseif _G.ch == 9 then
								TP(CFrame.new(6367.1435546875, 51.496280670166016, -1138.0067138671875))
								if (CFrame.new(6367.1435546875, 51.496280670166016, -1138.0067138671875).Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude <= 50 then
									_G.ch = 10
								end
							elseif _G.ch == 10 then
								TP(CFrame.new(6673.12451171875, 378.3918151855469, 287.5046081542969))
								if (CFrame.new(6673.12451171875, 378.3918151855469, 287.5046081542969).Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude <= 50 then
									_G.ch = 11
								end
							elseif _G.ch == 11 then
								TP(CFrame.new(5230.78125, 602.0435180664062, 268.712158203125))
								if (CFrame.new(5230.78125, 602.0435180664062, 268.712158203125).Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude <= 50 then
									_G.ch = 12
								end
							elseif _G.ch == 12 then
								TP(CFrame.new(5226.9912109375, 7.9970526695251465, 1096.6363525390625))
								if (CFrame.new(5226.9912109375, 7.9970526695251465, 1096.6363525390625).Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude <= 50 then
									_G.ch = 13
								end
							elseif _G.ch == 13 then
								TP(CFrame.new(-351.5566101074219, 73.72991943359375, 5768.98974609375))
								if (CFrame.new(-351.5566101074219, 73.72991943359375, 5768.98974609375).Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude <= 50 then
									_G.ch = 14
								end
							elseif _G.ch == 14 then
								TP(CFrame.new(-9500.115234375, 172.1048126220703, 6133.0224609375))
								if (CFrame.new(-9500.115234375, 172.1048126220703, 6133.0224609375).Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude <= 50 then
									_G.ch = 15
								end
							elseif _G.ch == 15 then
								TP(CFrame.new(-13596.994140625, 469.7859191894531, -6982.37841796875))
								if (CFrame.new(-13596.994140625, 469.7859191894531, -6982.37841796875).Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude <= 50 then
									_G.ch = 16
								end
							elseif _G.ch == 16 then
								TP(CFrame.new(-13265.462890625, 428.1678161621094, -7780.4267578125))
								if (CFrame.new(-13265.462890625, 428.1678161621094, -7780.4267578125).Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude <= 50 then
									_G.ch = 17
								end
							elseif _G.ch == 17 then
								TP(CFrame.new(-13304.8359375, 391.545654296875, -9779.3466796875))
								if (CFrame.new(-13304.8359375, 391.545654296875, -9779.3466796875).Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude <= 50 then
									_G.ch = 18
								end
							elseif _G.ch == 18 then
								TP(CFrame.new(-11877.6484375, 331.73828125, -10652.4560546875))
								if (CFrame.new(-11877.6484375, 331.73828125, -10652.4560546875).Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude <= 50 then
									_G.ch = 19
								end
							elseif _G.ch == 19 then
								TP(CFrame.new(-10956.169921875, 331.76263427734375, -8899.9296875))
								if (CFrame.new(-10956.169921875, 331.76263427734375, -8899.9296875).Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude <= 50 then
									_G.ch = 1
								end
							end
						until not che
					end
				end
			end
		end)
	end
end)







spawn(function()
	while task.wait() do
    	if _G.Main["Use Code"] then
			function UseCode(Text)
				game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(Text)
			end
            UseCode("NOOB_REFUND")
			UseCode("TY_FOR_WATCHING")
			UseCode("GAMER_ROBOT_1M")
			UseCode("ADMINGIVEAWAY")
			UseCode("SUBGAMERROBOT_RESET")
			UseCode("GAMERROBOT_YT")
			UseCode("kittgaming")
			UseCode("Sub2Fer999")
			UseCode("Enyu_is_Pro")
			UseCode("Magicbus")
			UseCode("JCWK")
			UseCode("Starcodeheo")
			UseCode("Bluxxy")
			UseCode("fudd10_v2")
			UseCode("SUB2GAMERROBOT_EXP1")
			UseCode("SUB2GAMERROBOT_RESET1")
			UseCode("Sub2NoobMaster123")
			UseCode("Sub2UncleKizaru")
			UseCode("Sub2Daigrock")
			UseCode("Axiore")
			UseCode("TantaiGaming")
			UseCode("StrawHatMaine")
			UseCode("Sub2OfficialNoobie")
			UseCode("Fudd10")
			UseCode("Bignews")
			UseCode("TheGreatAce")
        end
    end
end)



spawn(function()
    while wait() do
        pcall(function()
			if _G.Main["Check AFK"] and not gotp3 and not Auto_Quest_Yama_1 and not Auto_Quest_Yama_2 and not Auto_Quest_Yama_3 and not Auto_Quest_Tushita_2 and not Auto_Quest_Tushita_3 then
				local player = game.Players.LocalPlayer
				local lastMove = tick()
				local function checkAFK()
					if tick() - lastMove > tonumber(_G.Main["AFK Time AMount"]) then 
						local ts = game:GetService("TeleportService")
						ts:Teleport(game.PlaceId)
						print("Player has been kicked for being AFK.")
						warn("Player has been kicked for being AFK.")
					end
				end
				game.Players.LocalPlayer.CharacterAdded:Connect(function()
					lastMove = tick()
					game.Players.LocalPlayer.Character.Humanoid.Running:Connect(function()
						lastMove = tick()
					end)
				end)
				while wait() do
					checkAFK()
				end
			end
        end)
    end
end)

if _G.HUD["Close UI"] == true then
	if game.CoreGui:FindFirstChild("PepsiUi") then
		wait(1.5)
		game:GetService("VirtualInputManager"):SendKeyEvent(true,"RightControl",false,game)
		wait(1.5)
		game:GetService("VirtualInputManager"):SendKeyEvent(true,"RightControl",false,game)
	end
end


spawn(function()
    while wait() do
        local MyLevel = game.Players.LocalPlayer.Data.Level.Value
        if _G.Main["Random Fruit"] and MyLevel >= 150 then	
            local args = {
                [1] = "Cousin",
                [2] = "Buy"
            }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        end
    end
end)




spawn(function()
	while wait() and New_World do
		pcall(function()
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Geppo")
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Buso")
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Soru")
			if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress").KilledShanks then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk","Buy")
			end
		end)
	end
end)





if _G.HUD["Boos FPS"] then
	function TextureLow()
		if not game:IsLoaded() then repeat wait() until game:IsLoaded() end
		if hookfunction and setreadonly then
			local mt = getrawmetatable(game)
			local old = mt.__newindex
			setreadonly(mt, false)
			local sda
			sda = hookfunction(old, function(t, k, v)
				if k == "Material" then
					if v ~= Enum.Material.Neon and v ~= Enum.Material.Plastic and v ~= Enum.Material.ForceField then v = Enum.Material.Plastic end
				elseif k == "TopSurface" then v = "Smooth"
				elseif k == "Reflectance" or k == "WaterWaveSize" or k == "WaterWaveSpeed" or k == "WaterReflectance" then v = 0
				elseif k == "WaterTransparency" then v = 1
				elseif k == "GlobalShadows" then v = false end
				return sda(t, k, v)
			end)
			setreadonly(mt, true)
		end
		local g = game
		local w = g.Workspace
		local l = g:GetService"Lighting"
		local t = w:WaitForChild"Terrain"
		t.WaterWaveSize = 0
		t.WaterWaveSpeed = 0
		t.WaterReflectance = 0
		t.WaterTransparency = 1
		l.GlobalShadows = false
		function change(v)
			pcall(function()
				if v.Material ~= Enum.Material.Neon and v.Material ~= Enum.Material.Plastic and v.Material ~= Enum.Material.ForceField then
					pcall(function() v.Reflectance = 0 end)
					pcall(function() v.Material = Enum.Material.Plastic end)
					pcall(function() v.TopSurface = "Smooth" end)
				end
			end)
		end
		game.DescendantAdded:Connect(function(v)
			pcall(function()
				if v:IsA"Part" then change(v)
				elseif v:IsA"MeshPart" then change(v)
				elseif v:IsA"TrussPart" then change(v)
				elseif v:IsA"UnionOperation" then change(v)
				elseif v:IsA"CornerWedgePart" then change(v)
				elseif v:IsA"WedgePart" then change(v) end
			end)
		end)
		for i, v in pairs(game:GetDescendants()) do
			pcall(function()
				if v:IsA"Part" then change(v)
				elseif v:IsA"MeshPart" then change(v)
				elseif v:IsA"TrussPart" then change(v)
				elseif v:IsA"UnionOperation" then change(v)
				elseif v:IsA"CornerWedgePart" then change(v)
				elseif v:IsA"WedgePart" then change(v) end
			end)
		end
	end
	
	function WaterRemvoe()
		for i,v in pairs(workspace:GetDescendants()) do
			if string.find(v.Name,"Water") then
				v:Destroy()
			end
		end
	end
	
	function ObjectRemvoe()
		for i,v in pairs(workspace:GetDescendants()) do
			if string.find(v.Name,"Tree") or string.find(v.Name,"House") then
				v:Destroy()
			end
		end
	end
	
	function InvisibleObject()
		for i,v in pairs(game:GetService("Workspace"):GetDescendants()) do
			if  (v:IsA("Part") or v:IsA("MeshPart") or v:IsA("BasePart")) and v.Transparency then
				v.Transparency = 1
			end
		end
	end
	TextureLow()
	ObjectRemvoe()
	WaterRemvoe()
	InvisibleObject()
end

spawn(function()
    while wait() do
        pcall(function()
			if _G.HUD["Lock FPS"] == true then
				setfpscap(_G.HUD["FPS AMount"])
            else
                setfpscap(120)
            end
        end)
    end
end)



task.spawn(function()
	while task.wait() do
		pcall(function()
			for i,v in pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventory")) do
				if type(v) == "table" then
					if v.Type == "Sword" then
						if v.Name == "Saber" then
							Saber:Set("✅ : Saber | "..v.Mastery)
						end
						if v.Name == "Pole (1st Form)" then
							polev1:Set("✅ : Pole (1st Form) | "..v.Mastery)
						end
						if v.Name == "Rengoku" then
							Rengoku:Set("✅ : Rengoku | "..v.Mastery)
							_G.Quest.Rengoku = true
						end	
						if v.Name == "Midnight Blade" then
							MidnightBlade:Set("✅ : Midnight Blade | "..v.Mastery)
							_G.Quest.Midnight = true
						end
						if v.Name == "Dragon Trident" then
							DragonTrident:Set("✅ : Dragon Trident | "..v.Mastery)
						end
						if v.Name == "Yama" then
							Yama:Set("✅ : Yama | "..v.Mastery)
							_G.Quest.Yama = true
						end
						if v.Name == "Buddy Sword" then
							BuddySword:Set("✅ : Buddy Sword | "..v.Mastery)
							_G.Quest.Buddy = true
						end
						if v.Name == "Canvander" then
							Canvander:Set("✅ : Canvander | "..v.Mastery)
							_G.Quest.Canvander = true
						end
						if v.Name == "Twin Hooks" then
							TwinHooks:Set("✅ : Twin Hooks | "..v.Mastery)
							_G.Quest.Twin = true
						end
						if v.Name == "Spikey Trident" then
							SpikeyTrident:Set("✅ : Spikey Trident | "..v.Mastery)
							_G.Quest.Spike = true
						end
						if v.Name == "Hallow Scythe" then
							HallowScythe:Set("✅ : Hallow Scythe | "..v.Mastery)
						end
						if v.Name == "Dark Dagger" then
							DarkDagger:Set("✅ : Dark Dagger | "..v.Mastery)
							_G.Quest.Dagger = true
						end
						if v.Name == "Tushita" then
							Tushita:Set("✅ : Tushita | "..v.Mastery)
							_G.Quest.Tushita = true
						end
						if v.Name == "Cursed Dual Katana" then
							CDK:Set("✅ : Cursed Dual Katana | "..v.Mastery)
							_G.Quest.CDK = true
						end
					end
				end
			end
		end)
end
end)

---------------- Gun Check ----------------
task.spawn(
function()
	while task.wait() do
		pcall(
			function()
				for i, v in pairs(
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventoryWeapons")
				) do
					
					if v.Name == "Acidum Rifle" then
						AcidumRifle:Set("✅ : Acidum Rifle ")
					end
					if v.Name == "Kabucha" then
						Kabucha:Set("✅ : Kabucha ")
						_G.Quest.Kabucha = true
					end
					if v.Name == "Bizarre Rifle" then
						BizarreRifle:Set("✅ : Bizarre Rifle ")
					end
					if v.Name == "Soul Guita" then
						BizarreRifle:Set("✅ : Soul Guita  ")
						_G.Quest.Soul_Guita = true
					end
				end
			end
		)
	end
end
)




---------------- Quest Check ----------------
task.spawn(
function()
	while task.wait() do
		pcall(function()
			BuySharkmanKarate = tonumber(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate",true))
			BuySharkmanKarate1 = tostring(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate",true))
			--if _G.Quest.SharkMan == false then
				if BuySharkmanKarate then
					if BuySharkmanKarate ~= 0 or BuySharkmanKarate1 ~= "Keys" then
						_G.Quest.SharkMan = true
					end
				end
			--end
			BuyDeathStep = tonumber(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep",true))
			if BuyDeathStep then
				if BuyDeathStep ~= 0 or not game:GetService("Workspace").Map.IceCastle.Hall.LibraryDoor:FindFirstChild("PhoeyuDoor") then
					_G.Quest.DeathStep = true
				end
			end
			if _G.Quest.SharkMan == true then
				QuestShark:Set("✅ : Quest Sharkman")
			end
			if _G.Quest.DeathStep == true then
				QuestDeath:Set("✅ : Quest Death Step")
			end
			if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo") == 3 then
				if New_World then
					_G.Quest.Balito = true
					BartiloQuest:Set("✅ : Bartilo Quest")
				else
					BartiloQuest:Set("✅ : Bartilo Quest")
				end
			end
			if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetUnlockables").FlamingoAccess == nil then
			else
				if New_World then
					_G.Quest.DonSwanQuest = true
					DonSwanQuest:Set("✅ : Don Swan Quest")
				elseif not New_World then
					DonSwanQuest:Set("✅ : Don Swan Quest")
				end
			end
			if game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("ZQuestProgress", "Check") == 1 then
				KillDonSwan:Set("✅ : Kill Don Swan")
			end
		end)
	end
end
)

---------------- Legendary Sword Check ----------------
task.spawn(
function()
	while task.wait() do
		pcall(
			function()
				for i, v in pairs(
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventoryWeapons")
				) do
					if v.Name == "Shisui" then
						Shisui:Set("✅ : Shisui ")
					end
					if v.Name == "Saddi" then
						Saddi:Set("✅ : Saddi ")
					end
					if v.Name == "Wando" then
						Wando:Set("✅ : Wando ")
					end
					if v.Name == "True Triple Katana" then
						TrueTripleKatana:Set("✅ : True Triple Katana ")
					end
				end
			end
		)
	end
end
)

---------------- Melee Check ----------------
task.spawn(
function()
	while task.wait() do
		--if _G.Main["Start"] then
			pcall(function()
				if _G.Mud.Superhuman.Superhuman == true then
					Superhuman:Set("✅ : Superhuman")
				end
				if _G.Mud.DeathStep.DeathStep == true then
					DeathStep:Set("✅ : Death Step")
				end
				if _G.Mud.Sharkman.SharkmanKarate == true then
					SharkmanKarate:Set("✅ : Sharkman Karate")
				end
				if _G.Mud.ElectricClaw.ElectricClaw == true then
					ElectricClaw:Set("✅ : Electric Claw")
				end
				if _G.Mud.DragonTalon.DragonTalon == true then
					DragonTalon:Set("✅ : Dragon Talon")
				end
				if _G.Mud.GodHuman.Godhuman == true then
					GodHuman:Set("✅ : God Human")
				end
			end)
		--end
	end
end
)



return library, library_flags, library.subs