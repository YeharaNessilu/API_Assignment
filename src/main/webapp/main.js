let password = localStorage.getItem("password");

if (password === null){
    window.location.href = "index.jsp";
}