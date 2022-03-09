--[[

    Variables

]]

DecorRegister("CurrentJob", 3)

--[[

    Events

]]

RegisterNetEvent("caue-jobs:jobChanged")
AddEventHandler("caue-jobs:jobChanged", function(job)
    DecorSetInt(PlayerPedId(), "CurrentJob", jobDecor(job))
end)

--[[

    Threads

]]

Citizen.CreateThread(function()
	Citizen.Wait(500)

	JOBS = RPC.execute("caue-jobs:getJobs")
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(2000)

		if not DecorExistOn(PlayerPedId(), "CurrentJob") then
			DecorSetInt(PlayerPedId(), "CurrentJob", jobDecor(exports["caue-base"]:getChar("job")))
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1800000)

		local job = exports["caue-base"]:getChar("job")
		local paycheck = exports["caue-groups"]:GroupRankInfo(job, "paycheck") or JOBS[job]["paycheck"]

		if job and JOBS[job] then
			TriggerServerEvent("caue-jobs:paycheck", "Paycheck Job: " .. JOBS[job]["name"], paycheck)
		end
	end
end)