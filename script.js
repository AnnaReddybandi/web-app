function showTime() {
    const now = new Date();
    document.getElementById("time").innerText = "Current Time: " + now.toLocaleTimeString();
}
