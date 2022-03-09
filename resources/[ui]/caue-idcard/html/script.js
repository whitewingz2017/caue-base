window.addEventListener("message", function(event) {
    if (event.data.action == "open") {
        $("#caue-idcardop").css("display", "block")
        $("#name").html(event.data.name)
        $("#birth").html(event.data.dob)
        $("#gender").html(event.data.gender)
        $("#csn").html(event.data.id)
        $("#signature").html(event.data.name)
        const img = document.getElementById("canvas");
        img.src = event.data.image;
    } else if (event.data.action == "close") {
        $("#caue-idcardop").css("display", "none")
    }
})