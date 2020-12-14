local SearchModule = {}

function SearchModule:SearchGame(directory, SEARCH_ID)
	local children = directory:GetChildren()
	local output = {}

	local function PrintResult(typeName, model)
		print("------------------------------------------------------------------------------------")
		print("[ASSET ID: " .. SEARCH_ID .. "] Found " .. typeName .. " in " .. directory.Name)

		-- Get all parent names
		local function GetParent(model)
			if model.Parent then
				GetParent(model.Parent)
				table.insert(output, " >> " .. model.Name)
			end
		end

		GetParent(model)
		print(table.concat(output))
	end
	
	local t = 0
	for i = 1, #children do
		t = t + 1
		if t % 200 == 0 then
			wait()
		end
		if children[i]:IsA("MeshPart") then
			if string.match(tostring(children[i].TextureID), SEARCH_ID) then
				PrintResult("Meshpart", children[i])
			end
		end
		if children[i]:IsA("Decal") or children[i]:IsA("Texture") then
			if string.match(tostring(children[i].Texture), SEARCH_ID) then
				PrintResult("Decal/Texture", children[i])
			end
		end
		if children[i]:IsA("ImageLabel") then
			if string.match(tostring(children[i].Image), SEARCH_ID) then
				PrintResult("ImageLabel", children[i])
			end
		end
		if children[i]:IsA("ImageButton") then
			if string.match(tostring(children[i].Image), SEARCH_ID) then
				PrintResult("ImageButton", children[i])
			end
			if string.match(tostring(children[i].HoverImage), SEARCH_ID) then
				PrintResult("ImageButton Hover", children[i])
			end
		end
		if children[i]:IsA("Sound") then
			if string.match(tostring(children[i].SoundId), SEARCH_ID) then
				PrintResult("Sound", children[i])
			end
		end
		self:SearchGame(children[i], SEARCH_ID)
	end
end

-- Start search
function SearchModule:Search(frame, assetId, onColor)
	local SEARCH_ID = assetId.Text

	if frame.Workspace.BackgroundColor3 == onColor then
		self:SearchGame(workspace, SEARCH_ID)
	end
	if frame.Lighting.BackgroundColor3 == onColor then
		self:SearchGame(game.Lighting, SEARCH_ID)
	end
	if frame.ReplicatedFirst.BackgroundColor3 == onColor then
		self:SearchGame(game.ReplicatedFirst, SEARCH_ID)
	end
	if frame.ReplicatedStorage.BackgroundColor3 == onColor then
		self:SearchGame(game.ReplicatedStorage, SEARCH_ID)
	end
	if frame.ServerStorage.BackgroundColor3 == onColor then
		self:SearchGame(game.ServerStorage, SEARCH_ID)
	end
	if frame.StarterGui.BackgroundColor3 == onColor then
		self:SearchGame(game.StarterGui, SEARCH_ID)
	end
	if frame.StarterPack.BackgroundColor3 == onColor then
		self:SearchGame(game.StarterPack, SEARCH_ID)
	end
	if frame.SoundService.BackgroundColor3 == onColor then
		self:SearchGame(game.SoundService, SEARCH_ID)
	end

	print("Finished Searching")
end

return SearchModule
