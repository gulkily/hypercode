// == begin avatar.js

var configJsOpenPgp = 0; // this is templated from config/setting/admin/js/openpgp

function setAva () { // sets avatar widgets (and italicizes Profile link)
	//alert('DEBUG: setAva() begins');

	if (document.getElementById && String.fromCharCode) {
		var myidBox = document.getElementById('myid'); // displays username (if preference is set)
		var signinBox = document.getElementById('signin'); // Profile link

		//var gt = String.fromCharCode(62);
		var gt = unescape('%3E');

		if (myidBox && signinBox && window.localStorage) { // check for elements and features
			var myAvatar = localStorage.getItem('avatar');

			// #todo add provision for cookie auth here too

			if (!myAvatar) { // less error prone than checking for == null, i think
				// no avatar, probably not signed in
				signinBox.innerHTML = '<a href="/profile.html"' + gt + 'Register</a' + gt + '';
			} else {
				// there's an avatar, probably signed in
				signinBox.innerHTML = '';
				var myFp = localStorage.getItem('fingerprint');

				if (window.location.pathname == '/author/' + myFp + '/' || window.location.pathname == '/author/' + myFp + '/index.html') {
					var itsYou = document.getElementById('itsyou');
					itsYou.innerHTML = 'This is your profile!';
				}

				if (window.GetPrefs) {
					if (GetPrefs('display_username')) {
						myidBox.innerHTML = '<a href="/profile.html" class=avatar' + gt + myAvatar + '</a' + gt;
						signinBox.innerHTML = '';
					} else {
						myidBox.innerHTML = '';
						signinBox.innerHTML = '<a href="/profile.html"' + gt + '<i' + gt + 'Change</i' + gt + '</a' + gt + '';
					}
				} else {
					myidBox.innerHTML = '';
					signinBox.innerHTML = '<a href="/profile.html"' + gt + '<i' + gt + 'Change</i' + gt + '</a' + gt + '';
				}

				var configJsOpenPgp = 0; // this is templated from config/setting/admin/js/openpgp

				if (configJsOpenPgp && !window.openpgp && document.head && document.getElementById && window.localStorage) {
					//alert('DEBUG: setAva: loading openpgp.js');
					window.openPgpJsLoadBegin = 1;

					var script = document.createElement('script');
					script.src = '/openpgp.js';
					script.async = false; // This is required for synchronous execution
					document.head.appendChild(script);
				}

				if (!window.setAvatar && document.head && document.head.appendChild && document.getElementById && window.localStorage) {
					//alert('DEBUG: setAva: loading crypto2.js');

					var script2 = document.createElement('script');
					script2.src = '/crypto2.js';
					script2.async = false; // This is required for synchronous execution
					document.head.appendChild(script2);
				}
			}
		}
	}

	return true;
} // setAva()
if (window.localStorage && document.getElementById) {
	setAva();
}

function getAvatar () { // retrieve previously built avatar from localStorage (already in html form)
	if (window.localStorage) {
		var myAvatar = localStorage.getItem("avatar");
		if (!myAvatar || myAvatar.length == 0) {
			return '';
		} else {
			return myAvatar;
		}
	} else {
		return 'Anonymous*';
	}

	return false;
} // getAvatar()

// == end avatar.js
