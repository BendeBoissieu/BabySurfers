document.getElementById('skip').addEventListener("submit", idontLike);

function idontLike() {
    document.getElementById("tag-id").innerHTML = "I dont like";
}

document.getElementById('add').addEventListener("submit", iLike);

function iLike() {
    document.getElementById("tag-id").innerHTML = "I like";
}





