local ScreenGui = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local label = Instance.new("TextLabel")
local TextButton = Instance.new("TextButton")
local TextButton_2 = Instance.new("TextButton")

--Properties:

ScreenGui.Parent = game.CoreGui

Main.Name = "Main"
Main.Parent = ScreenGui
Main.BackgroundColor3 = Color3.fromRGB(93, 22, 4)
Main.Position = UDim2.new(0.512059808, 0, 0.412507355, 0)
Main.Size = UDim2.new(0, 467, 0, 325)
main.Active = true
main.Draggable = true


label.Name = "label"
label.Parent = Main
label.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
label.Size = UDim2.new(0, 467, 0, 50)
label.Font = Enum.Font.PermanentMarker
label.Text = "AffinityGUI"
label.TextColor3 = Color3.fromRGB(255, 255, 255)
label.TextScaled = true
label.TextSize = 14.000
label.TextWrapped = true

TextButton.Parent = Main
TextButton.BackgroundColor3 = Color3.fromRGB(0, 85, 255)
TextButton.Position = UDim2.new(0.0278372578, 0, 0.187692299, 0)
TextButton.Size = UDim2.new(0, 200, 0, 50)
TextButton.Font = Enum.Font.SourceSans
TextButton.Text = "Aimbot"
TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton.TextSize = 14.000
Main.MouseButton1Down:connect(function()
	local TeamCheck = true
	local WallCheck = true
	local Key = "E"
	local BodyPart = "Head"
	local FOV = 1000
	local Inset = game:GetService("GuiService"):GetGuiInset()
	local SC = Vector2.new(workspace.CurrentCamera.ViewportSize.X / 2, workspace.CurrentCamera.ViewportSize.Y / 2)
	local Mouse = game:GetService("Players").LocalPlayer:GetMouse()
	if string.len(Key) == 1 then
		Key = string.upper(Key)
	end
	function NotObstructing(Destination, Ignore)
		local Origin = workspace.CurrentCamera.CFrame.Position
		local CheckRay = Ray.new(Origin, Destination - Origin)
		local Hit = workspace:FindPartOnRayWithIgnoreList(CheckRay, Ignore)
		return Hit == nil
	end
	function ClosestHoe()
		local MaxDist, Nearest = math.huge
		for I,V in pairs(game:GetService("Players"):GetPlayers()) do
			if V ~= game:GetService("Players").LocalPlayer and V.Character and V.Character:FindFirstChild("Humanoid") then
				if WallCheck then
					if TeamCheck then
						if V.Team ~= game:GetService("Players").LocalPlayer.Team then
							local Pos, Vis = workspace.CurrentCamera:WorldToScreenPoint(V.Character[BodyPart].Position)
							if Vis and NotObstructing(V.Character[BodyPart].Position, {game:GetService("Players").LocalPlayer.Character, V.Character}) then
								local Diff = math.sqrt((Pos.X - SC.X) ^ 2 + (Pos.Y + Inset.Y - SC.Y) ^ 2)
								if Diff < MaxDist and Diff < FOV then
									MaxDist = Diff
									Nearest = V
								end
							end
						end
					else
						local Pos, Vis = workspace.CurrentCamera:WorldToScreenPoint(V.Character[BodyPart].Position)
						if Vis and NotObstructing(V.Character[BodyPart].Position, {game:GetService("Players").LocalPlayer.Character, V.Character}) then
							local Diff = math.sqrt((Pos.X - SC.X) ^ 2 + (Pos.Y + Inset.Y - SC.Y) ^ 2)
							if Diff < MaxDist and Diff < FOV then
								MaxDist = Diff
								Nearest = V
							end
						end
					end
				else
					if TeamCheck then
						if V.Team ~= game:GetService("Players").LocalPlayer.Team then
							local Pos, Vis = workspace.CurrentCamera:WorldToScreenPoint(V.Character[BodyPart].Position)
							if Vis then
								local Diff = math.sqrt((Pos.X - SC.X) ^ 2 + (Pos.Y + Inset.Y - SC.Y) ^ 2)
								if Diff < MaxDist and Diff < FOV then
									MaxDist = Diff
									Nearest = V
								end
							end
						end
					else
						local Pos, Vis = workspace.CurrentCamera:WorldToScreenPoint(V.Character[BodyPart].Position)
						if Vis then
							local Diff = math.sqrt((Pos.X - SC.X) ^ 2 + (Pos.Y + Inset.Y - SC.Y) ^ 2)
							if Diff < MaxDist and Diff < FOV then
								MaxDist = Diff
								Nearest = V
							end
						end
					end
				end
			end
		end
		return Nearest
	end

	game:GetService("RunService").RenderStepped:Connect(function()
		if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode[Key]) then
			local Hoe = ClosestHoe()
			if Hoe and Hoe.Character and Hoe.Character:FindFirstChild(BodyPart) then
				local Pos, Vis = workspace.CurrentCamera:WorldToScreenPoint(Hoe.Character[BodyPart].Position)
				if Vis then
					mousemoverel(Pos.X - Mouse.X, Pos.Y - Mouse.Y)
				end
			end
		end
	end)
end)

TextButton_2.Parent = Main2
TextButton_2.BackgroundColor3 = Color3.fromRGB(0, 85, 255)
TextButton_2.Position = UDim2.new(0.513918638, 0, 0.187692314, 0)
TextButton_2.Size = UDim2.new(0, 200, 0, 50)
TextButton_2.Font = Enum.Font.SourceSans
TextButton_2.Text = "Print \"Hello, Affinity!\""
TextButton_2.TextColor3 = Color3.fromRGB(255, 85, 0)
TextButton_2.TextSize = 14.000
Main2.MouseButton1Down:connect(function()
	print('Hello, Affinity!')
end)