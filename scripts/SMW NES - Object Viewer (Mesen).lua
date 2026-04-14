-- Get the emulation state
state = emu.getState()
-- Init variables
local oldMouseState = {}
local objPage = 0
-- ROM locations. Only change if your ROM has been shifted at all
objXHitbox = 0x6C87B
objYHitbox = 0x6C97B
-- Flags
local decimalObjPos = false
local relativeObjPos = false
local displayObjState = false
local displayHitBoxes = false
local pInfoCollapsed = false
local musicDisabled = false
local trajectoryEnabled = false
local show0669 = false
local curSong = 0 -- Track the song
-- Colors
local trans <const> = 0xFF000000
local lblue <const> = 0x9DC8D6
local blue <const> = 0x00008F
local lavender <const> = 0x3F3F7F
local green <const> = 0x008F00
local red <const> = 0x8F0000
local white <const> = 0xFFFFFF

-- ID editor variables
local idBoxClicked = false
local clickedObjBoxNum = 0 -- The index of the object the user is modifying

-- Gets the box of an object
function renderObjBox(index)
	local id = emu.read(0x500+index, emu.memType.nesMemory) -- Get object ID
	if id == 0 then return end -- Stop if object is null

	-- Get object position
	local objBoxX = getObjSprX(index)
	local objBoxY = getObjSprY(index)

	if objBoxX < 0 or objBoxX > 255 or objBoxY < 0 or objBoxY > 255 then return end -- Don't render off-screen objects

	local objBoxWidth = 16
	local objBoxHeight = 16 -- Size is hardcoded for object 1
	if id ~= 1 then
		objBoxWidth = emu.read(objXHitbox+id, emu.memType.nesPrgRom)
		objBoxHeight = emu.read(objYHitbox+id, emu.memType.nesPrgRom) -- Get object hitbox dimensions
	end

	emu.drawRectangle(objBoxX, objBoxY, objBoxWidth, objBoxHeight, red, false)
end

-- Converts byte to a binary string. Taken from here: https://love2d.org/forums/viewtopic.php?t=84988&start=10
function byte2bin(n)
local t = {}
  for i=7,0,-1 do
    t[#t+1] = math.floor(n / 2^i)
    n = n % 2^i
  end
  return table.concat(t)
end

-- Get hex string from keyboard. Needs to be run every frame while actively getting input
inpStr = ""
keyPressed = false
function getHexString(length)
	local chars <const> = {"1","2","3","4","5","6","7","8","9","A","B","C","D","E","F"}
	for i=1,#chars do
		if not keyPressed and string.len(inpStr) < length and emu.isKeyPressed(chars[i]) then
			keyPressed = true -- Indicate that a key was just pressed, preventing keys from being held
			inpStr = inpStr .. chars[i]
			emu.log(inpStr)
		elseif string.len(inpStr) == length or emu.isKeyPressed("Enter") then -- Stop when enter is pressed
			local ret = inpStr -- Copy when returning 
			inpStr = "" -- Clear the input string for next use of function
			return ret
		end
	end
	keyPressed = false -- Get input once key is released
	return -1 -- Indicate that input is still being polled
end

-- Draws a clickable box at the specified coordinates and returns true if clicked
function clickBox(rectX, rectY, w, h, color, mState)
	emu.drawRectangle(rectX, rectY, w, h, color, true, 1)
	return (mState.left and not oldMouseState.left) and (mState.x >= rectX and mState.x <= rectX+w) and (mState.y >= rectY and mState.y <= rectY+h)
end
-- Draws a clickable box at the specified coordinates (with text) and returns true if clicked
function clickBoxString(rectX, rectY, w, h, color, text, mState)
	emu.drawRectangle(rectX, rectY, w, h, color, true, 1)
	emu.drawString(rectX, rectY, text, white, color)
	return (mState.left and not oldMouseState.left) and (mState.x >= rectX and mState.x <= rectX+w) and (mState.y >= rectY and mState.y <= rectY+h)
end

-- Create buttons and check for clicks
function buttonHandler()
	local mouseState = emu.getMouseState()
	-- Object page buttons
	if objPage ~= 0 and clickBox(200, 64, 8, 7, blue, mouseState) then
		objPage = objPage - 1
	end
	if objPage ~= 2 and clickBox(248, 64, 8, 7, blue, mouseState) then
		objPage = objPage + 1
	end
	-- Object page strings
	if objPage ~= 0 then
		emu.drawString(200, 64, "<<", white, 0xFF000000)
	end
	if objPage ~= 2 then
		emu.drawString(248, 64, ">>", white, 0xFF000000)
	end
	
	-- Decimal toggle
	if clickBox(208, 64, 8, 7, lblue, mouseState) then
		decimalObjPos = not decimalObjPos
	end
	-- Object position decimal toggle characters
	if decimalObjPos then
		emu.drawString(208, 64, "D", white, 0xFF000000)
	else
		emu.drawString(208, 64, "H", white, 0xFF000000)
	end
	
	-- Position type toggle
	if clickBox(216, 64, 16, 7, red, mouseState) then
		relativeObjPos = not relativeObjPos
	end
	-- Object positioning type toggle
	if relativeObjPos then
		emu.drawString(216, 64, "Rel", white, trans)
	else
		emu.drawString(216, 64, "Abs", white, trans)
	end
	
	-- Display state button toggle
	if clickBox(232, 64, 8, 7, green, mouseState) then
		displayObjState = not displayObjState
	end
	-- Object state display toggle
	emu.drawString(232, 64, "S", white, trans, 0, 1)
	
	-- Display hitbox button toggle
	if clickBox(240, 64, 8, 7, red, mouseState) then
		displayHitboxes = not displayHitboxes
	end
	-- Hitbox button text
	emu.drawString(240, 64, "B", white, trans, 0, 1)
	
	-- Draw trajectory view toggle
	if clickBox(248, 232, 8, 8, red, mouseState) then
		trajectoryEnabled = not trajectoryEnabled
	end
	emu.drawString(248, 232, "T", white, trans, 0, 1)

	-- Draw object range 0669 toggle
	if clickBox(240, 232, 8, 8, blue, mouseState) then
		show0669 = not show0669
	end
	emu.drawString(240, 232, "A", white, trans, 0, 1)
	
	-- Collapsible player info
	local w = 144
	if pInfoCollapsed then
		w = 10
	end
	if clickBox(0, 206, w, 9, trans, mouseState) then
		pInfoCollapsed = not pInfoCollapsed
	end
	oldMouseState = mouseState
end

-- Get coordinates of object at index. Axis 0 is X and 1 is Y
function getObjCoords(index, axis)
	local result = 0
	local xLoAddr = 0x514
	local xHiAddr = 0x528
	local yLoAddr = 0x53C
	local yHiAddr = 0x550
	if emu.read(0x500+index+objPage*8, emu.memType.nesMemory) == 0 then
		return 0
	end
	if relativeObjPos then
		xLoAddr = 0x5A0
		xHiAddr = 0x5B4
		yLoAddr = 0x5C8
		yHiAddr = 0x5DC
	end
	if axis == 0 then
		result = emu.read(xLoAddr+index+objPage*8, emu.memType.nesMemory) + emu.read(xHiAddr+index+objPage*8, emu.memType.nesMemory, decimalObjPos) * 256
	else
		result = emu.read(yLoAddr+index+objPage*8, emu.memType.nesMemory) + emu.read(yHiAddr+index+objPage*8, emu.memType.nesMemory, decimalObjPos) * 256
	end
	if decimalObjPos then
		return result
	end
	return string.format("%X", result)
end
-- Return ID of object at given index
function getObjID(index)
	return emu.read(0x500+index+objPage*8, emu.memType.nesMemory)
end
-- Return object state bits
function getObjState(index)
	return byte2bin(emu.read(0x564+index+objPage*8, emu.memType.nesMemory))
end
-- Determine the sprite position of an object
function getObjSprX(i)
	local playerSprX = emu.read(0x12, emu.memType.nesMemory)
	local objXDist = emu.read(0x5A0+i, emu.memType.nesMemory) + emu.read(0x5B4+i, emu.memType.nesMemory, true) * 256

	local objX = objXDist + playerSprX
	return objX
end
function getObjSprY(i)
	local playerSprY = emu.read(0x13, emu.memType.nesMemory)
	local objYDist = emu.read(0x5C8+i, emu.memType.nesMemory) + emu.read(0x5DC+i, emu.memType.nesMemory, true) * 256
	
	local objY = objYDist + playerSprY + 1
	return objY
end

-- Return player's powerup state as string
function getPlayerState()
	if emu.read(0xDE, emu.memType.nesMemory) == 0 then -- On map
		if emu.read(0x6DA+p, emu.memType.nesMemory) == 0 then return "Small"
		elseif emu.read(0x6DA+p, emu.memType.nesMemory) == 1 then return "Big"
		elseif emu.read(0x6DA+p, emu.memType.nesMemory) == 2 then return "Fire"
		elseif emu.read(0x6DA+p, emu.memType.nesMemory) == 3 then return "Cape"
		else return "Cape (Moving)"
		end
	else -- In level
		if emu.read(0x624, emu.memType.nesMemory) == 0 then return "Small"
		elseif emu.read(0x624, emu.memType.nesMemory) == 1 then return "Big"
		elseif emu.read(0x624, emu.memType.nesMemory) == 2 then return "Fire"
		elseif emu.read(0x624, emu.memType.nesMemory) == 3 then return "Cape"
		else return "Cape (Moving)"
		end
	end
end
-- Return player's position at given axis. X is 0 and 1 is Y
function getPlayerCoords(axis)
	local result = 0
	if axis == 0 then
		result = emu.read(0xB, emu.memType.nesMemory) + emu.read(0xA, emu.memType.nesMemory) * 256
	else
		result = emu.read(0xD, emu.memType.nesMemory) + emu.read(0xC, emu.memType.nesMemory) * 256
	end
	if decimalObjPos then
		return result
	end
	return string.format("%X", result)
end

-- Return Bowser's state as string
function getBowserState()
	bowserState = emu.read(0x5F7, emu.memType.nesMemory)
	if bowserState ~= 6 and bowserState >= 0 and bowserState < 0xD then str = "Phase 1"
	elseif bowserState >= 0xD and bowserState < 0x19 then str = "Phase 2"
	elseif bowserState >= 0x19 and bowserState < 0x1F then str = "Phase 3"
	elseif bowserState >= 0x1F then str = "Defeated"
	end
	if bowserState == 6 then hurt = " (Hurt)"
	else hurt = "" end
	return str .. hurt
end

-- Main function
function main()
	local mouseState = emu.getMouseState()
	str = "" -- Blank return string
	p = emu.read(0x399, emu.memType.nesMemory) -- Current player
	
	if emu.read(0xDE, emu.memType.nesMemory) == 1 then
	local userNum = 0 -- Init input variable
	-- Draw and allow editing of object IDs
	for i=0,3 do
		emu.drawString(0, i*8, "ID: 0x", white, lavender)
		if clickBoxString(30, i*8, 12, 8, lavender, string.format("%X", getObjID(i)), mouseState) or idBoxClicked then
			--[[if not idBoxClicked then -- Don't reset the clicked box number if one was already clicked
				clickedObjBoxNum = i+objPage*8 -- Get index of object being changed
			end
			idBoxClicked = true
			userNum = getHexString(2) -- Hex number entered by the user
			if userNum ~= -1 then
				emu.log("Valid")
				emu.write(0x500+clickedObjBoxNum, tonumber(userNum, 16), emu.memType.nesMemory)
				idBoxClicked = false
				clickedObjBoxNum = 0 -- Set values back to default
			end]]-- 
		end
	end
	
	-- Draw object hitboxes
	if displayHitboxes then
		local playerSprXRAM = emu.read(0x12, emu.memType.nesMemory)
		local playerSprYRAM = emu.read(0x13, emu.memType.nesMemory)
		-- Draw object boxes
		for i=0,20 do
			renderObjBox(i)
		end
		
		-- Draw Yoshi box
		if emu.read(0x5F1, emu.memType.nesMemory) ~= 0 then
			local yoshiSprXPos = (emu.read(0x5F9, emu.memType.nesMemory) + emu.read(0x5FA, emu.memType.nesMemory, true) * 256) + playerSprXRAM
			local yoshiSprYPos = (emu.read(0x5FB, emu.memType.nesMemory) + emu.read(0x5FC, emu.memType.nesMemory, true) * 256) + playerSprYRAM + 1
			
			if emu.read(0x622, emu.memType.nesMemory) & 0x41 ~= 0 then
				yoshiSprXPos = yoshiSprXPos + 16 -- Offset if facing left
			end
			if yoshiSprXPos < 0 or yoshiSprXPos > 255 or yoshiSprYPos < 0 or yoshiSprYPos > 255 then
				yoshiSprXPos = 256
				yoshiSprYPos = 256
			end -- Don't render off-screen Yoshi
			emu.drawRectangle(yoshiSprXPos, yoshiSprYPos, 16, 32, green, false)	
		end
		
		-- Draw tongue
		if emu.read(0xE1, emu.memType.nesMemory) >= 9 and emu.read(0xE1, emu.memType.nesMemory) <= 0xB and emu.read(0x17, emu.memType.nesMemory) >= 6 then
			local tongueWidth = emu.read(0x6C85F+emu.read(0x17, emu.memType.nesMemory), emu.memType.nesPrgRom) - 16
			local tongueSprXPos = playerSprXRAM + 16
			local tongueSprYPos = playerSprYRAM - 16
			if emu.read(0x19, emu.memType.nesMemory) & 0x41 >= 0x40 then
				tongueSprXPos = playerSprXRAM - tongueWidth - 16 -- Offset if facing left
			end
			
			emu.drawRectangle(tongueSprXPos, tongueSprYPos, tongueWidth, 16, 0x35402b, false)
		end
		
		-- Draw player box
		local width = 16
		local height = 16 -- Default player (small) height
		if emu.read(0x624, emu.memType.nesMemory) ~= 0 then height = 24 end -- Big height
		if emu.read(0x1D, emu.memType.nesMemory) == 7 then height = 8 end -- Ducking height
		local playerBoxX = playerSprXRAM - (width/2)
		local playerBoxY = playerSprYRAM - height + 1
		emu.drawRectangle(playerBoxX, playerBoxY, width, height, blue, false)
		--[[Draw player cape box
		if emu.read(0x624, emu.memType.nesMemory) == 4 and emu.read(0x1D, emu.memType.nesMemory) == 5 then
			if emu.read(0x611, emu.memType.nesMemory) % 3 ~= 0 then
				emu.drawRectangle(playerBoxX + 16, playerBoxY + 8, 16, 16, 0xFF00FF, false)
			else
				emu.drawRectangle(playerBoxX - 16, playerBoxY + 8, 16, 16, 0xFF00FF, false)
			end
		end]]-- 
	end

	if show0669 then
		for i=0,20 do
			if emu.read(0x500+i, emu.memType.nesMemory) ~= 0 then
				local objX = getObjSprX(i)
				local objY = getObjSprY(i) + 1

				emu.drawString(objX, objY-8, string.format("%X", emu.read(0x578+i, emu.memType.nesMemory)), white, red)
				emu.drawString(objX, objY+8, string.format("%X", emu.read(0x669+i, emu.memType.nesMemory)), white, green)
				emu.drawString(objX, objY, string.format("%X", emu.read(0x500+i, emu.memType.nesMemory)), white, lavender)
			end
		end

	end
	
	if objPage < 2 then
		for i=4,7 do
			emu.drawString(0, i*8, "ID: 0x", white, lavender)
			clickBoxString(30, i*8, 12, 8, lavender, string.format("%X", getObjID(i)), mouseState)
		end
	end
	-- Draw object coordinates
	emu.drawString(200, 0, getObjCoords(0, 0) .. "," .. getObjCoords(0, 1), white, lavender)
	emu.drawString(200, 8, getObjCoords(1, 0) .. "," .. getObjCoords(1, 1), white, lavender)
	emu.drawString(200, 16, getObjCoords(2, 0) .. "," .. getObjCoords(2, 1), white, lavender)
	emu.drawString(200, 24, getObjCoords(3, 0) .. "," .. getObjCoords(3, 1), white, lavender)
	if objPage < 2 then
		emu.drawString(200, 32, getObjCoords(4, 0) .. "," .. getObjCoords(4, 1), white, lavender)
		emu.drawString(200, 40, getObjCoords(5, 0) .. "," .. getObjCoords(5, 1), white, lavender)
		emu.drawString(200, 48, getObjCoords(6, 0) .. "," .. getObjCoords(6, 1), white, lavender)
		emu.drawString(200, 56, getObjCoords(7, 0) .. "," .. getObjCoords(7, 1), white, lavender)
	end
	-- Object state bits
	if displayObjState then
		emu.drawString(144, 0, getObjState(0), white, lavender)
		emu.drawString(144, 8, getObjState(1), white, lavender)
		emu.drawString(144, 16, getObjState(2), white, lavender)
		emu.drawString(144, 24, getObjState(3), white, lavender)
		if objPage < 2 then
			emu.drawString(144, 32, getObjState(4), white, lavender)
			emu.drawString(144, 40, getObjState(5), white, lavender)
			emu.drawString(144, 48, getObjState(6), white, lavender)
			emu.drawString(144, 56, getObjState(7), white, lavender)
		end
	end
	
	-- Draw on-screen buttons
	buttonHandler()
	stat = emu.getState()
	end
	
	-- Draw player info
	if pInfoCollapsed then
		emu.drawString(0, 207, "P<", 0x00FFFFFF, 0x007F3F3F)
	else
		emu.drawString(0, 207, "P" .. p+1 .. ": " .. getPlayerState() .. " | " .. getPlayerCoords(0) .. "," .. getPlayerCoords(1), white, 0x007F3F3F)
	end
	-- Draw player sprite position
	-- emu.drawString(0, 216, "PS: " .. string.format("%X", emu.read(0x12, emu.memType.nesMemory)) .. ", " .. string.format("%X", emu.read(0x13, emu.memType.nesMemory)), white, 0x007F3F3F)
		
	-- Draw Yoshi info
	if emu.read(0x5F1, emu.memType.nesMemory) ~= 0 then
		local yoshiXLoAddr = 0x5F2
		local yoshiYAddr = 0x5F4
		if relativeObjPos then
			yoshiXLoAddr = 0x5F9
			yoshiYAddr = 0x5FB
		end
		local yoshiXLoPos = emu.read(yoshiXLoAddr, emu.memType.nesMemory) + emu.read(yoshiXLoAddr+1, emu.memType.nesMemory, decimalObjPos) * 256
		local yoshiYPos = emu.read(yoshiYAddr, emu.memType.nesMemory) + emu.read(yoshiYAddr+1, emu.memType.nesMemory, decimalObjPos) * 256
		
		if not decimalObjPos then
			yoshiXLoPos = string.format("%X", yoshiXLoPos)
			yoshiYPos = string.format("%X", yoshiYPos)
		end
		emu.drawString(0, 232, "Yoshi: " .. yoshiXLoPos .. "," .. yoshiYPos, white, 0x003F7F3F)
	end
	
	-- Draw Boo Buddies info
	if emu.read(0xC3, emu.memType.nesMemory) ~= 0 then
		emu.drawString(144, 232, "Boo Circle: " .. emu.read(0xC4, emu.memType.nesMemory) + emu.read(0xC5, emu.memType.nesMemory) * 256 .. "," .. emu.read(0xC6, emu.memType.nesMemory) + emu.read(0xC7, emu.memType.nesMemory, true) * 256, white, 0x003F3F3F)
	end
	
	-- Draw Bowser info
	if getObjID(1) == 0xE1 then
		emu.drawString(144, 232, "Bowser: " .. getBowserState(), white, 0x007F5F3F)
	end
	
	-- Disable music (if applicable)
	if musicDisabled then
		emu.write(0x8E, 0x2E, emu.memType.nesMemory)
	end
	
	-- Render trajectories
	-- TODO: FIX THIS
	if trajectoryEnabled then
		local playerXSpdVecs = {0, 1, 2, 3, 4, 5, 6, 7, 7, 7, 7, 7, 7, 7, 7, 7}
		local playerYSpdVecs = {0, 1, 2, 3, 4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5}

		local width = 16
		local height = 16 -- Default player (small) height
		if emu.read(0x624, emu.memType.nesMemory) ~= 0 then height = 24 end -- Big height
		if emu.read(0x1D, emu.memType.nesMemory) == 7 then height = 8 end -- Ducking height
		local playerXSpd = emu.read(0x14, emu.memType.nesMemory)
		local playerYSpd = emu.read(0x15, emu.memType.nesMemory)
		local playerBoxX = emu.read(0x12, emu.memType.nesMemory) - (width/2)
		local playerBoxY = emu.read(0x13, emu.memType.nesMemory) - height + 1
		
		playerXSpd = playerXSpdVecs[playerXSpd // 16 + 1]
		playerYSpd = playerXSpdVecs[playerYSpd // 16 + 1]

		local endPointX = 32 -- This is only changed depending on direction
		if emu.read(0x19, emu.memType.nesMemory) & 0x1 ~= 0 then
			playerXSpd = playerXSpd * -1
			endPointX = -32
		else
			playerBoxX = playerBoxX + width - 1
		end
		if emu.read(0x19, emu.memType.nesMemory) & 0x4 ~= 0 then
			playerYSpd = playerYSpd * -1
		end

		local endPointY = (playerYSpd / playerXSpd) * 32;
		print(endPointY)
		if (playerXSpd == 0) then
			endPointY = 0
		end
		
		emu.drawLine(playerBoxX, playerBoxY, playerBoxX+endPointX, playerBoxY+endPointY, 0x3FFFFFFF)
	end
end

-- Register some code (printInfo function) that will be run at the end of each frame
emu.addEventCallback(main, emu.eventType.startFrame); 

-- Display a startup message
emu.displayMessage("Script", "SMW NES Object Viewer script loaded.")
