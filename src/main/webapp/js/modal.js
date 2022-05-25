if (window.location.href.indexOf("read") != -1) {
	document.getElementById("viewQuestion").style.display = "block";
}
document.getElementById("writeButton").onclick = function() {
	document.getElementById("modal").style.display = "block";
}

document.getElementById("modal_close_btn").onclick = function() {
	document.getElementById("modal").style.display = "none";
}

document.getElementById("view_close_btn").onclick = function() {
	document.getElementById("viewQuestion").style.display = "none";
}
document.getElementById("edit_btn").onclick = function() {
	document.getElementById("viewQuestion").style.display = "none";
	document.getElementById("editQuestion").style.display = "block";
}
document.getElementById("edit_close_btn").onclick = function() {
	document.getElementById("editQuestion").style.display = "none";
}