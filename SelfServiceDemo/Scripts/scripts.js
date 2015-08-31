
function changeColor() {
    document.getElementById("securityQuestion").style.color = "#333";
}

function removeHighlightIcon() {
    document.getElementById("selectIcon").style.background = "#ddd";
}
function highlightIcon() {
    document.getElementById("selectIcon").style.background = "#333";
    document.getElementById("selectIcon").style.outline = "none";
}
function toRegisterTab() {
    document.getElementById("login").checked = false;
    document.getElementById("register").checked = true;
}