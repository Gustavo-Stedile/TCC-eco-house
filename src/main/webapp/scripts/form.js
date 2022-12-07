const sections = DoublyLinkedList(document.querySelectorAll('.section'));
let currSec = sections.head();

window.onkeydown = ev => {
	if (ev.key === 'Enter' && currSec.value.querySelector('.fields').lastElementChild.querySelector('input') === document.activeElement) {		
		ev.preventDefault();
		const error = document.querySelector('.erro');
		if (document.querySelector('#senha').value != document.querySelector('#confirmar-senha').value) {
			error.style.display = 'flex';
			document.querySelector('form').style.borderTopColor = 'red';
	
			document.querySelector('.message').textContent = 'Senhas não batem';
			return;
		} else {
			error.style.display = 'none';
			document.querySelector('form').style.borderTopColor = 'rgb(20, 251, 20)';
		}
		
		currSec.value.invisible();
		currSec = currSec.next;
		currSec.value.show();
	}
}

const next = document.querySelectorAll('.next');
next.forEach(n => n.onclick = ev => {
	const error = document.querySelector('.erro');
	if (document.querySelector('#senha').value != document.querySelector('#confirmar-senha').value) {
		error.style.display = 'flex';
		document.querySelector('form').style.borderTopColor = 'red';

		document.querySelector('.message').textContent = 'Senhas não batem';
		return;
	} else {
		error.style.display = 'none';
		document.querySelector('form').style.borderTopColor = 'rgb(20, 251, 20)';
	}
	console.log(currSec);
    currSec.value.invisible();
    currSec = currSec.next;
    currSec.value.show();
});

const previous = document.querySelectorAll('.previous');
previous.forEach(p => p.onclick = ev => {
    currSec.value.invisible();
    currSec = currSec.previous;
    currSec.value.show();
})
