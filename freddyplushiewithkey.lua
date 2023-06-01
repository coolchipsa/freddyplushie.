local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()
local Window = Rayfield:CreateWindow({
    Name = "frddy plushie(you can close this)",
    LoadingTitle = "frddy plushie is loading",
    LoadingSubtitle = "By cool chipsa (you can close this)",
    ConfigurationSaving = {
       Enabled = false,
       FolderName = nil, -- Create a custom folder for your hub/game
       FileName = "Atlas Hub"
    },
    Discord = {
       Enabled = true,
       Invite = "a2HxQQPu",
       RememberJoins = false -- Set this to false to make them join the discord every time they load it up
    },
    KeySystem = true, -- Set this to true to use our key system
    KeySettings = {
       Title = "freddy plush v1.0",
       Subtitle = "Key System",
       Note = "(discord.gg/a2HxQQPuy) for the key",
       FileName = "atlaskey",
       SaveKey = true,
       GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
       Key = "coolchipsaiscool533653429867"
    }
 })
 Rayfield:Notify({
   Title = "(:",
   Content = "This freddy plushie is a demo ",
   Duration = 6.5,
   Image = 4483362458,
   Actions = { -- Notification Buttons
      Ignore = {
         Name = "Okay!",
         Callback = function()
         print("The user tapped Okay!")
      end
   },
},
})
Rayfield:Notify({
	Title = "Notification",
	Content = " Enjoy!",
	Duration = 6.5,
	Image = 4483362458,
	Actions = { -- Notification Buttons
	   Ignore = {
		  Name = "Okay!",
		  Callback = function()
		  print("The user tapped Okay!")
	   end
	},
 },
 })
 local Players = game:GetService("Players")
local Equipped = false
local Plr = Players.LocalPlayer
local Char = Plr.Character or Plr.CharacterAdded:Wait()
local Hum = Char:WaitForChild("Humanoid")
local Root = Char:WaitForChild("HumanoidRootPart")
local RightArm = Char:WaitForChild("RightUpperArm")
local LeftArm = Char:WaitForChild("LeftUpperArm")
local RightC1 = RightArm.RightShoulder.C1
local LeftC1 = LeftArm.LeftShoulder.C1
local Functions = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Functions.lua"))()
local CustomShop = loadstring(game:HttpGet("https://raw.githubusercontent.com/MateiDaBest/Utilities/main/Doors/Custom%20Shop%20Items/Main.lua"))()
local Whopper = game:GetObjects("rbxassetid://13510081318")[1]
local Equip = "rbxassetid://9063995064"
local Eat = "rbxassetid://9063995064"
local Sound = Instance.new("Sound") 
local Sound2 = Instance.new("Sound")

Sound.SoundId = LoadCustomAsset(Equip)
Sound.Volume = 2.5
Sound.Parent = workspace

Sound2.SoundId = LoadCustomAsset(Eat)
Sound2.Volume = 2.5
Sound2.Parent = workspace

CustomShop.CreateItem({
	Title = "freddy plushie",
	Desc = "freddy plushie",
	Image = "rbxassetid://13510081805",
	Price = 69,
	Stack = 1,
})

Whopper.Parent = game.Players.LocalPlayer.Backpack

local function setupHands(tool)
	tool.Equipped:Connect(function()
		Equipped = true
		Char:SetAttribute("Hiding", true)
		for _, v in next, Hum:GetPlayingAnimationTracks() do
			v:Stop()
		end

		Sound:Play()

		RightArm.Name = "R_Arm"
		LeftArm.Name = "L_Arm"

		RightArm.RightShoulder.C1 = RightC1
			* CFrame.Angles(math.rad(-90), math.rad(-10), 0)
		LeftArm.LeftShoulder.C1 = LeftC1
			* CFrame.new(-0.2, -0.1, -0.5)
			* CFrame.Angles(math.rad(-100), math.rad(30), math.rad(0))
	end)

	tool.Unequipped:Connect(function()
		Equipped = false
		Char:SetAttribute("Hiding", nil)
		RightArm.Name = "RightUpperArm"
		LeftArm.Name = "LeftUpperArm"

		tool.GripPos = Vector3.new(0.5, -0.2, 0.3)

		Sound:Stop()
		Sound2:Stop()

		RightArm.RightShoulder.C1 = RightC1
		LeftArm.LeftShoulder.C1 = LeftC1
	end)

	tool.Activated:Connect(function()
		Sound2:Play()		task.wait(2)
		tool.GripPos = Vector3.new(0.5, -0.2, 0.3)
	end)
end

setupHands(Whopper)