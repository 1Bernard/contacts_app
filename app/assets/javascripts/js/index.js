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
  const root = document.documentElement; // Use the <html> element

  // Set the initial icon state
  if (root.classList.contains("dark-theme-variables")) {
    themeToggler.querySelector("span:nth-child(1)").classList.remove("active");
    themeToggler.querySelector("span:nth-child(2)").classList.add("active");
  } else {
    themeToggler.querySelector("span:nth-child(1)").classList.add("active");
    themeToggler.querySelector("span:nth-child(2)").classList.remove("active");
  }

  themeToggler.addEventListener("click", () => {
    root.classList.toggle("dark-theme-variables");

    if (root.classList.contains("dark-theme-variables")) {
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

document.addEventListener('DOMContentLoaded', function () {
  document.querySelectorAll('.more-options').forEach(option => {
    const moreIcon = option.querySelector('.more-icon');
    const miniModal = option.querySelector('.mini-modal');

    moreIcon.addEventListener('click', function (event) {
      event.stopPropagation(); // Prevent event from bubbling up
      miniModal.classList.toggle('show');
    });

    // Close when clicking outside
    document.addEventListener('click', function (event) {
      if (!option.contains(event.target)) {
        miniModal.classList.remove('show');
      }
    });
  });
});
