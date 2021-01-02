-- by Cosmo with love <3

function main()
    if not isSampLoaded() or not isSampfuncsLoaded() then return end
    while not isSampAvailable() do wait(80) end
    sampRegisterChatCommand('bank', function()
    	sendOnfootSync(-2665.1340, 792.4282, 1500.9688)
    end)
    wait(-1)
end

function sendOnfootSync(x, y, z)
    local almem = allocateMemory(68)
    local nX, nY, nZ = getCharCoordinates(playerPed)
    local selfId = select(2, sampGetPlayerIdByCharHandle(playerPed))
    sampStorePlayerOnfootData(selfId, almem)
    setStructFloatElement(almem, 6, x, false)
    setStructFloatElement(almem, 10, y, false)
    setStructFloatElement(almem, 14, z, false)
    sampSendOnfootData(almem)
   	setStructElement(almem, 36, 1, 128, false)
    setStructFloatElement(almem, 6, nX, false)
    setStructFloatElement(almem, 10, nY, false)
    setStructFloatElement(almem, 14, nZ, false)
    sampSendOnfootData(almem)
    freeMemory(almem)
end