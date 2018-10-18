<%-- 
    Document   : topbar
    Created on : Oct 17, 2018, 6:03:30 PM
    Author     : wq
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>
.navigation-clean-button {
  background:#fff;
  padding-top:.75rem;
  padding-bottom:.75rem;
  color:#333;
  border-radius:0;
  box-shadow:none;
  border:none;
  margin-bottom:0;
}

@media (min-width:768px) {
  .navigation-clean-button {
    padding-top:1rem;
    padding-bottom:1rem;
  }
}

.navigation-clean-button .navbar-brand {
  font-weight:bold;
  color:inherit;
}

.navigation-clean-button .navbar-brand:hover {
  color:#222;
}

.navigation-clean-button .navbar-toggler {
  border-color:#ddd;
}

.navigation-clean-button .navbar-toggler:hover, .navigation-clean-button .navbar-toggler:focus {
  background:none;
}

.navigation-clean-button .navbar-toggler {
  color:#888;
}

.navigation-clean-button .navbar-collapse, .navigation-clean-button .form-inline {
  border-top-color:#ddd;
}

.navigation-clean-button .navbar-nav a.active, .navigation-clean-button .navbar-nav > .show > a {
  background:none;
  box-shadow:none;
}

.navigation-clean-button.navbar-light .navbar-nav a.active, .navigation-clean-button.navbar-light .navbar-nav a.active:focus, .navigation-clean-button.navbar-light .navbar-nav a.active:hover {
  color:#8f8f8f;
  box-shadow:none;
  background:none;
  pointer-events:none;
}

.navigation-clean-button.navbar .navbar-nav .nav-link {
  padding-left:18px;
  padding-right:18px;
}

.navigation-clean-button.navbar-light .navbar-nav .nav-link {
  color:#465765;
}

.navigation-clean-button.navbar-light .navbar-nav .nav-link:focus, .navigation-clean-button.navbar-light .navbar-nav .nav-link:hover {
  color:#37434d !important;
  background-color:transparent;
}

.navigation-clean-button .navbar-nav > li > .dropdown-menu {
  margin-top:-5px;
  box-shadow:0 4px 8px rgba(0,0,0,.1);
  background-color:#fff;
  border-radius:2px;
}

.navigation-clean-button .dropdown-menu .dropdown-item:focus, .navigation-clean-button .dropdown-menu .dropdown-item {
  line-height:2;
  font-size:14px;
  color:#37434d;
}

.navigation-clean-button .dropdown-menu .dropdown-item:focus, .navigation-clean-button .dropdown-menu .dropdown-item:hover {
  background:#eee;
  color:inherit;
}

.navigation-clean-button .actions .login {
  margin-right:1rem;
  text-decoration:none;
  color:#465765;
}

.navigation-clean-button .navbar-text .action-button, .navigation-clean-button .navbar-text .action-button:active, .navigation-clean-button .navbar-text .action-button:hover {
  background:#56c6c6;
  border-radius:20px;
  font-size:inherit;
  color:#fff;
  box-shadow:none;
  border:none;
  text-shadow:none;
  padding:.5rem 1rem;
  transition:background-color 0.25s;
  font-size:inherit;
}

.navigation-clean-button .navbar-text .action-button:hover {
  background:#66d7d7;
}
</style>
    <nav class="navbar navbar-light navbar-expand-md navigation-clean-button">
        <div class="container"><a class="navbar-brand" href="#index" style="color:rgb(244,71,107);"><i class="typcn typcn-starburst-outline" style="padding:5px;padding-right:5px;"></i>Helios -&nbsp;ἥλιος</a><button class="navbar-toggler" data-toggle="collapse" data-target="#navcol-1"><span class="sr-only">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
            <div
                class="collapse navbar-collapse" id="navcol-1">
                <ul class="nav navbar-nav mr-auto">
                    <li class="nav-item" role="presentation"><a class="nav-link active" href="#">Acceuil</a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link" href="#">À propos</a></li>
                </ul><span class="navbar-text actions"> <a class="btn btn-light action-button" role="button" href="#">Connection</a></span></div>
        </div>
    </nav>