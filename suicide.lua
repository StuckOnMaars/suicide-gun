local Players = game:GetService("Players")
local SoundService = game:GetService("SoundService")
local LocalPlayer = Players.LocalPlayer
local GUN_NAME = "Gun"
local SOUND_ID = 801217802 -- replace with your custom sound ID
local MESH_ID = "rbxassetid://115344710735014" -- replace with your mesh ID
local TEXTURE_ID = "rbxassetid://90223512408840" -- optional, replace with gun texture
local function playSound()
	local sound = Instance.new("Sound")
	sound.SoundId = "rbxassetid://" .. SOUND_ID
	sound.Volume = 1
	sound.PlayOnRemove = true
	sound.Parent = SoundService
	sound:Destroy()
end
local tool = Instance.new("Tool")
tool.Name = GUN_NAME
tool.RequiresHandle = true
local handle = Instance.new("Part")
handle.Name = "Handle"
handle.Size = Vector3.new(1, 1, 3)
handle.CFrame = CFrame.new(handle.Position) * CFrame.Angles(0, math.rad(90), 0)
handle.Anchored = false
handle.CanCollide = false
handle.Massless = true
handle:SetAttribute("IgnoreToolHandleRotation", true)
local mesh = Instance.new("SpecialMesh")
mesh.MeshType = Enum.MeshType.FileMesh
mesh.MeshId = MESH_ID
mesh.TextureId = TEXTURE_ID
mesh.Scale = Vector3.new(1, 1, 1) 
mesh.Parent = handle
handle.Parent = tool
tool.Activated:Connect(function()
	local char = LocalPlayer.Character
	if char and char:FindFirstChild("Humanoid") then
		playSound()
		char.Humanoid.Health = 0
	end
end)
tool.Parent = LocalPlayer:WaitForChild("Backpack")
