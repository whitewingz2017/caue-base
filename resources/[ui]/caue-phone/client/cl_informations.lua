--[[

    NUI

]]

RegisterNUICallback("accountInformation", function()
    local _cid = exports["caue-base"]:getChar("id")
    local _accountid = exports["caue-base"]:getChar("bankid")
    local _phone = exports["caue-base"]:getChar("phone")
    local _cash = RPC.execute("caue-financials:getCash")
    local _bank = RPC.execute("caue-financials:getBalance", _accountid)
    local _job = exports["caue-jobs"]:jobName(exports["caue-base"]:getChar("job"))
    local _licenses = RPC.execute("caue-licenses:getLicenses", false, true)

	SendNUIMessage({
        openSection = "accountInformation",
        response = {
            cid = _cid,
            accountid = _accountid,
            phone = _phone,
            cash = _cash,
            bank = _bank,
            casino = 0,
            job = _job,
            licenses = _licenses,
        },
    })
end)