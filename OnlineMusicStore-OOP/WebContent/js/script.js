// SEARCH BAR TOGGLE
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
  const regBtn2 = document.querySelector('#reg-btn2');
  if (regBtn2) {
      regBtn2.addEventListener('click', () => {
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