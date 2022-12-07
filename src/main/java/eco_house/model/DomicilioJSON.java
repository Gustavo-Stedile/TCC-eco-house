package eco_house.model;

public class DomicilioJSON {

	private String cep, cidade, bairro, rua, numero;
	
	public DomicilioJSON(Domicilio dao) {
		this.cep = dao.getCep();
		this.cidade = dao.getCidade();
		this.bairro = dao.getBairro();
		this.rua = dao.getRua();
		this.numero = dao.getNumero();

	}
}
