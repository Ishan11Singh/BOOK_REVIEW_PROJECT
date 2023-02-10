let mode = localStorage.getItem("mode");

const switchMode = (mode) => {
  if (mode === "dark") {
    document.body.classList.add("dark");
    localStorage.setItem("mode", "dark");
  } else {
    document.body.classList.remove("dark");
    localStorage.setItem("mode", "light");
  }
};

if (!mode) {
  localStorage.setItem("mode", "light");
} else {
  switchMode(mode);
}

const toggleSwitch = document.querySelector('.theme-switch input[type="checkbox"]');

toggleSwitch.addEventListener("change", function () {
  switchMode(mode === "light" ? "dark" : "light");
  mode = localStorage.getItem("mode");
});
