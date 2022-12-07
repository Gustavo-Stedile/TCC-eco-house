const fetchCEP = async cep => {
    const res = await fetch(`https://viacep.com.br/ws/${cep}/json/`)
    const data = await res.text();
    return JSON.parse(data);
}

const cep = document.querySelector('#cep');
cep.onblur = async () => {
    const data = await fetchCEP(cep.value);
    document.querySelector('input[name="cidade"]').value = data.localidade;      
    document.querySelector('input[name="bairro"]').value = data.bairro;  
    document.querySelector('input[name="rua"]').value = data.logradouro;                
}