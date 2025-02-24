const sideMenu = document.querySelector("aside")
const menuBtn = document.querySelector("#menu-btn")
const closeBtn = document.querySelector("#close-btn")
const themeToggler = document.querySelector(".theme-toggler")

// show sidedar
menuBtn.addEventListener('click', () => {
  sideMenu.style.display = 'block'
})

// close sidebar
closeBtn.addEventListener('click', () => {
  sideMenu.style.display = 'none'
})

// change theme
document.addEventListener("DOMContentLoaded", () => {
  const themeToggler = document.querySelector(".theme-toggler");
  const body = document.body;

  // Check if dark mode is enabled in localStorage
  if (localStorage.getItem("darkMode") === "enabled") {
    body.classList.add("dark-theme-variables");
    themeToggler.querySelector("span:nth-child(1)").classList.remove("active");
    themeToggler.querySelector("span:nth-child(2)").classList.add("active");
  }

  themeToggler.addEventListener("click", () => {
    body.classList.toggle("dark-theme-variables");

    // Check the current state and store it in localStorage
    if (body.classList.contains("dark-theme-variables")) {
      localStorage.setItem("darkMode", "enabled");
      themeToggler.querySelector("span:nth-child(1)").classList.remove("active");
      themeToggler.querySelector("span:nth-child(2)").classList.add("active");
    } else {
      localStorage.setItem("darkMode", "disabled");
      themeToggler.querySelector("span:nth-child(1)").classList.add("active");
      themeToggler.querySelector("span:nth-child(2)").classList.remove("active");
    }
  });
});
