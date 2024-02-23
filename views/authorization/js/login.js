(function () {
	'use strict'

	var forms = document.querySelectorAll('.needs-validation')
	const funnytxt = document.querySelector('#funny-password')

	Array.prototype.slice.call(forms)
		.forEach(function (form) {
			form.addEventListener('submit', function (event) {
				if (!form.checkValidity()) {
					event.preventDefault()
					event.stopPropagation()
				}
				funnytxt.innerHTML = "Nie wprowadzono wszystkich danych!"
				form.classList.add('was-validated')
			}, false)
		})
})()

const password = document.getElementById('password')
const text = document.getElementById('funny-password')

const messages = [
	{
		"message": "Jeszcze troszeczke :3",
		"value": 3
	},
	{
		"message": "Już prawie!",
		"value": 5
	},
	{
		"message": "Idealnie!",
		"value": 6
	}
]
password.addEventListener('input', () => {
	for(let i = 0; i < messages.length; i++) {
		if(messages[i].value == password.value.length) {
			text.innerHTML = messages[i].message
		}
	}
})