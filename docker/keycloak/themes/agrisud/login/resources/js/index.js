setTimeout(() => {
    var formDiv = document.getElementsByClassName('card-pf')[0];
    var formImg = document.getElementById("form-img");
    var clientHeight = formDiv.offsetHeight;
    var paddingTop = window.getComputedStyle(formDiv, null).getPropertyValue('padding-top');
    formImg.style.height = clientHeight;
    formImg.style.marginTop = paddingTop;
    const queryString = window.location.search;
    const clientId = new URLSearchParams(queryString).get("client_id");
    if (clientId === 'agrisud-mediatheque-web') {
        document.getElementById('kc-form-register').remove();
    }
    var fToggle = function ($password, e) {
        e.preventDefault();
        const type = $password.getAttribute('type') === 'password' ? 'text' : 'password';
        $password.setAttribute('type', type);
        this.classList.toggle('eye-closed');
    };

    var createReveal = function (passwordId, toggleId) {
        var password = document.getElementById(passwordId);
        console.log('password', password);
        if ((password) && (password.style) && (password.style.display !== 'none')) {
            var icon = document.createElement("i");
            icon.id = toggleId;
            icon.classList.add('password-reveal', 'eye-open');
            icon.addEventListener('click', fToggle.bind(icon, password));
            password.parentNode.insertBefore(icon, password.nextSibling);
        }
    };

    createReveal('password', 'togglePassword');
}, 100);