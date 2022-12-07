const fotoPerfil = document.querySelector('#foto-perfil');
const preview = document.querySelector('label[for="foto-perfil"]');


fotoPerfil.onchange = ev => {
    const file = fotoPerfil.files[0];
    const reader = new FileReader();
    
    if (file) {
        reader.readAsDataURL(file);
    }

    reader.onloadend = () => {
        preview.style.backgroundImage = `url(${reader.result})`;
        preview.classList.add('no-hover');
    }    
}

const mensagem = document.querySelector('#mensagem');
const an = mensagem.animate([{opacity: 1}, {opacity: 0}], {duration: 1000, delay: 2000});
an.play();
an.onfinish = () => mensagem.remove();
