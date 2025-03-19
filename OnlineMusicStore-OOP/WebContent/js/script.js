// search bar
searchForm = document.querySelector(".search-form");

document.querySelector("#search-btn").onclick = () => {
  searchForm.classList.toggle("active");
};


document.addEventListener('DOMContentLoaded', () => {
  // Load login form
  fetch('login.jsp')
      .then(response => response.text())
      .then(data => {
          document.getElementById('login-container').innerHTML = data;
          setupLoginEvents(); // Bind events after loading
      });
  
});

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