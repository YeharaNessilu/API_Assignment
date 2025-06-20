function login(){
  let password =   document.getElementById("password").value;
  localStorage.setItem("password",password);
}