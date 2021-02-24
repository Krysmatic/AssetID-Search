-- SearchModule.lua
-- Krysmatic

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
function SearchModule:Search(settings, SEARCH_ID)
	if SEARCH_ID and SEARCH_ID ~= "" then
		for service, props in pairs(settings) do
			if props["Activated"] then
				self:SearchGame(game[service], SEARCH_ID)
			end
		end
		print("Finished Searching ID: " .. SEARCH_ID)
	else
		print("Enter valid ID.")
	end
end

return SearchModule
