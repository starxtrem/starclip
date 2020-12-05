-- Devlopped By Starxtrem --

local startrec = false
RegisterCommand('+startrec', function()
    startrec = true
end, false)
RegisterCommand('-startrec', function()
    startrec = false
end, false)
RegisterKeyMapping('+startrec', 'Start Recording', 'keyboard', '')

local startrecreplay = false
RegisterCommand('+startrecreplay', function()
    startrecreplay = true
end, false)
RegisterCommand('-startrecreplay', function()
    startrecreplay = false
end, false)
RegisterKeyMapping('+startrecreplay', 'Start Replay Recording', 'keyboard', '')

local stoprecordingsave = false
RegisterCommand('+stoprecordingsave', function()
    stoprecordingsave = true
end, false)
RegisterCommand('-stoprecordingsave', function()
    stoprecordingsave = false
end, false)
RegisterKeyMapping('+stoprecordingsave', 'Stop Recording And Save', 'keyboard', '')

local stoprecordingnotsave = false
RegisterCommand('+stoprecordingnotsave', function()
    stoprecordingnotsave = true
end, false)
RegisterCommand('-stoprecordingnotsave', function()
    stoprecordingnotsave = false
end, false)
RegisterKeyMapping('+stoprecordingnotsave', 'Stop Recording And Discard Clip', 'keyboard', '')

local leaveactivaterockstareditor = false
RegisterCommand('+leaveactivaterockstareditor', function()
    leaveactivaterockstareditor = true
end, false)
RegisterCommand('-leaveactivaterockstareditor', function()
    leaveactivaterockstareditor = false
end, false)
RegisterKeyMapping('+leaveactivaterockstareditor', 'Session Leave Activate Rockstar Editor', 'keyboard', '')

Citizen.CreateThread(function ()
	while(true) do
		Citizen.Wait(10)
		if(IsRecording()) then
			if stoprecordingsave then
				StopRecordingAndSaveClip()
			end
			
			if stoprecordingnotsave then
				StopRecordingAndDiscardClip()
			end
		else
			if startrecreplay then
				StartRecording(0)
			end
		
			if startrec then
				StartRecording(1)
			end
		end
		
		if leaveactivaterockstareditor then
			NetworkSessionLeaveSinglePlayer()
			ActivateRockstarEditor()
		end
	end
end)

-- Devlopped By Starxtrem --