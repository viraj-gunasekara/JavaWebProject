// SEARCH BAR
searchForm = document.querySelector(".search-form");

document.querySelector("#search-btn").onclick = () => {
  searchForm.classList.toggle("active");
};

// LOGIN, REGISTER, FORGET PW LOAD AND EVENTS

document.addEventListener('DOMContentLoaded', () => {
  // Load login form
  fetch('login.jsp')
      .then(response => response.text())
      .then(data => {
          document.getElementById('login-container').innerHTML = data;
          setupLoginEvents(); // Bind events after loading
      });

  // Load register form
  fetch('register.jsp')
      .then(response => response.text())
      .then(data => {
          document.getElementById('reg-container').innerHTML = data;
          setupRegEvents(); // Bind events after loading
      });

  // Load forget password form
  fetch('forgetpw.jsp')
      .then(response => response.text())
      .then(data => {
          document.getElementById('forgetpw-container').innerHTML = data;
          setupForgetPwEvents(); // Bind events after loading
      });
});

// SETUP LOGIN EVENTS
function setupLoginEvents() {
  const loginForm = document.querySelector('.login-form-container');

  document.querySelector('#login-btn').addEventListener('click', () => {
      loginForm.classList.toggle('active');
  });

  const closeLogin = document.querySelector('#close-login-btn');
  if (closeLogin) {
      closeLogin.addEventListener('click', () => {
          loginForm.classList.remove('active');
      });
  }

  // If you have a button to go to register from login
  const regBtn1 = document.querySelector('#reg-btn1');
  if (regBtn1) {
      regBtn1.addEventListener('click', () => {
          loginForm.classList.remove('active');
          document.querySelector('.reg-form-container').classList.add('active');
      });
  }

  // If you have a button to go to forget password from login
  const forgetPwBtn = document.querySelector('#forgetpw-btn');
  if (forgetPwBtn) {
      forgetPwBtn.addEventListener('click', () => {
          loginForm.classList.remove('active');
          document.querySelector('.forgetpw-form-container').classList.add('active');
      });
  }
}

// SETUP REGISTER EVENTS
function setupRegEvents() {
  const regForm = document.querySelector('.reg-form-container');

  const regBtn = document.querySelector('#reg-btn');
  if (regBtn) {
      regBtn.addEventListener('click', () => {
          regForm.classList.toggle('active');
          document.querySelector('.login-form-container').classList.remove('active');
      });
  }

  const closeReg = document.querySelector('#close-reg-btn');
  if (closeReg) {
      closeReg.addEventListener('click', () => {
          regForm.classList.remove('active');
      });
  }

  const loginBtn2 = document.querySelector('#login-btn2');
  if (loginBtn2) {
      loginBtn2.addEventListener('click', () => {
          regForm.classList.remove('active');
          document.querySelector('.login-form-container').classList.add('active');
      });
  }
}

// SETUP FORGET PASSWORD EVENTS
function setupForgetPwEvents() {
  const fpwForm = document.querySelector('.forgetpw-form-container');

  const closeFp = document.querySelector('#close-fpw-btn');
  if (closeFp) {
      closeFp.addEventListener('click', () => {
          fpwForm.classList.remove('active');
      });
  }

  const regBtn2 = document.querySelector('#reg-btn2');
  if (regBtn2) {
      regBtn2.addEventListener('click', () => {
          fpwForm.classList.remove('active');
          document.querySelector('.reg-form-container').classList.add('active');
      });
  }

  const loginBtn2 = document.querySelector('#login-btn2');
  if (loginBtn2) {
      loginBtn2.addEventListener('click', () => {
          fpwForm.classList.remove('active');
          document.querySelector('.login-form-container').classList.add('active');
      });
  }
}

// header-2 stop when scroll
window.onscroll = () => {
  searchForm.classList.remove("active");

  if (window.scrollY > 80) {
    document.querySelector(".header .header-2").classList.add("active");
  } else {
    document.querySelector(".header .header-2").classList.remove("active");
  }
};

window.onload = () => {
  if (window.scrollY > 80) {
    document.querySelector(".header .header-2").classList.add("active");
  } else {
    document.querySelector(".header .header-2").classList.remove("active");
  }

  fadeOut();
};


//loader
//function loader(){
//  document.querySelector('.loader-container').classList.add('active');
//}

//function fadeOut(){
//  setTimeout(loader, 500);
//}

//SwiperJs
var swiper = new Swiper(".music-slider", {
spaceBetween: 10,
loop: true,
centeredSlides: true,
autoplay: {
 delay: 5500,
 disableOnInteraction: false,
},
breakpoints: {
 0: {
   slidesPerView: 1,
 },
 768: {
   slidesPerView: 2,
 },
 1024: {
   slidesPerView: 3,
 },
},
});

var swiper = new Swiper(".featured-slider", {
spaceBetween: 10,
loop: true,
centeredSlides: true,
autoplay: {
 delay: 5500,
 disableOnInteraction: false,
},
navigation: {
 nextEl: ".swiper-button-next",
 prevEl: ".swiper-button-prev",
},
breakpoints: {
 0: {
   slidesPerView: 1,
 },
 450: {
   slidesPerView: 2,
 },
 768: {
   slidesPerView: 3,
 },
 1024: {
   slidesPerView: 4,
 },
},
});

var swiper = new Swiper(".arrivals-slider", {
 spaceBetween: 10,
 loop: true,
 centeredSlides: true,
 autoplay: {
   delay: 5500,
   disableOnInteraction: false,
 },
 breakpoints: {
   0: {
     slidesPerView: 1,
   },
   450: {
     slidesPerView: 2,
   },
   1024: {
     slidesPerView: 3,
   },
 },
});

var swiper = new Swiper(".reviews-slider", {
 spaceBetween: 10,
 grabCursor: true,
 loop: true,
 centeredSlides: true,
 autoplay: {
   delay: 5500,
   disableOnInteraction: false,
 },
 breakpoints: {
   0: {
     slidesPerView: 1,
   },
   450: {
     slidesPerView: 2,
   },
   1024: {
     slidesPerView: 3,
   },
 },
});

/*allProducts PAGE JS*/

//CATEGORY SELECTION
document.addEventListener("DOMContentLoaded", () => {
    const categories = document.querySelectorAll(".category");
    const products = document.querySelectorAll(".prod-box");
    const categoryLinks = document.querySelectorAll(".dropdown-content a");

    function activateCategory(selectedCategory) {
        categories.forEach(cat => cat.classList.remove("active-category"));
        const activeCategory = document.querySelector(`.category[data-category="${selectedCategory}"]`);
        if (activeCategory) {
            activeCategory.classList.add("active-category");
        }
    }

    function filterProducts(selectedCategory) {
        products.forEach(product => {
            let productCategory = product.getAttribute("data-category");
            product.style.display = (selectedCategory === "all" || productCategory === selectedCategory) ? "block" : "none";
        });
    }

    // Handle category section clicks
    categories.forEach(category => {
        category.addEventListener("click", function () {
            let selectedCategory = this.getAttribute("data-category");
            activateCategory(selectedCategory);
            filterProducts(selectedCategory);
        });
    });

    // Handle dropdown menu clicks
    categoryLinks.forEach(link => {
        link.addEventListener("click", function (e) {
            let selectedCategory = this.getAttribute("data-category");

            if (window.location.pathname.includes("allproducts.jsp")) {
                e.preventDefault();
                activateCategory(selectedCategory);
                filterProducts(selectedCategory);
            } else {
                // Redirect with category parameter
                window.location.href = `allproducts.jsp?category=${selectedCategory}`;
            }
        });
    });
});

// Handle category selection via URL (for allproducts.jsp)
document.addEventListener("DOMContentLoaded", function () {
    function getQueryParam(param) {
        const urlParams = new URLSearchParams(window.location.search);
        return urlParams.get(param);
    }

    const selectedCategory = getQueryParam("category");

    if (selectedCategory) {
        const categoryTitle = document.getElementById("category-title");
        if (categoryTitle) {
            categoryTitle.textContent = selectedCategory.replace("-", " ");
        }

        // Wait for the DOM to fully load before filtering
        setTimeout(() => {
            document.querySelectorAll(".product").forEach(product => {
                product.style.display = (product.dataset.category === selectedCategory) ? "block" : "none";
            });
        }, 100); // Small delay to ensure DOM elements are ready
    }
});

//SEARCH BAR
document.addEventListener("DOMContentLoaded", function () {
  const searchBox = document.getElementById("search-box");
  const searchResults = document.getElementById("search-results");

  // Hide search results initially
  searchResults.style.display = "none";

  searchBox.addEventListener("input", function () {
    let query = searchBox.value.toLowerCase();
    searchResults.innerHTML = "";

    if (query.trim() === "") {
      searchResults.style.display = "none";
      return;
    }

    let items;
    
    // Check if we are on 'allproducts.jsp'
    if (window.location.pathname.includes("allproducts.jsp")) {
      items = document.querySelectorAll(".all-prod-slider .prod-box .content h3");
    } else {
      items = document.querySelectorAll(".featured-slider .box .content h3");
    }

    let filteredItems = [];

    items.forEach(item => {
      let name = item.innerText.toLowerCase();
      if (name.includes(query)) {
        let imgSrc = item.closest(".prod-box") ? item.closest(".prod-box").querySelector("img").src : item.parentElement.parentElement.querySelector("img").src;
        filteredItems.push({ name, imgSrc });
      }
    });

    if (filteredItems.length === 0) {
      searchResults.style.display = "none";
      return;
    }

    filteredItems.forEach(product => {
      let div = document.createElement("div");
      div.classList.add("search-item");
      div.innerHTML = `<img src="${product.imgSrc}" alt=""><span>${product.name}</span>`;
      div.addEventListener("click", function () {
        searchBox.value = product.name;
        searchResults.style.display = "none";
      });
      searchResults.appendChild(div);
    });

    searchResults.style.display = "block";
  });

  document.addEventListener("click", function (e) {
    if (!searchBox.contains(e.target) && !searchResults.contains(e.target)) {
      searchResults.style.display = "none";
    }
  });
});


//CART START
//load cart.jsp dynamically
document.addEventListener('DOMContentLoaded', () => {
fetch('cart.jsp')
   .then(response => response.text())
   .then(data => {
       document.getElementById('cart-container').innerHTML = data;
       setupCartEvents();
   });
});

//cart event listeners - to view cart & close cart
function setupCartEvents() {
const cartBtn = document.getElementById('cart-btn');
const cartPanel = document.getElementById('cart-panel');
const closeCart = document.getElementById('close-cart');

if (!cartBtn || !cartPanel || !closeCart) {
   console.error("Cart elements not found!");
   return;
}

// Show cart when clicking cart icon
cartBtn.addEventListener('click', () => {
  cartPanel.classList.add('active');
});

// Close cart when clicking close icon
closeCart.addEventListener('click', () => {
  cartPanel.classList.remove('active');
});

}

//CART END